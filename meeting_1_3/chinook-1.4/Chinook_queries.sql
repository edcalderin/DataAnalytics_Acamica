/* 	Este es tu primer archivo .sql 
	Recuerda que puedes seleccionar y correr una consulta a la vez pintando las filas
	que correspondan y apretando el boton "Play"
	Elimina los ___ y reemplazalos por los campos correspondientes
*/

-- 0. Seleciona todo de la tabla Album
SELECT * FROM "Album";

-- 1. Seleciona los nombres unicos de las ciudades de la tabla "Invoice" 
SELECT distinct "BillingCity" FROM "Invoice";

-- 2. Selecciona los primeros 15 registros de la tabla Employee
SELECT * FROM "Employee" LIMIT 15;

-- 3. Selecciona la tabla "Customer" ordenado por apellido de forma descendiente.

SELECT * FROM "Customer" ORDER BY "LastName" DESC;

-- 4. Selecciona todos los clientes que sean de Polonia
SELECT * FROM "Customer"  WHERE "Country" = 'Poland';

-- 5. Selecciona todas las cacniones que duren 233926 o mas
SELECT * FROM "Track"  WHERE "Milliseconds" >= 233926;

-- 6. Selecciona todos los clientes cuyo CustomerId este entre 50 y 55
SELECT * FROM "Customer"  WHERE "CustomerId" BETWEEN 50 and 55;

-- 7. Selecciona todos los aritstas cuyos ArtistId sean 6,80,81,92.
SELECT * FROM "Artist" WHERE "ArtistId" IN (6,80,81,92);