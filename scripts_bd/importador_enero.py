import pandas as pd

# =================================================================
# 1. DICCIONARIO Y MAPEO DE DATOS (ENERO)
# =================================================================
FILE_PATH = '01 DE ENERO.xlsx'
OUTPUT_FILE = 'script_enero_limpio.sql'

# Mapeo exacto basado en las instrucciones del usuario
MAPEO_HOJAS = {
    'AFI-F1': [1],
    'AFI-F2': [2, 3],
    'AFI-F3': [4, 5],
    'AFI-F4': [6, 7],
    'AFI-F5': [8, 79],
    'CyC-F11-F12': [12, 13],
    'AFI-F6': [20],          # Excepción CYC
    'Burger-F7-F8': [9, 10],
    'Burger-F9-F10': [11],
    'ONLINE': [15],
    'GN-Completo': [14, 21],
    'GB1': [16, 17],
    'GB2': [18, 22]
}

VENDEDORES = {
    'katherine': 2, 'yadhira': 3, 'greici': 4, 'sofia': 5, 
    'tania': 6, 'gabriela': 7, 'jl': 8, 'fh': 10, 'camila': 13, 'sara': 14, 'mariel': 15
}

def safe_float(val):
    try:
        if pd.isna(val) or str(val).strip() == '': return 0.0
        return float(val)
    except:
        return 0.0

def clean_str(val):
    if pd.isna(val): return ''
    return str(val).strip().replace("'", "''")

# =================================================================
# 2. PROCESAMIENTO ETL (LÓGICA VALIDADOR FINANCIERO)
# =================================================================
sql_statements = ["START TRANSACTION;\n"]

try:
    xls = pd.ExcelFile(FILE_PATH)
except Exception as e:
    print(f"❌ Error al abrir el Excel: {e}")
    exit()

for sheet, eventos_ids in MAPEO_HOJAS.items():
    if sheet not in xls.sheet_names:
        print(f"⚠️ Hoja no encontrada: {sheet}")
        continue
        
    print(f"✅ Procesando hoja: {sheet}")
    df_raw = pd.read_excel(xls, sheet_name=sheet, header=None)
    
    # Encontrar cabecera
    header_row_idx = None
    for idx, row in df_raw.iterrows():
        if row.astype(str).str.contains('NOMBRES Y APELLIDOS', case=False, na=False).any():
            header_row_idx = idx
            break
            
    if header_row_idx is None: continue
        
    df = pd.read_excel(xls, sheet_name=sheet, skiprows=header_row_idx)
    df.columns = [str(c).strip().upper() for c in df.columns]
    
    col_nombres = [c for c in df.columns if 'NOMBRES Y APELLIDOS' in c][0]
    df = df[df[col_nombres].notna()]
    df = df[~df[col_nombres].astype(str).str.contains('Total', case=False)]
    
    col_monto_names = [c for c in df.columns if 'MONTO' in c]
    col_monto_idx = df.columns.get_loc(col_monto_names[0]) if col_monto_names else -1
    
    for _, row in df.iterrows():
        nombre = clean_str(row[col_nombres])
        if not nombre or len(nombre) < 3: continue
            
        col_dni = [c for c in df.columns if 'DNI' in c]
        dni = clean_str(row[col_dni[0]]) if col_dni else ''
        if dni.lower() in ['0', 'x', 'none', '']: dni = ''
        
        col_fecha = [c for c in df.columns if 'FE_ REGISTRO' in c or 'FE_REGISTRO' in c]
        try:
            fecha = pd.to_datetime(row[col_fecha[0]]).strftime('%Y-%m-%d 00:00:00')
        except:
            fecha = '2026-01-15 00:00:00'
            
        col_vend = [c for c in df.columns if 'VENDEDOR' in c]
        vendedor_name = clean_str(row[col_vend[0]]).lower() if col_vend else ''
        vendedor_id = VENDEDORES.get(vendedor_name, 1)
        
        # 🟢 LÓGICA DE AUDITORÍA: AZUL (Asesor) vs ROJO (Validador)
        # Datos del Asesor (Azul)
        monto_azul = safe_float(row[col_monto_names[0]]) if col_monto_names else 0.0
        col_xcobrar = [c for c in df.columns if 'COBRAR' in c]
        xcobrar_azul = safe_float(row[col_xcobrar[0]]) if col_xcobrar else 0.0
        
        # Datos del Validador (Rojo)
        col_total = [c for c in df.columns if 'TOTAL' in c]
        col_ingreso = [c for c in df.columns if 'INGRESO' in c]
        col_saldo = [c for c in df.columns if 'SALDO' in c]
        
        val_total = row[col_total[0]] if col_total else None
        
        # ¿Está validado? (Si la columna TOTAL roja tiene un número)
        if pd.isna(val_total) or str(val_total).strip() == '':
            # NO VALIDADO AÚN -> Confiamos en el Asesor
            total_final = monto_azul + xcobrar_azul
            ingreso_final = monto_azul
            saldo_final = xcobrar_azul
        else:
            # VALIDADO -> La verdad la dicta el Validador (Rojo)
            total_final = safe_float(val_total)
            ingreso_final = safe_float(row[col_ingreso[0]]) if col_ingreso else 0.0
            saldo_final = safe_float(row[col_saldo[0]]) if col_saldo else 0.0
            
        # Si el validador forzó un 0 absoluto, lo respetamos (ej. reprogramaciones gratis)
        if total_final == 0 and safe_float(val_total) == 0.0 and not pd.isna(val_total):
            total_final = 0.0
            ingreso_final = 0.0
            saldo_final = 0.0
        
        col_cuenta = [c for c in df.columns if 'CUENTA' in c]
        cuenta = clean_str(row[col_cuenta[0]]) if col_cuenta else ''
        
        estado_venta = 'PAGADO' if saldo_final <= 0 else 'PARCIAL'
        estado_pago = 'PAGADO' if ingreso_final > 0 else 'PENDIENTE'
        
        # 🟢 LÓGICA ANTI-DUPLICADOS (Leer las "X" exactas de las columnas)
        eventos_asignados = []
        if col_monto_idx != -1:
            idx_start = col_monto_idx - len(eventos_ids)
            for i, evt_id in enumerate(eventos_ids):
                if idx_start + i < len(row):
                    val = str(row.iloc[idx_start + i]).strip().lower()
                    if val == 'x':
                        eventos_asignados.append(evt_id)
        
        if not eventos_asignados:
            eventos_asignados = [eventos_ids[0]]
            
        # Divide el total si se marcó "X" en dos eventos (Combo)
        if len(eventos_asignados) > 0:
            subtotal_por_curso = round(total_final / len(eventos_asignados), 2)
        else:
            subtotal_por_curso = total_final
        
        # 🟢 GENERACIÓN DE SQL
        sql_statements.append(f"\n-- Cliente: {nombre}")
        if dni:
            sql_statements.append(f"INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('{dni}', '{nombre}', '{fecha}');")
            sql_statements.append(f"SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '{dni}' LIMIT 1);")
        else:
            sql_statements.append(f"INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('{nombre}', '{fecha}');")
            sql_statements.append("SET @cliente_id = LAST_INSERT_ID();")
            
        sql_statements.append(f"INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, {vendedor_id}, '{fecha}', {total_final}, {saldo_final}, '{estado_venta}', 'DEL_DIA');")
        sql_statements.append("SET @venta_id = LAST_INSERT_ID();")
        sql_statements.append(f"INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, {ingreso_final}, '{cuenta}', '{fecha}', '{estado_pago}');")
        
        for evt_id in eventos_asignados:
            sql_statements.append(f"INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, {evt_id}, {subtotal_por_curso}, 1, {subtotal_por_curso});")

# =================================================================
# 3. LÓGICA MANUAL CORPORATIVO 
# =================================================================
print("✅ Procesando hoja: Corporativo (Inyección Manual Estratégica)")
sql_statements.append("\n-- ==========================================")
sql_statements.append("-- CORPORATIVO (REGLAS ESTRICTAS)")
sql_statements.append("-- ==========================================\n")

# Jorge (ID 77)
sql_statements.append("INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Jorge', '2026-01-23 00:00:00');")
sql_statements.append("SET @cli_jorge = LAST_INSERT_ID();")
sql_statements.append("INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cli_jorge, 2, '2026-01-23 00:00:00', 2420, 720, 'PARCIAL', 'DEL_DIA');")
sql_statements.append("SET @v_jorge = LAST_INSERT_ID();")
sql_statements.append("INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@v_jorge, 1700, 'BCP EPP', '2026-01-23 00:00:00', 'PAGADO');")
sql_statements.append("INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@v_jorge, 77, 2420, 1, 2420);\n")

# Brenda Faraon (ID 78)
sql_statements.append("INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('BRENDA FARAON', '2026-01-22 00:00:00');")
sql_statements.append("SET @cli_brenda = LAST_INSERT_ID();")
sql_statements.append("INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cli_brenda, 10, '2026-01-22 00:00:00', 1724, 0, 'PAGADO', 'DEL_DIA');")
sql_statements.append("SET @v_b = LAST_INSERT_ID();")
sql_statements.append("INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@v_b, 1724, 'PAGO', '2026-01-22 00:00:00', 'PAGADO');")
sql_statements.append("INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@v_b, 78, 1724, 1, 1724);\n")

# Julio Geldres (ID 78, Fecha: 22/12/2026)
sql_statements.append("INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JULIO GELDRES', '2026-12-22 00:00:00');")
sql_statements.append("SET @cli_julio = LAST_INSERT_ID();")
sql_statements.append("INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cli_julio, 10, '2026-12-22 00:00:00', 500, 0, 'PAGADO', 'DEL_DIA');")
sql_statements.append("SET @v_j = LAST_INSERT_ID();")
sql_statements.append("INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@v_j, 500, 'PAGO', '2026-12-22 00:00:00', 'PAGADO');")
sql_statements.append("INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@v_j, 78, 500, 1, 500);\n")

sql_statements.append("COMMIT;")

with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
    f.write("\n".join(sql_statements))

print(f"\n🎉 ¡Proceso Terminado! Archivo '{OUTPUT_FILE}' generado con éxito.")