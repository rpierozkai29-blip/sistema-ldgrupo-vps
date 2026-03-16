import mysql.connector
import urllib.request
import json
import ssl

# --- CONFIGURACIÓN DE BASE DE DATOS ---
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'ld' 
}

def seed_database():
    conn = None
    try:
        # Ignorar certificados SSL para la descarga segura
        ctx = ssl.create_default_context()
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE

        conn = mysql.connector.connect(**db_config)
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
        print("🇵🇪 Descargando Ubigeo Oficial del Perú...")
        url_ubigeo = "https://raw.githubusercontent.com/joseluisq/ubigeos-peru/master/ubigeo-peru.json"
        req_u = urllib.request.urlopen(url_ubigeo, context=ctx)
        ubigeo_raw = json.loads(req_u.read())
        
        mapa_dep = {}; mapa_prov = {}
        
        print("🏗️ Armando estructura de Departamentos, Provincias y Distritos...")
        for row in ubigeo_raw:
            cc_dd = row['cc_dd']; cc_pp = row['cc_pp']; cc_di = row['cc_di']
            nombre = row['desc_ubigeo'].title()

            if cc_pp == "00" and cc_di == "00":
                cursor.execute("INSERT INTO departamentos (nombre) VALUES (%s)", (nombre,))
                mapa_dep[cc_dd] = cursor.lastrowid
            elif cc_pp != "00" and cc_di == "00":
                dep_id = mapa_dep[cc_dd]
                cursor.execute("INSERT INTO provincias (departamento_id, nombre) VALUES (%s, %s)", (dep_id, nombre))
                mapa_prov[f"{cc_dd}{cc_pp}"] = cursor.lastrowid
            elif cc_pp != "00" and cc_di != "00":
                prov_id = mapa_prov.get(f"{cc_dd}{cc_pp}")
                if prov_id:
                    cursor.execute("INSERT INTO distritos (provincia_id, nombre) VALUES (%s, %s)", (prov_id, nombre))

        conn.commit()
        print("✅ ¡Éxito Total! Base de datos actualizada con ubicaciones reales.")

    except Exception as e:
        print(f"❌ Error crítico: {e}")
    finally:
        if conn: conn.close()

if __name__ == "__main__":
    seed_database()