CREATE DATABASE IF NOT EXISTS alx_book_store
USE alx_book_store

CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(215) NOT NULL,
  PRIMARY KEY (`author_id`)
) 

CREATE TABLE IF NOT EXISTS `Books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(130) NOT NULL,
  `author_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
)

CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(215) NOT NULL,
  `email` varchar(215) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`customer_id`)
) 

CREATE TABLE IF NOT EXISTS `Order_Details` (
  `orderdetailid` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  PRIMARY KEY (`orderdetailid`),
  KEY `order_id` (`order_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `Order_Details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `Order_Details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
) 

CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
) 