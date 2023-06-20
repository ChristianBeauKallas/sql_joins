
/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */

SELECT p.Name, c.Name FROM products AS p JOIN categories as c ON c.CategoryID = p.CategoryID WHERE c.Name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT p.Name, p.Price, r.Rating FROM products AS p JOIN reviews as r ON p.ProductID = r.ProductID WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT CONCAT(e.FirstName, " ", e.LastName) as Employee, SUM(s.Quantity) as UnitsSold FROM employees as e JOIN sales as s ON e.EmployeeID = s.EmployeeID GROUP BY e.EmployeeID ORDER BY UnitsSold DESC LIMIT 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.Name as Department, c.Name as Category FROM departments as d JOIN categories as c ON c.DepartmentID = d.DepartmentID WHERE c.Name = "Appliances" or c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT p.Name as product, SUM(s.Quantity) as numberSold, SUM(s.PricePerUnit) AS TotalPrice FROM products as p JOIN sales as s ON p.ProductID = s.ProductID WHERE p.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name as Product, r.Reviewer, r.Rating, r.Comment FROM products as p JOIN reviews as r ON p.ProductID = r.ProductID WHERE p.Name LIKE "Vis%" LIMIT 1;


-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT e.EmployeeID, CONCAT(e.FirstName," ", e.LastName) as Name, SUM(s.Quantity) as Total_Sold FROM employees as e JOIN sales as s ON e.EmployeeID = s.EmployeeID JOIN products as p ON s.ProductID = p.ProductID GROUP BY e.EmployeeID;
