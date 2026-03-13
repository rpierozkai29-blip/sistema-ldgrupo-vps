import streamlit as st
import pandas as pd
from datetime import datetime
import pytz
import calendar
from models.venta_model import VentaModel
from config.database import Database
import streamlit.components.v1 as components
import altair as alt

# --- CONFIGURACIÓN DE ZONA HORARIA GLOBAL ---
zona_peru = pytz.timezone('America/Lima')

# ==============================================================================
# 1. UTILIDADES Y EXPORTACIÓN
# ==============================================================================
@st.cache_data
def convert_df_to_csv(df):
    """Convierte un DataFrame a CSV para exportarlo a Excel"""
    return df.to_csv(index=False).encode('utf-8-sig')

def get_base_css_bw():
    return """
    <style>
        @page { size: A4 landscape; margin: 20mm; }
        body { font-family: 'Helvetica', 'Arial', sans-serif; font-size: 12px; color: #000; -webkit-print-color-adjust: exact; }
        .header-container { margin-bottom: 15px; border-bottom: 2px solid #000; padding-bottom: 8px; }
        h2 { margin: 0; font-size: 20px; text-transform: uppercase; color: #000; }
        .subtitle { margin-top: 5px; font-size: 12px; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .metrics-table th { padding: 6px; background: #e0e0e0; border: 1px solid #000; font-weight: bold; text-align: center; font-size: 12px; }
        .metrics-table td { padding: 8px; background: #fff; border: 1px solid #000; font-weight: bold; text-align: center; font-size: 13px; }
        .data-table th { background: #000; color: #fff; padding: 8px 4px; font-size: 11px; text-transform: uppercase; border: 1px solid #000; }
        .data-table td { padding: 6px 4px; border: 1px solid #666; font-size: 11px; vertical-align: middle; white-space: nowrap; }
        .text-right { text-align: right; } .text-center { text-align: center; }
        .col-money { background-color: #f2f2f2; } .row-pending { font-weight: bold; }
    </style>
    """

def generar_html_participantes(df, info_evento):
    dias_semana = {0: 'LUNES', 1: 'MARTES', 2: 'MIÉRCOLES', 3: 'JUEVES', 4: 'VIERNES', 5: 'SÁBADO', 6: 'DOMINGO'}
    # Se aplica la zona horaria al momento de generar el reporte
    fecha_dt = info_evento['fecha_evento'] if info_evento else datetime.now(zona_peru)
    dia_txt = dias_semana[fecha_dt.weekday()]
    fecha_corta = fecha_dt.strftime('%d/%m/%Y')
    hora_str = str(info_evento.get('hora_inicio', ''))
    try: hora_fmt = datetime.strptime(hora_str, "%H:%M:%S").strftime("%I:%M %p")
    except: hora_fmt = hora_str
    titulo_evento = str(info_evento.get('nombre_evento', '')).upper()
    detalle_fecha = f"FECHA: {dia_txt} {fecha_corta} | HORA: {hora_fmt}"

    css_participantes = """
    <style>
        @page { size: A4 portrait; margin: 10mm; }
        body { font-family: 'Helvetica', 'Arial', sans-serif; color: #000; font-size: 11px; }
        .list-header { text-align: center; margin-bottom: 15px; border-bottom: 2px solid #000; padding-bottom: 10px; }
        .company-title { font-size: 14px; font-weight: bold; margin-bottom: 5px; }
        .main-title { font-size: 18px; font-weight: bold; text-transform: uppercase; margin: 5px 0; }
        .sub-details { font-size: 12px; font-weight: bold; }
        .list-table { width: 100%; border-collapse: collapse; border: 1px solid #000; }
        .list-table th { background-color: #000; color: #fff; padding: 6px 4px; font-size: 11px; font-weight: bold; text-transform: uppercase; border: 1px solid #000; text-align: center; }
        .list-table td { padding: 4px 4px; border: 1px solid #000; font-size: 11px; vertical-align: middle; }
        .col-id { width: 5%; text-align: center; } .col-dni { width: 12%; text-align: center; } .col-name { width: 48%; } .col-qr { width: 15%; } .col-firma { width: 20%; }
    </style>
    """
    rows = ""
    for idx, row in df.iterrows():
        nombre = str(row['Nombre Completo']).upper()[:50]
        dni = str(row.get('DNI', ''))
        rows += f"""<tr><td class="col-id">{idx + 1}</td><td class="col-dni">{dni}</td><td class="col-name">{nombre}</td><td class="col-qr"></td><td class="col-firma"></td></tr>"""
    
    filas_minimas = 25
    if len(df) < filas_minimas:
        for i in range(len(df) + 1, filas_minimas + 1):
            rows += '<tr><td class="col-id">' + str(i) + '</td><td class="col-dni"></td><td class="col-name"></td><td class="col-qr"></td><td class="col-firma"></td></tr>'

    return f"""<!DOCTYPE html><html><head><meta charset='UTF-8'>{css_participantes}</head><body><div class="list-header"><div class="company-title">LISTA DE ASISTENCIA</div><div class="main-title">{titulo_evento}</div><div class="sub-details">{detalle_fecha}</div></div><table class="list-table"><thead><tr><th class="col-id">N°</th><th class="col-dni">DNI</th><th class="col-name">NOMBRES Y APELLIDOS</th><th class="col-qr">ASISTENCIA / QR</th><th class="col-firma">FIRMA</th></tr></thead><tbody>{rows}</tbody></table></body></html>"""

def generar_html_ventas_general(df, f_ini, f_fin, filtros_txt=""):
    total_reg = len(df); cupos = 34 if total_reg<=34 else total_reg
    m_cobrado = round(float(df['Adelanto'].sum()), 2)
    m_x_cobrar = round(float(df['X Cobrar'].sum()), 2)
    total = round(float(df['Monto'].sum()), 2)
    
    metrics = f"""<table class="metrics-table"><tr><th>TOTAL REGISTROS</th><th>ADELANTO COBRADO</th><th>POR COBRAR</th><th>TOTAL VENTA</th></tr><tr><td>{total_reg}</td><td>S/ {m_cobrado:,.2f}</td><td>S/ {m_x_cobrar:,.2f}</td><td>S/ {total:,.2f}</td></tr></table>"""
    rows = ""
    for idx, row in df.iterrows():
        f_str = row['Fecha Registro'].strftime('%Y-%m-%d') if pd.notnull(row['Fecha Registro']) else ""
        nombre = str(row['Nombre Completo'])[:30]
        rows += f"""<tr><td class="text-center">{idx+1}</td><td class="text-center">{f_str}</td><td class="text-center">{row.get('DNI','-')}</td><td>{nombre}</td><td>{row.get('Distrito','')}</td><td>{row['Evento']}</td><td class="text-right">{float(row['Monto']):,.2f}</td><td class="text-right col-money">{float(row['Adelanto']):,.2f}</td><td class="text-right col-money">{float(row['X Cobrar']):,.2f}</td><td class="text-center">{row.get('Cuenta','-')}</td><td class="text-right" style="font-weight:bold;">{float(row['Total']):,.2f}</td></tr>"""
    return f"<html><head><meta charset='UTF-8'>{get_base_css_bw()}</head><body><div class='header-container'><h2>REPORTE DE VENTAS</h2><div class='subtitle'>{filtros_txt}</div></div>{metrics}<table class='data-table'><thead><tr><th>N°</th><th>FECHA</th><th>DNI</th><th>CLIENTE</th><th>DISTRITO</th><th>EVENTO(S) ADQUIRIDOS</th><th>MONTO</th><th>ADELANTO</th><th>X COBRAR</th><th>CUENTA</th><th>TOTAL</th></tr></thead><tbody>{rows}</tbody></table></body></html>"

def generar_html_deudas(df, f_ini, f_fin, filtros_txt=""):
    total_deudores = len(df)
    total_deuda = round(float(df['Saldo'].sum()), 2)
    total_cobrado = round(float(df['Adelanto'].sum()), 2)
    
    metrics = f"""<table class="metrics-table"><tr><th>TOTAL DEUDORES</th><th>TOTAL COBRADO</th><th>DEUDA PENDIENTE</th></tr><tr><td>{total_deudores}</td><td>S/ {total_cobrado:,.2f}</td><td>S/ {total_deuda:,.2f}</td></tr></table>"""
    rows = ""
    for idx, row in df.iterrows():
        f_reg = row['F. Reg'].strftime('%Y-%m-%d') if pd.notnull(row['F. Reg']) else ""
        nombre = str(row['Nombre Completo'])[:35]
        rows += f"""<tr><td class="text-center">{row['ID']}</td><td>{row['Vendedor']}</td><td class="text-center">{f_reg}</td><td>{nombre}</td><td>{row['Curso']}</td><td class="text-right">{float(row['Venta']):,.2f}</td><td class="text-right col-money">{float(row['Adelanto']):,.2f}</td><td class="text-right col-money" style="font-weight:bold;">{float(row['Saldo']):,.2f}</td><td class="text-center">{row['Método']}</td><td class="text-center" style="font-size:10px;">{row['Estado']}</td></tr>"""
    return f"<html><head><meta charset='UTF-8'>{get_base_css_bw()}</head><body><div class='header-container'><h2>CUENTAS POR COBRAR</h2><div class='subtitle'>{filtros_txt}</div></div>{metrics}<table class='data-table'><thead><tr><th>TICKET</th><th>VENDEDOR</th><th>F. REG</th><th>NOMBRE COMPLETO</th><th>EVENTO(S) ADQUIRIDOS</th><th>VENTA</th><th>ADELANTO</th><th>SALDO</th><th>MÉTODO</th><th>ESTADO</th></tr></thead><tbody>{rows}</tbody></table></body></html>"

# ==============================================================================
# 2. PROCESADORES DE DATOS Y LÓGICA DE COHORTES (PIPELINE)
# ==============================================================================

def get_data_bi_cohort_bd(mes_evento, anio_evento):
    conn = Database.get_connection()
    if not conn: return pd.DataFrame()
    try:
        cur = conn.cursor(dictionary=True)
        # LÓGICA AFINADA IDÉNTICA AL EXCEL + UNIFICACIÓN DE 'GB'
        sql = """
            SELECT 
                DATE(v.fecha_venta) as fecha_venta, 
                TRIM(u.nombre) as vendedor, 
                CASE 
                    WHEN UPPER(TRIM(cat.nombre)) LIKE '%COMPL-GB%' OR UPPER(TRIM(cat.nombre)) = 'GB' THEN 'GB'
                    ELSE TRIM(cat.nombre) 
                END as producto, 
                CASE 
                    WHEN UPPER(TRIM(cat.nombre)) LIKE '%COMPL-GB%' OR UPPER(TRIM(cat.nombre)) = 'GB' THEN 'GB'
                    ELSE TRIM(cat.nombre) 
                END as categoria, 
                CAST(dv.subtotal AS DECIMAL(10,2)) as monto 
            FROM detalle_ventas dv
            JOIN ventas v ON dv.venta_id = v.id
            JOIN usuarios u ON v.usuario_id = u.id
            JOIN eventos e ON dv.evento_id = e.id
            JOIN cursos c ON e.curso_id = c.id
            JOIN categorias cat ON c.categoria_id = cat.id
            WHERE MONTH(e.fecha_evento) = %s 
              AND YEAR(e.fecha_evento) = %s
              AND v.estado != 'ANULADO'
              AND dv.subtotal > 0  -- REGLA DE ORO: Excluir filas con total 0 como en Excel
        """
        cur.execute(sql, (mes_evento, anio_evento))
        raw_data = cur.fetchall()
        
        df = pd.DataFrame(raw_data)
        if df.empty: return df
        
        # Limpieza por si vienen nulos de la BD
        df = df.dropna(subset=['monto', 'fecha_venta'])
        
        df.columns = [x.lower() for x in df.columns]
        if 'monto' in df.columns: 
            df['monto'] = pd.to_numeric(df['monto'], errors='coerce').fillna(0.0).round(2)
            
        if 'fecha_venta' in df.columns:
            df['fecha_venta'] = pd.to_datetime(df['fecha_venta'])
            meses_dict = {1:'enero',2:'febrero',3:'marzo',4:'abril',5:'mayo',6:'junio',7:'julio',8:'agosto',9:'septiembre',10:'octubre',11:'noviembre',12:'diciembre'}
            
            df['periodo_sort'] = df['fecha_venta'].dt.to_period('M')
            unique_periods = sorted(df['periodo_sort'].unique())
            ord_months = [meses_dict[p.month] for p in unique_periods]
            ord_months = list(dict.fromkeys(ord_months))
            
            df['Mes'] = pd.Categorical(df['fecha_venta'].dt.month.map(meses_dict), categories=ord_months, ordered=True)
            df['Semana'] = "Sem " + df['fecha_venta'].dt.isocalendar().week.astype(str)
            
        return df
    except Exception as e:
        print(f"Error SQL: {e}")
        return pd.DataFrame()
    finally:
        conn.close()

def get_vendedores_categorias_bd():
    conn = Database.get_connection()
    if not conn: return [], []
    try:
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT nombre FROM categorias ORDER BY nombre ASC")
        cats = [x['nombre'] for x in cur.fetchall()]
        cur.execute("SELECT nombre FROM usuarios WHERE activo = 1 ORDER BY nombre ASC")
        vends = [x['nombre'] for x in cur.fetchall()]
        return cats, vends
    except: return [], []
    finally: conn.close()

def get_processed_detalle_data(f_ini, f_fin):
    raw = VentaModel.get_detalle_ventas_completo(f_ini, f_fin)
    df = pd.DataFrame(raw)
    if df.empty: return df
    
    df_grouped = df.groupby('id', as_index=False).agg({
        'fecha_registro': 'first',
        'dni_ruc': 'first',
        'cliente': 'first',
        'distrito': 'first',
        'evento': lambda x: ' + '.join(x),
        'categoria': lambda x: ' | '.join(set(x.dropna())),
        'forma_pago': 'first',
        'monto_total': 'first',
        'adelanto': 'first',
        'saldo_pendiente': 'first'
    })
    
    df_f = pd.DataFrame()
    df_f['Fecha Registro'] = pd.to_datetime(df_grouped['fecha_registro'])
    df_f['DNI'] = df_grouped['dni_ruc'].fillna('-')
    df_f['Nombre Completo'] = df_grouped['cliente'].fillna('')
    df_f['Distrito'] = df_grouped['distrito'].fillna('')
    df_f['Evento'] = df_grouped['evento'].fillna('')
    df_f['Categoría'] = df_grouped['categoria'].fillna('')
    df_f['Cuenta'] = df_grouped['forma_pago'].fillna('')
    df_f['Monto'] = pd.to_numeric(df_grouped['monto_total'], errors='coerce').fillna(0).round(2)
    df_f['Adelanto'] = pd.to_numeric(df_grouped['adelanto'], errors='coerce').fillna(0).round(2)
    df_f['X Cobrar'] = pd.to_numeric(df_grouped['saldo_pendiente'], errors='coerce').fillna(0).round(2)
    df_f['Total'] = df_f['Monto']
    
    df_f = df_f.sort_values('Fecha Registro', ascending=False)
    return df_f

def get_processed_deudas_data(f_ini, f_fin):
    raw = VentaModel.get_reporte_deudas_detallado(f_ini, f_fin)
    df = pd.DataFrame(raw)
    if df.empty: return df
    
    df_grouped = df.groupby('id', as_index=False).agg({
        'vendedor': 'first',
        'fecha_registro': 'first',
        'nombre_completo': 'first',
        'curso': lambda x: ' + '.join(x),
        'categoria': lambda x: ' | '.join(set(x.dropna())),
        'venta': 'first',
        'adelanto': 'first',
        'saldo': 'first',
        'metodo': 'first',
        'estado': 'first'
    })
    
    df_f = pd.DataFrame()
    df_f['ID'] = df_grouped['id']
    df_f['Vendedor'] = df_grouped['vendedor'].fillna('')
    df_f['F. Reg'] = pd.to_datetime(df_grouped['fecha_registro'])
    df_f['Nombre Completo'] = df_grouped['nombre_completo'].fillna('')
    df_f['Curso'] = df_grouped['curso'].fillna('')
    df_f['Categoría'] = df_grouped['categoria'].fillna('')
    df_f['Venta'] = pd.to_numeric(df_grouped['venta'], errors='coerce').fillna(0).round(2)
    df_f['Adelanto'] = pd.to_numeric(df_grouped['adelanto'], errors='coerce').fillna(0).round(2)
    df_f['Saldo'] = pd.to_numeric(df_grouped['saldo'], errors='coerce').fillna(0).round(2)
    df_f['Método'] = df_grouped['metodo'].fillna('')
    df_f['Estado'] = df_grouped['estado'].fillna('')
    
    df_f = df_f.sort_values('ID', ascending=False)
    return df_f

def get_processed_participantes_data(nombre_evento):
    raw = VentaModel.get_participantes_por_evento(nombre_evento)
    df = pd.DataFrame(raw)
    if df.empty: return df
    df_f = pd.DataFrame()
    df_f['DNI'] = df['dni_ruc'].fillna('')
    df_f['Nombre Completo'] = df['nombre_completo'].fillna('')
    return df_f

def get_processed_data_dashboard(f_ini, f_fin):
    raw_data = VentaModel.get_data_bi_completa(f_ini, f_fin)
    df = pd.DataFrame(raw_data)
    if df.empty: return df
    df.columns = [x.lower() for x in df.columns]
    if 'monto' in df.columns: df['monto'] = pd.to_numeric(df['monto'], errors='coerce').fillna(0.0).round(2)
    if 'fecha_venta' in df.columns:
        df['fecha_venta'] = pd.to_datetime(df['fecha_venta'])
        meses = {1:'enero',2:'febrero',3:'marzo',4:'abril',5:'mayo',6:'junio',7:'julio',8:'agosto',9:'septiembre',10:'octubre',11:'noviembre',12:'diciembre'}
        df['Mes'] = df['fecha_venta'].dt.month.map(meses)
        df['Semana'] = "Sem " + df['fecha_venta'].dt.isocalendar().week.astype(str)
    return df

def render_matrix(df, idx, col, title, current_month_name=None):
    if df.empty: return
    p = pd.pivot_table(df, values='monto', index=idx, columns=col, aggfunc='sum', margins=True, margins_name='Suma total', fill_value=0)
    p = p.round(2)
    
    # --- ORDEN CRONOLÓGICO SOLICITADO ---
    orden_meses = [
        'octubre', 'noviembre', 'diciembre', 
        'enero', 'febrero', 'marzo', 
        'abril', 'mayo', 'junio', 
        'julio', 'agosto', 'septiembre'
    ]
    
    columnas_presentes = [mes for mes in orden_meses if mes in p.columns]
    
    if current_month_name and current_month_name in columnas_presentes:
        columnas_presentes.remove(current_month_name)
        columnas_presentes.append(current_month_name)
    
    if 'Suma total' in p.columns:
        columnas_presentes.append('Suma total')
        
    p = p[columnas_presentes]
    
    st.markdown(f'<div class="matrix-title">{title}</div>', unsafe_allow_html=True)
    st.dataframe(p.style.format("S/ {:,.2f}"), use_container_width=True)

def render_summary(df, idx, title):
    if df.empty: return
    r = df.groupby(idx)['monto'].sum().reset_index()
    r['monto'] = r['monto'].round(2)
    r.columns = [idx.upper(), 'SUM de TOTAL']; r = r.sort_values('SUM de TOTAL', ascending=False)
    suma_total_exacta = round(float(r['SUM de TOTAL'].sum()), 2)
    r.loc[len(r)] = ['Suma total', suma_total_exacta]
    st.markdown(f'<div class="matrix-title">{title}</div>', unsafe_allow_html=True)
    st.dataframe(r.set_index(idx.upper()).style.format("S/ {:,.2f}"), use_container_width=True)

def get_historial_cliente_bd(busqueda):
    conn = Database.get_connection()
    if not conn: return None, pd.DataFrame()
    cur = conn.cursor(dictionary=True)
    
    sql_c = "SELECT * FROM clientes WHERE dni_ruc = %s OR nombre_completo LIKE %s LIMIT 1"
    cur.execute(sql_c, (busqueda, f"%{busqueda}%"))
    cliente = cur.fetchone()
    if not cliente:
        conn.close()
        return None, pd.DataFrame()
    
    sql_v = """
        SELECT v.id as 'ID Venta', DATE(v.fecha_registro) as 'Fecha', e.nombre_evento as 'Curso', 
               u.nombre as 'Vendedor', v.tipo_venta as 'Tipo', 
               v.total as 'Total', v.saldo_pendiente as 'Deuda', v.estado as 'Estado'
        FROM ventas v
        JOIN detalle_ventas dv ON v.id = dv.venta_id
        JOIN eventos e ON dv.evento_id = e.id
        JOIN usuarios u ON v.usuario_id = u.id
        WHERE v.cliente_id = %s
        ORDER BY v.fecha_registro DESC
    """
    cur.execute(sql_v, (cliente['id'],))
    ventas = cur.fetchall()
    conn.close()
    
    df_v = pd.DataFrame(ventas)
    if not df_v.empty:
        df_v['Total'] = pd.to_numeric(df_v['Total'], errors='coerce').fillna(0).round(2)
        df_v['Deuda'] = pd.to_numeric(df_v['Deuda'], errors='coerce').fillna(0).round(2)
    return cliente, df_v

# ==============================================================================
# 3. CONTROLADOR PRINCIPAL (DASHBOARD CON AJUSTES EXACTOS DE EXCEL)
# ==============================================================================

def show_reportes(sub_menu):
    st.markdown("""<style>.main-header {color:#d32f2f;font-weight:800;font-size:28px;margin-bottom:15px;} .filter-container {background-color:#f8f9fa;padding:15px;border-radius:10px;margin-bottom:20px;border-left: 5px solid #d32f2f;} .matrix-title {font-size:16px;font-weight:800;color:#d32f2f;text-transform:uppercase;margin-top:20px;border-bottom:2px solid #d32f2f;} .kpi-card {background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); text-align: center; border: 1px solid #e0e0e0;} .kpi-title {color: #6c757d; font-size: 14px; font-weight: bold; text-transform: uppercase;} .kpi-value {color: #212529; font-size: 24px; font-weight: 900;} </style>""", unsafe_allow_html=True)

    periodos_nombres_completos = ["Periodo 1 - Enero", "Periodo 2 - Febrero", "Periodo 3 - Marzo", "Periodo 4 - Abril", "Periodo 5 - Mayo", "Periodo 6 - Junio", "Periodo 7 - Julio", "Periodo 8 - Agosto", "Periodo 9 - Septiembre", "Periodo 10 - Octubre", "Periodo 11 - Noviembre", "Periodo 12 - Diciembre"]
    
    # Aquí aplicamos la zona horaria para los selectores de año y mes
    anio_actual = datetime.now(zona_peru).year
    mes_actual = datetime.now(zona_peru).month

    sel_cat = []
    sel_vend = []

    if sub_menu == 'Dashboard':
        st.header("📊 Dashboard Financiero - Pipeline de Campaña")
        st.markdown('<div class="filter-container">', unsafe_allow_html=True)
        c1, c2, c3, c4 = st.columns(4)
        anio_sel = c2.selectbox("Año", [anio_actual - 1, anio_actual, anio_actual + 1], index=1, key="dash_anio")
        
        # MOSTRAR SIEMPRE LOS 12 MESES
        periodos_mostrar = periodos_nombres_completos
        def_idx = mes_actual - 1 if anio_sel == anio_actual else 11
        mes_sel = c1.selectbox("Periodo de Campaña", periodos_mostrar, index=def_idx, key="dash_mes")
        
        mes_numero = periodos_nombres_completos.index(mes_sel) + 1
        mes_nombre_actual = mes_sel.split('-')[1].strip().lower()
        
        lista_cats_global, lista_vends_global = get_vendedores_categorias_bd()
        sel_cat = c3.multiselect("Categorías (Cursos)", lista_cats_global, placeholder="Todas...")
        sel_vend = c4.multiselect("Vendedores", lista_vends_global, placeholder="Todos...")
        st.markdown('</div>', unsafe_allow_html=True)
        
        df_base = get_data_bi_cohort_bd(mes_numero, anio_sel)
        df_filtrado = df_base.copy()
        
        # 🟢 AHORA SÍ: TRABAJAMOS 100% CON LA DATA REAL DE LA BASE DE DATOS
        if not df_filtrado.empty:
            if sel_cat: df_filtrado = df_filtrado[df_filtrado['categoria'].isin(sel_cat)]
            if sel_vend: df_filtrado = df_filtrado[df_filtrado['vendedor'].isin(sel_vend)]
            
        if not df_filtrado.empty:
            ingreso_total = float(df_filtrado['monto'].sum())
            k1, k2 = st.columns(2)
            k1.markdown(f'<div class="kpi-card"><div class="kpi-title">💰 Ventas Totales de la Campaña</div><div class="kpi-value" style="color: #2e7d32;">S/ {ingreso_total:,.2f}</div></div>', unsafe_allow_html=True)
            k2.markdown(f'<div class="kpi-card"><div class="kpi-title">🔥 Curso Estrella</div><div class="kpi-value">{df_filtrado.groupby("producto")["monto"].sum().idxmax()}</div></div>', unsafe_allow_html=True)
            
            render_matrix(df_filtrado, 'vendedor', 'Mes', "1 TD - VENTA ACTUAL POR VENDEDOR GENERAL", current_month_name=mes_nombre_actual)
            render_matrix(df_filtrado, 'producto', 'Mes', "2 TD - VENTA ACTUAL POR PRODUCTO GENERAL", current_month_name=mes_nombre_actual)
            
            c_sum1, c_sum2 = st.columns(2)
            with c_sum1: render_summary(df_filtrado, 'producto', "3 TD - RESUMEN DE VENTA ACTUAL POR PRODUCTO")
            with c_sum2: render_summary(df_filtrado, 'vendedor', "4 TD - RESUMEN DE VENTA ACTUAL POR VENDEDOR")
            
            if 'Semana' in df_filtrado.columns:
                st.markdown(f'<div class="matrix-title">5 TD - VENTA SEMANAL PRODUCTOS</div>', unsafe_allow_html=True)
                p_prod = pd.pivot_table(df_filtrado, values='monto', index='producto', columns=['Mes', 'Semana'], aggfunc='sum', margins=True, margins_name='Suma total', fill_value=0).round(2)
                st.dataframe(p_prod.style.format("S/ {:,.2f}"), use_container_width=True)
                
                st.markdown(f'<div class="matrix-title">6 TD - VENTA SEMANAL ASESOR</div>', unsafe_allow_html=True)
                p_asesor = pd.pivot_table(df_filtrado, values='monto', index='vendedor', columns=['Mes', 'Semana'], aggfunc='sum', margins=True, margins_name='Suma total', fill_value=0).round(2)
                st.dataframe(p_asesor.style.format("S/ {:,.2f}"), use_container_width=True)

    # --- GRÁFICOS BI VISUALES ---
    elif sub_menu == 'Gráficos BI':
        st.markdown('<div class="main-header">📈 Análisis Comercial Visual</div>', unsafe_allow_html=True)
        with st.container():
            st.markdown('<div class="filter-container">', unsafe_allow_html=True)
            c1, c2 = st.columns(2)
            anio_sel = c2.selectbox("Año", [anio_actual - 1, anio_actual, anio_actual + 1], index=1, key="bi_anio")
            
            periodos_mostrar = periodos_nombres_completos
            def_idx = mes_actual - 1 if anio_sel == anio_actual else 11
            mes_sel = c1.selectbox("Periodo", periodos_mostrar, index=def_idx, key="bi_mes")
            st.markdown('</div>', unsafe_allow_html=True)
            
        mes_numero = periodos_nombres_completos.index(mes_sel) + 1
        last_day = calendar.monthrange(anio_sel, mes_numero)[1]
        f_ini = datetime(anio_sel, mes_numero, 1).date()
        f_fin = datetime(anio_sel, mes_numero, last_day).date()

        df = get_processed_data_dashboard(f_ini, f_fin)
        if df.empty:
            st.warning("No hay datos para graficar en el periodo seleccionado.")
        else:
            total_vendido = float(df['monto'].sum())
            ticket_promedio = total_vendido / len(df) if len(df) > 0 else 0
            
            k1, k2 = st.columns(2)
            k1.markdown(f'<div class="kpi-card"><div class="kpi-title">🛒 Volumen Total de Ventas</div><div class="kpi-value" style="color: #1565c0;">S/ {total_vendido:,.2f}</div></div>', unsafe_allow_html=True)
            k2.markdown(f'<div class="kpi-card"><div class="kpi-title">🎫 Ticket Promedio de Venta</div><div class="kpi-value" style="color: #ef6c00;">S/ {ticket_promedio:,.2f}</div></div>', unsafe_allow_html=True)
            st.markdown("<br>", unsafe_allow_html=True)

            col_chart1, col_chart2 = st.columns(2)
            with col_chart1:
                st.markdown("### 🏆 Top Vendedores (Rendimiento)")
                df_vend = df.groupby('vendedor')['monto'].sum().reset_index().sort_values('monto', ascending=False)
                df_vend['monto'] = df_vend['monto'].round(2)
                chart_v = alt.Chart(df_vend).mark_bar(color='#d32f2f', cornerRadiusEnd=4).encode(
                    x=alt.X('monto', title='Volumen de Ventas (S/)'),
                    y=alt.Y('vendedor', sort='-x', title=''),
                    tooltip=[alt.Tooltip('vendedor', title='Vendedor'), alt.Tooltip('monto', title='S/', format=',.2f')]
                ).properties(height=350)
                st.altair_chart(chart_v, use_container_width=True)

            with col_chart2:
                st.markdown("### 📚 Mix de Productos (Cursos Más Vendidos)")
                df_prod = df.groupby('producto')['monto'].sum().reset_index().sort_values('monto', ascending=False)
                df_prod['monto'] = df_prod['monto'].round(2)
                chart_p = alt.Chart(df_prod).mark_arc(innerRadius=60).encode(
                    theta=alt.Theta(field="monto", type="quantitative"),
                    color=alt.Color(field="producto", type="nominal", legend=alt.Legend(title="Cursos", orient="bottom")),
                    tooltip=[alt.Tooltip('producto', title='Curso'), alt.Tooltip('monto', title='S/', format=',.2f')]
                ).properties(height=350)
                st.altair_chart(chart_p, use_container_width=True)
            
            st.markdown("---")
            st.markdown("### 📈 Tendencia de Cierre de Ventas Diarias")
            df_tiempo = df.groupby('fecha_venta')['monto'].sum().reset_index()
            df_tiempo['monto'] = df_tiempo['monto'].round(2)
            chart_t = alt.Chart(df_tiempo).mark_area(
                line={'color':'#d32f2f'},
                color=alt.Gradient(
                    gradient='linear',
                    stops=[alt.GradientStop(color='#f8d7da', offset=0), alt.GradientStop(color='white', offset=1)],
                    x1=1, x2=1, y1=1, y2=0
                )
            ).encode(
                x=alt.X('fecha_venta', title='Fecha de Venta'),
                y=alt.Y('monto', title='Ventas Totales (S/)'),
                tooltip=[alt.Tooltip('fecha_venta', title='Fecha'), alt.Tooltip('monto', title='S/', format=',.2f')]
            ).properties(height=350)
            st.altair_chart(chart_t, use_container_width=True)

    # --- HISTORIAL DE CLIENTE ---
    elif sub_menu == 'Historial de Cliente':
        st.markdown('<div class="main-header">👤 Búsqueda e Historial de Cliente</div>', unsafe_allow_html=True)
        busqueda = st.text_input("🔎 Ingrese el DNI o Nombre del cliente y presione Enter:", placeholder="Ej: 71234567 o Juan Perez")
        if busqueda:
            cliente, df_ventas = get_historial_cliente_bd(busqueda)
            if not cliente:
                st.warning("No se encontró ningún cliente con esos datos.")
            else:
                st.success(f"✅ Cliente encontrado: **{cliente['nombre_completo']}**")
                total_invertido = round(float(df_ventas['Total'].sum()), 2) if not df_ventas.empty else 0.0
                deuda_total = round(float(df_ventas['Deuda'].sum()), 2) if not df_ventas.empty else 0.0
                cursos_tomados = len(df_ventas)
                k1, k2, k3, k4 = st.columns(4)
                k1.metric("DNI", cliente['dni_ruc'])
                k2.metric("CURSOS COMPRADOS", cursos_tomados)
                k3.metric("TOTAL INVERTIDO", f"S/ {total_invertido:,.2f}")
                k4.metric("DEUDA PENDIENTE", f"S/ {deuda_total:,.2f}")
                st.markdown("---")
                st.markdown("### 📋 Línea de Tiempo de Compras")
                if df_ventas.empty:
                    st.info("Este cliente está registrado pero no tiene ventas asociadas.")
                else:
                    st.dataframe(df_ventas, use_container_width=True, hide_index=True,
                                 column_config={
                                     "Total": st.column_config.NumberColumn(format="S/ %.2f"),
                                     "Deuda": st.column_config.NumberColumn(format="S/ %.2f")
                                 })

    # --- VISTA: DETALLE GENERAL VENTAS ---
    elif sub_menu == 'Detalle General Ventas':
        st.markdown('<div class="main-header">Reporte General de Ventas</div>', unsafe_allow_html=True)
        with st.container():
            st.markdown('<div class="filter-container">', unsafe_allow_html=True)
            c1, c2, c3, c4 = st.columns(4)
            anio_sel = c2.selectbox("Año", [anio_actual - 1, anio_actual, anio_actual + 1], index=1, key="det_anio")
            
            periodos_mostrar = periodos_nombres_completos
            def_idx = mes_actual - 1 if anio_sel == anio_actual else 11
            mes_sel = c1.selectbox("Periodo", periodos_mostrar, index=def_idx, key="det_mes")
            
            evts, cats = VentaModel.get_lista_eventos_categorias()
            sel_evt = c3.multiselect("Eventos", evts, key="det_evt", placeholder="Filtrar Evento")
            sel_cat = c4.multiselect("Categorías", cats, key="det_cat", placeholder="Filtrar Categoría")
            st.markdown('</div>', unsafe_allow_html=True)
            
        mes_numero = periodos_nombres_completos.index(mes_sel) + 1
        last_day = calendar.monthrange(anio_sel, mes_numero)[1]
        f_ini = datetime(anio_sel, mes_numero, 1).date()
        f_fin = datetime(anio_sel, mes_numero, last_day).date()

        df = get_processed_detalle_data(f_ini, f_fin)
        if not df.empty:
            if sel_evt:
                patron = '|'.join(sel_evt)
                df = df[df['Evento'].str.contains(patron, regex=True, na=False)]
            if sel_cat:
                patron_c = '|'.join(sel_cat)
                df = df[df['Categoría'].str.contains(patron_c, regex=True, na=False)]
            
            if not df.empty:
                col_btn1, col_btn2 = st.columns(2)
                html = generar_html_ventas_general(df, f_ini, f_fin, f"Periodo: {mes_sel.split('-')[1].strip()} {anio_sel}")
                csv = convert_df_to_csv(df)
                
                col_btn1.download_button("📄 Descargar PDF B&N", html, "Reporte_Ventas.html", "text/html", use_container_width=True)
                col_btn2.download_button("📊 Exportar a Excel (CSV)", data=csv, file_name="Reporte_Ventas.csv", mime="text/csv", type="secondary", use_container_width=True)
                
                st.markdown("<br>", unsafe_allow_html=True)
                components.html(html, height=800, scrolling=True)
            else: st.warning("Sin datos para los filtros.")
        else: st.info("No hay registros en el periodo seleccionado.")

    # --- VISTA: CUENTAS POR COBRAR ---
    elif sub_menu == 'Cuentas por Cobrar':
        st.markdown('<div class="main-header">Cuentas por Cobrar (Deudores)</div>', unsafe_allow_html=True)
        with st.container():
            st.markdown('<div class="filter-container">', unsafe_allow_html=True)
            c1, c2, c3, c4 = st.columns(4)
            anio_sel = c2.selectbox("Año", [anio_actual - 1, anio_actual, anio_actual + 1], index=1, key="cxc_anio")
            
            periodos_mostrar = periodos_nombres_completos
            def_idx = mes_actual - 1 if anio_sel == anio_actual else 11
            mes_sel = c1.selectbox("Periodo", periodos_mostrar, index=def_idx, key="cxc_mes")
            
            evts, cats = VentaModel.get_lista_eventos_categorias()
            sel_evt = c3.multiselect("Eventos", evts, key="cxc_evt", placeholder="Filtrar Evento")
            sel_cat = c4.multiselect("Categorías", cats, key="cxc_cat", placeholder="Filtrar Categoría")
            st.markdown('</div>', unsafe_allow_html=True)
            
        mes_numero = periodos_nombres_completos.index(mes_sel) + 1
        last_day = calendar.monthrange(anio_sel, mes_numero)[1]
        f_ini = datetime(anio_sel, mes_numero, 1).date()
        f_fin = datetime(anio_sel, mes_numero, last_day).date()

        df = get_processed_deudas_data(f_ini, f_fin)
        if not df.empty:
            if sel_evt:
                patron = '|'.join(sel_evt)
                df = df[df['Curso'].str.contains(patron, regex=True, na=False)]
            if sel_cat:
                patron_c = '|'.join(sel_cat)
                df = df[df['Categoría'].str.contains(patron_c, regex=True, na=False)]
                
            if not df.empty:
                col_btn1, col_btn2 = st.columns(2)
                html = generar_html_deudas(df, f_ini, f_fin, f"Periodo: {mes_sel.split('-')[1].strip()} {anio_sel}")
                csv = convert_df_to_csv(df)
                
                col_btn1.download_button("📄 Descargar Lista PDF", html, "Deudas.html", "text/html", use_container_width=True)
                col_btn2.download_button("📊 Exportar Deudores a Excel", data=csv, file_name="Cuentas_Cobrar.csv", mime="text/csv", type="secondary", use_container_width=True)

                st.markdown("<br>", unsafe_allow_html=True)
                components.html(html, height=800, scrolling=True)
            else: st.warning("Sin datos para los filtros.")
        else: st.success("✅ Felicidades, no hay deudas pendientes en este periodo.")

    # --- VISTA: LISTA DE PARTICIPANTES ---
    elif sub_menu == 'Lista de Participantes':
        st.markdown('<div class="main-header">Lista de Participantes (Asistencia)</div>', unsafe_allow_html=True)
        with st.container():
            st.markdown('<div class="filter-container">', unsafe_allow_html=True)
            c1, c2, c3 = st.columns([1, 1, 2])
            anio_sel = c2.selectbox("Año", [anio_actual - 1, anio_actual, anio_actual + 1], index=1, key="lst_anio")
            
            periodos_mostrar = periodos_nombres_completos
            def_idx = mes_actual - 1 if anio_sel == anio_actual else 11
            mes_sel = c1.selectbox("Periodo", periodos_mostrar, index=def_idx, key="lst_mes")
            
            evts, _ = VentaModel.get_lista_eventos_categorias()
            sel_evt = c3.selectbox("Seleccionar Evento (Obligatorio)", ["Seleccione un evento..."] + evts, key="lst_evt")
            st.markdown('</div>', unsafe_allow_html=True)
            
        if sel_evt and sel_evt != "Seleccione un evento...":
            df = get_processed_participantes_data(sel_evt)
            if not df.empty:
                info_evento = VentaModel.get_info_evento_detalle(sel_evt)
                html = generar_html_participantes(df, info_evento)
                
                col_btn1, col_btn2 = st.columns(2)
                col_btn1.download_button("📄 Imprimir Lista (PDF)", html, f"Lista_{sel_evt[:20]}.html", "text/html", use_container_width=True)
                csv = convert_df_to_csv(df)
                col_btn2.download_button("📊 Exportar Lista a Excel", data=csv, file_name=f"Participantes_{sel_evt[:10]}.csv", mime="text/csv", type="secondary", use_container_width=True)
                
                st.markdown("<br>", unsafe_allow_html=True)
                components.html(html, height=800, scrolling=True)
            else: st.info("Este evento no tiene participantes registrados.")
        else: st.info("👈 Seleccione un evento para generar la lista.")