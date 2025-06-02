USE northwind;
-- What is the name of the table that holds the items Northwind sells?
SELECT * FROM Products;

-- Write a query to list the product id, product name, and unit price of every product.
SELECT ProductID, ProductName, UnitPrice FROM Products;

-- Write a query to list the product id, product name, and unit price of every product, ordered in ascending order by price.

-- What are the products that we carry where the unit price is $7.50 or less?

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price.

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price, and if two or more have the same price, list those in ascending order by product name.

-- What are the products that we carry where we have no units on hand, but 1 or more units on backorder? Order them by product name.

-- What is the name of the table that holds the types (categories) of the items Northwind sells?

-- Write a query that lists all of the columns and all of the rows of the categories table. What is the category id of seafood?

-- Examine the Products table. How does it identify the type (category) of each item sold? Write a query to list all of the seafood items we carry.

-- What are the first and last names of all of the Northwind employees?

-- What employees have “manager” in their titles?

-- List the distinct job titles in employees.

-- What employees have a salary that is between $2000 and $2500?

-- List all of the information about all of Northwind’s suppliers.

-- Examine the Products table. How do you know what supplier supplies each product? Write a query to list all of the items that “Tokyo Traders” supplies to Northwind.
