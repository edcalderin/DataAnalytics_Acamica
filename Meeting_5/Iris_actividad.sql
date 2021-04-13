
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----- DATA ANALYTICS: ENCUENTRO 5 --------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
----- PARTE 1: IMPORTAR LOS DATOS -------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Creamos la tabla donde vamos a alojar los datos (¡Guiate con Kaggle para crearla!)
CREATE TABLE iris('COMPLETAR' FLOAT, 
				  'COMPLETAR' FLOAT, 
				  'COMPLETAR' FLOAT, 
				  'COMPLETAR' FLOAT,
				  'COMPLETAR' FLOAT,
				  'COMPLETAR' VARCHAR(24));

-- Corroboramos la  estructura de la tabla
SELECT * FROM 'COMPLETAR';

-- Poblamos la tabla
COPY 'COMPLETAR'
FROM 'C:/Users/Public/Iris.csv'
DELIMITER ',' CSV HEADER;

-- Corroboramos tener datos
'COMPLETAR LA LINEA'


-----------------------------------------------------------------------------------------------
----- PARTE 2: ESTADISTICOS -------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Estadisticos descriptivos por especie (tendencia central)
SELECT 	'COMPLETAR',
 		AVG(SepalLengthCm) AS SepalLengthCm_promedio,
		percentile_cont(0.5) within group (order by SepalLengthCm) AS SepalLengthCm_mediana,
 		'COMPLETAR'(SepalWidthCm) AS SepalWidthCm_promedio,
		percentile_cont(0.5) within group (order by SepalWidthCm) AS SepalWidthCm_mediana,
 		'COMPLETAR'(PetalLengthCm) AS PetalLengthCm_promedio,
		percentile_cont(0.5) within group (order by PetalLengthCm) AS PetalLengthCm_mediana,
 		'COMPLETAR'(PetalWidthCm) AS PetalWidthCm_promedio,
		percentile_cont(0.5) within group (order by PetalWidthCm) AS PetalWidthCm_mediana
FROM 'COMPLETAR'
GROUP BY Species;

-- Estadisticos descriptivos por especie (dispersion y rango)
SELECT 	Species,
		stddev(SepalLengthCm) AS SepalLengthCm_sd,
		MIN(SepalLengthCm) AS SepalLengthCm_min,
		MAX(SepalLengthCm) AS SepalLengthCm_max,
		'COMPLETAR'(SepalWidthCm) AS SepalWidthCm_sd,
		'COMPLETAR'(SepalWidthCm) AS SepalWidthCm_min,
		'COMPLETAR'(SepalWidthCm) AS SepalWidthCm_max,
		'COMPLETAR'(PetalLengthCm) AS PetalLengthCm_sd,
		'COMPLETAR'(PetalLengthCm) AS PetalLengthCm_min,
		'COMPLETAR'(PetalLengthCm) AS PetalLengthCm_max,
		'COMPLETAR'(PetalWidthCm) AS PetalWidthCm_sd,
		'COMPLETAR'(PetalWidthCm) AS PetalWidthCm_min,
		'COMPLETAR'(PetalWidthCm) AS PetalWidthCm_max
FROM 'COMPLETAR'
GROUP BY 1;


-----------------------------------------------------------------------------------------------
----- CHALLENGE -------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- 1)
-- Realiza nuevamente las tablas de estadisticos, pero de una manera mas prolija.
-- Para esto, investiga la funcion ROUND() para que todo tenga 2 decimales. 

-- 2)
-- Ahora que conoces los estadisticos, ¿te imaginas la forma de la distribucion de cada especie?
-- ¡Debatelo con tus compañeros!




