-- First task
-- Create a SQL query to return next data ordered by city and then by name
-- |Employy Id | Employee Full Name | Title | City |
-- [Employee Full Name] - First Name and Last Name.
SELECT E.EmployeeID, E.FirstName, E.LastName, E.Title, E.City FROM Employees E ORDER BY E.City
SELECT E.EmployeeID, E.FirstName, E.LastName, E.Title, E.City FROM Employees E ORDER BY E.FirstName