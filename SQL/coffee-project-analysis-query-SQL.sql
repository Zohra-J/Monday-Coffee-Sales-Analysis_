-- Activity 1: Data Loading:
-- How do you create the tables for customers, products, and sales in the database?
create Database CoffeeSales;
use CoffeeSales;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city_id INT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    price DECIMAL(10, 2)
);
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    quantity INT,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    rating INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
-- Activity 2: Data Cleaning & Preprocessing
-- ● How can you identify null values in your dataset?
-- ● How do you check for mismatches between total_amount and the calculated value of price × quantity?

SELECT 
    SUM(customer_id IS NULL) AS customer_id_nulls,
    SUM(customer_name IS NULL) AS customer_name_nulls,
    SUM(city_id IS NULL) AS city_id_nulls
FROM Customers;

SELECT 
    SUM(sale_id IS NULL) AS sale_id_nulls,
    SUM(sale_date IS NULL) AS sale_date_nulls,
    SUM(product_id IS NULL) AS product_id_nulls,
    SUM(quantity IS NULL) AS quantity_nulls,
    SUM(customer_id IS NULL) AS customer_id_nulls,
    SUM(total_amount IS NULL) AS total_amount_nulls,
    SUM(rating IS NULL) AS rating_nulls
FROM Sales;

SELECT 
    SUM(product_id IS NULL) AS product_id_nulls,
    SUM(product_name IS NULL) AS product_name_nulls,
    SUM(price IS NULL) AS price_nulls
FROM Products;
-- No null value found in all three tables.

-- How can you check for duplicate entries in the customers table?

SELECT customer_id, COUNT(*) AS count
FROM Customers
GROUP BY customer_id
HAVING COUNT(*) > 1; 
-- No duplicates found. 

 
-- ● How do you check for mismatches between total_amount and the calculated value of price × quantity?
 
 SELECT s.sale_id, s.product_id, s.quantity, p.price, 
       s.total_amount, (p.price * s.quantity) AS expected_total
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
WHERE s.total_amount != (p.price * s.quantity)
Order by product_id Asc;

-- product id 2,3,4,7,10,14(saleid 2250), 14(saleid 5972),15,24 having mismatches.  


-- Activity 3: Data Transformation & Integration
-- ● How do you create a comprehensive sales report with customer and product details?
Select s.sale_id, s.sale_date, s.product_id, s.quantity, s.customer_id, s.total_amount, s.rating,
     p.product_name, p.price,
     c.customer_name, c.city_id,
     (p.price * s.quantity) as calculated_total
From sales s
Left join products p on s.product_id = p.product_id
Left join customers c on s.customer_id = c.customer_id;

-- Activity 4: Data Analysis & Aggregation
-- (a) What are the total sales per city?

select c.city_id, SUM(s.total_amount) as total_sales
FROM customers c
join sales s on c.customer_id = s.customer_id
group by c.city_id
order by total_sales Asc;

-- (b) How many total transactions occurred per city?
SELECT c.city_id, COUNT(s.sale_id) AS total_transactions
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city_id
ORDER BY total_transactions DESC;


-- (c) How many unique customers are there in each city?
select city_id, count(distinct customer_id) as unique_customers
from customers 
group by city_id
order by unique_customers desc;

-- (d) What is the average order value per city?
select c.city_id, Avg(s.total_amount) as Avg_OrderValue
from customers c
join sales s on c.customer_id= s.customer_id
group by c.city_id
Order by Avg_OrderValue desc;

-- (e) What is the demand for each product in different cities?

select c.city_id, p.product_name, sum(s.quantity) as total_quantity
from sales s
join customers c ON s.customer_id = c.customer_id
join  products p ON s.product_id = p.product_id
group by p.product_name, c.city_id 
order by c.city_id, total_quantity desc;


-- (f) What is the monthly sales trend?

SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month, SUM(s.total_amount) AS monthly_sales
FROM sales s
GROUP BY sale_month
ORDER BY sale_month;

-- (g) What is the average product rating per city based on customer purchases?

select c.city_id, Round(AVG(s.rating), 2) as Avg_ProductRating 
from sales s
join customers c on s.customer_id = c.customer_id
group by c.city_id;


-- Activity 5: Decision-Making & Recommendations
-- (a) How do you identify the top 3 cities based on sales, unique customers, and order count?

SELECT c.city_id,
    ROUND(SUM(s.total_amount), 2) AS total_sales,
    COUNT(DISTINCT s.customer_id) AS unique_customers,
    COUNT(s.sale_id) AS total_orders
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city_id
ORDER BY total_sales DESC, unique_customers DESC, total_orders DESC
LIMIT 3;










-- (b) What are the final recommendations for expanding Monday Coffee shops?








select *
from products;
select *
from customers;
select *
from sales;























