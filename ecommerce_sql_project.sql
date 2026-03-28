-- ecommerce sales analysis
-- mysql portfolio project
-- built to practice real business SQL patterns


-- ============================================================
--  SECTION 1: SCHEMA SETUP
-- ============================================================

DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


CREATE TABLE categories (
    category_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id   INT            PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(150)   NOT NULL,
    price        DECIMAL(10,2)  NOT NULL,
    category_id  INT            NOT NULL,
    stock        INT            DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(100) NOT NULL,
    email        VARCHAR(150) UNIQUE NOT NULL,
    city         VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id     INT           PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT           NOT NULL,
    order_date   DATE          NOT NULL,
    status       ENUM('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id     INT            PRIMARY KEY AUTO_INCREMENT,
    order_id    INT            NOT NULL,
    product_id  INT            NOT NULL,
    quantity    INT            NOT NULL,
    unit_price  DECIMAL(10,2)  NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ============================================================
--  SECTION 2: SAMPLE DATA
-- ============================================================

INSERT INTO categories (name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports & Outdoors'),
('Beauty & Personal Care'),
('Toys & Games');


INSERT INTO products (name, price, category_id, stock) VALUES
('Wireless Bluetooth Headphones',  2999.00, 1, 120),
('Smartphone Stand',                499.00, 1,  85),
('4K Smart TV 43"',               24999.00, 1,  30),
('Laptop Cooling Pad',             1199.00, 1,  60),
('Noise Cancelling Earbuds',       3499.00, 1,  75),
('Men\'s Running Shoes',           2499.00, 2, 200),
('Women\'s Kurta Set',             1299.00, 2, 150),
('Cotton T-Shirt Pack (3)',         799.00, 2, 300),
('Denim Jacket',                   2199.00, 2,  90),
('Yoga Pants',                     1099.00, 2, 175),
('Atomic Habits',                   499.00, 3, 500),
('Rich Dad Poor Dad',               399.00, 3, 450),
('The Alchemist',                   299.00, 3, 600),
('SQL for Beginners',               699.00, 3, 250),
('Clean Code',                      799.00, 3, 180),
('Non-Stick Cookware Set',         3499.00, 4,  50),
('Air Fryer 4L',                   4999.00, 4,  40),
('Stainless Steel Water Bottle',    699.00, 4, 300),
('Electric Kettle 1.5L',           1299.00, 4,  95),
('Bamboo Cutting Board',            599.00, 4, 200),
('Cricket Bat - Kashmir Willow',   1999.00, 5,  80),
('Badminton Racket Set',           1499.00, 5, 120),
('Yoga Mat Premium',               1299.00, 5, 200),
('Football Size 5',                 899.00, 5, 150),
('Cycling Gloves',                  599.00, 5, 100),
('Face Moisturizer SPF50',          999.00, 6, 200),
('Hair Serum 100ml',                799.00, 6, 250),
('Lip Balm Set (5 pcs)',            399.00, 6, 400),
('Electric Toothbrush',            1999.00, 6,  70),
('Vitamin C Serum 30ml',           1299.00, 6, 160),
('LEGO Classic Bricks Set',        2999.00, 7,  60),
('Remote Control Car',             1799.00, 7,  80),
('Board Game - Catan',             2499.00, 7,  45),
('Stuffed Animal Bundle',           999.00, 7, 120),
('Puzzle 1000 Pieces',              799.00, 7, 130);


INSERT INTO customers (name, email, city) VALUES
('Aarav Sharma',      'aarav.sharma@email.com',    'Mumbai'),
('Priya Patel',       'priya.patel@email.com',     'Ahmedabad'),
('Rohan Mehta',       'rohan.mehta@email.com',     'Delhi'),
('Sneha Iyer',        'sneha.iyer@email.com',      'Bangalore'),
('Karthik Nair',      'karthik.nair@email.com',    'Chennai'),
('Ananya Reddy',      'ananya.reddy@email.com',    'Hyderabad'),
('Vikram Singh',      'vikram.singh@email.com',    'Delhi'),
('Divya Krishnan',    'divya.krishnan@email.com',  'Bangalore'),
('Arjun Bose',        'arjun.bose@email.com',      'Kolkata'),
('Meera Joshi',       'meera.joshi@email.com',     'Pune'),
('Siddharth Gupta',   'siddharth.gupta@email.com', 'Mumbai'),
('Pooja Verma',       'pooja.verma@email.com',     'Lucknow'),
('Nikhil Desai',      'nikhil.desai@email.com',    'Surat'),
('Ishita Malhotra',   'ishita.malhotra@email.com', 'Delhi'),
('Rahul Kapoor',      'rahul.kapoor@email.com',    'Chandigarh'),
('Aishwarya Nambiar', 'aishwarya.n@email.com',     'Kochi'),
('Tejas Kulkarni',    'tejas.kulkarni@email.com',  'Pune'),
('Kavya Pillai',      'kavya.pillai@email.com',    'Bangalore'),
('Harsh Agarwal',     'harsh.agarwal@email.com',   'Jaipur'),
('Ritu Chauhan',      'ritu.chauhan@email.com',    'Noida'),
('Abhishek Tiwari',   'abhishek.t@email.com',      'Bhopal'),
('Shweta Pandey',     'shweta.pandey@email.com',   'Varanasi'),
('Manish Srivastava', 'manish.s@email.com',        'Lucknow'),
('Deepika Rao',       'deepika.rao@email.com',     'Hyderabad'),
('Varun Khanna',      'varun.khanna@email.com',    'Mumbai');


INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1,  '2024-01-05', 'Delivered',  4298.00),
(2,  '2024-01-12', 'Delivered',  2998.00),
(3,  '2024-01-18', 'Delivered',  7498.00),
(4,  '2024-01-25', 'Delivered',  1599.00),
(5,  '2024-02-02', 'Delivered',  5498.00),
(6,  '2024-02-10', 'Delivered',  3299.00),
(7,  '2024-02-15', 'Delivered',  2499.00),
(8,  '2024-02-20', 'Shipped',    9998.00),
(9,  '2024-02-28', 'Delivered',  1898.00),
(10, '2024-03-05', 'Delivered',  4199.00),
(1,  '2024-03-12', 'Delivered',  3499.00),
(11, '2024-03-18', 'Delivered',  6998.00),
(12, '2024-03-22', 'Cancelled',  2999.00),
(3,  '2024-03-28', 'Delivered',  5697.00),
(13, '2024-04-02', 'Delivered',  1798.00),
(4,  '2024-04-08', 'Delivered',  3498.00),
(14, '2024-04-14', 'Delivered',  4997.00),
(15, '2024-04-19', 'Cancelled',  1299.00),
(5,  '2024-04-25', 'Delivered',  8998.00),
(16, '2024-04-30', 'Delivered',  2598.00),
(6,  '2024-05-06', 'Delivered',  4498.00),
(17, '2024-05-11', 'Delivered',  3298.00),
(7,  '2024-05-17', 'Delivered',  5698.00),
(18, '2024-05-22', 'Delivered',  1897.00),
(8,  '2024-05-28', 'Delivered',  7496.00),
(9,  '2024-06-03', 'Delivered',  2797.00),
(10, '2024-06-08', 'Delivered',  3497.00),
(19, '2024-06-14', 'Cancelled',  4996.00),
(11, '2024-06-20', 'Delivered',  8497.00),
(2,  '2024-06-25', 'Delivered',  5997.00),
(20, '2024-07-01', 'Delivered',  2299.00),
(3,  '2024-07-08', 'Delivered',  9497.00),
(12, '2024-07-13', 'Delivered',  3996.00),
(21, '2024-07-18', 'Delivered',  1498.00),
(13, '2024-07-24', 'Delivered',  4496.00),
(4,  '2024-07-29', 'Delivered',  2597.00),
(22, '2024-08-04', 'Delivered',  6495.00),
(14, '2024-08-10', 'Delivered',  3994.00),
(5,  '2024-08-16', 'Delivered', 11994.00),
(23, '2024-08-21', 'Delivered',  2993.00),
(15, '2024-08-26', 'Delivered',  4991.00),
(24, '2024-09-01', 'Delivered',  7489.00),
(16, '2024-09-07', 'Delivered',  3488.00),
(6,  '2024-09-12', 'Delivered',  5987.00),
(25, '2024-09-18', 'Delivered',  2986.00),
(17, '2024-09-24', 'Delivered',  4985.00),
(7,  '2024-09-29', 'Delivered',  8983.00),
(18, '2024-10-05', 'Delivered',  1982.00),
(8,  '2024-10-11', 'Shipped',   13980.00),
(19, '2024-10-16', 'Delivered',  3979.00),
(9,  '2024-10-22', 'Delivered',  5977.00),
(20, '2024-10-27', 'Delivered',  2476.00),
(10, '2024-11-02', 'Delivered',  4474.00),
(11, '2024-11-07', 'Delivered',  9472.00),
(21, '2024-11-12', 'Delivered',  1971.00),
(1,  '2024-11-18', 'Delivered',  7469.00),
(22, '2024-11-23', 'Delivered',  4967.00),
(2,  '2024-11-29', 'Delivered',  5965.00),
(23, '2024-12-05', 'Delivered',  2964.00),
(3,  '2024-12-10', 'Delivered', 12960.00),
(24, '2024-12-15', 'Delivered',  4458.00),
(25, '2024-12-20', 'Delivered',  6956.00),
(4,  '2024-12-25', 'Delivered',  3454.00),
(5,  '2024-12-30', 'Delivered',  8952.00);


INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,  1, 1, 2999.00), (1,  8, 1,  799.00),
(2,  3, 0, 2999.00), (2,  7, 0,   -1.00),
(3,  3, 1,24999.00), (3, 11, 5,  499.00),
(4,  8, 2,  799.00),
(5,  1, 1, 2999.00), (5,  5, 1, 3499.00),
(6,  6, 1, 2499.00), (6, 27, 1,  799.00),
(7,  6, 1, 2499.00),
(8, 17, 2, 4999.00),
(9, 24, 2,  899.00), (9, 28, 1,  399.00),
(10,16, 1, 3499.00), (10,20, 1,  599.00),
(11, 5, 1, 3499.00),
(12, 3, 1,24999.00), (12,11, 5,  499.00),
(13,31, 1, 2999.00),
(14, 4, 2, 1199.00), (14, 6, 1, 2499.00), (14,11, 3,  499.00),
(15,32, 1, 1799.00),
(16,10, 2, 1099.00), (16,26, 1,  999.00), (16,29, 1, 1999.00),
(17,17, 1, 4999.00),
(18,14, 1,  699.00),
(20, 7, 2, 1299.00),
(21, 5, 1, 3499.00), (21,22, 1, 1499.00),
(22, 9, 1, 2199.00), (22,23, 1, 1299.00),
(23, 1, 1, 2999.00), (23,16, 1, 3499.00), (23,13, 3,  299.00),
(24,21, 1, 1999.00),
(25,17, 1, 4999.00), (25, 3, 1,24999.00),
(26,22, 1, 1499.00), (26,24, 2,  899.00),
(27,10, 2, 1099.00), (27,30, 1, 1299.00),
(28, 1, 1, 2999.00), (28,16, 1, 3499.00),
(29, 3, 1,24999.00), (29,11, 5,  499.00),
(30, 1, 1, 2999.00), (30, 5, 1, 3499.00),
(31, 9, 1, 2199.00),
(32, 3, 1,24999.00), (32,11, 5,  499.00), (32,17, 1, 4999.00),
(33,31, 1, 2999.00), (33,22, 1, 1499.00),
(34,21, 1, 1999.00),
(35,17, 1, 4999.00),
(36, 7, 2, 1299.00),
(37, 3, 1,24999.00), (37,26, 1,  999.00), (37,29, 1, 1999.00),
(38, 1, 1, 2999.00), (38, 5, 1, 3499.00),
(39, 3, 2,24999.00), (39,17, 1, 4999.00),
(40, 6, 1, 2499.00), (40,29, 1, 1999.00),
(41, 1, 1, 2999.00), (41,16, 1, 3499.00), (41,26, 1,  999.00),
(42,17, 1, 4999.00), (42, 3, 1,24999.00),
(43, 5, 1, 3499.00),
(44, 1, 1, 2999.00), (44, 5, 1, 3499.00),
(45, 6, 1, 2499.00), (45,29, 1, 1999.00),
(46, 1, 1, 2999.00), (46,16, 1, 3499.00),
(47, 3, 1,24999.00), (47,11, 5,  499.00),
(48,21, 1, 1999.00),
(49, 3, 2,24999.00), (49,17, 1, 4999.00), (49, 1, 2, 2999.00),
(50, 1, 1, 2999.00), (50,16, 1, 3499.00), (50,26, 1,  999.00),
(51, 9, 1, 2199.00), (51,22, 1, 1499.00), (51,23, 1, 1299.00),
(52,23, 1, 1299.00), (52,10, 2, 1099.00),
(53, 1, 1, 2999.00), (53,16, 1, 3499.00), (53, 5, 1, 3499.00),
(54,31, 1, 2999.00),
(55, 1, 1, 2999.00), (55, 5, 1, 3499.00), (55,17, 1, 4999.00),
(56, 5, 1, 3499.00), (56,22, 1, 1499.00), (56,24, 2,  899.00),
(57, 1, 1, 2999.00), (57, 5, 1, 3499.00),
(58, 6, 1, 2499.00), (58,29, 1, 1999.00),
(59, 3, 1,24999.00), (59,17, 1, 4999.00), (59, 1, 2, 2999.00),
(60, 1, 1, 2999.00), (60,16, 1, 3499.00), (60,29, 1,  999.00),
(61, 1, 1, 2999.00), (61,16, 1, 3499.00), (61, 5, 1, 3499.00),
(62, 3, 2,24999.00), (62,17, 1, 4999.00), (62,11, 3,  499.00),
(63, 1, 1, 2999.00), (63, 5, 1, 3499.00);


-- ============================================================
--  SECTION 3: BUSINESS QUESTIONS
-- ============================================================


-- Q1: all customers from a specific city
SELECT
    customer_id,
    name,
    email,
    city
FROM customers
WHERE city = 'Bangalore'
ORDER BY name;


-- Q2: orders placed in 2024
SELECT
    o.order_id,
    c.name       AS customer_name,
    o.order_date,
    o.status,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) = 2024
ORDER BY o.order_date;


-- Q3: top 5 most expensive products
SELECT
    p.product_id,
    p.name       AS product_name,
    cat.name     AS category,
    p.price
FROM products p
JOIN categories cat ON p.category_id = cat.category_id
ORDER BY p.price DESC
LIMIT 5;


-- Q4: total revenue per category (excluding cancelled orders)
SELECT
    cat.name                         AS category,
    COUNT(DISTINCT oi.order_id)      AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products   p   ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
JOIN orders     o   ON oi.order_id   = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY cat.category_id, cat.name
ORDER BY total_revenue DESC;


-- Q5: customers who placed more than 3 orders
SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id)   AS order_count,
    SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
HAVING COUNT(o.order_id) > 3
ORDER BY order_count DESC;


-- Q6: monthly revenue trend for 2024
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    MONTHNAME(o.order_date)            AS month_name,
    COUNT(o.order_id)                  AS total_orders,
    SUM(o.total_amount)                AS monthly_revenue
FROM orders o
WHERE YEAR(o.order_date) = 2024
  AND o.status != 'Cancelled'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m'), MONTHNAME(o.order_date)
ORDER BY month;


-- Q7: top 10 customers by total spending
SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id)             AS orders_placed,
    SUM(o.total_amount)           AS total_spent,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC
LIMIT 10;


-- Q8: products that have never been ordered
-- using NOT IN here; LEFT JOIN + IS NULL works too
SELECT
    p.product_id,
    p.name       AS product_name,
    cat.name     AS category,
    p.price,
    p.stock
FROM products p
JOIN categories cat ON p.category_id = cat.category_id
WHERE p.product_id NOT IN (
    SELECT DISTINCT product_id FROM order_items
)
ORDER BY cat.name, p.name;


-- Q9: average order value by city
SELECT
    c.city,
    COUNT(o.order_id)             AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.city
ORDER BY avg_order_value DESC;


-- Q10: revenue share by category
SELECT
    cat.name                                AS category,
    COUNT(DISTINCT p.product_id)            AS products_in_category,
    SUM(oi.quantity)                        AS units_sold,
    SUM(oi.quantity * oi.unit_price)        AS gross_revenue,
    ROUND(
        SUM(oi.quantity * oi.unit_price) * 100.0
        / (
            SELECT SUM(oi2.quantity * oi2.unit_price)
            FROM order_items oi2
            JOIN orders o2 ON oi2.order_id = o2.order_id
            WHERE o2.status != 'Cancelled'
        ),
    2)                                      AS revenue_share_pct
FROM order_items oi
JOIN orders     o   ON oi.order_id   = o.order_id
JOIN products   p   ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
WHERE o.status != 'Cancelled'
GROUP BY cat.category_id, cat.name
ORDER BY gross_revenue DESC;


-- Q11: returning customers (ordered more than once)
SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id)  AS total_orders,
    MIN(o.order_date)  AS first_order,
    MAX(o.order_date)  AS last_order,
    DATEDIFF(MAX(o.order_date), MIN(o.order_date)) AS days_as_customer
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;


-- Q12: cancelled orders and how much revenue was lost
SELECT
    o.order_id,
    c.name         AS customer_name,
    c.city,
    o.order_date,
    o.total_amount AS revenue_lost,
    GROUP_CONCAT(p.name SEPARATOR ', ') AS cancelled_products
FROM orders o
JOIN customers   c  ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products    p  ON oi.product_id = p.product_id
WHERE o.status = 'Cancelled'
GROUP BY o.order_id, c.name, c.city, o.order_date, o.total_amount
ORDER BY o.total_amount DESC;

-- quick summary of total cancellation loss
SELECT
    COUNT(*)                    AS cancelled_orders,
    SUM(total_amount)           AS total_revenue_lost,
    ROUND(AVG(total_amount), 2) AS avg_order_lost
FROM orders
WHERE status = 'Cancelled';


-- Q13: best-selling product in each category
WITH product_sales AS (
    SELECT
        p.category_id,
        p.product_id,
        p.name                           AS product_name,
        SUM(oi.quantity)                 AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders   o ON oi.order_id   = o.order_id
    WHERE o.status != 'Cancelled'
    GROUP BY p.category_id, p.product_id, p.name
),
ranked AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY category_id ORDER BY units_sold DESC) AS rnk
    FROM product_sales
)
SELECT
    cat.name       AS category,
    r.product_name AS best_selling_product,
    r.units_sold,
    r.revenue
FROM ranked r
JOIN categories cat ON r.category_id = cat.category_id
WHERE r.rnk = 1
ORDER BY cat.name;


-- Q14: segment customers into high / mid / low value
-- high = lifetime spend > 5000, mid = 2000-5000, low = below 2000
SELECT
    c.name,
    c.city,
    COALESCE(SUM(o.total_amount), 0) AS lifetime_value,
    CASE
        WHEN COALESCE(SUM(o.total_amount), 0) > 5000  THEN 'High Value'
        WHEN COALESCE(SUM(o.total_amount), 0) >= 2000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
   AND o.status != 'Cancelled'
GROUP BY c.customer_id, c.name, c.city
ORDER BY lifetime_value DESC;

-- segment summary
SELECT
    customer_segment,
    COUNT(*)                      AS customer_count,
    ROUND(AVG(lifetime_value), 2) AS avg_ltv
FROM (
    SELECT
        COALESCE(SUM(o.total_amount), 0) AS lifetime_value,
        CASE
            WHEN COALESCE(SUM(o.total_amount), 0) > 5000  THEN 'High Value'
            WHEN COALESCE(SUM(o.total_amount), 0) >= 2000 THEN 'Mid Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
       AND o.status != 'Cancelled'
    GROUP BY c.customer_id
) seg
GROUP BY customer_segment
ORDER BY FIELD(customer_segment, 'High Value', 'Mid Value', 'Low Value');


-- Q15: running total of monthly revenue + month-over-month growth %
-- using window functions here
SELECT
    month,
    month_name,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    ROUND(
        (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month))
        * 100.0
        / NULLIF(LAG(monthly_revenue) OVER (ORDER BY month), 0),
    2) AS mom_growth_pct
FROM (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        MONTHNAME(order_date)            AS month_name,
        SUM(total_amount)                AS monthly_revenue
    FROM orders
    WHERE YEAR(order_date) = 2024
      AND status != 'Cancelled'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m'), MONTHNAME(order_date)
) monthly
ORDER BY month;
