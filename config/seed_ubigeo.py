import mysql.connector
import ubigeos_peru as ubg

# --- CONFIGURACIÓN DE BASE DE DATOS ---
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '', # Pon tu contraseña de XAMPP si tienes una
    'database': 'db_edp'
}

# --- DATA DEL PERÚ (Ubigeo Jerárquico) ---
# Estructura: "Departamento": { "Provincia": ["Distrito1", "Distrito2"] }
# Nota: Para provincias fuera de Lima, he dejado una lista vacía [] para no saturar el código, 
# pero el sistema creará las provincias correctamente para que funcionen tus filtros.

data_peru = {
    "Amazonas": {
        "Chachapoyas": [], "Bagua": [], "Bongará": [], "Condorcanqui": [], "Luya": [], "Rodríguez de Mendoza": [], "Utcubamba": []
    },
    "Áncash": {
        "Huaraz": [], "Aija": [], "Antonio Raymondi": [], "Asunción": [], "Bolognesi": [], "Carhuaz": [], "Carlos Fermín Fitzcarrald": [], "Casma": [], "Corongo": [], "Huari": [], "Huarmey": [], "Huaylas": [], "Mariscal Luzuriaga": [], "Ocros": [], "Pallasca": [], "Pomabamba": [], "Recuay": [], "Santa": ["Chimbote", "Nuevo Chimbote"], "Sihuas": [], "Yungay": []
    },
    "Apurímac": {
        "Abancay": [], "Andahuaylas": [], "Antabamba": [], "Aymaraes": [], "Cotabambas": [], "Chincheros": [], "Grau": []
    },
    "Arequipa": {
        "Arequipa": ["Arequipa", "Cayma", "Cerro Colorado", "Yanahuara"], "Camaná": [], "Caravelí": [], "Castilla": [], "Caylloma": [], "Condesuyos": [], "Islay": [], "La Unión": []
    },
    "Ayacucho": {
        "Huamanga": [], "Cangallo": [], "Huanca Sancos": [], "Huanta": [], "La Mar": [], "Lucanas": [], "Parinacochas": [], "Páucar del Sara Sara": [], "Sucre": [], "Víctor Fajardo": [], "Vilcas Huamán": []
    },
    "Cajamarca": {
        "Cajamarca": [], "Cajabamba": [], "Celendín": [], "Chota": [], "Contumazá": [], "Cutervo": [], "Hualgayoc": [], "Jaén": [], "San Ignacio": [], "San Marcos": [], "San Miguel": [], "San Pablo": [], "Santa Cruz": []
    },
    "Callao": {
        "Callao": ["Callao", "Bellavista", "Carmen de la Legua Reynoso", "La Perla", "La Punta", "Ventanilla", "Mi Perú"]
    },
    "Cusco": {
        "Cusco": [], "Acomayo": [], "Anta": [], "Calca": [], "Canas": [], "Canchis": [], "Chumbivilcas": [], "Espinar": [], "La Convención": [], "Paruro": [], "Paucartambo": [], "Quispicanchi": [], "Urubamba": []
    },
    "Huancavelica": {
        "Huancavelica": [], "Acobamba": [], "Angaraes": [], "Castrovirreyna": [], "Churcampa": [], "Huaytará": [], "Tayacaja": []
    },
    "Huánuco": {
        "Huánuco": [], "Ambo": [], "Dos de Mayo": [], "Huacaybamba": [], "Huamalíes": [], "Leoncio Prado": [], "Marañón": [], "Pachitea": [], "Puerto Inca": [], "Lauricocha": [], "Yarowilca": []
    },
    "Ica": {
        "Ica": [], "Chincha": [], "Nazca": [], "Palpa": [], "Pisco": []
    },
    "Junín": {
        "Huancayo": [], "Concepción": [], "Chanchamayo": [], "Jauja": [], "Junín": [], "Satipo": [], "Tarma": [], "Yauli": [], "Chupaca": []
    },
    "La Libertad": {
        "Trujillo": ["Trujillo", "Huanchaco", "Moche", "Victor Larco Herrera"], "Ascope": [], "Bolívar": [], "Chepén": [], "Julcán": [], "Otuzco": [], "Pacasmayo": [], "Pataz": [], "Sánchez Carrión": [], "Santiago de Chuco": [], "Gran Chimú": [], "Virú": []
    },
    "Lambayeque": {
        "Chiclayo": [], "Ferreñafe": [], "Lambayeque": []
    },
    "Lima": {
        "Lima": [
            "Cercado de Lima", "Ancón", "Ate", "Barranco", "Breña", "Carabayllo", 
            "Chaclacayo", "Chorrillos", "Cieneguilla", "Comas", "El Agustino", 
            "Independencia", "Jesús María", "La Molina", "La Victoria", "Lince", 
            "Los Olivos", "Lurigancho-Chosica", "Lurín", "Magdalena del Mar", 
            "Miraflores", "Pachacámac", "Pucusana", "Pueblo Libre", "Puente Piedra", 
            "Punta Hermosa", "Punta Negra", "Rímac", "San Bartolo", "San Borja", 
            "San Isidro", "San Juan de Lurigancho", "San Juan de Miraflores", 
            "San Luis", "San Martín de Porres", "San Miguel", "Santa Anita", 
            "Santa María del Mar", "Santa Rosa", "Santiago de Surco", "Surquillo", 
            "Villa El Salvador", "Villa María del Triunfo"
        ],
        "Barranca": ["Barranca", "Paramonga", "Pativilca", "Supe", "Supe Puerto"],
        "Cajatambo": [],
        "Canta": ["Santa Rosa de Quives"],
        "Cañete": ["San Vicente de Cañete", "Asia", "Calango", "Cerro Azul", "Chilca", "Coayllo", "Imperial", "Lunahuaná", "Mala", "Nuevo Imperial", "Pacarán", "Quilmaná", "San Antonio", "San Luis", "Santa Cruz de Flores", "Zúñiga"],
        "Huaral": ["Huaral", "Chancay"],
        "Huarochirí": [],
        "Huaura": ["Huacho"],
        "Oyón": [],
        "Yauyos": []
    },
    "Loreto": {
        "Maynas": [], "Alto Amazonas": [], "Loreto": [], "Mariscal Ramón Castilla": [], "Requena": [], "Ucayali": [], "Datem del Marañón": [], "Putumayo": []
    },
    "Madre de Dios": {
        "Tambopata": [], "Manu": [], "Tahuamanu": []
    },
    "Moquegua": {
        "Mariscal Nieto": [], "General Sánchez Cerro": [], "Ilo": []
    },
    "Pasco": {
        "Pasco": [], "Daniel Alcides Carrión": [], "Oxapampa": []
    },
    "Piura": {
        "Piura": [], "Ayabaca": [], "Huancabamba": [], "Morropón": [], "Paita": [], "Sullana": [], "Talara": [], "Sechura": []
    },
    "Puno": {
        "Puno": [], "Azángaro": [], "Carabaya": [], "Chucuito": [], "El Collao": [], "Huancané": [], "Lampa": [], "Melgar": [], "Moho": [], "San Antonio de Putina": [], "San Román": ["Juliaca"], "Sandia": [], "Yunguyo": []
    },
    "San Martín": {
        "Moyobamba": [], "Bellavista": [], "El Dorado": [], "Huallaga": [], "Lamas": [], "Mariscal Cáceres": [], "Picota": [], "Rioja": [], "San Martín": ["Tarapoto"], "Tocache": []
    },
    "Tacna": {
        "Tacna": [], "Candarave": [], "Jorge Basadre": [], "Tarata": []
    },
    "Tumbes": {
        "Tumbes": [], "Contralmirante Villar": [], "Zarumilla": []
    },
    "Ucayali": {
        "Coronel Portillo": ["Pucallpa"], "Atalaya": [], "Padre Abad": [], "Purús": []
    }
}

def seed_database():
    conn = None
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        
        print("🧹 Limpiando tablas de Ubigeo...")
        # Desactivamos FK check para truncar sin problemas
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
        cursor.execute("TRUNCATE TABLE distritos;")
        cursor.execute("TRUNCATE TABLE provincias;")
        cursor.execute("TRUNCATE TABLE departamentos;")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
        
        print("🚀 Iniciando inserción masiva...")
        
        for dep, provincias_dict in data_peru.items():
            # 1. Insertar Departamento
            cursor.execute("INSERT INTO departamentos (nombre) VALUES (%s)", (dep,))
            dep_id = cursor.lastrowid
            
            for prov, distritos_list in provincias_dict.items():
                # 2. Insertar Provincia (vinculada al Departamento)
                cursor.execute("INSERT INTO provincias (departamento_id, nombre) VALUES (%s, %s)", (dep_id, prov))
                prov_id = cursor.lastrowid
                
                # 3. Insertar Distritos (vinculados a la Provincia)
                if distritos_list:
                    for dist in distritos_list:
                        cursor.execute("INSERT INTO distritos (provincia_id, nombre) VALUES (%s, %s)", (prov_id, dist))
                else:
                    # Si no hay distritos en la lista (Provincias lejanas), creamos uno genérico
                    # Esto es para que el dropdown no salga vacío en pruebas
                    nombre_generico = f"Cercado de {prov}"
                    cursor.execute("INSERT INTO distritos (provincia_id, nombre) VALUES (%s, %s)", (prov_id, nombre_generico))

        conn.commit()
        print("✅ ¡Éxito! Base de datos poblada con todo el Perú (Nivel Provincias) y Lima Completa.")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")
    finally:
        if conn: conn.close()

if __name__ == "__main__":
    seed_database()