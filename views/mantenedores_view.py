import streamlit as st
import pandas as pd
from models.usuario_model import UsuarioModel

def show_mantenedores():
    # 1. SEGURIDAD: Solo Admin puede ver esto
    if st.session_state.get("rol") != "Administrador":
        st.error("⛔ ACCESO DENEGADO: Se requieren permisos de Administrador.")
        return

    st.markdown("### ⚙️ Configuraciones del Sistema")
    st.markdown("Gestione los accesos y parámetros generales.")

    # Usamos Tabs para organizar (Usuarios hoy, mañana Eventos/Productos)
    tab1, tab2 = st.tabs(["👤 Gestión de Usuarios", "📦 Otros Parámetros"])

    with tab1:
        c1, c2 = st.columns([1, 2])
        
        # FORMULARIO DE CREACIÓN
        with c1:
            st.markdown("#### Nuevo Usuario")
            with st.form("form_user"):
                u_nombre = st.text_input("Nombre Completo")
                u_user = st.text_input("Usuario (Login)")
                u_pass = st.text_input("Contraseña", type="password")
                u_rol = st.selectbox("Rol", ["Vendedor", "Administrador"])
                
                if st.form_submit_button("💾 Crear Usuario", type="primary"):
                    if u_nombre and u_user and u_pass:
                        ok, msg = UsuarioModel.create_user({
                            'nombre': u_nombre, 'usuario': u_user, 
                            'password': u_pass, 'rol': u_rol
                        })
                        if ok: st.success(msg); st.rerun()
                        else: st.error(msg)
                    else:
                        st.warning("Todos los campos son obligatorios")

        # LISTADO DE USUARIOS
        with c2:
            st.markdown("#### Usuarios Activos")
            users = UsuarioModel.get_all_users()
            df_users = pd.DataFrame(users)
            
            if not df_users.empty:
                st.dataframe(
                    df_users, 
                    use_container_width=True, 
                    hide_index=True,
                    column_config={
                        "id": st.column_config.NumberColumn("ID", width="small"),
                        "password": None # Ocultar pass
                    }
                )
                
                # Eliminar usuario (simple)
                col_del, _ = st.columns([1, 3])
                with col_del:
                    id_to_del = st.number_input("ID a Eliminar", min_value=1, step=1)
                    if st.button("🗑️ Eliminar Usuario"):
                        if id_to_del == 1: # Proteccion basica para no borrar al Admin principal
                            st.error("No se puede borrar al Super Admin")
                        else:
                            UsuarioModel.delete_user(id_to_del)
                            st.rerun()

    with tab2:
        st.info("🚧 Módulo de gestión de Eventos/Precios en construcción.")