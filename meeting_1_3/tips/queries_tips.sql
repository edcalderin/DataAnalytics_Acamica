--Propina promedio
SELECT avg(total_bill) AS propina_promedio FROM tips t

--Propina promedio segun genero
SELECT sex, avg(total_bill) AS propina_promedio FROM tips t GROUP BY sex

--Propina en todo momento del día
SELECT time, AVG(total_bill) FROM tips t GROUP BY time

--Dias de la semana con mayor propina promedio
SELECT avg(total_bill) AS avg_bill, "day" FROM tips t GROUP BY "day" ORDER BY avg_bill DESC

--Horarios con mayor cantidad de propinas
SELECT time, COUNT(SIZE) AS size_bills FROM tips t GROUP BY time ORDER BY size_bills DESC 

--¿Cual es la máxima y la mínima propina que han dejado los clientes?
SELECT MIN(tip) AS Min_tip, MAX(tip) AS Max_tip FROM tips t 

--Según la información anterior cree una columna con 9 rangos de propinas y diga cuantos clientes caen en cada rango 
-- (Ejemplo: Entre 1$ y 2$ hay 20 clientes)
SELECT tip_ranges, COUNT(*) qty_clients FROM (
	SELECT 
		*,
		(	CASE 
		WHEN tip < 2  THEN 'R1'
		WHEN tip BETWEEN 2 AND 3 THEN 'R2'
		WHEN tip BETWEEN 3 AND 4 THEN 'R3'
		WHEN tip BETWEEN 4 AND 5 THEN 'R4'
		WHEN tip BETWEEN 5 AND 6 THEN 'R5'
		WHEN tip BETWEEN 6 AND 7 THEN 'R6'
		WHEN tip BETWEEN 7 AND 8 THEN 'R7'
		WHEN tip BETWEEN 8 AND 9 THEN 'R8'
		WHEN tip > 9 THEN 'R9'
		END
		) AS tip_ranges
	FROM tips
) sub_query
GROUP BY tip_ranges
ORDER BY tip_ranges

