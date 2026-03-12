import mysql.connector
import streamlit as st
from config.database import Database

class MantenimientoModel:

    # ==========================================
    # --- GESTIÓN DE USUARIOS Y MI PERFIL ---
    # ==========================================
    
    # 🛠️ NUEVO: Busca al usuario específico que está conectado
    @classmethod
    def get_usuario_por_login(cls, identificador):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            # Se ajustó la consulta para que busque coincidencias exactas por nombre O por usuario
            sql = "SELECT id, nombre, usuario, rol, activo FROM usuarios WHERE nombre = %s OR usuario = %s LIMIT 1"
            cur.execute(sql, (identificador, identificador))
            return cur.fetchone()
        except: return None
        finally: 
            if conn: conn.close()

    # 🛠️ NUEVO: Actualiza solo la contraseña del usuario
    @classmethod
    def cambiar_password(cls, id_usuario, nueva_password):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("UPDATE usuarios SET password=%s WHERE id=%s", (nueva_password, id_usuario))
            conn.commit()
            return True, "✅ Tu contraseña ha sido actualizada correctamente."
        except Exception as e:
            if conn: conn.rollback()
            return False, f"Error al actualizar: {e}"
        finally:
            if conn: conn.close()


    @classmethod
    def crear_usuario(cls, nombre, usuario, password, rol):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("SELECT id FROM usuarios WHERE usuario = %s", (usuario,))
            if cur.fetchone(): return False, "El nombre de usuario ya existe."
            rol_mayuscula = rol.upper()
            diccionario_roles = {'ADMIN': 1, 'VENDEDOR': 2, 'COORDINADOR': 3, 'AUDITOR': 4}
            rol_id = diccionario_roles.get(rol_mayuscula, None)
            sql = "INSERT INTO usuarios (nombre, usuario, password, rol, rol_id, activo) VALUES (%s, %s, %s, %s, %s, 1)"
            cur.execute(sql, (nombre, usuario, password, rol_mayuscula, rol_id))
            conn.commit()
            return True, "Usuario creado exitosamente."
        except Exception as e:
            if conn: conn.rollback()
            return False, f"Error al crear usuario: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def get_usuarios(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre, usuario, rol, activo FROM usuarios ORDER BY id DESC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def actualizar_usuario(cls, id_usuario, nombre, usuario, rol, activo, password=None):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            rol_mayuscula = rol.upper()
            diccionario_roles = {'ADMIN': 1, 'VENDEDOR': 2, 'COORDINADOR': 3, 'AUDITOR': 4}
            rol_id = diccionario_roles.get(rol_mayuscula, None)
            activo_int = 1 if activo == 'Activo' else 0

            if password: 
                sql = "UPDATE usuarios SET nombre=%s, usuario=%s, rol=%s, rol_id=%s, activo=%s, password=%s WHERE id=%s"
                cur.execute(sql, (nombre, usuario, rol_mayuscula, rol_id, activo_int, password, id_usuario))
            else: 
                sql = "UPDATE usuarios SET nombre=%s, usuario=%s, rol=%s, rol_id=%s, activo=%s WHERE id=%s"
                cur.execute(sql, (nombre, usuario, rol_mayuscula, rol_id, activo_int, id_usuario))
            conn.commit()
            return True, "Usuario actualizado correctamente."
        except Exception as e:
            if conn: conn.rollback()
            return False, f"Error al actualizar: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def eliminar_usuario(cls, id_usuario):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM usuarios WHERE id = %s", (id_usuario,))
            conn.commit()
            return True, "Usuario eliminado permanentemente."
        except Exception as e:
            if conn: conn.rollback()
            return False, "Error: No se puede eliminar el usuario. Inhabilítalo."
        finally:
            if conn: conn.close()


    # ==========================================
    # --- GESTIÓN DE EVENTOS Y AUXILIARES ---
    # ==========================================
    @classmethod
    def get_lista_cursos(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre FROM cursos ORDER BY nombre ASC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def get_lista_turnos(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre FROM turnos ORDER BY id ASC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()
            
    @classmethod
    def get_lista_sedes(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre FROM sedes ORDER BY nombre ASC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def get_lista_periodos(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre FROM periodos WHERE estado = 'ACTIVO' ORDER BY id ASC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()


    # ==========================================
    # --- CRUD DE EVENTOS ---
    # ==========================================
    @classmethod
    def crear_evento(cls, nombre_evento, fecha, curso_id, turno_id, sede_id, periodo_id, stock_maximo, estado="ABIERTO"):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            sql = "INSERT INTO eventos (nombre_evento, fecha_evento, curso_id, turno_id, sede_id, periodo_id, stock_maximo, stock_vendido, estado) VALUES (%s, %s, %s, %s, %s, %s, %s, 0, %s)"
            cur.execute(sql, (nombre_evento, fecha, curso_id, turno_id, sede_id, periodo_id, stock_maximo, estado))
            conn.commit()
            return True, "Evento creado exitosamente."
        except Exception as e:
            return False, f"Error al crear evento: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def get_eventos(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            sql = """
                SELECT e.id, e.nombre_evento, DATE(e.fecha_evento) as fecha, 
                       c.nombre as curso, t.nombre as turno, s.nombre as sede, p.nombre as periodo,
                       e.stock_maximo as aforo, e.stock_vendido as inscritos, e.estado
                FROM eventos e
                LEFT JOIN cursos c ON e.curso_id = c.id
                LEFT JOIN turnos t ON e.turno_id = t.id
                LEFT JOIN sedes s ON e.sede_id = s.id
                LEFT JOIN periodos p ON e.periodo_id = p.id
                ORDER BY e.fecha_evento DESC
            """
            cur.execute(sql)
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def actualizar_evento(cls, id_evento, nombre_evento, fecha, curso_id, turno_id, sede_id, periodo_id, stock_maximo, estado):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            sql = "UPDATE eventos SET nombre_evento=%s, fecha_evento=%s, curso_id=%s, turno_id=%s, sede_id=%s, periodo_id=%s, stock_maximo=%s, estado=%s WHERE id=%s"
            cur.execute(sql, (nombre_evento, fecha, curso_id, turno_id, sede_id, periodo_id, stock_maximo, estado, id_evento))
            conn.commit()
            return True, "Evento actualizado correctamente."
        except Exception as e:
            if conn: conn.rollback()
            return False, f"Error al actualizar evento: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def eliminar_evento(cls, id_evento):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM eventos WHERE id = %s", (id_evento,))
            conn.commit()
            return True, "Evento eliminado permanentemente."
        except Exception as e:
            if conn: conn.rollback()
            return False, "Error: No se puede eliminar. Probablemente ya tiene alumnos inscritos."
        finally:
            if conn: conn.close()


    # ==========================================
    # --- CRUD DE CURSOS ---
    # ==========================================
    @classmethod
    def get_lista_categorias(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre FROM categorias ORDER BY nombre ASC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def get_cursos_detalle(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("""
                SELECT c.id, c.codigo_sku, c.nombre, c.precio_base, cat.nombre as categoria 
                FROM cursos c 
                LEFT JOIN categorias cat ON c.categoria_id = cat.id 
                ORDER BY c.id DESC
            """)
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def crear_curso(cls, nombre, sku, precio_base, categoria_id):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("INSERT INTO cursos (nombre, codigo_sku, precio_base, categoria_id) VALUES (%s, %s, %s, %s)", (nombre, sku, precio_base, categoria_id))
            conn.commit()
            return True, "Curso agregado al catálogo."
        except Exception as e:
            return False, f"Error en BD (Posible SKU duplicado): {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def actualizar_curso(cls, id_curso, nombre, sku, precio_base, categoria_id):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("UPDATE cursos SET nombre=%s, codigo_sku=%s, precio_base=%s, categoria_id=%s WHERE id=%s", (nombre, sku, precio_base, categoria_id, id_curso))
            conn.commit()
            return True, "Curso actualizado correctamente."
        except Exception as e:
            return False, f"Error en BD: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def eliminar_curso(cls, id_curso):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM cursos WHERE id = %s", (id_curso,))
            conn.commit()
            return True, "Curso eliminado del catálogo."
        except Exception as e:
            return False, "Error: Este curso ya está siendo usado en Eventos activos."
        finally:
            if conn: conn.close()


    # ==========================================
    # --- CRUD DE PERIODOS ---
    # ==========================================
    @classmethod
    def get_periodos_detalle(cls):
        conn = Database.get_connection()
        try:
            cur = conn.cursor(dictionary=True)
            cur.execute("SELECT id, nombre, fecha_inicio, fecha_fin, estado FROM periodos ORDER BY id DESC")
            return cur.fetchall()
        except: return []
        finally: 
            if conn: conn.close()

    @classmethod
    def crear_periodo(cls, nombre, f_ini, f_fin, estado):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("INSERT INTO periodos (nombre, fecha_inicio, fecha_fin, estado) VALUES (%s, %s, %s, %s)", (nombre, f_ini, f_fin, estado))
            conn.commit()
            return True, "Nuevo periodo aperturado."
        except Exception as e:
            return False, f"Error en BD: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def actualizar_periodo(cls, id_periodo, nombre, f_ini, f_fin, estado):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("UPDATE periodos SET nombre=%s, fecha_inicio=%s, fecha_fin=%s, estado=%s WHERE id=%s", (nombre, f_ini, f_fin, estado, id_periodo))
            conn.commit()
            return True, "Periodo actualizado."
        except Exception as e:
            return False, f"Error en BD: {e}"
        finally:
            if conn: conn.close()

    @classmethod
    def eliminar_periodo(cls, id_periodo):
        conn = Database.get_connection()
        try:
            cur = conn.cursor()
            cur.execute("DELETE FROM periodos WHERE id = %s", (id_periodo,))
            conn.commit()
            return True, "Periodo eliminado."
        except Exception as e:
            return False, "Error: Este periodo ya tiene eventos asignados."
        finally:
            if conn: conn.close()