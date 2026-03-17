from models.venta_model import VentaModel
import streamlit as st

class VentasController:
    
    @staticmethod
    def cargar_datos_geograficos():
        deps = VentaModel.get_departamentos()
        return {d['id']: d['nombre'] for d in deps}

    @staticmethod
    def cargar_provincias(dep_id):
        provs = VentaModel.get_provincias(dep_id)
        return {p['id']: p['nombre'] for p in provs}

    @staticmethod
    def cargar_distritos(prov_id):
        dists = VentaModel.get_distritos(prov_id)
        return {d['id']: d['nombre'] for d in dists}

    @staticmethod
    def buscar_cliente(dni):
        if len(dni) >= 8:
            return VentaModel.buscar_cliente_por_dni(dni)
        return None

    @staticmethod
    def procesar_registro(datos):
        # Aquí validamos antes de mandar al modelo
        if not datos['cliente']['dni'] or not datos['cliente']['nombre']:
            return False, "⚠️ Faltan datos del cliente."
        if not datos['venta']['evento_id']:
            return False, "⚠️ Seleccione un curso."
            
        # Si no existe user_id en sesión, usamos 1 (Admin) por defecto para evitar crash
        uid = st.session_state.get('user_id', 1) 
        if not uid: uid = 1

        success, msg = VentaModel.registrar_venta_completa(
            uid,
            datos['cliente'],
            datos['venta'],
            datos['pago']
        )
        return success, msg
    
    @staticmethod
    def eliminar_venta(venta_id):
        # Borrado Lógico (Anulación)
        return VentaModel.eliminar_venta(venta_id)
    
    @staticmethod
    def eliminar_venta_fisica(id_venta):
        # Borrado definitivo de la BD (Solo Admin)
        return VentaModel.eliminar_venta_fisica(id_venta)

    @staticmethod
    def editar_pago(pago_id, monto, metodo, operacion, fecha_pago):
        # Editar una cuota específica
        return VentaModel.editar_pago_detalle(pago_id, monto, metodo, operacion, fecha_pago)
        
    @staticmethod
    def anular_pago(pago_id):
        # Anular una cuota específica (Solo Admin)
        return VentaModel.anular_pago_detalle(pago_id)