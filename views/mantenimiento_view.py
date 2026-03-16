import streamlit as st
import pandas as pd
from datetime import datetime
from models.mantenimiento_model import MantenimientoModel
import streamlit_antd_components as sac

# --- VENTANAS EMERGENTES (DIALOGS) ---
@st.dialog("✏️ Editar / Inhabilitar Usuario")
def editar_usuario_dialog(user_data):
    st.write(f"Modificando al usuario: **{user_data['Usuario']}**")
    with st.form("form_editar_usuario"):
        c1, c2 = st.columns(2)
        n_nombre = c1.text_input("Nombre Completo", value=user_data['Nombre'])
        n_usuario = c2.text_input("Login (Usuario)", value=user_data['Usuario'])
        
        c3, c4 = st.columns(2)
        roles = ["vendedor", "coordinador", "auditor", "admin"]
        rol_actual = str(user_data['Rol']).lower()
        idx_rol = roles.index(rol_actual) if rol_actual in roles else 0
        n_rol = c3.selectbox("Rol", roles, index=idx_rol)
        
        estados = ["Activo", "Inactivo"]
        estado_actual = "Activo" if user_data['Activo'] == 1 else "Inactivo"
        idx_est = estados.index(estado_actual)
        n_estado = c4.selectbox("Estado del Usuario", estados, index=idx_est)
        
        n_pass = st.text_input("Nueva Contraseña (Opcional)", type="password", placeholder="Dejar en blanco para no cambiar")
        
        if st.form_submit_button("💾 Guardar Cambios", type="primary", use_container_width=True):
            if not n_nombre or not n_usuario: st.error("El nombre y el usuario no pueden estar vacíos.")
            else:
                ok, msg = MantenimientoModel.actualizar_usuario(int(user_data['ID']), n_nombre, n_usuario, n_rol, n_estado, n_pass)
                if ok: st.success(msg); st.rerun()
                else: st.error(msg)

@st.dialog("✏️ Editar / Cerrar Evento", width="large")
def editar_evento_dialog(evt_data, cursos_dict, turnos_dict, modalidad_dict, periodos_dict):
    st.write(f"Modificando evento: **{evt_data['Evento']}**")
    with st.form("form_editar_evento"):
        c1, c2, c3 = st.columns([2, 3, 2])
        try: fecha_actual = datetime.strptime(str(evt_data['Fecha']), '%d/%m/%Y').date()
        except: fecha_actual = datetime.now().date()
        
        n_fecha = c1.date_input("Fecha", value=fecha_actual)
        
        lista_cursos = list(cursos_dict.keys())
        idx_curso = lista_cursos.index(evt_data['Curso']) if evt_data['Curso'] in lista_cursos else 0
        n_curso = c2.selectbox("Curso", lista_cursos, index=idx_curso)

        n_cupos = c3.number_input("Cupos Máximos", min_value=1, value=int(evt_data['Aforo']))
        
        c4, c5, c6, c7 = st.columns(4)
        lista_turnos = list(turnos_dict.keys())
        idx_turno = lista_turnos.index(evt_data['Turno']) if evt_data['Turno'] in lista_turnos else 0
        n_turno = c4.selectbox("Turno", lista_turnos, index=idx_turno)
        
        lista_modalidades = list(modalidad_dict.keys())
        idx_mod = lista_modalidades.index(evt_data['Modalidad']) if evt_data.get('Modalidad') in lista_modalidades else 0
        n_modalidad = c5.selectbox("Modalidad", lista_modalidades, index=idx_mod)
        
        lista_periodos = list(periodos_dict.keys())
        idx_periodo = lista_periodos.index(evt_data['Periodo']) if evt_data.get('Periodo') in lista_periodos else 0
        n_periodo = c6.selectbox("Campaña/Periodo", lista_periodos, index=idx_periodo)

        estados = ["ABIERTO", "CERRADO", "LLENO"]
        idx_est = estados.index(str(evt_data['Estado']).upper()) if str(evt_data['Estado']).upper() in estados else 0
        n_estado = c7.selectbox("Estado", estados, index=idx_est)
        
        n_nombre = st.text_input("Nombre Final del Evento", value=evt_data['Evento'])
        
        if st.form_submit_button("💾 Guardar Cambios", type="primary", use_container_width=True):
            if not n_nombre: st.error("El nombre no puede estar vacío.")
            else:
                ok, msg = MantenimientoModel.actualizar_evento(
                    int(evt_data['ID']), n_nombre, n_fecha, 
                    int(cursos_dict.get(n_curso)), int(turnos_dict.get(n_turno)), 
                    int(modalidad_dict.get(n_modalidad)), int(periodos_dict.get(n_periodo) or 0), 
                    n_cupos, n_estado
                )
                if ok: st.success(msg); st.rerun()
                else: st.error(msg)

@st.dialog("✏️ Editar Curso")
def editar_curso_dialog(curso_data, categorias_dict):
    st.write(f"Modificando Curso: **{curso_data['Nombre']}**")
    with st.form("form_editar_curso"):
        c1, c2 = st.columns([3, 1])
        n_nombre = c1.text_input("Nombre del Curso", value=curso_data['Nombre'])
        n_sku = c2.text_input("SKU", value=curso_data.get('SKU', ''))
        
        c3, c4 = st.columns(2)
        n_precio = c3.number_input("Precio Base (Catálogo)", min_value=0.0, value=float(curso_data['Precio Base']), step=10.0)
        
        lista_cat = list(categorias_dict.keys())
        idx_cat = lista_cat.index(curso_data['Categoria']) if curso_data.get('Categoria') in lista_cat else 0
        n_categoria = c4.selectbox("Categoría", lista_cat, index=idx_cat)
        
        if st.form_submit_button("💾 Guardar Cambios", type="primary", use_container_width=True):
            if not n_nombre: st.error("El nombre no puede estar vacío.")
            else:
                ok, msg = MantenimientoModel.actualizar_curso(int(curso_data['ID']), n_nombre, n_sku, n_precio, int(categorias_dict.get(n_categoria)))
                if ok: st.success(msg); st.rerun()
                else: st.error(msg)

@st.dialog("✏️ Editar Periodo / Campaña")
def editar_periodo_dialog(per_data):
    st.write(f"Modificando Periodo: **{per_data['Nombre']}**")
    with st.form("form_editar_periodo"):
        n_nombre = st.text_input("Nombre del Periodo", value=per_data['Nombre'])
        
        c1, c2 = st.columns(2)
        try: f_ini_val = datetime.strptime(str(per_data.get('Inicio', datetime.now().date())), '%Y-%m-%d').date()
        except: f_ini_val = datetime.now().date()
        
        try: f_fin_val = datetime.strptime(str(per_data.get('Fin', datetime.now().date())), '%Y-%m-%d').date()
        except: f_fin_val = datetime.now().date()
        
        n_f_ini = c1.date_input("Fecha Inicio", value=f_ini_val)
        n_f_fin = c2.date_input("Fecha Fin", value=f_fin_val)

        estados = ["ACTIVO", "CERRADO"]
        idx_est = estados.index(str(per_data['Estado']).upper()) if str(per_data['Estado']).upper() in estados else 0
        n_estado = st.selectbox("Estado", estados, index=idx_est)
        
        if st.form_submit_button("💾 Guardar Cambios", type="primary", use_container_width=True):
            if not n_nombre: st.error("El nombre no puede estar vacío.")
            elif n_f_ini > n_f_fin: st.error("La fecha de inicio no puede ser mayor a la de fin.")
            else:
                ok, msg = MantenimientoModel.actualizar_periodo(int(per_data['ID']), n_nombre, n_f_ini, n_f_fin, n_estado)
                if ok: st.success(msg); st.rerun()
                else: st.error(msg)


# --- VISTA PRINCIPAL ---
def show_mantenimiento(sub_menu):
    st.markdown(f"""
        <style>
        .mant-header {{ color: #d32f2f; font-weight: 800; font-size: 24px; margin-bottom: 20px; }}
        .form-box {{ background-color: #ffffff; padding: 25px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); border: 1px solid #e0e0e0; margin-bottom: 20px;}}
        .metric-box {{ padding: 10px; background-color: #f8f9fa; border-left: 4px solid #d32f2f; border-radius: 5px; margin-bottom: 15px; font-weight: bold; color: #333; }}
        </style>
        <div class="mant-header">{sub_menu}</div>
    """, unsafe_allow_html=True)

    if sub_menu == 'Registro de Usuario':
        with st.expander("➕ Crear Nuevo Usuario", expanded=False):
            st.markdown('<div class="form-box">', unsafe_allow_html=True)
            c1, c2 = st.columns(2)
            nombre = c1.text_input("Nombre Completo", placeholder="Ej: Juan Perez")
            usuario = c2.text_input("Usuario (Login)", placeholder="Ej: jperez")
            
            c3, c4 = st.columns(2)
            password = c3.text_input("Contraseña", type="password", placeholder="Escriba la contraseña secreta")
            rol = c4.selectbox("Rol del Usuario", ["vendedor", "coordinador", "auditor", "admin"], index=None, placeholder="Seleccione un rol...")
            
            st.markdown("<br>", unsafe_allow_html=True)
            if st.button("💾 Guardar Nuevo Usuario", use_container_width=True, type="primary"):
                if not nombre or not usuario or not password or not rol: st.error("⚠️ Error: Todos los campos son obligatorios.")
                else:
                    success, msg = MantenimientoModel.crear_usuario(nombre, usuario, password, rol)
                    if success: st.success(msg); st.rerun()
                    else: st.error(msg)
            st.markdown('</div>', unsafe_allow_html=True)

        st.markdown("### 👥 Lista de Usuarios del Sistema")
        usuarios_data = MantenimientoModel.get_usuarios()
        if usuarios_data:
            df_users = pd.DataFrame(usuarios_data)
            df_users.rename(columns={'id':'ID', 'nombre':'Nombre', 'usuario':'Usuario', 'rol':'Rol', 'activo':'Activo'}, inplace=True)
            df_users['Estado'] = df_users['Activo'].apply(lambda x: "🟢 Activo" if x == 1 else "🔴 Inactivo")
            cols_show = ['ID', 'Nombre', 'Usuario', 'Rol', 'Estado']
            event = st.dataframe(df_users[cols_show], use_container_width=True, hide_index=True, selection_mode="single-row", on_select="rerun")
            if len(event.selection.rows) > 0:
                idx = event.selection.rows[0]; sel = df_users.iloc[idx]
                c_btn1, c_btn2, _ = st.columns([1, 1, 3])
                if c_btn1.button("✏️ Editar", use_container_width=True): editar_usuario_dialog(sel)
                if c_btn2.button("🗑️ Eliminar", type="primary", use_container_width=True):
                    ok, msg = MantenimientoModel.eliminar_usuario(int(sel['ID']))
                    if ok: st.success(msg); st.rerun()
                    else: st.error(msg)
        else: st.info("No hay usuarios.")

    elif sub_menu == 'Agenda de Cursos':
        cursos = MantenimientoModel.get_lista_cursos(); turnos = MantenimientoModel.get_lista_turnos() 
        modalidades = MantenimientoModel.get_lista_modalidad(); periodos = MantenimientoModel.get_lista_periodos()
        
        curso_dict = {c['nombre']: c['id'] for c in cursos} if cursos else {}
        turno_dict = {t['nombre']: t['id'] for t in turnos} if turnos else {}
        modalidad_dict = {m['nombre']: m['id'] for m in modalidades} if modalidades else {}
        periodo_dict = {p['nombre']: p['id'] for p in periodos} if periodos else {}

        with st.expander("➕ Crear Nuevo Evento", expanded=False):
            st.markdown('<div class="form-box">', unsafe_allow_html=True)
            c1, c2, c3 = st.columns([2, 3, 2])
            fecha = c1.date_input("Fecha del Evento", value=datetime.now().date())
            nom_curso = c2.selectbox("Curso Base", list(curso_dict.keys()) if cursos else [], index=None, placeholder="Seleccione el curso...")
            cupos_max = c3.number_input("Cupos (Aforo)", min_value=1, value=20)
            
            c4, c5, c6, c7 = st.columns(4)
            nom_turno = c4.selectbox("Turno", list(turno_dict.keys()) if turnos else [], index=None, placeholder="Turno...")
            nom_modalidad = c5.selectbox("Modalidad", list(modalidad_dict.keys()) if modalidades else [], index=None, placeholder="Modalidad...")
            nom_periodo = c6.selectbox("Campaña/Periodo", list(periodo_dict.keys()) if periodos else [], index=None, placeholder="Periodo...")
            estado = c7.selectbox("Estado", ["ABIERTO", "CERRADO", "LLENO"], index=None, placeholder="Estado...")
            
            nombre_evento = st.text_input("Nombre Final del Evento", value=f"{nom_curso}" if nom_curso else "")

            st.markdown("<br>", unsafe_allow_html=True)
            if st.button("📅 Crear Evento", use_container_width=True, type="primary"):
                if not nom_curso or not nom_turno or not nom_modalidad or not nom_periodo or not estado or not nombre_evento: 
                    st.error("⚠️ Faltan datos obligatorios (No olvides elegir el periodo).")
                else:
                    success, msg = MantenimientoModel.crear_evento(
                        nombre_evento, fecha, curso_dict.get(nom_curso), 
                        turno_dict.get(nom_turno), modalidad_dict.get(nom_modalidad), 
                        periodo_dict.get(nom_periodo), cupos_max, estado
                    )
                    if success: st.success(msg); st.rerun()
                    else: st.error(msg)
            st.markdown('</div>', unsafe_allow_html=True)

        st.markdown("### 📅 Matriz de Control de Eventos")
        eventos_data = MantenimientoModel.get_eventos()
        if eventos_data:
            df_evt = pd.DataFrame(eventos_data)
            df_evt.rename(columns={'id':'ID', 'nombre_evento':'Evento', 'fecha':'Fecha', 'curso':'Curso', 'turno':'Turno', 'modalidad':'Modalidad', 'periodo':'Periodo', 'aforo':'Aforo', 'inscritos': 'Inscritos', 'estado':'Estado'}, inplace=True)
            df_evt['Fecha'] = pd.to_datetime(df_evt['Fecha'])
            
            df_evt['Mes_Año'] = df_evt['Fecha'].dt.strftime('%m/%Y')
            
            año_actual = datetime.now().year
            meses_fijos = [f"{str(m).zfill(2)}/{año_actual}" for m in range(1, 13)]
            opciones_mes = sorted(list(set(meses_fijos + list(df_evt['Mes_Año'].unique()))))
            
            f_col1, f_col2, f_col3 = st.columns(3)
            filtro_mes = f_col1.selectbox("Filtrar por Mes", ["Todos"] + opciones_mes)
            filtro_estado = f_col2.selectbox("Filtrar Estado", ["Todos", "ABIERTO", "LLENO", "CERRADO"])
            
            opciones_periodos = ["Todos"] + list(df_evt['Periodo'].dropna().unique())
            filtro_periodo = f_col3.selectbox("Filtrar por Periodo", opciones_periodos)
            
            if filtro_mes != "Todos": df_evt = df_evt[df_evt['Mes_Año'] == filtro_mes]
            if filtro_estado != "Todos": df_evt = df_evt[df_evt['Estado'] == filtro_estado]
            if filtro_periodo != "Todos": df_evt = df_evt[df_evt['Periodo'] == filtro_periodo]
            
            df_evt['Fecha'] = df_evt['Fecha'].dt.strftime('%d/%m/%Y')
            
            cols_show = ['ID', 'Fecha', 'Evento', 'Periodo', 'Curso', 'Turno', 'Modalidad', 'Inscritos', 'Aforo', 'Estado']
            
            event = st.dataframe(df_evt[cols_show], use_container_width=True, height=500, hide_index=True, selection_mode="single-row", on_select="rerun")
            
            if len(event.selection.rows) > 0:
                idx = event.selection.rows[0]; sel = df_evt.iloc[idx]
                c_btn1, c_btn2, _ = st.columns([1, 1, 3])
                if c_btn1.button("✏️ Editar", use_container_width=True): editar_evento_dialog(sel, curso_dict, turno_dict, modalidad_dict, periodo_dict)
                if c_btn2.button("🗑️ Eliminar", type="primary", use_container_width=True):
                    ok, msg = MantenimientoModel.eliminar_evento(int(sel['ID']))
                    if ok: st.success(msg); st.rerun()
                    else: st.error(msg)
        else:
            st.info("No hay eventos registrados.")

    elif sub_menu == 'Registro de Cursos':
        categorias_data = MantenimientoModel.get_lista_categorias()
        cat_dict = {c['nombre']: c['id'] for c in categorias_data} if categorias_data else {}

        with st.expander("➕ Añadir Nuevo Curso al Catálogo", expanded=False):
            st.markdown('<div class="form-box">', unsafe_allow_html=True)
            c1, c2, c3 = st.columns([2, 1, 2])
            nombre_curso = c1.text_input("Nombre del Curso", placeholder="Ej: Especialización en Finanzas")
            sku_curso = c2.text_input("Código SKU", placeholder="Ej: 01013")
            cat_curso = c3.selectbox("Categoría", list(cat_dict.keys()), index=None, placeholder="Seleccione...")
            
            c4, _ = st.columns([1, 3])
            precio_curso = c4.number_input("Precio Base (S/)", min_value=0.0, value=0.0, step=10.0)
            
            st.markdown("<br>", unsafe_allow_html=True)
            if st.button("💾 Guardar Nuevo Curso", use_container_width=True, type="primary"):
                if not nombre_curso or not cat_curso: st.error("⚠️ El nombre y la categoría son obligatorios.")
                else:
                    success, msg = MantenimientoModel.crear_curso(nombre_curso, sku_curso, precio_curso, cat_dict.get(cat_curso))
                    if success: st.success(msg); st.rerun()
                    else: st.error(msg)
            st.markdown('</div>', unsafe_allow_html=True)

        st.markdown("### 📚 Catálogo Activo de Cursos")
        cursos_detalle = MantenimientoModel.get_cursos_detalle()
        if cursos_detalle:
            df_cur = pd.DataFrame(cursos_detalle)
            df_cur.rename(columns={'id':'ID', 'nombre':'Nombre', 'codigo_sku': 'SKU', 'precio_base':'Precio Base', 'categoria':'Categoria'}, inplace=True)
            cols_show = ['ID', 'SKU', 'Nombre', 'Categoria', 'Precio Base']
            
            event = st.dataframe(df_cur[cols_show], use_container_width=True, height=500, hide_index=True, selection_mode="single-row", on_select="rerun")
            if len(event.selection.rows) > 0:
                idx = event.selection.rows[0]; sel = df_cur.iloc[idx]
                c_btn1, c_btn2, _ = st.columns([1, 1, 3])
                if c_btn1.button("✏️ Editar Curso", use_container_width=True): editar_curso_dialog(sel, cat_dict)
                if c_btn2.button("🗑️ Eliminar", type="primary", use_container_width=True):
                    ok, msg = MantenimientoModel.eliminar_curso(int(sel['ID']))
                    if ok: st.success(msg); st.rerun()
                    else: st.error(msg)
        else: st.info("No hay cursos registrados.")

    elif sub_menu == 'Registro de Periodos':
        with st.expander("➕ Aperturar Nuevo Periodo/Campaña", expanded=False):
            st.markdown('<div class="form-box">', unsafe_allow_html=True)
            
            c_top1, c_top2 = st.columns([3, 1])
            nombre_periodo = c_top1.text_input("Nombre del Periodo", placeholder="Ej: Febrero 2026")
            estado_periodo = c_top2.selectbox("Estado Inicial", ["ACTIVO", "CERRADO"])
            
            c_f1, c_f2 = st.columns(2)
            f_ini_periodo = c_f1.date_input("Fecha de Inicio")
            f_fin_periodo = c_f2.date_input("Fecha de Fin")
            
            st.markdown("<br>", unsafe_allow_html=True)
            if st.button("💾 Guardar Periodo", use_container_width=True, type="primary"):
                if not nombre_periodo: 
                    st.error("⚠️ El nombre es obligatorio.")
                elif f_ini_periodo > f_fin_periodo:
                    st.error("⚠️ La fecha de inicio no puede ser mayor a la fecha de fin.")
                else:
                    success, msg = MantenimientoModel.crear_periodo(nombre_periodo, f_ini_periodo, f_fin_periodo, estado_periodo)
                    if success: st.success(msg); st.rerun()
                    else: st.error(msg)
            st.markdown('</div>', unsafe_allow_html=True)

        st.markdown("### 🗓️ Historial de Periodos")
        periodos_data = MantenimientoModel.get_periodos_detalle()
        if periodos_data:
            df_per = pd.DataFrame(periodos_data)
            df_per.rename(columns={'id':'ID', 'nombre':'Nombre', 'fecha_inicio': 'Inicio', 'fecha_fin': 'Fin', 'estado':'Estado'}, inplace=True)
            
            df_per['Inicio'] = pd.to_datetime(df_per['Inicio']).dt.strftime('%Y-%m-%d')
            df_per['Fin'] = pd.to_datetime(df_per['Fin']).dt.strftime('%Y-%m-%d')
            df_per['Estado_Visual'] = df_per['Estado'].apply(lambda x: f"🟢 {x}" if x == 'ACTIVO' else f"🔴 {x}")
            
            cols_show = ['ID', 'Nombre', 'Inicio', 'Fin', 'Estado_Visual']
            
            event = st.dataframe(df_per[cols_show], use_container_width=True, height=500, hide_index=True, selection_mode="single-row", on_select="rerun")
            
            if len(event.selection.rows) > 0:
                idx = event.selection.rows[0]; sel = df_per.iloc[idx]
                c_btn1, c_btn2, _ = st.columns([1, 1, 3])
                if c_btn1.button("✏️ Editar Periodo", use_container_width=True): editar_periodo_dialog(sel)
                if c_btn2.button("🗑️ Eliminar", type="primary", use_container_width=True):
                    ok, msg = MantenimientoModel.eliminar_periodo(int(sel['ID']))
                    if ok: st.success(msg); st.rerun()
                    else: st.error(msg)
        else: st.info("No hay periodos registrados.")

# 🟢 NUEVO MÓDULO: ORÍGENES Y TIPOS DE VENTA (Parámetros)
    elif sub_menu == 'Parámetros de Venta':
        st.markdown("Gestión de las listas desplegables para el registro de ventas.")
        col_t1, col_t2 = st.columns(2)
        
        # --- COLUMNA 1: ORÍGENES DE VENTA ---
        with col_t1:
            st.markdown("### 📱 Orígenes de Venta")
            with st.form("form_nuevo_origen"):
                n_origen = st.text_input("Nuevo Origen", placeholder="Ej: Publicidad Google")
                if st.form_submit_button("➕ Añadir Origen"):
                    if n_origen:
                        ok, msg = MantenimientoModel.agregar_parametro("origenes_venta", n_origen)
                        if ok: st.success(msg); st.rerun()
                        else: st.error(msg)
            
            datos_ori = MantenimientoModel.get_parametros("origenes_venta")
            if datos_ori:
                df_ori = pd.DataFrame(datos_ori)
                evt_ori = st.dataframe(df_ori, use_container_width=True, hide_index=True, selection_mode="single-row", on_select="rerun")
                
                # Validación si no se ha seleccionado nada
                if hasattr(evt_ori, 'selection') and len(evt_ori.selection.rows) > 0:
                    id_borrar = df_ori.iloc[evt_ori.selection.rows[0]]['id']
                    if st.button("🗑️ Borrar Origen Seleccionado", key="btn_del_ori"):
                        ok, msg = MantenimientoModel.eliminar_parametro("origenes_venta", int(id_borrar))
                        if ok: st.success(msg); st.rerun()
                        else: st.error(msg)
        
        # --- COLUMNA 2: TIPOS DE VENTA ---
        with col_t2:
            st.markdown("### 🛒 Tipos de Venta")
            with st.form("form_nuevo_tipo"):
                n_tipo = st.text_input("Nuevo Tipo", placeholder="Ej: VIP, Corporativo")
                if st.form_submit_button("➕ Añadir Tipo"):
                    if n_tipo:
                        ok, msg = MantenimientoModel.agregar_parametro("tipos_venta", n_tipo)
                        if ok: st.success(msg); st.rerun()
                        else: st.error(msg)
            
            datos_tip = MantenimientoModel.get_parametros("tipos_venta")
            if datos_tip:
                df_tip = pd.DataFrame(datos_tip)
                evt_tip = st.dataframe(df_tip, use_container_width=True, hide_index=True, selection_mode="single-row", on_select="rerun")
                
                # Validación si no se ha seleccionado nada
                if hasattr(evt_tip, 'selection') and len(evt_tip.selection.rows) > 0:
                    id_borrar_t = df_tip.iloc[evt_tip.selection.rows[0]]['id']
                    if st.button("🗑️ Borrar Tipo Seleccionado", key="btn_del_tip"):
                        ok, msg = MantenimientoModel.eliminar_parametro("tipos_venta", int(id_borrar_t))
                        if ok: st.success(msg); st.rerun()
                        else: st.error(msg)

    # 🛠️ MÓDULO: MI PERFIL
    elif sub_menu == 'Mi Perfil':
        nombre_usuario = st.session_state.get('usuario')
        mi_data = MantenimientoModel.get_usuario_por_login(nombre_usuario)
        
        if mi_data:
            with st.expander("👤 Mis Datos Personales", expanded=True):
                st.markdown('<div class="form-box">', unsafe_allow_html=True)
                c1, c2, c3 = st.columns(3)
                c1.text_input("Nombre Completo", value=mi_data['nombre'], disabled=True)
                c2.text_input("Usuario (Login)", value=mi_data['usuario'], disabled=True)
                c3.text_input("Rol en el Sistema", value=mi_data['rol'], disabled=True)
                st.markdown('</div>', unsafe_allow_html=True)
                
            with st.expander("🔐 Seguridad y Acceso", expanded=True):
                st.markdown('<div class="form-box">', unsafe_allow_html=True)
                with st.form("form_cambiar_pass"):
                    st.write("¿Deseas cambiar tu contraseña de acceso?")
                    p1, p2 = st.columns(2)
                    nueva_pass = p1.text_input("Ingresa tu nueva contraseña", type="password")
                    conf_pass = p2.text_input("Confirma la nueva contraseña", type="password")
                    
                    st.markdown("<br>", unsafe_allow_html=True)
                    if st.form_submit_button("Actualizar mi Contraseña", type="primary", use_container_width=True):
                        if not nueva_pass or not conf_pass:
                            st.error("⚠️ Debes llenar ambos campos para cambiar tu contraseña.")
                        elif nueva_pass != conf_pass:
                            st.error("⚠️ Las contraseñas no coinciden. Inténtalo de nuevo.")
                        else:
                            ok, msg = MantenimientoModel.cambiar_password(mi_data['id'], nueva_pass)
                            if ok:
                                st.success(msg)
                                st.rerun()
                            else:
                                st.error(msg)
                st.markdown('</div>', unsafe_allow_html=True)
        else:
            st.error("No se pudieron cargar tus datos de perfil.")