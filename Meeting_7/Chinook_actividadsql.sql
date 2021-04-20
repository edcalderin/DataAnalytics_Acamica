
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
----- DATA ANALYTICS: ENCUENTRO 7 --------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
----- PARTE 1: CARGA DE DATOS -----------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Vamos a utilizar la base de datos 'Chinook'. 
-- Para eso, te pedimos que antes corras el archivo 'Chinook_Postgresql.sql' del 1er encuentro.

-- Corroboramos la carga de todas las tablas
SELECT * from "Album" LIMIT 10;
SELECT * from "Artist" LIMIT 10;
SELECT * from "Customer" LIMIT 10;
SELECT * from "Employee" LIMIT 10;
SELECT * from "Genre" LIMIT 10;
SELECT * from "Invoice" LIMIT 10;
SELECT * from "InvoiceLine" LIMIT 10;
SELECT * from "MediaType" LIMIT 10;
SELECT * from "Playlist" LIMIT 10;
SELECT * from "PlaylistTrack" LIMIT 10;
SELECT * from "Track" LIMIT 10;
SELECT * from "Artist" LIMIT 10;


-----------------------------------------------------------------------------------------------
----- PARTE 2: JOINS --------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Vemos el artista de los albumes 'For those about to rock' y 'Let there be rock'
SELECT "Album".title, "Artist".name
FROM "Album" Al
JOIN "Artist" ON "Album".ArtistId = "Artist".ArtistId
WHERE "Album".title IN ('For Those About To Rock We Salute You', 'Let There Be Rock')

-- Vemos los 10 artistas con mas albumes dentro de la base
SELECT "Artist"."Name", count("Album"."Title") q_titulos
FROM "Artist"
JOIN "Album" USING ("ArtistId")
GROUP BY "Name"
ORDER BY q_titulos DESC
LIMIT 10;

-- Vemos los generos que estan presentes en mas playlists
SELECT 	"Genre"."Name", 
		count(distinct "PlaylistTrack"."PlaylistId") playlists, 
		count(distinct "PlaylistTrack"."TrackId") tracks
FROM "Genre"
JOIN "Track" USING ("GenreId")
JOIN "PlaylistTrack" USING ("TrackId")
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Vemos los generos que tienen incorporados mas tracks en playlists
SELECT	"Genre"."Name", 
		count(distinct "PlaylistTrack"."PlaylistId") playlists, 
		count(distinct "PlaylistTrack"."TrackId") tracks
FROM "Genre"
JOIN "Track" USING ("GenreId")
JOIN "PlaylistTrack" USING ("TrackId")
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;

-- Vemos los tracks que mayor facturacion registran
SELECT 	"Track"."Name", 
		sum("InvoiceLine"."UnitPrice" * "InvoiceLine"."Quantity") as Facturacion
FROM "Track"
JOIN "InvoiceLine" ON "Track"."TrackId" = "InvoiceLine"."TrackId"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Vemos los tracks que mayor facturacion registran. ¿De qué artistas son?
SELECT 	"Track"."Name",
		"Artist"."Name",
		sum("InvoiceLine"."UnitPrice" * "InvoiceLine"."Quantity") as Facturacion
FROM "Track"
JOIN "Album" ON "Album"."AlbumId"= "Track"."AlbumId"
JOIN "Artist" ON "Artist"."ArtistId"= "Album"."ArtistId"
JOIN "InvoiceLine" ON "Track"."TrackId" = "InvoiceLine"."TrackId"
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10;

-- Vemos artistas que mayor facturacion registran, en total.
SELECT 	Artist.Name,
		sum(InvoiceLine.UnitPrice * InvoiceLine.Quantity) as Facturacion
FROM Artist
JOIN Album ON Album.ArtistId = Artist.ArtistId
JOIN Track ON Track.AlbumId = Album.AlbumId
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- ¿Cuántos tracks están en playlist y cuántos no? 
-- CHALLENGE: ¡Piensa por qué, en este caso, usamos left join!
SELECT
count(distinct case when "PlaylistTrack"."TrackId" is not null then "Track"."TrackId" else null end) as tracks_in_playlist,
count(distinct case when "PlaylistTrack"."TrackId" is null then "Track"."TrackId" else null end)  as tracks_not_in_playlist
FROM "Track"
LEFT JOIN "PlaylistTrack" ON "Track"."TrackId" = "PlaylistTrack"."TrackId"


SELECT COUNT(DISTINCT("TrackId")) FROM "PlaylistTrack"
SELECT COUNT(DISTINCT("TrackId")) FROM "Track"

INSERT INTO public."Track"
("TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Composer", "Milliseconds", "Bytes", "UnitPrice")
VALUES(1111111, 'Anonimo', 1, 1, 1, 'Metallica', 100, 20, 20);
/*Con Left Join nos aseguramos que obtenga únicamente las canciones que hacen parte de un playlist. 
Si hay mas canciones en la tabla Tracks no se incluirán en el reporte ya que no hacen parte de la transacción con Playlist
*/  

-----------------------------------------------------------------------------------------------
----- PARTE 3: CHALLENGE ----------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- Mira la base de datos 'Chinook' y utiliza alguna tabla que no se haya utilizado hasta aquí­.
-- Te sugerimos un caso como disparador: ¿Cuál es la facturación por día?
-- Para responder a esto, te sugerimos mirar las tablas 'Invoice' e 'InvoiceLine'

SELECT "InvoiceDate", SUM(sub_total) AS total FROM (
	SELECT "InvoiceId", "InvoiceDate", SUM("UnitPrice"*"Quantity") AS sub_total FROM "Invoice" i
	INNER JOIN "InvoiceLine"
	USING ("InvoiceId")
	GROUP BY 1
) facturacion_x_id
GROUP BY 1
ORDER BY 1

--SELECT "InvoiceId", "InvoiceDate" FROM "Invoice" 
--SELECT * FROM "InvoiceLine"



