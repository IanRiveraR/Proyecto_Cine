# Proyecto Cine - Análisis de Datos y Visualización Interactiva

Este proyecto tiene como objetivo el análisis de datos relacionados con tickets de cine, limpieza de datos, creación de una base de datos relacional en PostgreSQL, y la creación de dashboards interactivos en Power BI.

## Estructura del Proyecto

La estructura del proyecto es la siguiente:

## Descripción del Proyecto

1. **Obtención de Datos**: Los datos de los tickets de cine se obtuvieron desde Kaggle en formato CSV.
2. **Limpieza de Datos**: Los datos fueron procesados y limpiados utilizando Python (Jupyter Notebook). Se eliminaron duplicados y se dio formato a los datos.
3. **Base de Datos Relacional**: Los datos fueron importados a una base de datos PostgreSQL, donde se crearon relaciones con tablas adicionales como "clientes", "cines" y "películas".
4. **Consultas SQL**: Se realizaron consultas en PostgreSQL para extraer información valiosa de la base de datos.
5. **Power BI**: Se creó un dashboard interactivo con Power BI, usando DirectQuery para conectar la base de datos PostgreSQL y generar análisis visuales dinámicos.

## Cómo Ejecutar el Proyecto

### 1. Requisitos

- Python 3.x
- PostgreSQL
- Power BI
- Jupyter Notebook (para los notebooks)
- Librerías de Python: `pandas`, `numpy`, `sqlalchemy`, `psycopg2`

### 2. Configuración de la Base de Datos

1. Importa los archivos CSV en PostgreSQL utilizando el script `sql_scripts/esquema.sql` para crear las tablas.
2. Carga los datos limpios (`tickets.csv`, `films.csv`, `customers.csv`, `cinemas.csv`) en las tablas correspondientes en PostgreSQL.
3. Ejecuta las consultas necesarias utilizando `sql_scripts/consultas.sql`.

### 3. Limpieza de Datos

Para ver cómo se realizó la limpieza de datos, abre el archivo `notebooks/limpieza_datos.ipynb`. Allí se muestran todos los pasos de la limpieza, como la eliminación de duplicados y el formateo de columnas.

### 4. Análisis SQL

El archivo `notebooks/analisis_sql.ipynb` contiene el análisis realizado en la base de datos, incluyendo las consultas relevantes para obtener insights valiosos.

### 5. Visualización en Power BI

1. Abre el archivo `dashboards/dashboard.pbix` en Power BI.
2. Conecta Power BI a la base de datos PostgreSQL utilizando DirectQuery.
3. Explora los dashboards interactivos para obtener información sobre los tickets, clientes, películas y cines.

## Licencia

Este proyecto está bajo la licencia MIT.