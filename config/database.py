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
            host=os.getenv('DB_HOST'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASS'),
            database=os.getenv('DB_NAME')
        )
        return connection
    except Error as e:
        print(f"Error conectando a MySQL: {e}")
        return None

class Database:

    # Si usas .env, cámbialo aquí, pero esto funcionará ya mismo.
    _db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': '',
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
