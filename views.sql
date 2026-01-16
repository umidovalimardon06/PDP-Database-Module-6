CREATE TABLE customers (
    customer_id INT PRIMARY KEY ,
    full_name VARCHAR(100) ,
    email VARCHAR(200),
    city VARCHAR(100) ,
    created_at DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY ,
    sku VARCHAR(30) ,
    product_name VARCHAR(200) ,
    category VARCHAR(200) ,
    unit_price DECIMAL(10,2) ,
    is_active BOOLEAN
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY ,
    customer_id INT ,
    order_date DATE ,
    status varchar(20) ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
    order_id INT ,
    product_id INT ,
    quantity INT,
    unit_price DECIMAL(10,2) ,
    PRIMARY KEY (order_id,product_id) ,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- INSERTION
INSERT INTO customers(customer_id, full_name, email, city, created_at)
VALUES
    (1,'Botirov Amirbek','botirov2000@gmail.com','Tashkent','2024-10-01'::date),
    (2,'Gulamov Shuxratjon','shuxratsila@gmail.com','Tashkent','2020-09-21' ),
    (3,'Karimov Furqatjon','furqatbey@gmail.com','Samarqand','2000-06-19'::date)
;

INSERT INTO products VALUES
    (10,'SKU-COF-001','Coffee Beans 1kg','Grocery',12.50,true),
    (11,'SKU-TEA-001','Green Tea 200g','Grocery',6.20,true),
    (12,'SKU-MUG-001','Ceramic Mug','Home',8.90,true),
    (13,'SKU-MUG-002','Thermal Mug','Home',18.00,false)
;

INSERT INTO orders VALUES
    (100,1,'2025-10-01','SHIPPED'),
    (101,1,'2025-10-12','CANCELLED'),
    (102,2,'2025-11-02','PLACED'),
    (103,3,'2025-11-05','SHIPPED')
;

INSERT INTO order_items VALUES
                            (100,10,2,12.50),
                            (100,12,1,8.90),
                            (101,11,3,6.20),
                            (102,10,1,12.50),
                            (102,11,2,6.20),
                            (103,12,2,8.90)
;

-- QUERYING
SELECT
    o.order_id,
    o.order_date,
    o.status,
    c.customer_id,
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
         JOIN customers c ON c.customer_id = o.customer_id
         JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY
    o.order_id, o.order_date, o.status, c.customer_id, c.full_name;

CREATE VIEW order_summary AS
SELECT
    o.order_id,
    o.order_date,
    o.status,
    c.customer_id,
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
         JOIN customers c ON c.customer_id = o.customer_id
         JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY
    o.order_id, o.order_date, o.status, c.customer_id, c.full_name
;


-- VIEWS

CREATE MATERIALIZED VIEW order_summary_m AS
SELECT
    o.order_id,
    o.order_date,
    o.status,
    c.customer_id,
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
         JOIN customers c ON c.customer_id = o.customer_id
         JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY
    o.order_id, o.order_date, o.status, c.customer_id, c.full_name
;



SELECT * FROM order_summary_m;
SELECT status,full_name FROM order_summary;

REFRESH MATERIALIZED VIEW order_summary_m;






