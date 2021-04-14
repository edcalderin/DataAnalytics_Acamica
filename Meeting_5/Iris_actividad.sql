
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----- DATA ANALYTICS: ENCUENTRO 5 --------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
----- PARTE 1: IMPORTAR LOS DATOS -------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Creamos la tabla donde vamos a alojar los datos (Â¡Guiate con Kaggle para crearla!)
CREATE TABLE iris(Id SMALLINT, 
				  SepalLengthCm FLOAT, 
				  SepalWidthCm FLOAT, 
				  PetalLengthCm FLOAT,
				  PetalWidthCm FLOAT,
				  Species VARCHAR(24));

-- Corroboramos la  estructura de la tabla
SELECT * FROM iris;

-- Poblamos la tabla
COPY iris
FROM 'C:\Users\Erick\Projects\DataAnlytics_Acamica\Meeting_5\Iris.csv'
DELIMITER ',' CSV HEADER;

-- Corroboramos tener datos
SELECT * FROM iris;


-----------------------------------------------------------------------------------------------
----- PARTE 2: ESTADISTICOS -------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Estadisticos descriptivos por especie (tendencia central)
SELECT 	species,
 		ROUND(CAST(AVG(SepalLengthCm) AS DECIMAL), 2) AS SepalLengthCm_promedio,
		percentile_cont(0.5) within group (order by SepalLengthCm) AS SepalLengthCm_mediana,
		MODE() WITHIN GROUP (ORDER BY SepalLengthCm) AS SepalLengthCm_moda,
 		ROUND(CAST(AVG(SepalWidthCm) AS DECIMAL), 2) AS SepalWidthCm_promedio,
		percentile_cont(0.5) within group (order by SepalWidthCm) AS SepalWidthCm_mediana,
		MODE() WITHIN GROUP (ORDER BY SepalWidthCm) AS SepalWidthCm_moda,
 		ROUND(CAST(AVG(PetalLengthCm) AS DECIMAL), 2) AS PetalLengthCm_promedio,
		percentile_cont(0.5) within group (order by PetalLengthCm) AS PetalLengthCm_mediana,
		MODE() WITHIN GROUP (ORDER BY PetalLengthCm) AS PetalLengthCm_moda,
 		ROUND(CAST(AVG(PetalWidthCm) AS DECIMAL), 2) AS PetalWidthCm_promedio,
		percentile_cont(0.5) within group (order by PetalWidthCm) AS PetalWidthCm_mediana,
		MODE() WITHIN GROUP (ORDER BY PetalWidthCm) AS PetalWidthCm_moda
FROM iris
GROUP BY Species;

-- Estadisticos descriptivos por especie (dispersion y rango)
SELECT 	Species,
		ROUND(CAST(stddev(SepalLengthCm) AS DECIMAL), 2) AS SepalLengthCm_sd,
		MIN(SepalLengthCm) AS SepalLengthCm_min,
		MAX(SepalLengthCm) AS SepalLengthCm_max,
		ROUND(CAST(stddev(SepalWidthCm) AS DECIMAL), 2) AS SepalWidthCm_sd,
		MIN(SepalWidthCm) AS SepalWidthCm_min,
		MAX(SepalWidthCm) AS SepalWidthCm_max,
		ROUND(CAST(stddev(PetalLengthCm) AS DECIMAL), 2)  AS PetalLengthCm_sd,
		MIN(PetalLengthCm) AS PetalLengthCm_min,
		MAX(PetalLengthCm) AS PetalLengthCm_max,
		ROUND(CAST(stddev(PetalWidthCm) AS DECIMAL), 2) AS PetalWidthCm_sd,
		MIN(PetalWidthCm) AS PetalWidthCm_min,
		MAX(PetalWidthCm) AS PetalWidthCm_max
FROM iris
GROUP BY 1;


-----------------------------------------------------------------------------------------------
----- CHALLENGE -------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- 1)
-- Realiza nuevamente las tablas de estadisticos, pero de una manera mas prolija.
-- Para esto, investiga la funcion ROUND() para que todo tenga 2 decimales. 

-- 2)
-- Ahora que conoces los estadisticos, ¿Te imaginas la forma de la distribucion de cada especie?
-- ¡Debatelo con tus compañeros!

-- 3)
-- ¿Cual es la especie con un largo de pétalo mayor, en promedio? Esta especie, ¿es muy dispersa respecto al resto?
SELECT 	Species,		
		ROUND(CAST(stddev(PetalLengthCm) AS DECIMAL), 2)  AS PetalLengthCm_sd,
		MIN(PetalLengthCm) AS PetalLengthCm_min,
		MAX(PetalLengthCm) AS PetalLengthCm_max
FROM iris
GROUP BY 1;
-- R: Virginica es la especie con largo de pétalo mayor, y es la más dispersa teniendo el valor de su desviación estandas y 
--	  comparándola con el resto.


