
USE game_db1;

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS  product;
DROP TABLE IF EXISTS order_tb;
DROP TABLE IF EXISTS orderline;



CREATE TABLE customer(
    customer_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    name_ VARCHAR(45) NOT NULL,
    address VARCHAR(45) NOT NULL,
    dob DATE NOT NULL
);
CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    title VARCHAR(45) NOT NULL,
    genre VARCHAR(45) NOT NULL,
    rating INT NOT NULL,
    price FLOAT NOT NULL,
    stock INT NOT NULL

);

CREATE TABLE orderline(
	orderline_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE order_tb(
	order_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    customer_id INT NOT NULL,
    orderline_id INT NOT NULL,
    purchase_date DATETIME NOT NULL,
    status VARCHAR(45) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (orderline_id) REFERENCES orderline(orderline_id)
);

INSERT INTO customer (name_, address, dob)
VALUES
	('rob','122 NewName Road, London', '1991-03-24'),
    ('sarah', '34 havelock Street, London', '1990-02-12'),
    ('meghan','122 Bolsover Road, Edinburgh','1988-05-21'),
    ('raj', '25 kings Street, London', '1992-11-22');
    
ALTER TABLE customer
ADD postcode VARCHAR(10),
ADD age INT;

UPDATE customer
SET postcode='W12 8JJ'
WHERE customer_id=1;

UPDATE customer
SET postcode='EC12 2QH'
WHERE customer_id=2;

UPDATE customer
SET postcode='EH99 1SPF'
WHERE customer_id=3;

UPDATE customer
SET postcode='SE12 2JF'
WHERE customer_id=4;

ALTER TABLE product
ADD release_date DATE;


INSERT INTO product (title, genre, rating, release_date, price, stock)
VALUES
	('need for speed: underground','racing', '12','2003-11-17',21.90,50),
	('minecraft','sandbox-survival', '7','2011-10-18',24.99,150),
	('batman: arkham city','action-adventure', '13','2011-10-18',18.95,100);
   
INSERT INTO orderline(product_id, quantity,total_price)
VALUES
	(2,1,24.99);
        
INSERT INTO order_tb(customer_id, orderline_id, purchase_date,status)
VALUES
    (1,2,'2022-03-24','DISPATCHED');
    set foreign_key_checks = 1; 