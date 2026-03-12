import mysql.connector
from config.database import get_db_connection

class UsuarioModel:
    @staticmethod
    def validar_login(usuario, password):
        conn = get_db_connection()
        user = None
        if conn:
            try:
                cursor = conn.cursor(dictionary=True)
                # Consulta idéntica a tu código original
                cursor.execute("SELECT * FROM usuarios WHERE usuario = %s AND password = %s AND activo = 1", (usuario, password))
                user = cursor.fetchone()
            except Exception as e:
                print(f"Error Login: {e}")
            finally:
                conn.close()
        return user
    
    @classmethod
    def get_all_users(cls):
        conn = cls.create_connection()
        if conn:
            try:
                cur = conn.cursor(dictionary=True)
                cur.execute("SELECT id, usuario, rol, nombre_completo, estado FROM usuarios")
                return cur.fetchall()
            finally:
                conn.close()
        return []

    @classmethod
    def create_user(cls, data):
        conn = cls.create_connection()
        if conn:
            try:
                cur = conn.cursor()
                # Nota: En producción deberías encriptar la contraseña
                sql = "INSERT INTO usuarios (usuario, password, rol, nombre_completo, estado) VALUES (%s, %s, %s, %s, 'ACTIVO')"
                cur.execute(sql, (data['usuario'], data['password'], data['rol'], data['nombre']))
                conn.commit()
                return True, "Usuario creado"
            except Exception as e:
                return False, str(e)
            finally:
                conn.close()
        return False, "No conexión"

    @classmethod
    def delete_user(cls, id_user):
        conn = cls.create_connection()
        if conn:
            try:
                cur = conn.cursor()
                cur.execute("DELETE FROM usuarios WHERE id = %s", (id_user,))
                conn.commit()
                return True, "Usuario eliminado"
            except Exception as e:
                return False, str(e)
            finally:
                conn.close()
        return False, "No conexión"