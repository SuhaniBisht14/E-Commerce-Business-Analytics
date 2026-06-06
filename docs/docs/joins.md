# Olist E-Commerce Dataset - Table Relationships (Joins Documentation)

## 📌 Project Overview
This document explains the relationships between all tables in the Olist E-Commerce dataset used for the data analytics project.

---

## 🔗 1. Customers → Orders

- **Join Type:** One-to-Many  
- **Key:** customer_id  

### Relationship:
One customer can place multiple orders, but each order belongs to one customer.

```sql
customers.customer_id = orders.customer_id
. Orders → Order Items
Join Type: One-to-Many
Key: order_id
Relationship:

One order can contain multiple items.

orders.order_id = order_items.order_id
3. Order Items → Products
Join Type: Many-to-One
Key: product_id
Relationship:

Multiple order items can belong to one product.

order_items.product_id = products.product_id
4. Order Items → Sellers
Join Type: Many-to-One
Key: seller_id
Relationship:

Multiple order items can be handled by one seller.

order_items.seller_id = sellers.seller_id
5. Orders → Order Payments
Join Type: One-to-Many
Key: order_id
Relationship:

One order can have multiple payment records (installments or methods).

orders.order_id = order_payments.order_id
6. Orders → Order Reviews
Join Type: One-to-One / One-to-Many
Key: order_id
Relationship:

Each order can have one or more reviews.

orders.order_id = order_reviews.order_id
7. Products → Product Category Translation
Join Type: Many-to-One
Key: product_category_name
Relationship:

Products are mapped to English category names using translation table.

products.product_category_name = product_category_translation.product_category_name
