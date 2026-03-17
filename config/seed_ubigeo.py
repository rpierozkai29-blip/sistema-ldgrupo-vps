import urllib.request
import json
import ssl
import sys
import os

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from config.database import Database

def seed_database():
    conn = None
    try:
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE

        print("🔌 Conectando a la BD...")
        conn = Database.get_connection()
        if not conn:
            print("❌ No hay conexión.")
            return
        
        cursor = conn.cursor()
        print("🧹 Limpiando datos antiguos...")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
        cursor.execute("TRUNCATE TABLE distritos;")
        cursor.execute("TRUNCATE TABLE provincias;")
        cursor.execute("TRUNCATE TABLE departamentos;")
        cursor.execute("TRUNCATE TABLE paises;")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
        
        # PAÍSES
        print("🌎 Descargando Países...")
        url_paises = "https://raw.githubusercontent.com/umpirsky/country-list/master/data/es_PE/country.json"
        paises_data = json.loads(urllib.request.urlopen(url_paises, context=ctx).read())
        cursor.execute("INSERT INTO paises (id, nombre) VALUES (1, 'Perú')")
        if isinstance(paises_data, dict):
            for code, nombre in paises_data.items():
                if nombre != "Perú":
                    cursor.execute("INSERT INTO paises (nombre) VALUES (%s)", (nombre,))

        # DEPARTAMENTOS
        print("🇵🇪 Descargando Departamentos...")
        deps_data = json.loads(urllib.request.urlopen("https://raw.githubusercontent.com/ernestorivero/Ubigeo-Peru/master/json/ubigeo_peru_2016_departamentos.json", context=ctx).read())
        mapa_deps = {}
        for d in deps_data:
            cursor.execute("INSERT INTO departamentos (nombre) VALUES (%s)", (d['name'].title(),))
            mapa_deps[d['id']] = cursor.lastrowid
            
        # PROVINCIAS
        print("🇵🇪 Descargando Provincias...")
        provs_data = json.loads(urllib.request.urlopen("https://raw.githubusercontent.com/ernestorivero/Ubigeo-Peru/master/json/ubigeo_peru_2016_provincias.json", context=ctx).read())
        mapa_provs = {}
        for p in provs_data:
            id_dep_db = mapa_deps.get(p['department_id'])
            if id_dep_db:
                cursor.execute("INSERT INTO provincias (departamento_id, nombre) VALUES (%s, %s)", (id_dep_db, p['name'].title()))
                mapa_provs[p['id']] = cursor.lastrowid

        # DISTRITOS
        print("🇵🇪 Descargando Distritos...")
        dists_data = json.loads(urllib.request.urlopen("https://raw.githubusercontent.com/ernestorivero/Ubigeo-Peru/master/json/ubigeo_peru_2016_distritos.json", context=ctx).read())
        for di in dists_data:
            id_prov_db = mapa_provs.get(di['province_id'])
            if id_prov_db:
                cursor.execute("INSERT INTO distritos (provincia_id, nombre) VALUES (%s, %s)", (id_prov_db, di['name'].title()))

        conn.commit()
        print("✅ ¡Éxito Total! Ubigeo vinculado perfectamente.")

    except Exception as e:
        print(f"❌ Error crítico: {e}")
    finally:
        if conn: conn.close()

if __name__ == "__main__":
    seed_database()