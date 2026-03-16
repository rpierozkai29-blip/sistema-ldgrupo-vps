import urllib.request
import json
import ssl
import sys
import os

# Esto permite que el script encuentre tu archivo oficial de conexión a la base de datos
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from config.database import Database

def seed_database():
    conn = None
    try:
        # Ignorar certificados SSL para la descarga segura desde GitHub
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE

        print("🔌 Conectando a la base de datos usando tus credenciales oficiales...")
        conn = Database.get_connection()
        if not conn:
            print("❌ No se pudo conectar a la base de datos. Verifica tu config/database.py")
            return
        
        cursor = conn.cursor()
        
        print("🧹 Limpiando tablas antiguas y datos falsos...")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
        cursor.execute("TRUNCATE TABLE distritos;")
        cursor.execute("TRUNCATE TABLE provincias;")
        cursor.execute("TRUNCATE TABLE departamentos;")
        cursor.execute("TRUNCATE TABLE paises;")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
        
        # ---------------------------------------------------------
        # 1. POBLAR PAÍSES
        # ---------------------------------------------------------
        print("🌎 Descargando e insertando Países...")
        url_paises = "https://raw.githubusercontent.com/umpirsky/country-list/master/data/es_PE/country.json"
        req_p = urllib.request.urlopen(url_paises, context=ctx)
        paises_data = json.loads(req_p.read())
        
        cursor.execute("INSERT INTO paises (id, nombre) VALUES (1, 'Perú')")
        for code, nombre in paises_data.items():
            if nombre != "Perú":
                cursor.execute("INSERT INTO paises (nombre) VALUES (%s)", (nombre,))
        
        # ---------------------------------------------------------
        # 2. POBLAR UBIGEO DEL PERÚ (1,874 Distritos Reales)
        # ---------------------------------------------------------
        print("🇵🇪 Descargando Departamentos del Perú...")
        req_d = urllib.request.urlopen("https://raw.githubusercontent.com/joseluisq/ubigeos-peru/master/json/departamentos.json", context=ctx)
        deps_raw = json.loads(req_d.read())

        print("🇵🇪 Descargando Provincias del Perú...")
        req_pr = urllib.request.urlopen("https://raw.githubusercontent.com/joseluisq/ubigeos-peru/master/json/provincias.json", context=ctx)
        provs_raw = json.loads(req_pr.read())

        print("🇵🇪 Descargando Distritos del Perú...")
        req_di = urllib.request.urlopen("https://raw.githubusercontent.com/joseluisq/ubigeos-peru/master/json/distritos.json", context=ctx)
        dists_raw = json.loads(req_di.read())
        
        print("🏗️ Armando estructura de Departamentos, Provincias y Distritos...")
        
        # 🟢 NUEVA LÓGICA DE DICCIONARIO SIMPLE
        mapa_deps = {}
        for cod_dep, nom_dep in deps_raw.items():
            cursor.execute("INSERT INTO departamentos (nombre) VALUES (%s)", (nom_dep.title(),))
            mapa_deps[cod_dep] = cursor.lastrowid
            
        mapa_provs = {}
        for cod_prov, nom_prov in provs_raw.items():
            cod_dep = cod_prov[:2] # Los primeros 2 caracteres indican a qué Dep. pertenece
            id_dep = mapa_deps.get(cod_dep)
            if id_dep:
                cursor.execute("INSERT INTO provincias (departamento_id, nombre) VALUES (%s, %s)", (id_dep, nom_prov.title()))
                mapa_provs[cod_prov] = cursor.lastrowid

        for cod_dist, nom_dist in dists_raw.items():
            cod_prov = cod_dist[:4] # Los primeros 4 caracteres indican a qué Prov. pertenece
            id_prov = mapa_provs.get(cod_prov)
            if id_prov:
                cursor.execute("INSERT INTO distritos (provincia_id, nombre) VALUES (%s, %s)", (id_prov, nom_dist.title()))

        conn.commit()
        print("✅ ¡Éxito Total! Base de datos actualizada con ubicaciones reales.")

    except Exception as e:
        print(f"❌ Error crítico: {e}")
    finally:
        if conn: conn.close()

if __name__ == "__main__":
    seed_database()