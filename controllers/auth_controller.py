import streamlit as st
from models.usuario_model import UsuarioModel

class AuthController:
    @staticmethod
    def login(username, password):
        user = UsuarioModel.validar_login(username, password)
        if user:
            # Guardamos en sesión tal como lo hacías antes
            st.session_state.usuario = user['nombre']
            st.session_state.user_id = user['id']
            st.session_state.rol = user['rol']
            st.rerun() # Recarga la página para entrar al sistema
        else:
            st.error("Acceso Denegado. Verifique sus datos.")

    @staticmethod
    def logout():
        st.session_state.usuario = None
        st.session_state.user_id = None
        st.session_state.rol = None
        st.rerun()