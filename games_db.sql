use game_db1;

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




