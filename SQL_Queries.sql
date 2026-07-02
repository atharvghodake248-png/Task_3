USE ecommerce;
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;

SELECT *
FROM Products
WHERE Price > 3000;

SELECT *
FROM Products
ORDER BY Price DESC;

SELECT
Category,
COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

SELECT
SUM(p.Price * o.Quantity) AS TotalRevenue
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT
AVG(Price) AS AveragePrice
FROM Products;

SELECT
c.Name,
p.ProductName,
o.Quantity,
o.OrderDate
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT
c.CustomerID,
c.Name,
o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT
p.ProductName,
o.OrderID
FROM Orders o
RIGHT JOIN Products p
ON o.ProductID = p.ProductID;

SELECT
ProductName,
Price
FROM Products
WHERE Price >
(
SELECT AVG(Price)
FROM Products
);

SELECT
c.Name,
SUM(p.Price * o.Quantity) AS Revenue
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY c.Name
ORDER BY Revenue DESC;

SELECT
c.Name,
COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

SELECT *
FROM Products
WHERE Price =
(
SELECT MAX(Price)
FROM Products
);

SELECT *
FROM Products
WHERE Price =
(
SELECT MIN(Price)
FROM Products
);

SELECT * FROM Sales_View;

SELECT
SUM(p.Price * o.Quantity) /
COUNT(DISTINCT o.CustomerID) AS AverageRevenuePerUser
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT
CustomerID,
Name,
COALESCE(City, 'Unknown') AS City
FROM Customers;

SHOW INDEX FROM Orders;