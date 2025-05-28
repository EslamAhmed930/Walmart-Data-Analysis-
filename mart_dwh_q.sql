-- Create Customer Dimension Table
CREATE TABLE cust_dim (
    customer_id_k SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(255),
    marital_status VARCHAR(20),
    has_children BOOLEAN
);

-- Insert into Customer Dimension Table
INSERT INTO cust_dim (customer_id, customer_name, age, gender, phone, email, marital_status, has_children) VALUES
(501, 'John Doe', 30, 'Male', '123-456-7890', 'john@example.com', 'Married', TRUE),
(502, 'Jane Smith', 25, 'Female', '987-654-3210', 'jane@example.com', 'Single', FALSE),
(503, 'Alice Johnson', 40, 'Female', '555-555-5555', 'alice@example.com', 'Married', TRUE);

-- Create Product Dimension Table
CREATE TABLE prod_dim (
    product_id_k SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2),
    category_sub_id_k INT,
    promotion_id_k INT
);

-- Insert into Product Dimension Table
INSERT INTO prod_dim (product_id, product_name, price, category_sub_id_k, promotion_id_k) VALUES
(1001, 'iPhone 13', 999.99, 1, 1),
(1002, 'MacBook Pro', 1999.99, 2, 2),
(1003, 'Men''s T-Shirt', 29.99, 3, NULL),
(1004, 'Samsung Fridge', 899.99, 4, NULL);

-- Create Promotion Dimension Table
CREATE TABLE promo_dim (
    promotion_id_k SERIAL PRIMARY KEY,
    promotion_id INT NOT NULL,
    promotion_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    discount DECIMAL(5, 2)
);

-- Insert into Promotion Dimension Table
INSERT INTO promo_dim (promotion_id, promotion_name, start_date, end_date, discount) VALUES
(1, 'Summer Sale', '2023-07-01', '2023-07-31', 10.0),
(2, 'Black Friday', '2023-11-24', '2023-11-27', 20.0);

-- Create Sales Fact Table
CREATE TABLE sales_fact (
    transaction_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    quantity INT NOT NULL,
    sales_amount DECIMAL(10, 2) NOT NULL,
    product_id_k INT REFERENCES prod_dim(product_id_k),
    category_sub_id_k INT,
    promotion_id_k INT REFERENCES promo_dim(promotion_id_k),
    customer_id_k INT REFERENCES cust_dim(customer_id_k),
    casher_id_k INT,
    branch_id_k INT
);

-- Insert into Sales Fact Table (with more dates)
INSERT INTO sales_fact (transaction_id, date, time, quantity, sales_amount, product_id_k, category_sub_id_k, promotion_id_k, customer_id_k, casher_id_k, branch_id_k) VALUES
(10001, '2023-10-01', '10:15:00', 1, 999.99, 1, 1, 1, 1, 1, 1),
(10002, '2023-10-02', '14:30:00', 1, 1999.99, 2, 2, 2, 2, 2, 2),
(10003, '2023-10-03', '09:45:00', 2, 59.98, 3, 3, NULL, 3, 3, 3),
(10004, '2023-10-04', '11:00:00', 1, 899.99, 4, 4, NULL, 1, 1, 1),
(10005, '2023-10-05', '16:20:00', 1, 999.99, 1, 1, 1, 2, 2, 2),
(10006, '2023-10-06', '12:10:00', 1, 1999.99, 2, 2, 2, 3, 3, 3),
(10007, '2023-10-07', '09:30:00', 3, 89.97, 3, 3, NULL, 1, 1, 1),
(10008, '2023-10-08', '14:45:00', 1, 899.99, 4, 4, NULL, 2, 2, 2),
(10009, '2023-10-09', '10:00:00', 2, 1999.98, 2, 2, 2, 3, 3, 3),
(10010, '2023-10-10', '17:00:00', 1, 999.99, 1, 1, 1, 1, 1, 1);
-- Insert into Sales Fact Table (with even more data)
INSERT INTO sales_fact (transaction_id, date, time, quantity, sales_amount, product_id_k, category_sub_id_k, promotion_id_k, customer_id_k, casher_id_k, branch_id_k) VALUES
(10021, '2023-10-21', '11:00:00', 1, 999.99, 1, 1, 1, 1, 1, 1),
(10022, '2023-10-22', '14:30:00', 1, 1999.99, 2, 2, 2, 2, 2, 2),
(10023, '2023-10-23', '09:45:00', 2, 59.98, 3, 3, NULL, 3, 3, 3),
(10024, '2023-10-24', '11:00:00', 1, 899.99, 4, 4, NULL, 4, 1, 1),
(10025, '2023-10-25', '16:20:00', 1, 999.99, 1, 1, 1, 5, 2, 2),
(10026, '2023-10-26', '12:10:00', 1, 1999.99, 2, 2, 2, 1, 3, 3),
(10027, '2023-10-27', '09:30:00', 3, 89.97, 3, 3, NULL, 2, 1, 1),
(10028, '2023-10-28', '14:45:00', 1, 899.99, 4, 4, NULL, 3, 2, 2),
(10029, '2023-10-29', '10:00:00', 2, 1999.98, 2, 2, 2, 4, 3, 3),
(10030, '2023-10-30', '17:00:00', 1, 999.99, 1, 1, 1, 5, 1, 1),
(10031, '2023-10-31', '13:00:00', 1, 249.99, 5, 1, NULL, 1, 2, 2),
(10032, '2023-11-01', '15:30:00', 2, 99.98, 6, 3, NULL, 2, 3, 3),
(10033, '2023-11-02', '11:45:00', 1, 699.99, 7, 4, NULL, 3, 1, 1),
(10034, '2023-11-03', '16:00:00', 1, 999.99, 1, 1, 1, 4, 2, 2),
(10035, '2023-11-04', '10:30:00', 1, 1999.99, 2, 2, 2, 5, 3, 3),
(10036, '2023-11-05', '14:15:00', 3, 149.97, 3, 3, NULL, 1, 1, 1),
(10037, '2023-11-06', '09:00:00', 1, 899.99, 4, 4, NULL, 2, 2, 2),
(10038, '2023-11-07', '12:45:00', 2, 499.98, 5, 1, NULL, 3, 3, 3),
(10039, '2023-11-08', '17:30:00', 1, 49.99, 6, 3, NULL, 4, 1, 1),
(10040, '2023-11-09', '10:10:00', 1, 699.99, 7, 4, NULL, 5, 2, 2),
(10041, '2023-11-10', '11:00:00', 1, 999.99, 1, 1, 1, 1, 3, 3),
(10042, '2023-11-11', '14:30:00', 1, 1999.99, 2, 2, 2, 2, 1, 1),
(10043, '2023-11-12', '09:45:00', 2, 59.98, 3, 3, NULL, 3, 2, 2),
(10044, '2023-11-13', '11:00:00', 1, 899.99, 4, 4, NULL, 4, 3, 3),
(10045, '2023-11-14', '16:20:00', 1, 999.99, 1, 1, 1, 5, 1, 1),
(10046, '2023-11-15', '12:10:00', 1, 1999.99, 2, 2, 2, 1, 2, 2),
(10047, '2023-11-16', '09:30:00', 3, 89.97, 3, 3, NULL, 2, 3, 3),
(10048, '2023-11-17', '14:45:00', 1, 899.99, 4, 4, NULL, 3, 1, 1),
(10049, '2023-11-18', '10:00:00', 2, 1999.98, 2, 2, 2, 4, 2, 2),
(10050, '2023-11-19', '17:00:00', 1, 999.99, 1, 1, 1, 5, 3, 3);

commit;