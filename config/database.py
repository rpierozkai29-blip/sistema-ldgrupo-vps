import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()

def get_db_connection():
    """Crea y devuelve conexión a la base de datos."""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='EscuelaLD',
            password='Escuela-Parrillera1',
            database='ld'
        )
        return connection
    except Error as e:
        print(f"Error conectando a MySQL: {e}")
        return None

class Database:
    # Configuración directa (basada en lo que tenías antes)
    # Si usas .env, cámbialo aquí, pero esto funcionará ya mismo.
    _db_config = {
        'host': 'localhost',
        'user': 'EscuelaLD',
        'password': 'Escuela-Parrillera1',
        'database': 'ld'
    }

    @classmethod
    def get_connection(cls):
        try:
            connection = mysql.connector.connect(**cls._db_config)
            return connection
        except mysql.connector.Error as e:
            print(f"❌ Error de Conexión a Base de Datos: {e}")
            return None
