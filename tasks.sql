-- First task
-- Create a SQL query to return next data ordered by city and then by name
-- |Employy Id | Employee Full Name | Title | City |
-- [Employee Full Name] - First Name and Last Name.
SELECT E.EmployeeID, E.FirstName, E.LastName, E.Title, E.City FROM Employees E ORDER BY E.City
SELECT E.EmployeeID, E.FirstName, E.LastName, E.Title, E.City FROM Employees E ORDER BY E.FirstName

--Second task
--Create a query to return a list ordered by order id descending
--| Order Id | Order Total Price | Total Order Discount, % |
SELECT OD.OrderID, (OD.UnitPrice * OD.Quantity) AS OrderTotalPrice, OD.Discount AS [TotalOrderDiscount, %]
FROM [Order Details] OD
ORDER BY OD.OrderID DESC
-- alternative
SELECT OD.OrderID, SUM(OD.UnitPrice) AS TotalCount, SUM(OD.Discount)*100 AS TotalDiscount 
FROM [Order Details] OD
GROUP BY OD.OrderId 
ORDER BY OD.OrderID DESC

--Third task
-- Create a query to return all customers from USA without Fax:
--| CustomerId | CompanyName |
SELECT C.CustomerID, C.CompanyName FROM Customers C WHERE C.Country='USA' AND C.Fax IS NOT NULL

--Fourth task
-- Create a query to return:
-- | Customer Id | Total number of Orders | % of all orders |
--SELECT O.CustomerID, COUNT(O.OrderID) AS [Total Number Of Orders], AS [% Of All Orders] FROM Orders O
-- SELECT COUNT(Orders.OrderID) FROM Orders == SELECT COUNT(*) FROM Orders
SELECT C.CustomerID, COUNT(O.OrderID) AS [Total Number Of Orders],  CAST ((COUNT(O.OrderId)*100) AS FLOAT)/(SELECT COUNT(*) FROM Orders) AS PercentOfAllOrders FROM  Customers C 
FULL OUTER JOIN Orders O 
ON O.CustomerID=C.CustomerID 
GROUP BY C.CustomerID
ORDER BY PercentOfAllOrders DESC