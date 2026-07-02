DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(1,'Atharv','Mumbai'),
(2,'Rohan','Pune'),
(3,'Priya','Delhi'),
(4,'Amit','Nagpur'),
(5,'Sneha','Nashik');

INSERT INTO Products VALUES
(101,'Laptop','Electronics',50000),
(102,'Mouse','Electronics',700),
(103,'Shoes','Fashion',2500),
(104,'Phone','Electronics',30000),
(105,'Watch','Accessories',4000);

INSERT INTO Orders VALUES
(1,1,101,1,'2025-06-01'),
(2,2,102,2,'2025-06-02'),
(3,3,103,3,'2025-06-05'),
(4,1,104,1,'2025-06-07'),
(5,5,105,2,'2025-06-08'),
(6,4,101,1,'2025-06-09'),
(7,2,103,2,'2025-06-10'),
(8,3,105,1,'2025-06-11');

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;

CREATE VIEW Sales_View AS
SELECT
    c.CustomerID,
    c.Name,
    c.City,
    p.ProductName,
    p.Category,
    o.Quantity,
    p.Price,
    (o.Quantity * p.Price) AS Revenue,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID;

SELECT * FROM Sales_View;

CREATE INDEX idx_customer
ON Orders(CustomerID);