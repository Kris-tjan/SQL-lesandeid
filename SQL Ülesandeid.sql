                                                           -- (Üle,1:) --
SELECT * FROM d107230_leopard.orders;

                                                            -- (Ül,2:) --
SELECT * FROM d107230_leopard.books WHERE 
 release_date >= 2010 AND type = 'new';

                                                            -- (Üle,3:) --
SELECT title, release_date, price, type FROM books 
WHERE release_date
< 1970 AND type= 'used' AND price < 20 ;

															-- (Üle,4:) --
SELECT count(*) AS "Tellimuste arv" , YEAR (order_date) 
AS Aasta FROM orders
GROUP BY YEAR(order_date);

                                                             -- (Üle,5:) --
SELECT ROUND(SUM(price),2) AS "Ümardatud" FROM orders 
LEFT JOIN books ON orders.book_id = books.id 
GROUP BY YEAR(order_date);

                                                             -- (Üle,6:) --
SELECT SUM(price), COUNT(*) FROM orders 
LEFT JOIN books ON orders.book_id = books.id 
WHERE YEAR (order_date) = 2015;

                                                               -- (Üle,7:) --
SELECT SUM(price), COUNT(*), username FROM d107230_leopard.clients 
LEFT JOIN orders ON orders.client_id = clients.id
LEFT JOIN books ON orders.book_id = books.id WHERE YEAR
 (order_date) = 2017 GROUP BY client_id;

															  -- (Üle,8:) --
SELECT COUNT(*) FROM d107230_leopard.orders 
LEFT JOIN books ON orders.book_id = books.id 
WHERE YEAR (order_date) = 2017 GROUP BY books.id
 ORDER BY count(*) desc LIMIT 10;

                                                              -- (Üle,9:) --
SELECT * FROM d107230_leopard.books WHERE price >
 ALL(SELECT avg(price) FROM books);

                                                              -- (22, Üle1:) --
SELECT sum(stock_saldo*price) 
FROM d107230_leopard.books;

                                                                -- (22, Üle 2:) --
SELECT MIN(price) AS Kõige_odavam, MAX(price) 
AS Kõige_kallim, AVG(price) 
AS Keskmine FROM d107230_leopard.books;

                                                               -- (22, Üle 3:) --
SELECT max(price) AS Kõige_kallim 
FROM d107230_leopard.books 
WHERE type= 'used';

                                                               -- (22, Üle 4:) -- 
SELECT CASE WHEN type = "new" THEN "uus" WHEN type = "used" 
THEN "kasutatud" WHEN type = "ebook" THEN "e-raamat" END as Tüüp,
 round(avg(price),2) as Keskmine_Hind, COUNT(*) 
 AS Hulk FROM d107230_leopard.books GROUP BY type;

                                                               -- (22, Üle 5) --
SELECT * FROM d107230_leopard.books
 WHERE type = "used" AND price > 
(SELECT avg(price) FROM d107230_leopard.books 
WHERE type = 'new');

                                                             -- (22, Üle 6:) --
SELECT * FROM d107230_leopard.books WHERE price > 
(SELECT avg(price) FROM d107230_leopard.authors
LEFT JOIN book_authors ON book_authors.author_id = authors.id
LEFT JOIN books ON books.id  = book_authors.book_id  
LEFT JOIN orders ON orders.book_id = books.id 
GROUP BY authors.id ORDER BY count(*) desc LIMIT 1);

                                                             -- (22, Üle 7:) --
SELECT * FROM d107230_leopard.books 
WHERE release_date % 2 = 0; 

                                                            -- (22, Üle 8:) --
SELECT count(*), language FROM d107230_leopard.books 
GROUP BY language 
ORDER BY count(*) desc LIMIT 3;

															-- (23, Üle 1:) -- 
INSERT INTO clients (username, first_name, last_name, email, address)
VALUES ("kris", "jooop", "fpl", "ma20krisles@gmail.com", "lasnamääe");

															-- (23, Üle 2:) --
UPDATE books
SET language = "Eesti,Soome,Rootsi"
WHERE id = 3;

                                                             -- (23, Üle 3:) --
DELETE FROM orders
WHERE id = 2300;

                                                             -- (23, Üle 4:) --
INSERT INTO clients (username, first_name, last_name, email, address)
VALUES 
("Kris", "KOKO", "HOKOI", "ma20krisles@gmail.com", "honda"),
("Kris", "KOKOe", "HOKyOI", "mat20krisles@gmail.com", "honvda"),
("Krids", "KOKOd", "HOnyKOI", "may20krisles@gmail.com", "honda")
("Krifs", "KOKtgO", "HnyOKOI", "math20krisles@gmail.com", "honysnda"),
("Krifs", "KOKtgO", "HnyOKOI", "math20krisles@gmail.com", "honysnda");


                                                             -- (23, Üle 5:) --
INSERT INTO orders (delivery_address, order_date, 
status, client_id, book_id)
VALUES
("nõmme tee 43-6", "2021-06-10", "sent",
(SELECT id FROM d107230_leopard.clients 
WHERE username = "mcage1o"),
(SELECT id FROM d107230_leopard.books
 WHERE title = "Vendetta"));

															-- (23 Üle 6:) --
UPDATE books
set price = price * 1.05, pages = pages - 5  
where id > 0;

															-- (23 Üle 7:) --
                                            
DELETE FROM authors WHERE id IN 
(SELECT authors.id 
FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id
WHERE book_authors.id is NULL);




