import mysql.connector
import os
from dotenv import load_dotenv

# Cargar el archivo .env
load_dotenv()

class Database:
    @classmethod
    def get_connection(cls):
        try:
            # Buscamos 'DB_PASSWORD' (o 'DB_PASS' por si acaso)
            db_pass = os.getenv('DB_PASSWORD') or os.getenv('DB_PASS') or ""
            
            connection = mysql.connector.connect(
                host=os.getenv('DB_HOST', 'localhost'),
                user=os.getenv('DB_USER', 'root'),
                password=db_pass,
                database=os.getenv('DB_NAME', 'ld'),
                port=int(os.getenv('DB_PORT', 3306))
            )
            return connection
        except mysql.connector.Error as e:
            print(f"❌ Error de Conexión a Base de Datos: {e}")
            return None

def get_db_connection():
    # Esta función hace lo mismo por compatibilidad
    return Database.get_connection()