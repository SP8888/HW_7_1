-- Составьте список пользователей users,
-- которые осуществили хотя бы один заказ orders в интернет магазине.

show tables;
SELECT * FROM orders;
SELECT * FROM users;
DESC users;

INSERT users VALUES (NULL, 'Alex');
INSERT users VALUES (NULL, 'Anton');
INSERT users VALUES (NULL, 'Boris');
INSERT users VALUES (NULL, 'Dima');
INSERT users VALUES (NULL, 'Violeta');
 
INSERT orders VALUES (NULL, 1, '1989-10-02', "20.10.2017");
INSERT orders VALUES (NULL, 1, '1989-10-02', "20.10.2017");
INSERT orders VALUES (NULL, 4, '1987-10-02', "20.10.2017");
INSERT orders VALUES (NULL, 1, '1995-10-02', "20.10.2017");
INSERT orders VALUES (NULL, 5, '1993-10-02', "20.10.2017");

SELECT users.name, COUNT(*) FROM users JOIN orders 
ON users.id = orders.user_id
GROUP BY users.name ;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT * FROM products;
SELECT * FROM catalogs;

SELECT p.name, p.description, p.price, c.name FROM products p JOIN catalogs c
ON p.catalog_id = c.id;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities 
-- (label, name). Поля from, to и label содержат английские 
-- названия городов, поле name — русское. Выведите список рейсов flights 
-- с русскими названиями городов.
DROP TABLE IF EXISTS flights ;
CREATE TABLE flights(
 id SERIAL PRIMARY KEY,
 from_name VARCHAR(256),
 to_name VARCHAR(256));

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
 id SERIAL PRIMARY KEY, 
 label VARCHAR(256),
 name VARCHAR(256));

INSERT INTO flights (from_name, to_name)
VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('ircutsk','moscow'),
('omsk', 'ircutsk'),
('moscow', 'kazan');

INSERT INTO cities (label, name)
VALUES
('moscow', 'Москва'),
('novgorod', 'Новгород'),
('ircutsk','Иркутск'),
('omsk', 'Омск'),
('kazan', 'Казань');

SELECT * FROM flights;
SELECT * FROM cities;

SELECT * FROM flights f JOIN cities c;

SELECT
  f.id,
  cities_from.name AS `from`,
  cities_to.name AS `to`
FROM flights AS f
  LEFT JOIN cities AS cities_from
    ON f.from_name = cities_from.label
  LEFT JOIN cities AS cities_to
    ON f.to_name = cities_to.label;
   

   
 
