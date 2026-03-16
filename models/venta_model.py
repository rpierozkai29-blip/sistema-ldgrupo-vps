import mysql.connector
import streamlit as st
from config.database import Database
from datetime import datetime, date

class VentaModel:

    # ==========================================
    # --- 1. UTILIDADES GENERALES ---
    # ==========================================
    @classmethod
    def get_lista_distritos(cls):
        conn = Database.get_connection()
        nombres = []
        if conn:
            try:
                cur = conn.cursor()
                sql = "SELECT d.nombre FROM distritos d JOIN provincias p ON d.provincia_id = p.id WHERE p.nombre = 'Lima' ORDER BY d.nombre ASC"
                cur.execute(sql)
                res = cur.fetchall()
                nombres = [x[0] for x in res]
            except: pass
            finally: conn.close()
        if not nombres: nombres = ["Cercado de Lima", "Miraflores", "San Isidro"]
        return nombres

    @classmethod
    def get_id_distrito(cls, nombre_distrito):
        conn = Database.get_connection()
        dist_id = 1 
        if conn:
            try:
                cur = conn.cursor()
                cur.execute("SELECT id FROM distritos WHERE nombre = %s LIMIT 1", (nombre_distrito,))
                res = cur.fetchone()
                if res: dist_id = res[0]
            except: pass
            finally: conn.close()
        return dist_id
    
    @classmethod
    def get_lista_paises(cls):
        conn = Database.get_connection()
        if not conn: return ["Perú", "Otro"]
        try:
            cur = conn.cursor()
            cur.execute("SELECT nombre FROM paises ORDER BY CASE WHEN id = 1 THEN 0 ELSE 1 END, nombre ASC")
            res = cur.fetchall()
            if res: return [x[0] for x in res]
            return ["Perú", "Otro"] # Salvavidas si la tabla está vacía
        except: return ["Perú", "Otro"]
        finally: conn.close()

    @classmethod
    def get_lista_departamentos(cls):
        conn = Database.get_connection()
        if not conn: return ["Lima"]
        try:
            cur = conn.cursor()
            cur.execute("SELECT nombre FROM departamentos ORDER BY nombre ASC")
            res = cur.fetchall()
            if res: return [x[0] for x in res]
            return ["Lima"]
        except: return ["Lima"]
        finally: conn.close()

    @classmethod
    def get_provincias_por_dep(cls, nombre_dep):
        conn = Database.get_connection()
        if not conn: return ["Lima"]
        try:
            cur = conn.cursor()
            cur.execute("SELECT p.nombre FROM provincias p JOIN departamentos d ON p.departamento_id = d.id WHERE d.nombre = %s ORDER BY p.nombre ASC", (nombre_dep,))
            res = cur.fetchall()
            if res: return [x[0] for x in res]
            return ["Lima"]
        except: return ["Lima"]
        finally: conn.close()

    @classmethod
    def get_distritos_por_prov(cls, nombre_prov):
        conn = Database.get_connection()
        if not conn: return ["Cercado de Lima"]
        try:
            cur = conn.cursor()
            cur.execute("SELECT d.nombre FROM distritos d JOIN provincias p ON d.provincia_id = p.id WHERE p.nombre = %s ORDER BY d.nombre ASC", (nombre_prov,))
            res = cur.fetchall()
            if res: return [x[0] for x in res]
            return ["Cercado de Lima"]
        except: return ["Cercado de Lima"]
        finally: conn.close()  

    @staticmethod
    def get_turnos(): return ["Mañana", "Tarde", "Noche"]
    
    @staticmethod
    def get_estados_venta(): return ["PENDIENTE", "PAGADO", "ANULADO", "PARCIAL"]
    
    @staticmethod
    def get_cuentas(): return ["Yape", "Plin", "BCP", "BBVA", "Efectivo", "MercadoPago", "CULQI"]
    
    @classmethod
    def get_tipos_venta(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("SELECT nombre FROM tipos_venta ORDER BY nombre ASC")
            return [x[0] for x in cur.fetchall()]
        except: return ["DEL_DIA", "SEGUIMIENTO"]
        finally: 
            if conn: conn.close()

    @classmethod
    def get_origen_venta(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("SELECT nombre FROM origenes_venta ORDER BY nombre ASC")
            return [x[0] for x in cur.fetchall()]
        except: return ["Facebook", "Instagram", "Whatsapp"]
        finally: 
            if conn: conn.close()

    @classmethod
    def get_usuarios_vendedores(cls): 
        conn = Database.get_connection()
        res = [] 
        if conn: 
            try: 
                cur = conn.cursor()
                cur.execute("SELECT nombre FROM usuarios WHERE activo = 1 ORDER BY nombre ASC")
                d = cur.fetchall()
                if d: 
                    res = [x[0] for x in d if x[0]]
            except: pass
            finally: conn.close()
        return res

    @classmethod
    def get_periodos_activos(cls):
        conn = Database.get_connection()
        if conn:
            try:
                cur = conn.cursor(dictionary=True)
                cur.execute("SELECT id, nombre FROM periodos WHERE estado = 'ACTIVO' ORDER BY id ASC")
                return cur.fetchall()
            except Exception as e:
                return []
            finally:
                conn.close()
        return []

    # ==========================================
    # --- 2. GESTIÓN DE EVENTOS / CURSOS ---
    # ==========================================
    @classmethod
    def get_eventos_activos(cls):
        conn = Database.get_connection()
        if conn:
            try:
                cur = conn.cursor(dictionary=True)
                sql = """SELECT e.id, e.nombre_evento, e.fecha_evento, c.precio_base, t.nombre as nombre_turno, 
                                e.estado, e.stock_maximo, e.stock_vendido
                         FROM eventos e 
                         LEFT JOIN cursos c ON e.curso_id = c.id 
                         LEFT JOIN turnos t ON e.turno_id = t.id
                         WHERE e.estado != 'CERRADO'
                         AND e.fecha_evento >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
                         ORDER BY e.fecha_evento ASC"""
                cur.execute(sql)
                return cur.fetchall()
            except: return []
            finally: conn.close()
        return []

    @classmethod
    def get_lista_eventos_categorias(cls):
        conn = Database.get_connection()
        ev, ca = [], []
        if conn:
            try:
                cur = conn.cursor()
                cur.execute("""
                    SELECT DISTINCT CONCAT(nombre_evento, ' [', DATE_FORMAT(fecha_evento, '%d/%m'), ']') as nombre_completo
                    FROM eventos 
                    ORDER BY nombre_completo DESC
                """)
                res_ev = cur.fetchall()
                if res_ev: ev = [x[0] for x in res_ev]
                
                cur.execute("SELECT DISTINCT nombre FROM categorias ORDER BY nombre ASC")
                res_ca = cur.fetchall()
                if res_ca: ca = [x[0] for x in res_ca]
                    
            except Exception as e: pass
            finally: conn.close()
        return ev, ca

    @classmethod
    def get_participantes_por_evento(cls, nombre_evento_completo):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            sql = """
                SELECT DISTINCT c.dni_ruc, c.nombre_completo
                FROM detalle_ventas dv JOIN ventas v ON dv.venta_id = v.id JOIN clientes c ON v.cliente_id = c.id
                JOIN eventos e ON dv.evento_id = e.id
                WHERE CONCAT(e.nombre_evento, ' [', DATE_FORMAT(e.fecha_evento, '%d/%m'), ']') = %s AND v.estado != 'ANULADO'
                ORDER BY c.nombre_completo ASC
            """
            cur.execute(sql, (nombre_evento_completo,))
            return cur.fetchall()
        except: return []
        finally: conn.close()

    @classmethod
    def get_info_evento_detalle(cls, nombre_evento_completo):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            sql = """
                SELECT e.nombre_evento, e.fecha_evento, t.hora_inicio, t.nombre as turno
                FROM eventos e LEFT JOIN turnos t ON e.turno_id = t.id
                WHERE CONCAT(e.nombre_evento, ' [', DATE_FORMAT(e.fecha_evento, '%d/%m'), ']') = %s LIMIT 1
            """
            cur.execute(sql, (nombre_evento_completo,))
            return cur.fetchone()
        except: return None
        finally: conn.close()


    # ==========================================
    # --- 3. OPERACIONES PRINCIPALES DE VENTA ---
    # ==========================================
    @classmethod
    def registrar_venta_completa(cls, id_cliente, id_usuario, total, saldo, estado, tipo_venta, origen_venta, items_venta, monto_pago, metodo_pago, operacion, observacion, fecha_venta, descuento, fecha_registro):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            # 🟢 SE AGREGÓ "origen" AL INSERT
            sql_v = "INSERT INTO ventas (cliente_id, usuario_id, total, descuento, saldo_pendiente, estado, tipo_venta, origen, observacion, fecha_venta, fecha_registro) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cur.execute(sql_v, (id_cliente, id_usuario, total, descuento, total, estado, tipo_venta, origen_venta, observacion, fecha_venta, fecha_registro))
            venta_id = cur.lastrowid

            sql_d = "INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, subtotal) VALUES (%s, %s, %s, %s)"
            for item in items_venta:
                cur.execute(sql_d, (venta_id, item['id'], item['precio_base'], item['subtotal']))

            if monto_pago > 0:
                sql_p = "INSERT INTO pagos (venta_id, monto, metodo_pago, nro_operacion, usuario_id, estado, fecha_pago) VALUES (%s, %s, %s, %s, %s, 'PENDIENTE', %s)"
                cur.execute(sql_p, (venta_id, monto_pago, metodo_pago, operacion, id_usuario, fecha_venta))

            for item in items_venta:
                cur.execute("UPDATE eventos SET stock_vendido = (SELECT COUNT(*) FROM detalle_ventas dv JOIN ventas v ON dv.venta_id = v.id WHERE dv.evento_id = %s AND v.estado != 'ANULADO') WHERE id = %s", (item['id'], item['id']))
                cur.execute("UPDATE eventos SET estado = CASE WHEN stock_vendido >= stock_maximo AND stock_maximo > 0 THEN 'LLENO' ELSE 'ABIERTO' END WHERE id = %s", (item['id'],))

            conn.commit()
            return True, "Venta registrada con éxito y enviada a validación."
        except Exception as e:
            if conn: conn.rollback()
            return False, f"Error BD: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def update_venta(cls, id_venta, d_ven, d_pag, d_cli, items_venta):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("SELECT evento_id FROM detalle_ventas WHERE venta_id = %s", (id_venta,))
            eventos_viejos = [row[0] for row in cur.fetchall()]

            # 🟢 SE AGREGÓ "origen" AL UPDATE
            sql_v = "UPDATE ventas SET total=%s, descuento=%s, observacion=%s, tipo_venta=%s, origen=%s, fecha_venta=%s, fecha_registro=%s WHERE id=%s"
            cur.execute(sql_v, (d_ven['precio'], d_ven['descuento'], d_ven['obs'], d_ven['tipo_venta'], d_ven['origen'], d_ven['fecha_venta'], d_ven['fecha_registro'], id_venta))

            cur.execute("DELETE FROM detalle_ventas WHERE venta_id = %s", (id_venta,))
            sql_d = "INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, subtotal) VALUES (%s, %s, %s, %s)"
            for item in items_venta:
                cur.execute(sql_d, (id_venta, item['id'], item['precio_base'], item['subtotal']))

            sql_c = "UPDATE clientes SET nombre_completo=%s, celular=%s, email=%s, distrito_id=%s, pais_id=1, ciudad_extranjera=%s WHERE dni_ruc=%s"
            cur.execute(sql_c, (d_cli['nombre'], d_cli['celular'], d_cli['email'], d_cli['distrito_id'], d_cli['ciudad_extranjera'], d_cli['dni']))

            eventos_afectados = set(eventos_viejos + [item['id'] for item in items_venta])
            for ev_id in eventos_afectados:
                cur.execute("UPDATE eventos SET stock_vendido = (SELECT COUNT(*) FROM detalle_ventas dv JOIN ventas v ON dv.venta_id = v.id WHERE dv.evento_id = %s AND v.estado != 'ANULADO') WHERE id = %s", (ev_id, ev_id))
                cur.execute("UPDATE eventos SET estado = CASE WHEN stock_vendido >= stock_maximo AND stock_maximo > 0 THEN 'LLENO' ELSE 'ABIERTO' END WHERE id = %s", (ev_id,))

            conn.commit()
            cls.recalcular_saldos_venta(id_venta)
            return True, "Venta actualizada correctamente."
        except Exception as e:
            if conn: conn.rollback()
            return False, f"Error BD: {e}"
        finally:
            if conn: conn.close()

    @staticmethod
    def eliminar_venta(id_venta):
        try:
            conn = Database.get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT evento_id FROM detalle_ventas WHERE venta_id = %s", (id_venta,))
            eventos_afectados = cursor.fetchall()
            
            cursor.execute("UPDATE ventas SET estado = 'ANULADO' WHERE id = %s", (id_venta,))
            cursor.execute("UPDATE pagos SET estado = 'ANULADO' WHERE venta_id = %s AND estado = 'PENDIENTE'", (id_venta,))
            
            for ev in eventos_afectados:
                cursor.execute("""
                    UPDATE eventos SET stock_vendido = (
                        SELECT COUNT(*) FROM detalle_ventas dv JOIN ventas v ON dv.venta_id = v.id 
                        WHERE dv.evento_id = %s AND v.estado != 'ANULADO'
                    ) WHERE id = %s
                """, (ev[0], ev[0]))
                cursor.execute("UPDATE eventos SET estado = CASE WHEN stock_vendido >= stock_maximo AND stock_maximo > 0 THEN 'LLENO' ELSE 'ABIERTO' END WHERE id = %s", (ev[0],))
                
            conn.commit()
            cursor.close(); conn.close()
            return True, "✅ Venta Anulada (Borrado Lógico Exitoso)"
        except Exception as e: 
            return False, f"Error al anular: {e}"


    # ==========================================
    # --- 4. GESTIÓN DE PAGOS Y VALIDACIONES ---
    # ==========================================
    @classmethod
    def registrar_pago_detalle(cls, id_venta, monto, metodo, operacion, usuario_id, nota, fecha_pago):
        conn = Database.get_connection()
        if conn:
            try:
                cur = conn.cursor()
                sql = """
                    INSERT INTO pagos (venta_id, monto, metodo_pago, nro_operacion, usuario_id, estado, referencia, fecha_pago)
                    VALUES (%s, %s, %s, %s, %s, 'PENDIENTE', %s, %s)
                """
                cur.execute(sql, (id_venta, monto, metodo, operacion, usuario_id, nota, fecha_pago))
                conn.commit()
                return True, "Pago registrado para validación."
            except Exception as e:
                if conn: conn.rollback()
                return False, f"Error BD: {e}"
            finally:
                conn.close()
        return False, "Error de conexión."

    @classmethod
    def get_historial_pagos(cls, venta_id):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            sql = """
                SELECT p.id, p.fecha_pago, p.monto, p.metodo_pago, p.nro_operacion, p.estado, u.nombre as registrado_por
                FROM pagos p LEFT JOIN usuarios u ON p.usuario_id = u.id
                WHERE p.venta_id = %s ORDER BY p.fecha_pago DESC
            """
            cur.execute(sql, (venta_id,))
            return cur.fetchall()
        except: return []
        finally: conn.close()
    
    @classmethod
    def validar_pago_individual(cls, pago_id):
        conn = Database.get_connection()
        try:
            conn.start_transaction()
            cur = conn.cursor(dictionary=True)
            cur.execute("UPDATE pagos SET estado = 'PAGADO', fecha_validacion = NOW() WHERE id = %s", (pago_id,))
            
            cur.execute("SELECT venta_id FROM pagos WHERE id = %s", (pago_id,))
            pago_info = cur.fetchone()
            if not pago_info: raise Exception("Pago no encontrado.")
            venta_id = pago_info['venta_id']
            
            conn.commit()
            cls.recalcular_saldos_venta(venta_id)
            return True, "✅ Pago validado con éxito. El dinero ya ingresó a caja."
        except Exception as e:
            conn.rollback()
            return False, str(e)
        finally:
            conn.close()

    @classmethod
    def recalcular_saldos_venta(cls, venta_id):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT SUM(monto) as total_validado FROM pagos WHERE venta_id = %s AND estado = 'PAGADO'", (venta_id,))
            suma_validados = cur.fetchone()['total_validado'] or 0.0
            total_validado = round(float(suma_validados), 2)
            
            cur.execute("SELECT total FROM ventas WHERE id = %s", (venta_id,))
            venta_info = cur.fetchone()
            total_venta = round(float(venta_info['total']), 2)
            nuevo_saldo = round(total_venta - total_validado, 2)
            
            # LÓGICA ESTRICTA:
            if nuevo_saldo <= 0.01:
                nuevo_estado = 'PAGADO'
            elif total_validado == 0:
                nuevo_estado = 'PENDIENTE'
            else:
                nuevo_estado = 'PARCIAL'
            
            cur.execute("UPDATE ventas SET saldo_pendiente = %s, estado = %s WHERE id = %s", (nuevo_saldo, nuevo_estado, venta_id))
            conn.commit()
        except:
            if conn: conn.rollback()
        finally:
            if conn: conn.close()


    # ==========================================
    # --- 5. LECTURA DE REPORTES Y TABLAS ---
    # ==========================================
    @classmethod
    def get_historial_filtrado(cls, f_ini, f_fin, f_asesor, f_tipo):
        conn = Database.get_connection()
        if conn:
            try:
                cur = conn.cursor(dictionary=True)
                sql = """
                    SELECT v.id, v.fecha_venta, DATE(v.fecha_registro) as fecha_registro, c.dni_ruc as dni, c.nombre_completo as cliente,
                        c.email, c.celular, d.nombre as distrito, e.nombre_evento, e.fecha_evento, dv.evento_id,
                        v.total as monto, v.descuento,
                        (SELECT COALESCE(SUM(monto), 0) FROM pagos WHERE venta_id = v.id AND estado = 'PAGADO') as ingreso,
                        (SELECT COALESCE(SUM(monto), 0) FROM pagos WHERE venta_id = v.id AND estado = 'PENDIENTE') as por_validar,
                        v.saldo_pendiente as saldo,
                        v.estado, u.nombre as vendedor, v.observacion, v.tipo_venta
                    FROM ventas v
                    JOIN clientes c ON v.cliente_id = c.id
                    JOIN detalle_ventas dv ON v.id = dv.venta_id
                    JOIN eventos e ON dv.evento_id = e.id
                    JOIN usuarios u ON v.usuario_id = u.id
                    LEFT JOIN distritos d ON c.distrito_id = d.id
                    WHERE DATE(v.fecha_registro) BETWEEN %s AND %s
                """
                params = [f_ini, f_fin]
                if f_asesor != "Todos": 
                    sql += " AND u.nombre = %s"
                    params.append(f_asesor)
                if f_tipo != "Todos": 
                    sql += " AND v.tipo_venta = %s"
                    params.append(f_tipo)
                    
                sql += " ORDER BY v.id DESC"
                cur.execute(sql, tuple(params))
                data = cur.fetchall()
                
                for row in data:
                    f_obj = row['fecha_evento']
                    str_f = f_obj.strftime("%d/%m") if isinstance(f_obj, (date, datetime)) else ""
                    row['curso_fmt'] = f"{row['nombre_evento']} [{str_f}]"
                return data
            except: return []
            finally: conn.close()
        return []

    @classmethod
    def get_kpis_hoy(cls):
        conn = Database.get_connection(); kpis={'total_ventas':0, 'por_cobrar':0.0}
        if conn:
            try: 
                cur=conn.cursor(dictionary=True)
                # 🚨 Dashboard y KPIs ignoran PENDIENTES
                cur.execute("SELECT COUNT(*) c, SUM(saldo_pendiente) d FROM ventas WHERE DATE(fecha_venta)=CURDATE() AND estado IN ('PAGADO', 'PARCIAL')")
                r=cur.fetchone()
                kpis['total_ventas']=r['c']
                kpis['por_cobrar']=float(r['d'] or 0)
            except: pass
            finally: conn.close()
        return kpis

    @classmethod
    def get_data_bi_completa(cls, f_ini, f_fin):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            # 🚨 Dashboard ignora completamente las ventas PENDIENTES
            sql = """SELECT v.fecha_venta, u.nombre as vendedor, cat.nombre as producto, dv.subtotal as monto
                     FROM detalle_ventas dv JOIN ventas v ON dv.venta_id = v.id JOIN usuarios u ON v.usuario_id = u.id
                     JOIN eventos e ON dv.evento_id = e.id JOIN cursos c ON e.curso_id = c.id JOIN categorias cat ON c.categoria_id = cat.id
                     WHERE DATE(v.fecha_venta) BETWEEN %s AND %s AND v.estado IN ('PAGADO', 'PARCIAL')"""
            cur.execute(sql, (f_ini, f_fin))
            return cur.fetchall()
        except: return []
        finally: conn.close()

    @classmethod
    def reporte_cuentas_cobrar(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            sql = """SELECT c.nombre_completo as cliente, c.celular, v.fecha_venta, v.total, v.saldo_pendiente, u.usuario as vendedor 
                     FROM ventas v JOIN clientes c ON v.cliente_id = c.id JOIN usuarios u ON v.usuario_id = u.id 
                     WHERE v.saldo_pendiente > 0 AND v.estado != 'ANULADO' ORDER BY v.saldo_pendiente DESC"""
            cur.execute(sql)
            return cur.fetchall()
        except: return []
        finally: conn.close()

    @classmethod
    def get_detalle_ventas_completo(cls, f_ini, f_fin):
        conn = Database.get_connection()
        if not conn: return []
        try:
            cur = conn.cursor(dictionary=True)
            sql = """
                SELECT 
                    v.id, v.fecha_registro, c.dni_ruc, c.nombre_completo as cliente, c.email, d.nombre as distrito, 
                    CONCAT(e.nombre_evento, ' [', DATE_FORMAT(e.fecha_evento, '%d/%m'), ']') as evento,
                    cat.nombre as categoria, v.tipo_venta, v.estado,
                    (SELECT metodo_pago FROM pagos WHERE venta_id = v.id ORDER BY id ASC LIMIT 1) as forma_pago,
                    dv.subtotal as precio, v.saldo_pendiente,
                    (v.total - v.saldo_pendiente) as adelanto, v.total as monto_total,
                    u.nombre as vendedor, v.observacion
                FROM detalle_ventas dv
                JOIN ventas v ON dv.venta_id = v.id
                JOIN usuarios u ON v.usuario_id = u.id
                JOIN clientes c ON v.cliente_id = c.id
                LEFT JOIN distritos d ON c.distrito_id = d.id
                JOIN eventos e ON dv.evento_id = e.id
                JOIN cursos cur ON e.curso_id = cur.id
                JOIN categorias cat ON cur.categoria_id = cat.id
                WHERE DATE(v.fecha_venta) BETWEEN %s AND %s AND v.estado IN ('PAGADO', 'PARCIAL')
                ORDER BY v.fecha_registro DESC
            """
            cur.execute(sql, (f_ini, f_fin))
            return cur.fetchall()
        except Exception as e: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def get_reporte_deudas_detallado(cls, f_ini, f_fin):
        conn = Database.get_connection()
        if not conn: return []
        try:
            cur = conn.cursor(dictionary=True)
            sql = """
                SELECT v.id, u.nombre as vendedor, v.fecha_registro, c.dni_ruc, c.nombre_completo,
                    CONCAT(e.nombre_evento, ' [', DATE_FORMAT(e.fecha_evento, '%d/%m'), ']') as curso,
                    cat.nombre as categoria, v.tipo_venta as cierre, v.total as venta,
                    (v.total - v.saldo_pendiente) as adelanto, v.saldo_pendiente as saldo,
                    (SELECT metodo_pago FROM pagos WHERE venta_id = v.id ORDER BY id ASC LIMIT 1) as metodo, v.estado
                FROM ventas v JOIN clientes c ON v.cliente_id = c.id JOIN usuarios u ON v.usuario_id = u.id
                JOIN detalle_ventas dv ON v.id = dv.venta_id JOIN eventos e ON dv.evento_id = e.id
                JOIN cursos cur ON e.curso_id = cur.id JOIN categorias cat ON cur.categoria_id = cat.id
                WHERE DATE(v.fecha_venta) BETWEEN %s AND %s AND v.saldo_pendiente > 0 AND v.estado IN ('PAGADO', 'PARCIAL')
                ORDER BY v.fecha_registro DESC
            """
            cur.execute(sql, (f_ini, f_fin))
            return cur.fetchall()
        except Exception as e: return []
        finally: 
            if conn: conn.close()     