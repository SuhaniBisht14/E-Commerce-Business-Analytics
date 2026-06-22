-- 1. Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

-- 3. Total Sellers
SELECT COUNT(DISTINCT seller_id) AS total_sellers
FROM sellers;

-- 4. Total Products
SELECT COUNT(DISTINCT product_id) AS total_products
FROM products;

-- 5. Total Revenue
SELECT SUM(order_total) AS total_revenue
FROM (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
) t;

-- 6. Average Order Value
SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
) t;

-- 7. Highest Payment
SELECT MAX(payment_value) AS highest_payment
FROM order_payments;

-- 8. Lowest Payment
SELECT MIN(payment_value) AS lowest_payment
FROM order_payments;

-- 9. Delivered Orders
SELECT COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'delivered';

-- 10. Cancelled Orders
SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'canceled';

-- 11. Orders by Status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- 12. Average Review Score
SELECT AVG(review_score) AS avg_review_score
FROM order_reviews;

-- 13. Payment Type Distribution
SELECT payment_type, COUNT(*) AS total_payments
FROM order_payments
GROUP BY payment_type;

-- 14. Top 10 Sellers by Orders
SELECT TOP 10 seller_id, COUNT(*) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC;

-- 15. Top 10 Products by Sales
SELECT TOP 10 product_id,
       COUNT(order_id) AS total_sales,
       SUM(price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC;

-- 16. Average Freight Value
SELECT AVG(freight_value) AS avg_freight
FROM order_items;

-- 17. Total Order Items
SELECT COUNT(*) AS total_order_items
FROM order_items;

-- 18. Customers per State
SELECT customer_state, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state;

-- 19. Sellers per State
SELECT seller_state, COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state;

-- 20. Revenue by Payment Type
SELECT payment_type, SUM(payment_value) AS total_revenue
FROM order_payments
GROUP BY payment_type;
