import streamlit as st
import pandas as pd
from datetime import datetime
import pytz
from config.database import Database

zona_peru = pytz.timezone('America/Lima')

# ==========================================
# FUNCIONES DE BASE DE DATOS PARA EL REPORTE
# ==========================================
def get_vendedores_activos():
    """Obtiene la lista de usuarios que tienen el rol de vendedor"""
    try:
        conn = Database.get_connection()
        cur = conn.cursor(dictionary=True)
        # Filtramos estrictamente por rol vendedor y que estén activos
        cur.execute("SELECT nombre FROM usuarios WHERE activo = 1 AND LOWER(rol) = 'vendedor'")
        data = cur.fetchall()
        conn.close()
        return [row['nombre'] for row in data]
    except Exception as e:
        return []

def cargar_atenciones_bd(vendedor, fecha):
    try:
        conn = Database.get_connection()
        cur = conn.cursor(dictionary=True)
        cur.execute("""
            SELECT cliente_dni as 'Cliente / DNI', tipo_venta as 'Tipo de Venta', 
                   origen as 'Origen', llamada_realizada as 'Llamada Realizada' 
            FROM atenciones_diarias 
            WHERE vendedor_nombre = %s AND fecha_reporte = %s
        """, (vendedor, fecha))
        data = cur.fetchall()
        conn.close()
        
        if data:
            df = pd.DataFrame(data)
            df['Llamada Realizada'] = df['Llamada Realizada'].astype(bool)
            return df
        return pd.DataFrame()
    except Exception as e:
        return pd.DataFrame()

def guardar_atenciones_bd(vendedor, fecha, df_atenciones):
    conn = Database.get_connection()
    if not conn: return False, "Error de conexión a BD."
    
    try:
        cur = conn.cursor()
        cur.execute("DELETE FROM atenciones_diarias WHERE vendedor_nombre = %s AND fecha_reporte = %s", (vendedor, fecha))
        
        if not df_atenciones.empty:
            sql = """INSERT INTO atenciones_diarias (vendedor_nombre, fecha_reporte, cliente_dni, tipo_venta, origen, llamada_realizada) 
                     VALUES (%s, %s, %s, %s, %s, %s)"""
            valores = []
            for _, row in df_atenciones.iterrows():
                valores.append((
                    vendedor, 
                    fecha, 
                    str(row['Cliente / DNI']), 
                    str(row['Tipo de Venta']), 
                    str(row['Origen']), 
                    bool(row['Llamada Realizada'])
                ))
            cur.executemany(sql, valores) 
            
        conn.commit()
        return True, "Reporte diario guardado correctamente."
    except Exception as e:
        return False, str(e)
    finally:
        conn.close()

# ==========================================
# VISTA PRINCIPAL
# ==========================================
def show_reporte_diario():
    st.markdown("""<style>.main-header {color:#d32f2f;font-weight:800;font-size:28px;margin-bottom:15px;}</style>""", unsafe_allow_html=True)
    st.markdown('<div class="main-header">📋 Control Diario de Asesor</div>', unsafe_allow_html=True)
    
    fecha_actual = datetime.now(zona_peru)
    usuario_sesion = st.session_state.get('usuario', 'Asesor Demo')
    rol_sesion = st.session_state.get('rol', 'vendedor').lower()
    
    c1, c2 = st.columns([1, 3])
    fecha_rep = c1.date_input("Fecha del Reporte", value=fecha_actual.date())
    
    # --- LÓGICA DE ROLES PARA EL SELECTOR DE ASESOR ---
    asesor_seleccionado = usuario_sesion
    
    if rol_sesion == 'admin':
        lista_vendedores = get_vendedores_activos()
        
        # Por si el admin no está en la lista de vendedores, lo añadimos para evitar errores de índice
        if usuario_sesion not in lista_vendedores:
            lista_vendedores.insert(0, usuario_sesion)
            
        idx = lista_vendedores.index(usuario_sesion)
        asesor_seleccionado = c2.selectbox("Asesor Responsable (Modo Admin)", lista_vendedores, index=idx)
    else:
        # Los vendedores solo pueden verse a sí mismos
        c2.text_input("Asesor Responsable", value=asesor_seleccionado, disabled=True)
    
    # --- SISTEMA DE MEMORIA DINÁMICO (Detecta cambio de Fecha O de Asesor) ---
    if 'filtro_memoria' not in st.session_state or st.session_state['filtro_memoria'] != (fecha_rep, asesor_seleccionado):
        df_bd = cargar_atenciones_bd(asesor_seleccionado, fecha_rep)
        if not df_bd.empty:
            st.session_state['df_diario'] = df_bd
        else:
            st.session_state['df_diario'] = pd.DataFrame({
                "Cliente / DNI": ["", "", ""], "Tipo de Venta": [None, None, None],
                "Origen": [None, None, None], "Llamada Realizada": [False, False, False]
            })
        st.session_state['filtro_memoria'] = (fecha_rep, asesor_seleccionado)
        st.rerun()

    st.markdown("---")
    st.subheader("1️⃣ Registro de Atenciones (Editable)")
    
    df_editado = st.data_editor(
        st.session_state['df_diario'],
        num_rows="dynamic",
        use_container_width=True,
        column_config={
            "Cliente / DNI": st.column_config.TextColumn("👤 Cliente / DNI", max_chars=100, required=True),
            "Tipo de Venta": st.column_config.SelectboxColumn("🛒 Tipo de Venta", options=["Venta Nueva", "Seguimiento", "Renovación", "Cierre Exitoso", "Duda/Consulta"], required=True),
            "Origen": st.column_config.SelectboxColumn("📱 Origen", options=["WhatsApp", "Facebook", "Instagram", "Llamada Entrante", "Base de Datos", "Referido"], required=True),
            "Llamada Realizada": st.column_config.CheckboxColumn("📞 Llamada (Check)", default=False)
        }
    )
    st.session_state['df_diario'] = df_editado

    # Filtrar válidos para KPIs y Guardado
    df_validos = df_editado[df_editado["Cliente / DNI"].str.strip() != ""]
    
    total_atenciones = len(df_validos)
    llamadas_hechas = df_validos["Llamada Realizada"].sum() if total_atenciones > 0 else 0
    efectividad = round((llamadas_hechas / total_atenciones) * 100, 1) if total_atenciones > 0 else 0.0

    st.markdown("---")
    st.subheader("2️⃣ Resumen de Productividad")
    k1, k2, k3 = st.columns(3)
    k1.metric("Total Atenciones", total_atenciones)
    k2.metric("Llamadas Realizadas ✔️", llamadas_hechas)
    k3.metric("Efectividad de Contacto", f"{efectividad}%")

    st.write("")
    col_btn1, col_btn2 = st.columns(2)
    
    # --- BOTÓN PARA GUARDAR EN BASE DE DATOS ---
    if col_btn1.button("💾 Guardar Reporte en Servidor", type="primary", use_container_width=True):
        if total_atenciones == 0:
            st.warning("⚠️ No hay datos válidos para guardar. Llena al menos un cliente.")
        else:
            with st.spinner("Guardando en Base de Datos..."):
                ok, msg = guardar_atenciones_bd(asesor_seleccionado, fecha_rep, df_validos)
                if ok:
                    st.success(msg)
                else:
                    st.error(f"Error: {msg}")

    # --- BOTÓN PDF (Dejamos el espacio listo) ---
    col_btn2.button("📄 Exportar a PDF (Próximamente)", use_container_width=True, disabled=True)