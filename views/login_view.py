import streamlit as st
from controllers.auth_controller import AuthController

def show_login():
    # --- 1. CSS LOGIN
    LOGIN_BG = "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop"

    st.markdown(f"""
    <style>
        /* Fondo con imagen de parrilla y superposición oscura */
        [data-testid="stAppViewContainer"] {{
            background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.7)), url('{LOGIN_BG}');
            background-size: cover; 
            background-position: center; 
            background-attachment: fixed;
        }}
        
        /* Estilos de Inputs para que resalten sobre el fondo oscuro */
        .stTextInput label p {{ 
            color: white !important; 
            text-shadow: 1px 1px 2px black; 
            font-size: 16px;
        }}
        .stTextInput input {{ 
            background-color: #ffffff !important; 
            color: #000000 !important; 
            border: none; 
            font-weight: 500; 
            border-radius: 8px;
        }}
        
        /* Eliminar bordes y fondos del formulario nativo */
        [data-testid="stForm"] {{ 
            border: none !important; 
            box-shadow: none !important; 
            background-color: transparent !important; 
            padding: 0 !important; 
        }}
        
        /* Botón primario */
        div.stButton > button {{
            background-color: #800020 !important; /* Rojo Vino */
            color: white !important;
            border-radius: 8px;
            font-weight: bold;
            border: none;
        }}
    </style>
    """, unsafe_allow_html=True)

    # --- 2. ESTRUCTURA VISUAL ---
    c1, c2, c3 = st.columns([1, 1.2, 1]) # Columnas paraS centrar
    
    with c2:
        st.markdown("<br><br><br>", unsafe_allow_html=True)
        
        # LOGO Y TÍTULO
        st.markdown("""
        <div style='text-align:center;'>
            <div style='font-size:80px; margin-bottom:10px; text-shadow: 2px 2px 4px #000000;'>🔥</div>
            <h1 style='color:white !important; margin:0; text-shadow: 2px 2px 8px #000000;'>ESCUELA DE PARRILLEROS</h1>
            <p style='color:#ecf0f1 !important; font-size:18px; text-shadow: 1px 1px 3px #000000;'>Sistema de Gestión Académica</p>
        </div>
        """, unsafe_allow_html=True)

        # FORMULARIO
        st.markdown("<br>", unsafe_allow_html=True)
        with st.form("login_form"):
            u = st.text_input("Usuario", placeholder="Ingrese su usuario")
            p = st.text_input("Contraseña", type="password", placeholder="••••••••")
            
            st.markdown("<br>", unsafe_allow_html=True)
            submit = st.form_submit_button("INGRESAR AL SISTEMA", use_container_width=True)

            if submit:
                if u and p:
                    AuthController.login(u, p)
                else:
                    st.warning("Por favor ingrese usuario y contraseña.")