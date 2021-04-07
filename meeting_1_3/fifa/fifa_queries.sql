SELECT * FROM fifa_players ORDER BY id DESC LIMIT 10

--MAS JOVEN
SELECT * FROM fifa_players ORDER BY age LIMIT 1

--MAS ALTO
SELECT * FROM fifa_players ORDER BY height_cm DESC LIMIT 1

--ULTIMA 

--Vista
CREATE VIEW unique_clubs_view AS
SELECT DISTINCT (club_position) FROM fifa_players WHERE club_position <> '';

--Cantidad
SELECT COUNT(*) FROM unique_clubs_view 

--Orden alfabetico
 SELECT * FROM  unique_clubs_view ORDER BY club_position
    
    
--3 JUGADORES ZURDOS QUE MAS VALEN
SELECT * FROM fifa_players WHERE preferred_foot ='Left' AND value_euro IS NOT NULL ORDER BY value_euro DESC LIMIT 3
    
--CUALES JUGADORES SON DE ARGENTINA, COLOMBIA O MEXICO y TIENEN 90 O MAS RATING
SELECT * FROM fifa_players WHERE lower(nationality) IN ('argentina','colombia','mexico') AND overall_rating >= 90

--
SELECT * FROM fifa_players WHERE age BETWEEN 30 AND 40 ORDER BY release_clause_euro DESC

