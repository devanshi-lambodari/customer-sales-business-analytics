# Customer & Sales Business Analytics

## 📌 Project Overview

This project analyzes customer, product, and transactional sales data using **MySQL and SQL** to generate business insights around revenue performance, customer behavior, product performance, customer segmentation, and geographic trends.

The project demonstrates how SQL can be used to transform transactional data into meaningful **business KPIs and actionable insights** that support data-driven decision making.

---

## 🎯 Business Objectives

The analysis focuses on:

* Measuring overall and monthly revenue performance
* Identifying top-performing products
* Understanding customer purchasing behavior
* Comparing revenue across customer segments
* Identifying high-value customers
* Analyzing city-level sales performance
* Supporting customer targeting and business decision making

---

## 🗃️ Database Structure

The project uses three relational tables:

### 1. Customers

| Column          | Description                |
| --------------- | -------------------------- |
| `customer_id`   | Unique customer identifier |
| `customer_name` | Customer name              |
| `city`          | Customer city              |
| `age`           | Customer age               |
| `segment`       | Customer segment           |

### 2. Products

| Column         | Description               |
| -------------- | ------------------------- |
| `product_id`   | Unique product identifier |
| `product_name` | Product name              |
| `category`     | Product category          |
| `price`        | Product price             |

### 3. Orders

| Column        | Description             |
| ------------- | ----------------------- |
| `order_id`    | Unique order identifier |
| `customer_id` | Customer reference      |
| `product_id`  | Product reference       |
| `order_date`  | Date of order           |
| `quantity`    | Quantity purchased      |

### Relationship

```text
Customers
    │
    │ customer_id
    ▼
 Orders
    ▲
    │ product_id
    │
 Products
```

---

## 🛠️ SQL Concepts Used

The project demonstrates:

* `SELECT`
* `JOIN`
* `GROUP BY`
* `ORDER BY`
* Aggregate functions such as `SUM()` and `COUNT()`
* `CASE WHEN`
* `COUNT(DISTINCT)`
* Common Table Expressions (CTEs)
* Date-based analysis using `DATE_FORMAT()`
* Revenue and KPI calculations
* Customer segmentation
* Multi-table relational analysis

---

## 📊 Business Analysis

### 1. Overall Revenue

Calculated total revenue generated across all transactions using product prices and order quantities.

### 2. Monthly Revenue Analysis

Analyzed revenue across January–April 2026.

| Month    |  Revenue |
| -------- | -------: |
| January  | ₹193,000 |
| February | ₹115,000 |
| March    | ₹231,000 |
| April    | ₹164,000 |

**Insight:** March generated the highest monthly revenue at **₹231,000**, while February recorded the lowest at **₹115,000**.

---

### 3. Product Performance

Analyzed product-level sales volume and revenue.

| Product    | Units Sold |  Revenue |
| ---------- | ---------: | -------: |
| Laptop     |          4 | ₹260,000 |
| Smartphone |          6 | ₹210,000 |
| Monitor    |          5 | ₹110,000 |
| Headphones |          9 |  ₹45,000 |
| Desk       |          2 |  ₹36,000 |

**Insight:** Laptops generated the highest revenue, while headphones had higher sales volume but significantly lower revenue, demonstrating the difference between **unit volume and revenue contribution**.

---

### 4. Customer Segment Analysis

Compared revenue and order activity across customer segments.

| Segment            | Customers | Orders |  Revenue |
| ------------------ | --------: | -----: | -------: |
| Professional       |         3 |      8 | ₹259,000 |
| Established        |         3 |      6 | ₹231,000 |
| Young Professional |         4 |     10 | ₹213,000 |

**Insight:** The Professional segment generated the highest revenue despite having fewer customers than the Young Professional segment.

The Young Professional segment generated the highest number of orders, indicating stronger transaction frequency but lower revenue per customer.

---

### 5. High-Value Customer Analysis

Customers were segmented based on total spending:

* **High Value:** ₹100,000+
* **Medium Value:** ₹50,000–₹99,999
* **Low Value:** Below ₹50,000

The highest-value customer was **Arjun Shah**, with total spending of **₹112,000**.

This analysis can support **customer targeting, prioritization, and personalized business strategies**.

---

### 6. City-Level Revenue Analysis

| City      | Customers | Orders |  Revenue |
| --------- | --------: | -----: | -------: |
| Mumbai    |         3 |      8 | ₹271,000 |
| Delhi     |         2 |      4 | ₹184,000 |
| Bangalore |         2 |      4 | ₹126,000 |
| Pune      |         3 |      8 | ₹122,000 |

**Insight:** Mumbai generated the highest revenue at **₹271,000**.

Interestingly, Mumbai and Pune had the same number of customers and orders, but Mumbai generated substantially higher revenue. This indicates differences in **purchase value and product mix** across locations.

---

## 💡 Key Business Insights

1. **Mumbai** was the strongest-performing city by revenue.
2. **Professional customers** generated the highest revenue among customer segments.
3. **Young Professionals** generated the highest number of orders but not the highest revenue.
4. **Laptops** were the highest-revenue product.
5. High-volume products do not necessarily generate the highest revenue.
6. **March** was the strongest month by revenue.
7. Customer value segmentation can help identify customers for targeted strategies.
8. Differences in revenue between cities with similar order volumes suggest opportunities to analyze **product mix and customer spending behavior**.

---

## 📁 Project Structure

```text
customer-sales-business-analytics/
│
├── README.md
│
└── sql/
    └── business_analytics.sql
```

---

## ▶️ How to Run

### 1. Install MySQL

Install and open **MySQL Workbench** or another MySQL client.

### 2. Open the SQL script

Navigate to:

```text
sql/business_analytics.sql
```

### 3. Execute the script

Run the SQL script to:

* Create the `business_analytics` database
* Create the required tables
* Insert sample customer, product, and order data
* Execute business analysis queries

### 4. Explore the results

The queries can be modified to perform additional analysis such as:

* Customer purchase frequency
* Average order value
* Product category performance
* Revenue contribution by segment
* Additional geographic analysis

---

## 🧰 Tools & Technologies

* **MySQL**
* **SQL**
* **MySQL Workbench**

---

## 📌 Project Purpose

This project was developed to strengthen practical SQL and business analytics skills by working with relational data and converting transactional information into **business-focused insights and recommendations**.
