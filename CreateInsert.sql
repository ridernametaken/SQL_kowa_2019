DROP TABLE IF EXISTS pizza CASCADE; 
DROP TABLE IF EXISTS kunde CASCADE; 
DROP TABLE IF EXISTS bestellung CASCADE;

CREATE TABLE pizza (
   p_id INTEGER NOT NULL PRIMARY KEY,
   name VARCHAR(30),
   zutaten VARCHAR(50),
   preis NUMERIC(8,2)
);

CREATE TABLE kunde (
   k_id INTEGER NOT NULL PRIMARY KEY,
   name VARCHAR(30)
);

CREATE TABLE bestellung ( 
   p_id INTEGER NOT NULL,
   k_id INTEGER NOT NULL,
   beginn TIMESTAMP,
   dauer INTERVAL,
   FOREIGN KEY (k_id) REFERENCES kunde (k_id),
   FOREIGN KEY (p_id) REFERENCES pizza (p_id) 
);

INSERT INTO pizza(p_id,name ,zutaten ,preis) VALUES 
   (1, 'Peperoni', 'Tomato, Salami, Peperoni', 4.50),
   (2, 'Cheesagedon', 'Cheese', 4.00),
   (3, 'Empty Pizza', 'NULL', 8.00),
   (4, 'Sea Food Pizza', 'Tomato, Fish, Onion', 5.00)
;

INSERT INTO kunde(k_id, name) VALUES 
   (1, 'Tony'),
   (2, 'Peter')
;

INSERT INTO bestellung(p_id, k_id, beginn, dauer) VALUES 
   (2,1, TIMESTAMP '2019-08-29 14:00', INTERVAL '20 minutes'),
   (3,2, TIMESTAMP '2019-08-29 15:00', INTERVAL '5 minutes')
;
