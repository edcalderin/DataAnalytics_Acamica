
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



