
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----- DATA ANALYTICS: Encuentro 4 --------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
Crear una base de datos nueva llamada crud
-----------------------------------------------------------------------------------------------
----- PARTE 1: CREACION Y MANIPULACION DE TABLAS ----------------------------------------------
-----------------------------------------------------------------------------------------------

-- Creamos la tabla 'usuarios'
CREATE TABLE usuarios
(id VARCHAR(24), name VARCHAR(24), age FLOAT);

-- Corroboramos que exista
SELECT * FROM usuarios;

-- Insertamos dos registros
INSERT INTO usuarios VALUES
	(1, 'juan', 24);
INSERT INTO usuarios VALUES
	(2, 'maria', 35);

--Corroboramos que se hayan insertado los registros
SELECT * FROM usuarios;

-- Eliminamos un registro de la tabla
DELETE FROM usuarios
WHERE name = 'juan';

-- Corroboramos que se haya efectaudo el cambio
SELECT * FROM usuarios;


-----------------------------------------------------------------------------------------------
----- PARTE 2: USO DE TABLAS TEMPORALES -------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Creamos la tabla donde vamos a alojar los datos
CREATE TABLE cars(mpg FLOAT, 
				  cylinders FLOAT, 
				  displacement FLOAT, 
				  horsepower FLOAT,
				  weight FLOAT,
				  acceleration FLOAT,
				  model_year FLOAT,
				  origin FLOAT,
				  car_name VARCHAR(64));

-- Corroboramos la  estructura de la tabla
SELECT * FROM cars;

-- Poblamos la tabla
COPY cars
FROM 'C:\Users\Erick\Projects\DataAnlytics_Acamica\meeting_1_3\auto-mpg\auto-mpg.csv'
DELIMITER ';' CSV HEADER;

-- Corroboramos tener datos
SELECT * FROM cars;

-- Creamos una tabla personal con valores promedio por vehiculo
SELECT car_name, AVG(weight) AS peso_promedio
INTO TEMP TABLE car_avg
FROM cars
GROUP BY 1;

-- Corroboramos el contenido de la tabla temporal
SELECT * FROM car_avg;

-----------------------------------------------------------------------------------------------
----- CHALLENGE -------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-- Crea una tabla temporal para consultar los 10 modelos de auto con mayor 'horsepower' promedio.
-- ¡Te dejamos dos pistas! 
-- Ordena tus datos con ORDER BY <campo> DESC, y toma los primeros 10 valores con LIMIT.
SELECT
	car_name
	, AVG(horsepower) AS avg_horsepower
INTO TEMP TABLE models_avg_horsepower
FROM
	cars
WHERE
	horsepower IS NOT NULL
GROUP BY
	car_name
ORDER BY
	avg_horsepower DESC
LIMIT 10

SELECT * FROM models_avg_horsepower


