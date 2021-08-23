--SQL JOINS EXERCISE
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

 SELECT products.Name AS 'Product Name', categories.Name AS 'Category Name'
 FROM products
 LEFT JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE categories.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name AS 'Product Name', products.Price AS 'Price', reviews.Rating
 FROM products
 LEFT JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS 'Total Quantity Sold'
FROM sales
LEFT JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.FirstName, employees.LastName
ORDER BY 'Total Quantity Sold' DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
LEFT JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.CategoryID = 2 OR categories.CategoryID = 8;

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.name AS 'Product Name', SUM(sales.Quantity) AS 'Total Quantity Sold', SUM(sales.PricePerUnit) AS 'Total Price Sold'
FROM sales
LEFT JOIN products ON products.ProductID = sales.ProductID
GROUP BY products.name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating AS 'Lowest Rating', reviews.Comment
FROM products
INNER JOIN reviews ON reviews.ProductID = products.ProductID
WHERE reviews.ProductID = 857 AND reviews.Rating =1
GROUP BY products.Name, reviews.Reviewer, reviews.Rating, reviews.comment;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity) AS 'Total Quantity Sold'
FROM employees
LEFT JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName, products.Name
ORDER BY employees.EmployeeID;
