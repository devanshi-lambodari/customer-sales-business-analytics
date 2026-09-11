CREATE DATABASE business_analytics;
USE business_analytics;

-- =========================
-- CUSTOMERS
-- =========================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    age INT,
    segment VARCHAR(30)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'Mumbai', 24, 'Young Professional'),
(2, 'Priya Patel', 'Pune', 29, 'Young Professional'),
(3, 'Rahul Mehta', 'Delhi', 35, 'Professional'),
(4, 'Sneha Joshi', 'Bangalore', 42, 'Established'),
(5, 'Arjun Shah', 'Mumbai', 31, 'Professional'),
(6, 'Ananya Desai', 'Pune', 27, 'Young Professional'),
(7, 'Rohan Kapoor', 'Delhi', 39, 'Established'),
(8, 'Ishita Rao', 'Bangalore', 25, 'Young Professional'),
(9, 'Vikram Singh', 'Mumbai', 46, 'Established'),
(10, 'Neha Gupta', 'Pune', 34, 'Professional');

-- =========================
-- PRODUCTS
-- =========================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 65000),
(102, 'Smartphone', 'Electronics', 35000),
(103, 'Headphones', 'Electronics', 5000),
(104, 'Office Chair', 'Furniture', 12000),
(105, 'Desk', 'Furniture', 18000),
(106, 'Monitor', 'Electronics', 22000),
(107, 'Keyboard', 'Accessories', 3000),
(108, 'Mouse', 'Accessories', 1500);

-- =========================
-- ORDERS
-- =========================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001, 1, 101, '2026-01-05', 1),
(1002, 2, 102, '2026-01-08', 1),
(1003, 3, 103, '2026-01-12', 2),
(1004, 4, 104, '2026-01-15', 1),
(1005, 5, 101, '2026-01-20', 1),
(1006, 6, 107, '2026-01-23', 2),

(1007, 7, 106, '2026-02-03', 1),
(1008, 8, 102, '2026-02-07', 1),
(1009, 9, 105, '2026-02-10', 1),
(1010, 10, 103, '2026-02-14', 3),
(1011, 1, 106, '2026-02-18', 1),
(1012, 2, 108, '2026-02-21', 2),

(1013, 3, 101, '2026-03-02', 1),
(1014, 4, 102, '2026-03-06', 2),
(1015, 5, 104, '2026-03-10', 1),
(1016, 6, 103, '2026-03-15', 2),
(1017, 7, 101, '2026-03-18', 1),
(1018, 8, 107, '2026-03-22', 3),

(1019, 9, 106, '2026-04-03', 2),
(1020, 10, 102, '2026-04-07', 1),
(1021, 1, 103, '2026-04-11', 2),
(1022, 2, 105, '2026-04-15', 1),
(1023, 3, 106, '2026-04-20', 1),
(1024, 5, 102, '2026-04-25', 1);

USE business_analytics;

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

USE business_analytics;

-- calculating Total Revenue
SELECT 
    SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id;
    
-- calculating monthly Revenue
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * o.quantity) AS monthly_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

SELECT
    p.product_name,
    SUM(o.quantity) AS total_units_sold,
    SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- analyzing customer behavious over various segments
SELECT
    c.segment,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(o.order_id) AS total_orders,
    SUM(p.price * o.quantity) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.segment
ORDER BY total_revenue DESC;

-- high value customer
SELECT
    c.customer_name,
    c.segment,
    SUM(p.price * o.quantity) AS total_spent,
    CASE
        WHEN SUM(p.price * o.quantity) >= 100000 THEN 'High Value'
        WHEN SUM(p.price * o.quantity) >= 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY total_spent DESC;

-- city generating most revenue 
USE business_analytics;

SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(o.order_id) AS total_orders,
    SUM(p.price * o.quantity) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;


-- (PRACTICE) trying to find city with most revenue using CTE
USE business_analytics;

WITH city_revenue AS (
    SELECT
        c.city,
        SUM(p.price * o.quantity) AS total_revenue,
        COUNT(DISTINCT c.customer_id) AS total_customers,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.city
)

SELECT
    city,
    total_customers,
    total_orders,
    total_revenue
FROM city_revenue
ORDER BY total_revenue DESC;