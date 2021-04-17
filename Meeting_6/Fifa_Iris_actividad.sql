
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----- DATA ANALYTICS: ENCUENTRO 6 --------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Corroboramos la carga.
SELECT * FROM fifa_players LIMIT 10;  

-- Correlación entre rating y valor.
SELECT corr(overall_rating, value_euro) FROM fifa_players;

-- Distintas correlaciones para rating. ¿Qué variable se encuentra más relacionada a esta?
SELECT 	corr(overall_rating, value_euro) corr_value_euro,
		corr(overall_rating, age) corr_age,
		corr(overall_rating, potential) corr_potential,
		corr(overall_rating, crossing) corr_crossing,
		corr(overall_rating, finishing) corr_finishing,
		corr(overall_rating, short_passing) corr_short_passing,
		corr(overall_rating, long_passing) corr_long_passing,
		corr(overall_rating, ball_control) corr_ball_control,
		corr(overall_rating, ball_control) corr_ball_control,
		corr(overall_rating, shot_power) corr_shot_power
FROM fifa_players;
				  
-- CHALLENGE
-- Acabas de ver una serie de correlaciones. Evalúa estas correlaciones según la nacionalidad de cada jugador. 
-- Pista: utiliza 'nationality' como variable cualitativa. ¡Ya sabes cómo calcular las correlaciones!
-- Extra: siempre es bueno saber los tamaños de las muestras. ¡Incorpóralo a tu query!

SELECT 	nationality,
		count(*) AS tamanio_muestras,
		corr(overall_rating, value_euro) corr_value_euro,
		corr(overall_rating, age) corr_age,
		corr(overall_rating, potential) corr_potential,
		corr(overall_rating, crossing) corr_crossing,
		corr(overall_rating, finishing) corr_finishing,
		corr(overall_rating, short_passing) corr_short_passing,
		corr(overall_rating, long_passing) corr_long_passing,
		corr(overall_rating, ball_control) corr_ball_control,
		corr(overall_rating, ball_control) corr_ball_control,
		corr(overall_rating, shot_power) corr_shot_power
FROM fifa_players
GROUP BY nationality
ORDER BY tamanio_muestras				  

-----------------------------------------------------------------------------------------------
----- PARTE 2: IRIS ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- ¡Ahora te toca a ti! Te dejamos lista la tabla para incorporar el dataset 'iris'.
-- Responde: 
-- 1.¿Cuáles son los atributos más correlacionados entre sí? Petallength y petalwidth
-- 2.¿Esto se da para todas las especies? No, al agruparlo por especies las correlaciones disminuyen en algunas especies.

SELECT * FROM iris LIMIT 10;

SELECT 	species,
		corr(sepallengthcm, sepalwidthcm) corr_sepallenght_sepalwidth,
		corr(sepallengthcm, petallengthcm) corr_sepallenght_petallength,
		corr(sepallengthcm, petalwidthcm) corr_sepallenght_petalwidth,
		corr(sepalwidthcm, petallengthcm) corr_sepalwidth_petallength,
		corr(sepalwidthcm, petalwidthcm) corr_sepalwidth_petalwidth,
		corr(petallengthcm, petalwidthcm) corr_petallength_petalwidth
FROM iris
GROUP BY species

-----------------------------------------------------------------------------------------------
----- CHANLLENGE PRO --------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--1. ¿Cuál es el  jugador más jóven de cada país?

-- CON Window Functions
SELECT "name", nationality, birth_date FROM (
	SELECT "name", nationality, birth_date, RANK () OVER (PARTITION BY nationality ORDER BY birth_date) 
	FROM fifa_players fp
) query_wf
WHERE rank=3

-- SIN Window Functions
SELECT fp.nationality , fp2.max_birthday, fp."name"  FROM fifa_players fp
INNER JOIN (
	SELECT nationality, MAX(birth_date) AS max_birthday FROM fifa_players GROUP BY 1
) fp2
ON fp.nationality = fp2.nationality
WHERE fp.birth_date = fp2.max_birthday
ORDER BY 1


/*2. Cuántos jugadores nacieron en la misma fecha y en el mismo país. 
	(Ideal que el resultado muestre los nombres de los jugadores)*/

DROP TABLE IF EXISTS temp_groups_fifa;

CREATE TEMP TABLE temp_groups_fifa AS (
	SELECT query_wf.* FROM fifa_players fp 
	INNER JOIN 
	(
		SELECT name, nationality, birth_date, 
		ROW_NUMBER () OVER( PARTITION BY nationality, birth_date) AS count_groups,
		TO_CHAR(birth_date, 'day') AS day_of_week		
		FROM fifa_players
	) query_wf
	ON query_wf.nationality = fp.nationality AND query_wf.birth_date = fp.birth_date 
	WHERE query_wf.count_groups > 1
	ORDER BY fp.nationality
);

SELECT * FROM temp_groups_fifa

-- 3. Cual es el día de la semana que se da más este acontecimiento.

--SIN Window Functions
SELECT day_of_week, COUNT(*) AS max FROM temp_groups_fifa
GROUP BY day_of_week
ORDER BY max DESC
--LIMIT 1

--CON Window Functions
SELECT day_of_week, MAX(frequency) FROM (
	SELECT day_of_week, ROW_NUMBER() OVER(PARTITION BY day_of_week) AS frequency FROM temp_groups_fifa
) subquery
GROUP BY day_of_week
ORDER BY max DESC
--LIMIT 1

-- Borrar tabla temporal
DROP TABLE IF EXISTS temp_groups_fifa;


