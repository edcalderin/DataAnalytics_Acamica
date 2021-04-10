-- Query 1: ¿Cuales son los modelos de auto con mayor peso promedio?¿Y mayor horsepower?

SELECT
	model_year	
	, avg(weight) AS avg_col
	--, avg(horsepower) AS avg_col	
FROM
	public.cars
GROUP BY model_year
ORDER BY avg_col DESC

/*
Query 2: Si realizas el mismo procedimiento pero en base a la aceleración. 
¿Puedes sacar alguna relación entre lo que ves aquí y el peso promedio?
*/
SELECT
	model_year	
	, avg(acceleration) AS avg_acce	
FROM
	public.cars
GROUP BY model_year
ORDER BY avg_acce DESC

/* 

CONCLUSIONES:

Query 1: Los primeros modelos tienden a tener menor peso
Query 2: Los últimos modelos tienden a tener una mayor aceleración
*/