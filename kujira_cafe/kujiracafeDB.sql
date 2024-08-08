DROP DATABASE IF EXISTS kujiracafe;
CREATE DATABASE kujiracafe DEFAULT CHAR SET utf8; 
USE kujiracafe;
CREATE TABLE categories (
    category_id TINYINT(1) PRIMARY KEY,
    category_name VARCHAR(64)
);
INSERT INTO categories VALUES 
    (1,'all'),
    (2,'drink'),
    (3,'dessert'),
    (4,'food');
CREATE TABLE menu (
    id int PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(64) NOT NULL,
    category_id TINYINT(1),
    image_name VARCHAR(128),
    price int,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE USER 'cafeowner'@'localhost' IDENTIFIED BY '5Dmg&EYh8Sk7';
GRANT ALL ON kujiracafe.* TO 'cafeowner'@'localhost';