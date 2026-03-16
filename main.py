import streamlit as st
import streamlit_antd_components as sac
import base64
import os
from views import ordenes_view, reportes_view, login_view, mantenimiento_view, reporte_diario_view 

st.set_page_config(page_title="Sistema LD GRUPO", layout="wide", initial_sidebar_state="expanded")

# FUNCIÓN CSS DINÁMICO Y ESTILOS GLOBALES

def set_background(image_path, opacity=0.92):
    css_fondo = ""
    if os.path.exists(image_path):
        with open(image_path, "rb") as image_file:
            encoded_string = base64.b64encode(image_file.read()).decode()
            css_fondo = f"""
            background-image: url("data:image/png;base64,{encoded_string}");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            """
    
    st.markdown(
        f"""
        <style>
        .stApp {{ {css_fondo} }}
        [data-testid="stMainBlockContainer"] {{
            background-color: rgba(255, 255, 255, {opacity});
            border-radius: 15px;
            padding-top: 2rem; padding-bottom: 2rem; margin-top: 1rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            max-width: 1150px !important; 
            margin: 0 auto;                
        }}
        [data-testid="stHeader"] {{ background: rgba(0,0,0,0); }}
        section[data-testid="stSidebar"] {{
            background-color: #f8f9fa !important;
            width: 280px !important;
            min-width: 280px !important;
            max-width: 280px !important;
        }}
        </style>
        """,
        unsafe_allow_html=True
    )

def main():
    if 'usuario' not in st.session_state:
        login_view.show_login()
    else:
        rol_usuario = st.session_state.get('rol', 'vendedor').lower()
        usuario_nombre = st.session_state.get('usuario', 'Usuario')

        with st.sidebar:
            st.title("Sistema LD") # 🟢 Actualizado
            st.write(f"Hola, **{usuario_nombre}**")
            st.caption(f"Rol: {rol_usuario.capitalize()}")
            
            menu_items = []
            menu_items.append(sac.MenuItem('Inicio', icon='house'))

            # --- MENÚ VENTAS ---
            ventas_subs = [sac.MenuItem('Registrar Venta', icon='pencil-square')]
            if rol_usuario in ['admin', 'auditor']:
                ventas_subs.append(sac.MenuItem('Ventas por Validar', icon='hourglass-split'))
                ventas_subs.append(sac.MenuItem('Ventas Validadas', icon='check-circle-fill'))
            menu_items.append(sac.MenuItem('Ventas', icon='cart', children=ventas_subs))

            # --- MENÚ REPORTES BI ---
            menu_items.append(sac.MenuItem('Reportes BI', icon='bar-chart-line', children=[
                sac.MenuItem('Dashboard', icon='grid-1x2'),
                sac.MenuItem('Gráficos BI', icon='pie-chart'),
            ]))

            # --- CENTRO DE REPORTES (PARA TODOS, PERO DINÁMICO) ---
            reportes_subs = [sac.MenuItem('Reporte Diario', icon='calendar-check')] 
            
            # Roles gerenciales ven todo
            if rol_usuario in ['admin', 'auditor', 'coordinador']:
                reportes_subs.extend([
                    sac.MenuItem('Detalle General Ventas', icon='table'),
                    sac.MenuItem('Cuentas por Cobrar', icon='exclamation-circle'),
                    sac.MenuItem('Lista de Participantes', icon='people'),
                    sac.MenuItem('Historial de Cliente', icon='person-badge')
                ])
            # Vendedores solo ven Cuentas por Cobrar además del Reporte Diario
            elif rol_usuario == 'vendedor':
                reportes_subs.append(sac.MenuItem('Cuentas por Cobrar', icon='exclamation-circle'))
                
            menu_items.append(sac.MenuItem('Centro de Reportes', icon='file-earmark-spreadsheet', children=reportes_subs))

            # --- MANTENIMIENTO ---
            if rol_usuario == 'admin':
                menu_items.append(sac.MenuItem('Mantenimiento', icon='gear', children=[
                    sac.MenuItem('Agenda de Cursos', icon='calendar-plus'),
                    sac.MenuItem('Registro de Usuario', icon='person-plus'),
                    sac.MenuItem('Registro de Cursos', icon='book'),      
                    sac.MenuItem('Registro de Periodos', icon='clock'),
                    sac.MenuItem('Parámetros de Venta', icon='tags'), # 🟢 AQUÍ ESTÁ EL NUEVO MENÚ (Tipos y Orígenes)
                ]))
            elif rol_usuario == 'coordinador':
                menu_items.append(sac.MenuItem('Mantenimiento', icon='gear', children=[
                    sac.MenuItem('Agenda de Cursos', icon='calendar-plus'),
                    sac.MenuItem('Registro de Cursos', icon='book'),      
                    sac.MenuItem('Registro de Periodos', icon='clock'),
                    sac.MenuItem('Mi Perfil', icon='person-badge'), 
                ]))
            else:
                menu_items.append(sac.MenuItem('Mantenimiento', icon='gear', children=[
                    sac.MenuItem('Mi Perfil', icon='person-badge'), 
                ]))

            menu_items.append(sac.MenuItem('Cerrar Sesión', icon='box-arrow-right'))
            selected = sac.menu(menu_items, open_all=True)

        if 'menu_anterior' not in st.session_state:
            st.session_state['menu_anterior'] = selected

        if selected != st.session_state['menu_anterior']:
            llaves_protegidas = ['usuario', 'rol', 'menu_anterior']
            for key in list(st.session_state.keys()):
                if key not in llaves_protegidas and not key.startswith(('sac_', 'st_')):
                    del st.session_state[key]
            st.session_state['menu_anterior'] = selected

        if selected == 'Inicio':
            set_background("assets/fondo_v2.png", opacity=0.1)
        else:
            set_background("assets/fondo_v2.png", opacity=0.95)

        if selected == 'Inicio':
            st.markdown(f"""
                <div style='text-align: center; margin-top: 15%;'>
                    <h1 style='color: #1f2937; text-shadow: 2px 2px 5px rgba(255,255,255,0.8); font-size: 3.5rem;'>¡Bienvenido al Sistema Academia Cyberseguridad!</h1>
                    <h3 style='color: #d32f2f; text-shadow: 1px 1px 3px rgba(255,255,255,0.9);'>Has iniciado sesión como {usuario_nombre}</h3>
                </div>
            """, unsafe_allow_html=True)

        elif selected in ['Registrar Venta', 'Ventas por Validar', 'Ventas Validadas']:
            if selected == 'Registrar Venta' or rol_usuario in ['admin', 'auditor']:
                ordenes_view.show_ordenes(selected)
            else: st.error("Acceso denegado.")

        elif selected in ['Dashboard', 'Gráficos BI']:
            reportes_view.show_reportes(selected)
            
        # --- RUTEADOR DEL CENTRO DE REPORTES ---
        elif selected == 'Reporte Diario':
            reporte_diario_view.show_reporte_diario()
            
        elif selected in ['Detalle General Ventas', 'Lista de Participantes', 'Historial de Cliente']:
            if rol_usuario in ['admin', 'auditor', 'coordinador']:
                reportes_view.show_reportes(selected)
            else: st.error("Acceso denegado.")
            
        elif selected == 'Cuentas por Cobrar':
            if rol_usuario in ['admin', 'auditor', 'coordinador', 'vendedor']:
                reportes_view.show_reportes(selected)
            else: st.error('Acceso denegado')

        elif selected in ['Agenda de Cursos', 'Registro de Cursos', 'Registro de Periodos']:
            if rol_usuario in ['admin', 'coordinador']:
                mantenimiento_view.show_mantenimiento(selected)
            else: st.error("Acceso denegado. Solo Administradores o Coordinadores.")
            
        # 🟢 SE AGREGÓ "Parámetros de Venta" PARA QUE RUTEE CORRECTAMENTE A LA VISTA
        elif selected in ['Registro de Usuario', 'Parámetros de Venta']:
            if rol_usuario == 'admin':
                mantenimiento_view.show_mantenimiento(selected)
            else: st.error("Acceso denegado. Solo Administradores.")
            
        elif selected == 'Mi Perfil':
            mantenimiento_view.show_mantenimiento(selected)

        elif selected == 'Cerrar Sesión':
            st.session_state.clear()
            st.rerun()

if __name__ == '__main__':
    main()