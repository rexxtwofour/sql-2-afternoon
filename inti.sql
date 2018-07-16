Practice Joins


1
select * 
from invoice i
join invoiceline il on il.invoiceid = i.invoiceid
where il.unitprice > 0.99;

2
SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId;

3
SELECT c.FirstName, c.LastName, e.FirstName , e.LastName
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

4
SELECT al.Title, ar.Name
FROM Album al
JOIN Artist ar ON al.ArtistId = ar.ArtistId;

5
SELECT pt.TrackId
FROM PlaylistTrack pt
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId 
WHERE p.Name = 'Music';

6
SELECT t.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;


7
SELECT t.name, p.Name
FROM Track t
JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;

8
SELECT t.Name, a.title
FROM Track t
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Alternative";







Practice nested queries
1
SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > 0.99)

2
SELECT * 
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId FROM Playlist WHERE Name = "Music" );

3
SELECT Name 
FROM Track
WHERE TrackId IN ( SELECT TrackId FROM PlaylistTrack WHERE PlaylistId = 5 ); 

4
SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId FROM Genre WHERE Name = "Comedy" );

5
SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId FROM Album WHERE Title = "Fireball" );

6
SELECT *
FROM Track
WHERE AlbumId IN (
    SELECT AlbumId FROM Album WHERE ArtistID IN (
        SELECT ArtistId FROM Artist WHERE Name = "Queen"
    )
);


practice updating rows
1
UPDATE Customer
SET Fax = null
WHERE FAX IS NOT null;

2
UPDATE Customer
SET Company = "Self"
WHERE Company IS null;


3
UPDATE Customer
SET LastName = "Thompson"
WHERE FirstName = "Julia" AND LastName = "Barnett";

4
UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl"
5
UPDATE Track
SET Composer = "The darkness around us"
WHERE GenreId = (SELECT GenreId FROM Genre WHERE Name = "METAL" )
AND Composer IS null;



group by

1
SELECT Count(*),g.Name
FROM Track t
JOIN Genre g ON t.GenreId = g.GenreId
Group BY g.Name;

2
SELECT Count(*), g.Name
FROM Track t
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = 'Rock'
Group BY g.Name;


3
SELECT ar.Name, Count(*)
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY al.ArtistId;




use distinct
1
SELECT DISTINCT Composer
FROM Track;

2
SELECT DISTINCT BillingPostalCode
FROM Invoice;

3
SELECT DISTINCT Company
FROM Customer;

delete rows
1
SELECT * FROM practice_delete;

DELETE
FROM practice_delete
WHERE Type = "bronze";

2
SELECT * FROM practice_delete;

DELETE
FROM practice_delete
WHERE Type = "silver";


3
SELECT * FROM practice_delete;

DELETE
FROM practice_delete
WHERE value = 150;








eCommerce simulation No hints



CREATE TABLE Users (
   ID serial PRIMARY KEY,
   name text,
   email text
);

INSERT INTO Users ( name, email ) VALUES ( 'David', '123fullstreet@rmail.com' );
INSERT INTO Users ( name, email ) VALUES ( 'Luis', 'romperstomper@flymail.com' );
INSERT INTO Users ( name, email ) VALUES ( 'Robert', 'upintheair@gomama.com' );




CREATE TABLE Products (
   productId serial PRIMARY KEY,
   name text,
   price int,
   users_id int REFERENCES users (id)
);

INSERT INTO Products( name, price, users_id ) VALUES ( 'polo' , 35.00, 1 );
INSERT INTO Products( name, price, users_id ) VALUES ( 'hats' , 15.00, 2 );
INSERT INTO Products( name, price, users_id ) VALUES ( 'shoes' , 79.00, 3 );




CREATE TABLE  Orders (
   ordersId serial PRIMARY KEY,
   productRef INT
   productsId int REFERENCES products (id)
);

INSERT INTO Orders ( id, productRef, productId ) VALUES ( 1,'first', 1 )
INSERT INTO Orders ( id, productRef, productId ) VALUES ( 2,'second', 2 )
INSERT INTO Orders ( id, productRef, productId ) VALUES ( 3,'third',3 )



