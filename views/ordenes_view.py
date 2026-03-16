import streamlit as st
import pandas as pd
import streamlit_antd_components as sac
from controllers.ventas_controller import VentasController
from models.venta_model import VentaModel
from config.database import Database
from datetime import datetime, date
import pytz

zona_peru = pytz.timezone('America/Lima')

# --- 1. FUNCIONES DIALOG ---

@st.dialog("🌍 Ubicación del Cliente")
def modal_ubicacion():
    pais = st.selectbox("País", VentaModel.get_lista_paises())
    
    if pais == "Perú":
        c1, c2, c3 = st.columns(3)
        dep = c1.selectbox("Departamento", VentaModel.get_lista_departamentos())
        prov = c2.selectbox("Provincia", VentaModel.get_provincias_por_dep(dep))
        dist = c3.selectbox("Distrito", VentaModel.get_distritos_por_prov(prov))
        
        if st.button("💾 Confirmar", type="primary", use_container_width=True):
            st.session_state['form_data']['pais'] = pais
            st.session_state['form_data']['departamento'] = dep
            st.session_state['form_data']['provincia'] = prov
            st.session_state['form_data']['distrito'] = dist
            st.session_state['form_data']['ciudad_ext'] = ""
            st.rerun()
    else:
        st.info("Para extranjeros, escriba la ciudad, estado o región manualmente.")
        ciudad = st.text_input("Ciudad / Región / Estado")
        if st.button("💾 Confirmar", type="primary", use_container_width=True):
            st.session_state['form_data']['pais'] = pais
            st.session_state['form_data']['departamento'] = ""
            st.session_state['form_data']['provincia'] = ""
            st.session_state['form_data']['distrito'] = None
            st.session_state['form_data']['ciudad_ext'] = ciudad
            st.rerun()

@st.dialog("➕ Registrar Nueva Cuota")
def registrar_cuota_dialog(id_venta, cliente, deuda_actual, total_venta, pagado_anterior):
    fecha_actual = datetime.now(zona_peru)
    try:
        deuda_actual = round(float(deuda_actual), 2)
        total_venta = round(float(total_venta), 2)
        pagado_anterior = round(float(pagado_anterior), 2)
    except:
        deuda_actual, total_venta, pagado_anterior = 0.0, 0.0, 0.0

    st.write(f"**Cliente:** {cliente}")
    st.write(f"**Venta #:** {id_venta}")
    st.markdown("---")
    
    html_stats = f"""
    <div style="display: flex; justify-content: space-between; gap: 10px; margin-bottom: 20px;">
        <div style="flex: 1; padding: 10px; background-color: #f8f9fa; border-radius: 8px; border: 1px solid #dee2e6; text-align: center;">
            <div style="font-size: 12px; color: #6c757d; font-weight: bold;">TOTAL</div>
            <div style="font-size: 18px; color: #212529; font-weight: 800;">S/ {total_venta:,.2f}</div>
        </div>
        <div style="flex: 1; padding: 10px; background-color: #f8f9fa; border-radius: 8px; border: 1px solid #dee2e6; text-align: center;">
            <div style="font-size: 12px; color: #6c757d; font-weight: bold;">PAGADO REAL</div>
            <div style="font-size: 18px; color: #212529; font-weight: 800;">S/ {pagado_anterior:,.2f}</div>
        </div>
        <div style="flex: 1; padding: 10px; background-color: #fff3cd; border-radius: 8px; border: 1px solid #ffeeba; text-align: center;">
            <div style="font-size: 12px; color: #856404; font-weight: bold;">DEUDA EN CAJA</div>
            <div style="font-size: 18px; color: #d39e00; font-weight: 800;">S/ {deuda_actual:,.2f}</div>
        </div>
    </div>
    """
    st.markdown(html_stats, unsafe_allow_html=True)
    
    c1, c2 = st.columns(2)
    fecha_pago_input = c1.date_input("📅 Fecha de Pago (Real)", value=fecha_actual.date())
    monto_ingreso = c2.number_input("Monto a Pagar:", value=0.0, step=10.0)
    
    c3, c4 = st.columns(2)
    metodo_pago = c3.selectbox("Método de Pago", VentaModel.get_cuentas())
    operacion = c4.text_input("N° Operación")
    
    nota_cierre = st.text_input("Observación / Detalle")
    st.markdown("<br>", unsafe_allow_html=True)
    
    if st.button("💾 Enviar a Validación", type="primary", use_container_width=True):
        monto_val = round(float(monto_ingreso), 2)
        deuda_val = round(float(deuda_actual), 2)
        
        if monto_val <= 0:
            st.error("⚠️ El monto a cobrar debe ser mayor a S/ 0.00.")
        elif monto_val > (deuda_val + 0.01):
            st.error(f"⚠️ Error: El cliente solo debe S/ {deuda_val:.2f}.")
        else:
            try:
                usuario_id_actual = st.session_state.get('usuario_id', 1)
                ok, msg = VentaModel.registrar_pago_detalle(id_venta, monto_val, metodo_pago, operacion, usuario_id_actual, nota_cierre, fecha_pago_input)
                if ok: 
                    st.success("¡Cuota registrada como PENDIENTE con éxito!")
                    st.rerun() 
                else: 
                    st.error(msg)
            except Exception as e: 
                st.error(f"Error: {e}")

@st.dialog("🔐 Validar Pagos en Caja (Auditor/Admin)", width="large")
def validar_pagos_admin_dialog(id_venta, cliente):
    st.write(f"**Cliente:** {cliente}")
    st.write(f"**Venta #:** {id_venta}")
    st.markdown("---")

    rol_actual = st.session_state.get('rol', '').lower()
    if rol_actual not in ['admin', 'auditor', 'coordinador']:
        st.error("🚨 Acceso denegado: Solo el área de administración/auditoría puede validar el ingreso de dinero a caja.")
        return

    pagos = VentaModel.get_historial_pagos(id_venta)
    
    total_venta = 0.0
    dinero_validado = 0.0
    dinero_por_validar = 0.0
    
    conn = Database.get_connection()
    if conn:
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT total FROM ventas WHERE id = %s", (id_venta,))
            v_info = cur.fetchone()
            if v_info:
                total_venta = round(float(v_info['total']), 2)
            
            cur.execute("""
                SELECT 
                    SUM(CASE WHEN estado = 'PAGADO' THEN monto ELSE 0 END) as validado,
                    SUM(CASE WHEN estado = 'PENDIENTE' THEN monto ELSE 0 END) as por_validar
                FROM pagos 
                WHERE venta_id = %s
            """, (id_venta,))
            sum_info = cur.fetchone()
            if sum_info:
                dinero_validado = round(float(sum_info['validado'] or 0.0), 2)
                dinero_por_validar = round(float(sum_info['por_validar'] or 0.0), 2)
                
        except Exception as e: pass
        finally: conn.close()
        
    por_cobrar = round(max(0.0, total_venta - (dinero_validado + dinero_por_validar)), 2)

    html_stats = f"""
    <div style="display: flex; justify-content: space-between; gap: 8px; margin-bottom: 20px;">
        <div style="flex: 1; padding: 10px; background-color: #f8f9fa; border-radius: 8px; border: 1px solid #dee2e6; text-align: center;">
            <div style="font-size: 11px; color: #6c757d; font-weight: bold;">TOTAL VENTA</div>
            <div style="font-size: 17px; color: #212529; font-weight: 800;">S/ {total_venta:,.2f}</div>
        </div>
        <div style="flex: 1; padding: 10px; background-color: #e6f4ea; border-radius: 8px; border: 1px solid #c3e6cb; text-align: center;">
            <div style="font-size: 11px; color: #155724; font-weight: bold;">VALIDADO (Caja)</div>
            <div style="font-size: 17px; color: #155724; font-weight: 800;">S/ {dinero_validado:,.2f}</div>
        </div>
        <div style="flex: 1; padding: 10px; background-color: #cce5ff; border-radius: 8px; border: 1px solid #b8daff; text-align: center;">
            <div style="font-size: 11px; color: #004085; font-weight: bold;">POR VALIDAR</div>
            <div style="font-size: 17px; color: #004085; font-weight: 800;">S/ {dinero_por_validar:,.2f}</div>
        </div>
        <div style="flex: 1; padding: 10px; background-color: #fff3cd; border-radius: 8px; border: 1px solid #ffeeba; text-align: center;">
            <div style="font-size: 11px; color: #856404; font-weight: bold;">POR COBRAR</div>
            <div style="font-size: 17px; color: #d39e00; font-weight: 800;">S/ {por_cobrar:,.2f}</div>
        </div>
    </div>
    """
    st.markdown(html_stats, unsafe_allow_html=True)

    if not pagos:
        st.info("No hay historial de abonos para esta venta.")
        return

    st.markdown("### 📋 Desglose de Cuotas")
    
    h1, h_pago, h2, h3, h4, h5 = st.columns([1.5, 1.2, 1.5, 1.5, 2, 1.5])
    h1.markdown("**Fecha**"); h_pago.markdown("**Pago**"); h2.markdown("**Monto**"); h3.markdown("**Método**"); h4.markdown("**N° Op**"); h5.markdown("**Acción**")
    st.markdown("---")

    total_pagos = len(pagos)
    
    for idx, p in enumerate(pagos):
        numero_pago = total_pagos - idx 

        c1, c_pago, c2, c3, c4, c5 = st.columns([1.5, 1.2, 1.5, 1.5, 2, 1.5], vertical_alignment="center")
        
        fecha_str = p['fecha_pago'].strftime("%d/%m/%Y") if isinstance(p.get('fecha_pago'), (datetime, date)) else str(p.get('fecha_pago', ''))
        c1.write(fecha_str)
        c_pago.write(f"Pago {numero_pago}") 
        c2.write(f"S/ {float(p.get('monto', 0)):.2f}")
        c3.write(p.get('metodo_pago', '-'))
        
        nro_op = p.get('nro_operacion')
        c4.write(nro_op if nro_op else '-')
        
        estado_actual = str(p.get('estado', '')).upper()
        
        with c5:
            if estado_actual == 'PENDIENTE':
                if st.button("✅ Aprobar", key=f"btn_aprobar_{idx}_{p.get('id', idx)}", type="primary", use_container_width=True):
                    id_pago_real = p.get('id')
                    if id_pago_real:
                        ok, msg = VentaModel.validar_pago_individual(id_pago_real)
                        if ok:
                            st.success("Dinero ingresado a caja.")
                            st.rerun()
                        else:
                            st.error(msg)
                    else:
                        st.error("⚠️ Falta 'p.id' en tu SQL de get_historial_pagos.")
            elif estado_actual == 'PAGADO':
                st.success("✅ Validado")
            else:
                st.write(estado_actual)
        st.markdown("<div style='border-bottom: 1px solid #f0f2f6; margin-bottom: 5px;'></div>", unsafe_allow_html=True)


# --- 2. FUNCIONES AUXILIARES ---
def cargar_css_elegante():
    css_extra = ""
    try:
        with open('assets/custom.css', encoding='utf-8') as f:
            css_extra = f.read()
    except: pass
    
    st.markdown(f'''
        <style>
            {css_extra}
            .main .block-container {{ padding-top: 3rem !important; }}
            [data-testid="stMetric"] {{ transition: all 0.3s ease; border: 1px solid #f0f2f6; background-color: white; }}
            [data-testid="stMetric"]:hover {{ transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important; border-color: #6C5CE7 !important; cursor: default; }}
            .stButton button[kind="secondary"] {{ background-color: #10b981 !important; color: white !important; border: none !important; font-weight: 600 !important; border-radius: 6px !important; transition: 0.2s; }}
            .stButton button[kind="secondary"]:hover {{ background-color: #059669 !important; color: white !important; }}
            .small-btn button {{ padding: 0px 5px !important; min-height: 42px !important; margin-top: 28px !important; }}
            .row-header {{ font-weight: bold; background-color: #f8f9fa; padding: 10px 5px; border-bottom: 2px solid #e9ecef; font-size: 13px; color: #495057; }}
            .row-body {{ padding: 12px 5px; border-bottom: 1px solid #f1f3f5; font-size: 13px; display: flex; align-items: center; }}
            input[disabled] {{ color: #1f2937 !important; -webkit-text-fill-color: #1f2937 !important; opacity: 1 !important; font-weight: 700 !important; background-color: #e9ecef !important; border: 1px solid #ced4da !important; }}
            input[disabled]::placeholder {{ color: #9ca3af !important; -webkit-text-fill-color: #9ca3af !important; font-weight: 400 !important; }}
            hr.form-divider {{ border: 0; height: 1px; background: #e0e0e0; margin: 15px 0; }}
        </style>
    ''', unsafe_allow_html=True)

def get_mapa_vendedores():
    mapa = {}
    try:
        conn = Database.get_connection(); cur = conn.cursor()
        cur.execute("SELECT id, nombre FROM usuarios WHERE activo = 1")
        for row in cur.fetchall(): mapa[row[1]] = row[0] 
        conn.close()
    except: pass
    if not mapa: mapa = {st.session_state.get('usuario', 'Admin'): 1}
    return mapa

def get_next_id_venta():
    try:
        conn = Database.get_connection(); cur = conn.cursor()
        cur.execute("SELECT MAX(id) FROM ventas")
        res = cur.fetchone(); conn.close()
        return (res[0] + 1) if res and res[0] else 1
    except: return 1

def buscar_cliente_bd(valor, por_dni=True):
    try:
        conn = Database.get_connection(); cur = conn.cursor(dictionary=True)
        sql = "SELECT c.*, d.nombre as distrito FROM clientes c LEFT JOIN distritos d ON c.distrito_id = d.id WHERE "
        sql += "dni_ruc = %s" if por_dni else "nombre_completo LIKE %s"
        cur.execute(sql + " LIMIT 1", (valor if por_dni else f"%{valor}%",))
        cliente = cur.fetchone(); conn.close()
        return cliente
    except: return None


# --- 3. VISTA PRINCIPAL ---
def show_ordenes(sub_menu="Registrar Venta"):
    fecha_actual = datetime.now(zona_peru)
    cargar_css_elegante()

    if 'form_key_counter' not in st.session_state:
        st.session_state['form_key_counter'] = 0

    reset_dict = {
        "fecha_venta": fecha_actual.date(),
        "fecha_registro": fecha_actual.date(),
        "dni": "", "cliente": "", "email": "", 
        "celular": "", "distrito": None, "curso": [], "turno": "", 
        "monto": 0.0, "dscto": 0.0, "a_cuenta": 0.0, "tipo": None, "origen": None, 
        "cuenta": None, "vendedor": None, "nota": "", "operacion": "",
        "pais": "Perú", "departamento": "", "provincia": "", "ciudad_ext": ""
    }

    if 'edit_id' not in st.session_state: st.session_state['edit_id'] = None
    if 'is_editing' not in st.session_state: st.session_state['is_editing'] = False
    if 'form_data' not in st.session_state: st.session_state['form_data'] = reset_dict.copy()

    st.header(f"🛒 {sub_menu}")
    kpi_placeholder = st.container()
    st.markdown("---")

    mapa_vendedores = get_mapa_vendedores(); lista_vendedores = list(mapa_vendedores.keys())
    eventos_raw = VentaModel.get_eventos_activos(); mapa_eventos = {}
    
    fechas_unicas = set()
    for e in eventos_raw:
        f_obj = e['fecha_evento']
        str_f = f_obj.strftime("%d/%m") if isinstance(f_obj, (date, datetime)) else ""
        if isinstance(f_obj, (date, datetime)): fechas_unicas.add(f_obj.strftime("%Y-%m-%d"))
        
        t_nombre = e.get('nombre_turno') or "Mañana"
        precio = float(e['precio_base']) if e['precio_base'] else 0.0
        stock_vendido = e.get('stock_vendido', 0); stock_maximo = e.get('stock_maximo', 1)
        is_lleno = stock_vendido >= stock_maximo
        
        indicador_lleno = " 🔴 [LLENO]" if is_lleno else ""
        nombre_display = f"{e['nombre_evento']} [{str_f}] - {t_nombre}{indicador_lleno}"
        
        mapa_eventos[nombre_display] = {
            'id': e['id'], 'precio': precio, 'turno': t_nombre, 'fecha_obj': f_obj, 'is_lleno': is_lleno 
        }
    
    lista_cursos = ["Todos"] + list(mapa_eventos.keys())
    lista_cursos_form = list(mapa_eventos.keys()) 
    key_suffix = sub_menu.replace(" ", "_").lower()
    usuario_actual = st.session_state.get('usuario', '')
    rol_actual = st.session_state.get('rol', '').lower()

    with st.expander("🔍 Filtros de Búsqueda", expanded=(sub_menu != "Registrar Venta")):
        c1, c2, c3, c4 = st.columns(4)
        f_ini = c1.date_input("Desde (F. Reg)", fecha_actual.date(), key=f"ini_{key_suffix}")
        f_fin = c2.date_input("Hasta (F. Reg)", fecha_actual.date(), key=f"fin_{key_suffix}")
        
        lista_filtro_asesores = ["Todos"] + lista_vendedores
        idx_asesor_filtro = 0
        disable_asesor_filtro = False
        
        if rol_actual not in ['admin', 'coordinador', 'auditor']:
            if usuario_actual in lista_filtro_asesores:
                idx_asesor_filtro = lista_filtro_asesores.index(usuario_actual)
            disable_asesor_filtro = True
            
        f_asesor = c3.selectbox("Asesor", lista_filtro_asesores, index=idx_asesor_filtro, disabled=disable_asesor_filtro, key=f"ase_{key_suffix}")

        if sub_menu in ["Ventas por Validar", "Ventas Validadas"]:
            f_curso = c4.selectbox("Evento / Curso", lista_cursos, key=f"cur_{key_suffix}")
            f_cliente, f_tipo, f_cuenta = "", "Todos", "Todos"
        else:
            f_cliente = c4.text_input("Cliente/DNI", placeholder="Buscar...", key=f"cli_{key_suffix}") 
            c5, c6, c7 = st.columns(3)
            f_tipo = c5.selectbox("Tipo", ["Todos"] + VentaModel.get_tipos_venta(), key=f"tip_{key_suffix}")
            f_cuenta = c6.selectbox("Cuenta", ["Todos"] + VentaModel.get_cuentas(), key=f"cta_{key_suffix}")
            f_curso = c7.selectbox("Curso", lista_cursos, key=f"cur_{key_suffix}")

    data_raw = VentaModel.get_historial_filtrado(f_ini, f_fin, f_asesor, f_tipo)
    df_hist = pd.DataFrame(data_raw)
    df_show = pd.DataFrame() 

    if not df_hist.empty:
        if 'cuenta' not in df_hist.columns:
            if 'metodo_pago' in df_hist.columns: df_hist['cuenta'] = df_hist['metodo_pago']
            else: df_hist['cuenta'] = 'Yape'
            
        if 'por_validar' not in df_hist.columns: df_hist['por_validar'] = 0.0
        if 'descuento' not in df_hist.columns: df_hist['descuento'] = 0.0

        df_hist['saldo'] = df_hist['monto'] - df_hist['ingreso'] - df_hist['por_validar']
        df_hist['saldo'] = df_hist['saldo'].apply(lambda x: max(0.0, x))

        if sub_menu == "Ventas por Validar":
            df_hist = df_hist[~df_hist['estado'].isin(['PAGADO', 'ANULADO'])]
        elif sub_menu == "Ventas Validadas":
            df_hist = df_hist[df_hist['estado'].isin(['PAGADO', 'PARCIAL'])]
        
        if f_curso != "Todos":
            nombre_curso_filtro = f_curso.split(" [")[0]
            df_hist = df_hist[df_hist['curso_fmt'].str.contains(nombre_curso_filtro, na=False)]

        if f_cliente: 
             mask = df_hist['cliente'].str.contains(f_cliente, case=False, na=False) | df_hist['dni'].str.contains(f_cliente, case=False, na=False)
             df_hist = df_hist[mask]

        df_show = df_hist.groupby('id', as_index=False).agg({
            'fecha_venta': 'first', 'fecha_registro': 'first', 'dni': 'first', 'cliente': 'first', 'vendedor': 'first',
            'curso_fmt': lambda x: ' + '.join(x), 'tipo_venta': 'first', 
            'monto': 'first', 'descuento': 'first', 'ingreso': 'first', 'por_validar': 'first', 'saldo': 'first', 'estado': 'first', 
            'cuenta': 'first'
        })

    with kpi_placeholder:
        if sub_menu == "Registrar Venta":
            try:
                hoy = fecha_actual.date()
                data_hoy = VentaModel.get_historial_filtrado(hoy, hoy, 'Todos', 'Todos')
                df_hoy = pd.DataFrame(data_hoy)
                
                if rol_actual not in ['admin', 'coordinador', 'auditor']:
                    df_hoy = df_hoy[df_hoy['vendedor'] == usuario_actual]

                if not df_hoy.empty:
                    df_hoy_g = df_hoy.groupby('id', as_index=False).agg({'monto': 'first', 'saldo': 'first', 'estado': 'first', 'ingreso': 'first', 'por_validar':'first'})
                    df_hoy_g['saldo_real'] = df_hoy_g['monto'] - df_hoy_g['ingreso'] - df_hoy_g['por_validar']
                    df_hoy_g['saldo_real'] = df_hoy_g['saldo_real'].apply(lambda x: max(0.0, x))
                    
                    df_hoy_validas = df_hoy_g[df_hoy_g['estado'].isin(['PAGADO', 'PARCIAL'])]
                    total_ventas_hoy_cnt = len(df_hoy_validas)
                    monto_ventas_hoy = round(float(df_hoy_validas['monto'].sum()), 2)
                    por_cobrar_hoy = round(float(df_hoy_validas['saldo_real'].sum()), 2)
                else:
                    total_ventas_hoy_cnt = 0
                    monto_ventas_hoy = 0.0
                    por_cobrar_hoy = 0.0
            except:
                total_ventas_hoy_cnt = 0
                monto_ventas_hoy = 0.0
                por_cobrar_hoy = 0.0

            c1, c2, c3, c4 = st.columns(4)
            c1.metric("FECHA SISTEMA", fecha_actual.strftime("%d/%m/%Y")) 
            c2.metric("VENTAS HOY", total_ventas_hoy_cnt)
            c3.metric("MONTO VENTAS HOY", f"S/ {monto_ventas_hoy:,.2f}")
            kpis_base = VentaModel.get_kpis_hoy()
            c4.metric("POR COBRAR TOTAL", f"S/ {float(kpis_base['por_cobrar']):,.2f}")
        
        elif sub_menu == "Ventas por Validar":
            k1, k2 = st.columns(2)
            val_cnt = len(df_show) if not df_show.empty else 0
            val_deuda = round(float(df_show['saldo'].sum()), 2) if not df_show.empty else 0.0
            k1.metric("CLIENTES POR VALIDAR", val_cnt)
            k2.metric("TOTAL POR COBRAR", f"S/ {val_deuda:,.2f}")

        elif sub_menu == "Ventas Validadas":
            k1, k2 = st.columns(2)
            val_cnt = len(df_show) if not df_show.empty else 0
            val_total = round(float(df_show['monto'].sum()), 2) if not df_show.empty else 0.0
            k1.metric("VENTAS VALIDADAS", val_cnt)
            k2.metric("DINERO VALIDADO", f"S/ {val_total:,.2f}")

    # --- FORMULARIO DE REGISTRO MULTI-CURSO ---
    if sub_menu == "Registrar Venta" or st.session_state['is_editing']:
        id_display = str(st.session_state.get('edit_id')) if st.session_state['is_editing'] else str(get_next_id_venta())
        titulo_form = f"✏️ Modificar Venta #{id_display}" if st.session_state['is_editing'] else "📝 Formulario de Registro"
        
        with st.expander(titulo_form, expanded=True):
            def on_cursos_change():
                llave_dinamica = f"widget_cursos_{st.session_state['form_key_counter']}"
                sels = st.session_state.get(llave_dinamica, [])
                suma = sum([mapa_eventos[c]['precio'] for c in sels if c in mapa_eventos])
                turnos = " | ".join(list(set([mapa_eventos[c]['turno'] for c in sels if c in mapa_eventos])))
                st.session_state['form_data']["monto"] = suma
                st.session_state['form_data']["turno"] = turnos
                st.session_state['form_data']["curso"] = sels

            with st.container():
                if st.session_state['is_editing']:
                    st.warning("⚠️ Editando Registro Existente")
                    if st.button("Cancelar Edición", type="secondary"):
                        st.session_state['is_editing'] = False
                        st.session_state['edit_id'] = None
                        st.session_state['form_data'] = reset_dict.copy()
                        st.session_state['form_key_counter'] += 1
                        st.rerun()

                c_row1 = st.columns([1, 1.5, 1.5])
                c_row1[0].text_input("ID Venta", value=f"{id_display}", disabled=True)
                fecha_v_input = c_row1[1].date_input("📅 Fecha de Venta (Real)", value=st.session_state['form_data'].get("fecha_venta", fecha_actual.date()), help="Fecha en que se cerró la venta")
                
                es_admin = True if rol_actual == 'admin' else False
                fecha_r_input = c_row1[2].date_input("🕒 Fecha de Registro (Sistema)", value=st.session_state['form_data'].get("fecha_registro", fecha_actual.date()), disabled=not es_admin, help="Se guarda automáticamente al registrar (Editable solo por Admin)")
                
                st.markdown("<hr class='form-divider'>", unsafe_allow_html=True)
                
                c_row2 = st.columns(2)
                with c_row2[0]:
                    cd1, cd2 = st.columns([4, 1])
                    dni_input = cd1.text_input("DNI / RUC", value=st.session_state['form_data']["dni"], max_chars=11, placeholder="Ingrese documento")
                    with cd2:
                        st.markdown('<div class="small-btn">', unsafe_allow_html=True)
                        if st.button("🔍", key="btn_search_dni"):
                            if dni_input:
                                res = buscar_cliente_bd(dni_input, por_dni=True)
                                if res:
                                    st.toast(f"Cliente: {res['nombre_completo']}", icon="✅")
                                    st.session_state['form_data'].update({'cliente': res['nombre_completo'], 'email': res['email'] or "", 'celular': res['celular'] or ""})
                                    if res['distrito']: st.session_state['form_data']['distrito'] = res['distrito']
                                    st.rerun()
                                else: st.toast("DNI no encontrado", icon="⚠️")
                        st.markdown('</div>', unsafe_allow_html=True)
                with c_row2[1]:
                    cn1, cn2 = st.columns([4, 1])
                    nom_input = cn1.text_input("Nombre de Cliente", value=st.session_state['form_data']["cliente"], placeholder="Nombres y apellidos")
                    with cn2:
                        st.markdown('<div class="small-btn">', unsafe_allow_html=True)
                        if st.button("🔍", key="btn_search_nom"):
                            if nom_input:
                                res = buscar_cliente_bd(nom_input, por_dni=False)
                                if res:
                                    st.toast(f"Encontrado: {res['dni_ruc']}", icon="✅")
                                    st.session_state['form_data'].update({'dni': res['dni_ruc'], 'email': res['email'] or "", 'celular': res['celular'] or ""})
                                    if res['distrito']: st.session_state['form_data']['distrito'] = res['distrito']
                                    st.rerun()
                                else: st.toast("Nombre no encontrado", icon="⚠️")
                        st.markdown('</div>', unsafe_allow_html=True)

                c_row3 = st.columns([1, 1, 1.5])
                cel_input = c_row3[0].text_input("Celular", value=st.session_state['form_data']["celular"], placeholder="Ej: 987654321")
                email_input = c_row3[1].text_input("Email", value=st.session_state['form_data']["email"], placeholder="correo@ejemplo.com")
                
                with c_row3[2]:
                    ub_pais = st.session_state['form_data'].get('pais', 'Perú')
                    ub_dep = st.session_state['form_data'].get('departamento', '')
                    ub_prov = st.session_state['form_data'].get('provincia', '')
                    ub_dist = st.session_state['form_data'].get('distrito', '')
                    ub_ciud = st.session_state['form_data'].get('ciudad_ext', '')

                    if ub_pais == "Perú":
                        if ub_dep and ub_prov and ub_dist:
                            texto_ubi = f"{ub_dep} - {ub_prov} - {ub_dist}"
                        elif ub_dist:
                            texto_ubi = f"{ub_dist}"
                        else:
                            texto_ubi = "Ubicación no seleccionada"
                    else:
                        if ub_ciud:
                            texto_ubi = f"{ub_pais} - {ub_ciud}"
                        else:
                            texto_ubi = f"{ub_pais} (Sin especificar)"

                    c_ubi1, c_ubi2 = st.columns([4, 1])
                    c_ubi1.text_input("Ubicación", value=texto_ubi, disabled=True)
                    with c_ubi2:
                        st.markdown('<div class="small-btn">', unsafe_allow_html=True)
                        if st.button("🌎", help="Cambiar ubicación", use_container_width=True):
                            modal_ubicacion()
                        st.markdown('</div>', unsafe_allow_html=True)

                st.markdown("<hr class='form-divider'>", unsafe_allow_html=True)

                lista_seleccionados = st.session_state['form_data'].get("curso", [])
                if not isinstance(lista_seleccionados, list): 
                    lista_seleccionados = [lista_seleccionados] if lista_seleccionados else []

                if st.session_state['is_editing']:
                    for c in lista_seleccionados:
                        if c not in lista_cursos_form:
                            lista_cursos_form.append(c)
                            mapa_eventos[c] = {'id': st.session_state['form_data'].get('evento_id'), 'precio': st.session_state['form_data'].get('monto'), 'turno': '', 'fecha_obj': None, 'is_lleno': False}

                c_row4 = st.columns([3, 1])
                curso_input = c_row4[0].multiselect(
                    "Cursos Registrados (Seleccione uno o varios)", 
                    lista_cursos_form, 
                    default=lista_seleccionados, 
                    key=f"widget_cursos_{st.session_state['form_key_counter']}", 
                    on_change=on_cursos_change, 
                    placeholder="Agregue cursos al carrito..."
                )
                t_val = st.session_state['form_data'].get("turno", "")
                turno_input = c_row4[1].text_input("Turno(s)", value=t_val, disabled=True)
                
                if len(curso_input) > 0:
                    st.caption("🔹 **Desglose de precios base (Catálogo):** " + " | ".join([f"{c.split(' [')[0]}: S/ {mapa_eventos[c]['precio']:.2f}" for c in curso_input if c in mapa_eventos]))

                st.markdown("<hr class='form-divider'>", unsafe_allow_html=True)

                c_fin1, c_fin2, c_fin3, c_fin4 = st.columns(4)
                monto_input = c_fin1.number_input("Precio Base (Suma)", min_value=0.0, value=float(st.session_state['form_data']["monto"]), step=10.0)
                dscto_input = c_fin2.number_input("Descuento Global (-)", min_value=0.0, value=float(st.session_state['form_data']["dscto"]), step=5.0)
                acuenta_input = c_fin3.number_input("Primer Pago (A Cuenta)", min_value=0.0, value=float(st.session_state['form_data']["a_cuenta"]), step=10.0)
                
                total_calc = round(max(0.0, monto_input - dscto_input), 2)
                saldo_calc = round(max(0.0, total_calc - acuenta_input), 2)
                
                with c_fin4: 
                    if saldo_calc > 0: 
                        st.metric("Saldo Pendiente", f"S/ {saldo_calc:.2f}", delta="- Pendiente", delta_color="inverse")
                    else: 
                        st.metric("Saldo Pendiente", f"S/ {saldo_calc:.2f}", delta="⚠️ Por Validar", delta_color="off")
                
                # 🟢 AÑADIMOS EL ORIGEN COMO UNA 5TA COLUMNA DINÁMICA
                c_pag1, c_pag2, c_pag3, c_pag4, c_pag5 = st.columns(5)
                
                t_val_v = st.session_state['form_data'].get("tipo")
                t_idx = VentaModel.get_tipos_venta().index(t_val_v) if t_val_v in VentaModel.get_tipos_venta() else None
                tipo_input = c_pag1.selectbox("Tipo Venta", VentaModel.get_tipos_venta(), index=t_idx, placeholder="Seleccione...")
                
                o_val_v = st.session_state['form_data'].get("origen")
                o_idx = VentaModel.get_origen_venta().index(o_val_v) if o_val_v in VentaModel.get_origen_venta() else None
                origen_input = c_pag2.selectbox("Origen", VentaModel.get_origen_venta(), index=o_idx, placeholder="Seleccione...")
                
                cta_val = st.session_state['form_data'].get("cuenta")
                cta_idx = VentaModel.get_cuentas().index(cta_val) if cta_val in VentaModel.get_cuentas() else None
                cuenta_input = c_pag3.selectbox("Método", VentaModel.get_cuentas(), index=cta_idx, placeholder="Seleccione...")
                
                op_input = c_pag4.text_input("N° Operación", value=st.session_state['form_data'].get("operacion", ""))
                
                if not st.session_state['is_editing']:
                    if rol_actual in ['admin', 'coordinador']: 
                        v_idx = None
                    else:
                        try: v_idx = lista_vendedores.index(usuario_actual)
                        except: v_idx = None
                else:
                    v_val = st.session_state['form_data'].get("vendedor")
                    v_idx = lista_vendedores.index(v_val) if v_val in lista_vendedores else None
                
                disable_vendedor_form = False if rol_actual in ['admin', 'coordinador'] else True
                vend_nombre_input = c_pag5.selectbox("Vendedor", lista_vendedores, index=v_idx, disabled=disable_vendedor_form, placeholder="Seleccione...")
                
                st.markdown("<hr class='form-divider'>", unsafe_allow_html=True)
                
                obs_input = st.text_input("Observaciones / Detalles Adicionales", value=st.session_state['form_data']["nota"], placeholder="Información extra de la venta...")

                st.write("")
                label_btn = "💾 Guardar Cambios" if st.session_state['is_editing'] else "💾 Registrar Venta"

                deshabilitar_boton = False
                for c in curso_input:
                    info_c = mapa_eventos.get(c, {})
                    if info_c.get('is_lleno', False) and not st.session_state['is_editing']:
                        if rol_actual in ['admin', 'coordinador']:
                            st.warning(f"⚠️ Atención: Estás inscribiendo al alumno en el curso **{c}** que ya ha alcanzado su límite de aforo.")
                        else:
                            st.error(f"🚨 El curso **{c}** está lleno. No se puede registrar.")
                            deshabilitar_boton = True
                            break
                
                pais_input = st.session_state['form_data'].get('pais', 'Perú')
                dist_input = st.session_state['form_data'].get('distrito')
                ciudad_ext_input = st.session_state['form_data'].get('ciudad_ext', '')

                if st.button(label_btn, type="primary", use_container_width=True, disabled=deshabilitar_boton):
                    st.session_state['form_data'].update({
                        "fecha_venta": fecha_v_input, "fecha_registro": fecha_r_input, "dni": dni_input, "cliente": nom_input, 
                        "celular": cel_input, "curso": curso_input, 
                        "turno": turno_input, "email": email_input, "monto": monto_input, 
                        "dscto": dscto_input, "a_cuenta": acuenta_input, "tipo": tipo_input, "origen": origen_input,
                        "cuenta": cuenta_input, "vendedor": vend_nombre_input, "nota": obs_input,
                        "operacion": op_input
                    })
                    
                    if not nom_input or len(curso_input) == 0 or not tipo_input or not origen_input or not cuenta_input or not vend_nombre_input: 
                        st.error("⚠️ Faltan datos obligatorios (Cliente, Cursos, Tipo y Origen de Venta).")
                    elif pais_input == "Perú" and not dist_input:
                        st.error("⚠️ Por favor, seleccione la Ubicación (Departamento/Provincia/Distrito) haciendo clic en el botón del Mundo 🌎.")
                    elif round(float(acuenta_input), 2) < 0:
                        st.error("⚠️ El monto 'A Cuenta' no puede ser negativo.")
                    elif round(float(acuenta_input), 2) > round(float(total_calc), 2):
                        st.error(f"⚠️ Error: El cliente debe pagar un total de S/ {total_calc:.2f}. No puedes registrar S/ {acuenta_input:.2f} a cuenta.")
                    else:
                        try:
                            catalogo_total = sum([mapa_eventos[c]['precio'] for c in curso_input if c in mapa_eventos])
                            items_venta = []
                            suma_distribuida = 0.0
                            
                            for i, c in enumerate(curso_input):
                                info = mapa_eventos[c]
                                peso = (info['precio'] / catalogo_total) if catalogo_total > 0 else (1.0 / len(curso_input))
                                subtotal_item = round(total_calc * peso, 2)
                                
                                if i == len(curso_input) - 1:
                                    subtotal_item = round(total_calc - suma_distribuida, 2)
                                
                                suma_distribuida += subtotal_item
                                items_venta.append({'id': info['id'], 'precio_base': info['precio'], 'subtotal': subtotal_item})

                            dist_id = VentaModel.get_id_distrito(dist_input) if dist_input else None
                            id_usuario_final = mapa_vendedores.get(vend_nombre_input, 1)
                            
                            d_cli = {'dni': dni_input, 'nombre': nom_input, 'celular': cel_input, 'email': email_input, 'distrito_id': dist_id, 'pais': pais_input, 'ciudad_extranjera': ciudad_ext_input}
                            d_ven = {'precio': total_calc, 'descuento': dscto_input, 'obs': obs_input, 'tipo_venta': tipo_input, 'origen': origen_input, 'fecha_venta': fecha_v_input, 'fecha_registro': fecha_r_input}
                            d_pag = {'monto': acuenta_input, 'metodo': cuenta_input}
                            
                            if st.session_state['is_editing']:
                                ok, msg = VentaModel.update_venta(st.session_state['edit_id'], d_ven, d_pag, d_cli, items_venta)
                                if ok: 
                                    st.success(msg)
                                    st.session_state['is_editing'] = False
                                    st.session_state['edit_id'] = None
                                    st.session_state['form_data'] = reset_dict.copy()
                                    st.session_state['form_key_counter'] += 1
                                    st.rerun()
                                else: st.error(msg)
                            else:
                                try:
                                    conn = Database.get_connection(); cur = conn.cursor()
                                    cur.execute("SELECT id FROM clientes WHERE dni_ruc = %s", (dni_input,)); res_c = cur.fetchone()
                                    if res_c: id_cliente = res_c[0]
                                    else: 
                                        cur.execute("INSERT INTO clientes (dni_ruc, nombre_completo, celular, email, distrito_id, fecha_registro) VALUES (%s, %s, %s, %s, %s, NOW())", (dni_input, nom_input, cel_input, email_input, dist_id))
                                        id_cliente = cur.lastrowid
                                        conn.commit()
                                    conn.close()
                                except: st.error("Error al registrar el cliente en BD"); st.stop()
                                
                                estado_calculado = 'PENDIENTE'
                                # 🟢 SE PASA ORIGEN INPUT COMO PARAMETRO EXTRA
                                ok, msg = VentaModel.registrar_venta_completa(id_cliente, id_usuario_final, total_calc, saldo_calc, estado_calculado, tipo_input, origen_input, items_venta, acuenta_input, cuenta_input, op_input, obs_input, fecha_v_input, dscto_input, fecha_r_input)
                                if ok: 
                                    st.success("✅ ¡Venta Registrada!")
                                    st.session_state['form_data'] = reset_dict.copy()
                                    st.session_state['form_key_counter'] += 1
                                    st.rerun()
                                else: st.error(msg)
                        except Exception as e: st.error(f"Error interno: {e}")

    # --- TABLAS Y RESULTADOS ---
    if not df_show.empty:
        df_display = df_show.rename(columns={
            "id":"ID", "vendedor": "Vendedor", "fecha_venta": "F. Venta", "fecha_registro": "F. Reg", 
            "cliente":"Nombre", "curso_fmt":"Evento", "tipo_venta":"Tipo",
            "monto":"Precio", "ingreso":"A Cuenta", "por_validar": "P. Validar", "saldo":"Por Cobrar", 
            "estado": "Estado", "dni": "DNI", "cuenta": "Metodo Pago"
        })

        df_display['F. Venta'] = pd.to_datetime(df_display['F. Venta'], errors='coerce').dt.strftime('%Y-%m-%d').fillna('')
        df_display['F. Reg'] = pd.to_datetime(df_display['F. Reg'], errors='coerce').dt.strftime('%Y-%m-%d').fillna('')

        if sub_menu in ["Ventas por Validar", "Ventas Validadas"]:
            col_ratios = [0.5, 1.2, 1, 1, 2, 2, 0.8, 0.8, 0.8, 0.8, 0.8, 1, 0.8, 1.2]
            h = st.columns(col_ratios)
            headers = ["ID", "Vendedor", "F. Venta", "Doc", "Nombre Completo", "Cursos", "Cierre", "Venta", "A Cuenta", "P. Validar", "Saldo", "Método", "Estado", "Acción"]
            for i, text in enumerate(headers):
                h[i].markdown(f"<div class='row-header'>{text}</div>", unsafe_allow_html=True)
            
            for index, row in df_display.iterrows():
                c = st.columns(col_ratios, vertical_alignment="center")
                c[0].write(f"{row['ID']}")
                c[1].write(f"{row['Vendedor']}")
                c[2].write(f"{row['F. Venta']}")
                c[3].write(f"{row['DNI']}")
                c[4].write(f"{row['Nombre']}")
                c[5].write(f"{row['Evento']}") 
                c[6].write(f"{row['Tipo']}")
                c[7].write(f"{float(row['Precio']):.2f}")
                c[8].write(f"{float(row['A Cuenta']):.2f}")
                c[9].write(f"{float(row['P. Validar']):.2f}")
                c[10].write(f"{float(row['Por Cobrar']):.2f}")
                c[11].write(f"{row['Metodo Pago']}")
                c[12].write(f"{row['Estado']}")
                
                with c[13]:
                    if sub_menu == "Ventas por Validar":
                        if st.button("Validar Pagos", key=f"btn_val_{row['ID']}", type="secondary", use_container_width=True):
                            validar_pagos_admin_dialog(int(row['ID']), row['Nombre'])
                    else: st.write("✅ OK")
                st.markdown("<div style='border-bottom: 1px solid #e0e0e0; margin-bottom: 5px;'></div>", unsafe_allow_html=True)

        else:
            cols_show = ["ID", "F. Venta", "Nombre", "Vendedor", "Evento", "Tipo", "Precio", "A Cuenta", "P. Validar", "Por Cobrar", "Estado", "F. Reg"]
            cols_finales = [x for x in cols_show if x in df_display.columns]
            
            event = st.dataframe(df_display[cols_finales], use_container_width=True, hide_index=True, selection_mode="single-row", on_select="rerun",
                column_config={"ID": st.column_config.NumberColumn(format="%d", width="small"), "Precio": st.column_config.NumberColumn(format="S/ %.2f")})
            
            if len(event.selection.rows) > 0:
                idx = event.selection.rows[0]
                sel = df_display.iloc[idx]
                id_sel = int(sel["ID"])
                estado_sel = str(sel.get("Estado", "")).upper()
                
                st.markdown(f"### 💳 Historial de Pagos - Venta #{id_sel}")
                historial_pagos = VentaModel.get_historial_pagos(id_sel)
                
                if historial_pagos:
                    df_pagos = pd.DataFrame(historial_pagos)
                    df_pagos_fmt = df_pagos.rename(columns={
                        'fecha_pago': '📅 Fecha', 'monto': '💰 Monto', 'metodo_pago': '🏦 Método',
                        'nro_operacion': '🔢 Op.', 'estado': '✅ Estado', 'registrado_por': '👤 Recibido por'
                    })
                    st.dataframe(df_pagos_fmt, use_container_width=True, hide_index=True, column_config={"💰 Monto": st.column_config.NumberColumn(format="S/ %.2f"), "📅 Fecha": st.column_config.DatetimeColumn(format="DD/MM/YYYY")})
                else:
                    st.info("No se encontraron registros detallados de pagos para esta venta.")
                
                if estado_sel in ['PARCIAL', 'PENDIENTE']:
                    if st.button("➕ Registrar Nueva Cuota", key=f"add_cuota_{id_sel}"):
                        registrar_cuota_dialog(id_sel, sel['Nombre'], sel['Por Cobrar'], sel['Precio'], sel['A Cuenta'])
                
                if estado_sel == 'PAGADO' and rol_actual not in ['admin', 'coordinador', 'auditor']:
                    st.warning(f"🔒 La Venta #{id_sel} ya está validada y pagada. Solo un Coordinador o Administrador puede modificarla.")
                else:
                    c1, c2 = st.columns(2)
                    if c1.button(f"✏️ MODIFICAR #{id_sel}", use_container_width=True):
                        st.session_state['is_editing'] = True
                        st.session_state['edit_id'] = id_sel
                        
                        row_data = df_hist[df_hist['id'] == id_sel]
                        if not row_data.empty:
                            row_first = row_data.iloc[0]
                            
                            curso_display_matches = []
                            for _, r in row_data.iterrows():
                                evt_id = r.get("evento_id")
                                c_match = None
                                for k, v in mapa_eventos.items():
                                    if str(v['id']) == str(evt_id):
                                        c_match = k
                                        break
                                
                                if c_match and c_match not in curso_display_matches:
                                    curso_display_matches.append(c_match)
                                elif not c_match:
                                    c_match_fallback = f"{r.get('curso_fmt')} - (ANTIGUO/CERRADO)"
                                    if c_match_fallback not in curso_display_matches:
                                        curso_display_matches.append(c_match_fallback)
                            
                            precio_base_catalogo = sum([mapa_eventos[c]['precio'] for c in curso_display_matches if c in mapa_eventos])

                            op_inicial = ""
                            if historial_pagos:
                                op_inicial = str(historial_pagos[-1].get('nro_operacion') or "")

                            st.session_state['form_data'].update({
                                "fecha_venta": row_first.get("fecha_venta", fecha_actual.date()),
                                "fecha_registro": row_first.get("fecha_registro", fecha_actual.date()),
                                "dni": row_first.get("dni", ""),
                                "cliente": row_first.get("cliente", ""),
                                "celular": row_first.get("celular", "") if pd.notna(row_first.get("celular")) else "",
                                "email": row_first.get("email", "") if pd.notna(row_first.get("email")) else "",
                                "distrito": row_first.get("distrito", None) if pd.notna(row_first.get("distrito")) else None,
                                "pais": row_first.get("pais", "Perú") if "pais" in row_first else "Perú",
                                "ciudad_ext": row_first.get("ciudad_extranjera", "") if "ciudad_extranjera" in row_first and pd.notna(row_first.get("ciudad_extranjera")) else "",
                                "curso": curso_display_matches,
                                "turno": " | ".join(list(set([mapa_eventos[c]['turno'] for c in curso_display_matches if c in mapa_eventos]))), 
                                "monto": precio_base_catalogo,
                                "dscto": float(row_first.get("descuento", 0.0)),
                                "a_cuenta": float(row_first.get("ingreso", 0.0)) + float(row_first.get("por_validar", 0.0)),
                                "tipo": row_first.get("tipo_venta", None),
                                "origen": row_first.get("origen", None), # 🟢 SE RECUPERA EL ORIGEN AL EDITAR
                                "cuenta": row_first.get("cuenta", None),
                                "vendedor": row_first.get("vendedor", None),
                                "nota": row_first.get("observacion", "") if pd.notna(row_first.get("observacion")) else "",
                                "operacion": op_inicial
                            })
                            st.session_state['form_key_counter'] += 1
                        st.rerun()
                        
                    if c2.button(f"🗑️ ELIMINAR #{id_sel}", type="primary", use_container_width=True):
                        VentasController.eliminar_venta(id_sel); st.rerun()
    else:
        st.info(f"No hay registros en '{sub_menu}' con los filtros actuales.")