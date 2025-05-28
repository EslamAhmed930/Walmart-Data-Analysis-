-- Table: branch_dim
CREATE TABLE IF NOT EXISTS branch_dim (
    branch_id INT,
    branch_id_bk INT,
    branch_name VARCHAR(255),
    city_id INT,
    city_name VARCHAR(255),
    state_id INT,
    state_name VARCHAR(255),
    area VARCHAR(255)
);
-- Table: cashier_dim

CREATE TABLE IF NOT EXISTS cashier_dim (
    cashier_id INT,
    cashier_id_bk INT,
    cashier_name VARCHAR(255),
    age INT,
    phone VARCHAR(15),
    gender VARCHAR(10),
    hire_date DATE,
    salary DECIMAL(10, 2)
);
-- Table: category_dim
CREATE TABLE IF NOT EXISTS category_dim (
    category_sub_id INT,
    category_sub_id_bk INT,
    category_id INT,
    category_name VARCHAR(255),
    sub_category_id INT,
    sub_name VARCHAR(255)
);

-- Table: customer_dim
CREATE TABLE IF NOT EXISTS customer_dim (
    customer_id INT,
    customer_id_bk INT,
    customer_name VARCHAR(255),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(255),
    marital_status VARCHAR(20),
    has_children INT
);

-- Table: date_dim
CREATE TABLE IF NOT EXISTS date_dim (
    date_id INT NOT NULL,
    date DATE NOT NULL,
    day_of_week VARCHAR(3),
    day_of_month INT,
    day_of_year INT,
    last_day_in_month_indicator INT,
    week_of_year INT,
    month INT,
    month_name VARCHAR(3),
    quarter INT,
    year INT,
    holiday_indicator INT,
    weekday_indicator INT
);

-- Table: product_dim
CREATE TABLE IF NOT EXISTS product_dim (
    product_id INT,
    product_id_bk INT,
    product_name VARCHAR(255),
    price DECIMAL(10,2),
    category_id INT,
    sub_category_id INT,
    category_sub_id_bk INT,
    promotion_id_bk INT
);

-- Table: promotion_dim
CREATE TABLE IF NOT EXISTS promotion_dim (
    promotion_id INT,
    promotion_id_bk INT,
    promotion_name VARCHAR(255),
    start_date VARCHAR(7),
    end_date VARCHAR(7),
    discount DECIMAL(5,2)
);

-- Table: sales_fact
CREATE TABLE IF NOT EXISTS sales_fact (
    transaction_id BIGINT,
    time BIGINT,
    quantity BIGINT,
    sales_amount DOUBLE PRECISION,
    product_id_bk BIGINT,
    category_sub_id_bk BIGINT,
    promotion_id_bk DOUBLE PRECISION,
    customer_id_bk BIGINT,
    cashier_id_bk BIGINT,
    branch_id_bk BIGINT,
    date_id BIGINT
);

--------------------------------------------------------------------------------------------------------
-- Insert into branch_dim
INSERT INTO branch_dim (branch_id_bk, branch_id, branch_name, area, city_id, city_name, state_id, state_name)
VALUES
(1, 1, 'LA Downtown', 'Downtown', 1, 'Los Angeles', 1, 'California'),
(2, 2, 'SF Bay Area', 'Bay Area', 2, 'San Francisco', 1, 'California'),
(3, 3, 'Houston Central', 'Central', 3, 'Houston', 2, 'Texas'),
(4, 4, 'Dallas North', 'North', 4, 'Dallas', 2, 'Texas'),
(5, 5, 'NYC Manhattan', 'Manhattan', 5, 'New York City', 3, 'New York'),
(6, 6, 'Buffalo East', 'East', 6, 'Buffalo', 3, 'New York');

-- Insert into cashier_dim
INSERT INTO cashier_dim (cashier_id_bk, cashier_id, cashier_name, age, phone, gender, hire_date, salary)
VALUES
(1, 1, 'Mike Johnson', 28, '111-222-3333', 'Male', '2022-01-15', 3500.0),
(2, 2, 'Emily Davis', 24, '222-333-4444', 'Female', '2022-03-10', 3200.0),
(3, 3, 'Chris Brown', 30, '333-444-5555', 'Male', '2021-11-05', 3800.0),
(4, 4, 'Laura Wilson', 26, '444-555-6666', 'Female', '2022-02-20', 3300.0);

-- Insert into customer_dim
INSERT INTO customer_dim (customer_id_bk, customer_id, customer_name, age, gender, phone, email, marital_status, has_children)
VALUES
(1, 1, 'John Doe', 30, 'Male', '123-456-7890', 'john.doe@example.com', 'Married', 1),
(2, 2, 'Jane Smith', 25, 'Female', '987-654-3210', 'jane.smith@example.com', 'Single', 0),
(3, 3, 'Alice Johnson', 40, 'Female', '555-123-4567', 'alice.johnson@example.com', 'Married', 1),
(4, 4, 'Bob Brown', 35, 'Male', '444-555-6666', 'bob.brown@example.com', 'Single', 0),
(5, 5, 'Sarah Lee', 22, 'Female', '777-888-9999', 'sarah.lee@example.com', 'Single', 0),
(6, 6, 'David Wilson', 45, 'Male', '666-777-8888', 'david.wilson@example.com', 'Married', 1),
(7, 7, 'Emma Brown', 29, 'Female', '555-666-7777', 'emma.brown@example.com', 'Single', 0),
(8, 8, 'Michael Davis', 50, 'Male', '444-555-6666', 'michael.davis@example.com', 'Married', 1);

-- Insert into category_dim
INSERT INTO category_dim (category_sub_id, sub_category_id, sub_name, category_id, category_name, category_sub_id_bk)
VALUES
(0, 1, 'Smartphones', 1, 'Electronics', 1),
(2, 2, 'Laptops', 1, 'Electronics', 3),
(4, 3, 'Men''s Clothing', 2, 'Clothing', 5),
(6, 4, 'Women''s Clothing', 2, 'Clothing', 7),
(8, 5, 'Cookware', 3, 'Home & Kitchen', 9),
(9, 6, 'Furniture', 3, 'Home & Kitchen', 10),
(10, 7, 'Fitness Equipment', 4, 'Sports & Outdoors', 11),
(11, 8, 'Camping Gear', 4, 'Sports & Outdoors', 12),
(12, 9, 'Fiction', 5, 'Books', 13),
(13, 10, 'Non-Fiction', 5, 'Books', 14),
(14, 11, 'Board Games', 6, 'Toys & Games', 15),
(15, 12, 'Outdoor Toys', 6, 'Toys & Games', 16),
(16, 13, 'Skincare', 7, 'Beauty & Personal Care', 17),
(17, 14, 'Makeup', 7, 'Beauty & Personal Care', 18),
(18, 15, 'Car Accessories', 8, 'Automotive', 19),
(19, 16, 'Tools & Equipment', 8, 'Automotive', 20);

-- Insert into date_dim
INSERT INTO date_dim (date_id, date, day_of_week, day_of_month, day_of_year, last_day_in_month_indicator, week_of_year, month, month_name, quarter, year, holiday_indicator, weekday_indicator)
VALUES
(1, '2023-01-05', 'Thu', 5, 5, 0, 1, 1, 'Jan', 1, 2023, 0, 0),
(2, '2023-01-06', 'Fri', 6, 6, 0, 1, 1, 'Jan', 1, 2023, 0, 0),
(3, '2023-01-07', 'Sat', 7, 7, 0, 1, 1, 'Jan', 1, 2023, 0, 1),
(4, '2023-01-08', 'Sun', 8, 8, 0, 1, 1, 'Jan', 1, 2023, 0, 1),
(5, '2023-01-09', 'Mon', 9, 9, 0, 2, 1, 'Jan', 1, 2023, 1, 0),
(6, '2023-01-10', 'Tue', 10, 10, 0, 2, 1, 'Jan', 1, 2023, 0, 0),
(7, '2023-01-11', 'Wed', 11, 11, 0, 2, 1, 'Jan', 1, 2023, 0, 0),
(8, '2023-01-12', 'Thu', 12, 12, 0, 2, 1, 'Jan', 1, 2023, 0, 0),
(9, '2023-01-13', 'Fri', 13, 13, 0, 2, 1, 'Jan', 1, 2023, 0, 0),
(10, '2023-01-14', 'Sat', 14, 14, 0, 2, 1, 'Jan', 1, 2023, 0, 1),
(11, '2023-01-15', 'Sun', 15, 15, 0, 2, 1, 'Jan', 1, 2023, 0, 1),
(12, '2023-01-16', 'Mon', 16, 16, 0, 3, 1, 'Jan', 1, 2023, 0, 0),
(13, '2023-01-17', 'Tue', 17, 17, 0, 3, 1, 'Jan', 1, 2023, 0, 0),
(14, '2023-01-18', 'Wed', 18, 18, 0, 3, 1, 'Jan', 1, 2023, 0, 0),
(15, '2023-01-19', 'Thu', 19, 19, 0, 3, 1, 'Jan', 1, 2023, 0, 0),
(16, '2023-01-20', 'Fri', 20, 20, 0, 3, 1, 'Jan', 1, 2023, 0, 0),
(17, '2023-01-21', 'Sat', 21, 21, 0, 3, 1, 'Jan', 1, 2023, 0, 1),
(18, '2023-01-22', 'Sun', 22, 22, 0, 3, 1, 'Jan', 1, 2023, 0, 1),
(19, '2023-01-23', 'Mon', 23, 23, 0, 4, 1, 'Jan', 1, 2023, 0, 0),
(20, '2023-01-24', 'Tue', 24, 24, 0, 4, 1, 'Jan', 1, 2023, 0, 0),
(21, '2023-01-25', 'Wed', 25, 25, 0, 4, 1, 'Jan', 1, 2023, 0, 0),
(22, '2023-01-26', 'Thu', 26, 26, 0, 4, 1, 'Jan', 1, 2023, 0, 0),
(23, '2023-01-27', 'Fri', 27, 27, 0, 4, 1, 'Jan', 1, 2023, 0, 0),
(24, '2023-01-28', 'Sat', 28, 28, 0, 4, 1, 'Jan', 1, 2023, 0, 1),
(25, '2023-01-29', 'Sun', 29, 29, 0, 4, 1, 'Jan', 1, 2023, 0, 1),
(26, '2023-01-30', 'Mon', 30, 30, 0, 5, 1, 'Jan', 1, 2023, 0, 0),
(27, '2023-01-31', 'Tue', 31, 31, 0, 5, 1, 'Jan', 1, 2023, 0, 0),
(28, '2023-02-01', 'Wed', 1, 32, 0, 5, 2, 'Feb', 1, 2023, 0, 0),
(29, '2023-02-02', 'Thu', 2, 33, 0, 5, 2, 'Feb', 1, 2023, 0, 0),
(30, '2023-02-03', 'Fri', 3, 34, 0, 5, 2, 'Feb', 1, 2023, 0, 0),
(31, '2023-02-04', 'Sat', 4, 35, 0, 5, 2, 'Feb', 1, 2023, 0, 1),
(32, '2023-02-05', 'Sun', 5, 36, 0, 5, 2, 'Feb', 1, 2023, 0, 1),
(33, '2023-02-06', 'Mon', 6, 37, 0, 6, 2, 'Feb', 1, 2023, 0, 0),
(34, '2023-02-07', 'Tue', 7, 38, 0, 6, 2, 'Feb', 1, 2023, 0, 0),
(35, '2023-02-08', 'Wed', 8, 39, 0, 6, 2, 'Feb', 1, 2023, 0, 0),
(36, '2023-02-09', 'Thu', 9, 40, 0, 6, 2, 'Feb', 1, 2023, 0, 0),
(37, '2023-02-10', 'Fri', 10, 41, 0, 6, 2, 'Feb', 1, 2023, 0, 0),
(38, '2023-02-11', 'Sat', 11, 42, 0, 6, 2, 'Feb', 1, 2023, 0, 1),
(39, '2023-02-12', 'Sun', 12, 43, 0, 6, 2, 'Feb', 1, 2023, 0, 1),
(40, '2023-02-13', 'Mon', 13, 44, 0, 7, 2, 'Feb', 1, 2023, 0, 0),
(41, '2023-02-14', 'Tue', 14, 45, 0, 7, 2, 'Feb', 1, 2023, 0, 0),
(42, '2023-02-15', 'Wed', 15, 46, 0, 7, 2, 'Feb', 1, 2023, 0, 0),
(43, '2023-02-16', 'Thu', 16, 47, 0, 7, 2, 'Feb', 1, 2023, 0, 0),
(44, '2023-02-17', 'Fri', 17, 48, 0, 7, 2, 'Feb', 1, 2023, 0, 0),
(45, '2023-02-18', 'Sat', 18, 49, 0, 7, 2, 'Feb', 1, 2023, 0, 1),
(46, '2023-02-19', 'Sun', 19, 50, 0, 7, 2, 'Feb', 1, 2023, 0, 1),
(47, '2023-02-20', 'Mon', 20, 51, 0, 8, 2, 'Feb', 1, 2023, 0, 0),
(48, '2023-02-21', 'Tue', 21, 52, 0, 8, 2, 'Feb', 1, 2023, 0, 0),
(49, '2023-02-22', 'Wed', 22, 53, 0, 8, 2, 'Feb', 1, 2023, 0, 0),
(50, '2023-02-23', 'Thu', 23, 54, 0, 8, 2, 'Feb', 1, 2023, 0, 0),
(51, '2023-02-24', 'Fri', 24, 55, 0, 8, 2, 'Feb', 1, 2023, 0, 0),
(52, '2023-02-25', 'Sat', 25, 56, 0, 8, 2, 'Feb', 1, 2023, 0, 1),
(53, '2023-02-26', 'Sun', 26, 57, 0, 8, 2, 'Feb', 1, 2023, 0, 1),
(54, '2023-02-27', 'Mon', 27, 58, 0, 9, 2, 'Feb', 1, 2023, 0, 0),
(55, '2023-02-28', 'Tue', 28, 59, 0, 9, 2, 'Feb', 1, 2023, 0, 0),
(56, '2023-03-01', 'Wed', 1, 60, 0, 9, 3, 'Mar', 1, 2023, 0, 0),
(57, '2023-03-02', 'Thu', 2, 61, 0, 9, 3, 'Mar', 1, 2023, 0, 0),
(58, '2023-03-03', 'Fri', 3, 62, 0, 9, 3, 'Mar', 1, 2023, 0, 0),
(59, '2023-03-04', 'Sat', 4, 63, 0, 9, 3, 'Mar', 1, 2023, 0, 1),
(60, '2023-03-05', 'Sun', 5, 64, 0, 9, 3, 'Mar', 1, 2023, 0, 1),
(61, '2023-03-06', 'Mon', 6, 65, 0, 10, 3, 'Mar', 1, 2023, 0, 0),
(62, '2023-03-07', 'Tue', 7, 66, 0, 10, 3, 'Mar', 1, 2023, 0, 0),
(63, '2023-03-08', 'Wed', 8, 67, 0, 10, 3, 'Mar', 1, 2023, 0, 0),
(64, '2023-03-09', 'Thu', 9, 68, 0, 10, 3, 'Mar', 1, 2023, 0, 0),
(65, '2023-03-10', 'Fri', 10, 69, 0, 10, 3, 'Mar', 1, 2023, 0, 0),
(66, '2023-03-11', 'Sat', 11, 70, 0, 10, 3, 'Mar', 1, 2023, 0, 1),
(67, '2023-03-12', 'Sun', 12, 71, 0, 10, 3, 'Mar', 1, 2023, 0, 1),
(68, '2023-03-13', 'Mon', 13, 72, 0, 11, 3, 'Mar', 1, 2023, 0, 0),
(69, '2023-03-14', 'Tue', 14, 73, 0, 11, 3, 'Mar', 1, 2023, 0, 0),
(70, '2023-03-15', 'Wed', 15, 74, 0, 11, 3, 'Mar', 1, 2023, 0, 0),
(71, '2023-03-16', 'Thu', 16, 75, 0, 11, 3, 'Mar', 1, 2023, 0, 0),
(72, '2023-03-17', 'Fri', 17, 76, 0, 11, 3, 'Mar', 1, 2023, 0, 0),
(73, '2023-03-18', 'Sat', 18, 77, 0, 11, 3, 'Mar', 1, 2023, 0, 1),
(74, '2023-03-19', 'Sun', 19, 78, 0, 11, 3, 'Mar', 1, 2023, 0, 1),
(75, '2023-03-20', 'Mon', 20, 79, 0, 12, 3, 'Mar', 1, 2023, 0, 0),
(76, '2023-03-21', 'Tue', 21, 80, 0, 12, 3, 'Mar', 1, 2023, 0, 0),
(77, '2023-03-22', 'Wed', 22, 81, 0, 12, 3, 'Mar', 1, 2023, 0, 0),
(78, '2023-03-23', 'Thu', 23, 82, 0, 12, 3, 'Mar', 1, 2023, 0, 0),
(79, '2023-03-24', 'Fri', 24, 83, 0, 12, 3, 'Mar', 1, 2023, 0, 0),
(80, '2023-03-25', 'Sat', 25, 84, 0, 12, 3, 'Mar', 1, 2023, 0, 1),
(81, '2023-03-26', 'Sun', 26, 85, 0, 12, 3, 'Mar', 1, 2023, 0, 1),
(82, '2023-03-27', 'Mon', 27, 86, 0, 13, 3, 'Mar', 1, 2023, 0, 0),
(83, '2023-03-28', 'Tue', 28, 87, 0, 13, 3, 'Mar', 1, 2023, 0, 0),
(84, '2023-03-29', 'Wed', 29, 88, 0, 13, 3, 'Mar', 1, 2023, 0, 0),
(85, '2023-03-30', 'Thu', 30, 89, 0, 13, 3, 'Mar', 1, 2023, 0, 0);

-- Insert into product_dim
INSERT INTO product_dim (product_id_bk, product_id, product_name, price)
VALUES
(1, 1, 'iPhone 14', 999.99),
(1, 1, 'iPhone 14', 999.99),
(2, 2, 'Samsung Galaxy S22', 899.99),
(2, 2, 'Samsung Galaxy S22', 899.99),
(3, 3, 'MacBook Pro 16"', 2399.99),
(4, 4, 'Dell XPS 15', 1499.99),
(5, 5, 'Men''s T-Shirt', 19.99),
(5, 5, 'Men''s T-Shirt', 19.99),
(6, 6, 'Men''s Jeans', 49.99),
(7, 7, 'Women''s Dress', 59.99),
(7, 7, 'Women''s Dress', 59.99),
(8, 8, 'Women''s Jacket', 79.99),
(9, 9, 'Non-Stick Cookware Set', 129.99),
(9, 9, 'Non-Stick Cookware Set', 129.99),
(10, 10, 'Dining Table', 299.99),
(11, 11, 'Treadmill', 799.99),
(11, 11, 'Treadmill', 799.99),
(12, 12, 'Tent', 149.99),
(13, 13, 'The Great Gatsby', 12.99),
(14, 14, 'Sapiens: A Brief History of Humankind', 18.99),
(15, 15, 'Monopoly', 29.99),
(16, 16, 'Frisbee', 9.99),
(17, 17, 'Moisturizing Cream', 24.99),
(18, 18, 'Lipstick Set', 34.99),
(19, 19, 'Car Phone Holder', 19.99),
(20, 20, 'Tool Kit', 49.99);

-- Insert into promotion_dim
INSERT INTO promotion_dim (promotion_id_bk, promotion_id, promotion_name, start_date, end_date, discount)
VALUES
(1, 1, 'New Year Sale', '2023-01', '2023-01', 10.0),
(1, 1, 'New Year Sale', '2023-01', '2023-01', 15.0),
(2, 2, 'Valentine''s Day Special', '2023-02', '2023-02', 20.0),
(2, 2, 'Valentine''s Day Special', '2023-02', '2023-02', 25.0),
(3, 3, 'Spring Clearance', '2023-03', '2023-03', 30.0),
(3, 3, 'Spring Clearance', '2023-03', '2023-03', 35.0);

-- Insert into sales_fact
INSERT INTO sales_fact (transaction_id, time, quantity, sales_amount, product_id_bk, category_sub_id_bk, promotion_id_bk, customer_id_bk, cashier_id_bk, branch_id_bk, date_id)
VALUES
-- Existing records from sales_fact.csv
(1, 10, 1, 899.99, 1, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 1, 1, 1.0, 1, 1, 1, 1),
(2, 14, 1, 764.99, 2, 1, 1.0, 2, 2, 2, 3),
(2, 14, 1, 764.99, 2, 1, 1.0, 2, 2, 2, 3),
(3, 11, 2, 39.98, 5, 5, 2.0, 3, 3, 3, 6),
(3, 11, 2, 39.98, 5, 5, 2.0, 3, 3, 3, 6),
(4, 16, 1, 59.99, 7, 7, 2.0, 4, 4, 4, 11),
(4, 16, 1, 59.99, 7, 7, 2.0, 4, 4, 4, 11),
(5, 12, 1, 15.99, 5, 5, 2.0, 1, 1, 1, 39),
(5, 12, 1, 15.99, 5, 5, 2.0, 1, 1, 1, 39),
(6, 18, 1, 44.99, 7, 7, 2.0, 2, 2, 2, 41),
(6, 18, 1, 44.99, 7, 7, 2.0, 2, 2, 2, 41),
(7, 9, 1, 90.99, 9, 9, 3.0, 3, 3, 3, 47),
(7, 9, 1, 90.99, 9, 9, 3.0, 3, 3, 3, 47),
(8, 14, 1, 519.99, 11, 11, 3.0, 4, 4, 4, 52),
(8, 14, 1, 519.99, 11, 11, 3.0, 4, 4, 4, 52),
(9, 10, 1, 90.99, 9, 9, 3.0, 1, 1, 1, 60),
(9, 10, 1, 90.99, 9, 9, 3.0, 1, 1, 1, 60),
(10, 12, 1, 519.99, 11, 11, 3.0, 2, 2, 2, 65),
(10, 12, 1, 519.99, 11, 11, 3.0, 2, 2, 2, 65),
(11, 15, 1, 149.99, 12, 12, NULL, 3, 3, 3, 70),
(12, 17, 1, 299.99, 10, 10, NULL, 4, 4, 4, 75),
(13, 12, 1, 12.99, 13, 13, NULL, 5, 1, 1, 14),
(14, 15, 1, 29.99, 15, 15, NULL, 6, 2, 2, 16),
(15, 10, 1, 24.99, 17, 17, NULL, 7, 3, 3, 18),
(16, 14, 1, 19.99, 19, 19, NULL, 8, 4, 4, 21),
(17, 11, 1, 18.99, 14, 14, NULL, 5, 1, 1, 32),
(18, 16, 2, 19.98, 16, 16, NULL, 6, 2, 2, 35),
(19, 13, 1, 34.99, 18, 18, NULL, 7, 3, 3, 39),
(20, 17, 1, 49.99, 20, 20, NULL, 8, 4, 4, 45),
(21, 9, 1, 12.99, 13, 13, NULL, 5, 1, 1, 56),
(22, 12, 1, 29.99, 15, 15, NULL, 6, 2, 2, 60),
(23, 14, 1, 24.99, 17, 17, NULL, 7, 3, 3, 65),
(24, 16, 1, 19.99, 19, 19, NULL, 8, 4, 4, 70),
(25, 10, 1, 18.99, 14, 14, NULL, 5, 1, 1, 75),
(26, 13, 1, 9.99, 16, 16, NULL, 6, 2, 2, 77),
(27, 15, 1, 34.99, 18, 18, NULL, 7, 3, 3, 80),
(28, 18, 1, 49.99, 20, 20, NULL, 8, 4, 4, 85),
-- Additional records (generated based on previous data)
(29, 10, 1, 899.99, 1, 1, 1.0, 2, 2, 2, 1),
(30, 14, 1, 764.99, 2, 1, 1.0, 3, 3, 3, 3),
(31, 11, 2, 39.98, 5, 5, 2.0, 4, 4, 4, 6),
(32, 16, 1, 59.99, 7, 7, 2.0, 1, 1, 1, 11),
(33, 12, 1, 15.99, 5, 5, 2.0, 2, 2, 2, 39),
(34, 18, 1, 44.99, 7, 7, 2.0, 3, 3, 3, 41),
(35, 9, 1, 90.99, 9, 9, 3.0, 4, 4, 4, 47),
(36, 14, 1, 519.99, 11, 11, 3.0, 1, 1, 1, 52),
(37, 10, 1, 90.99, 9, 9, 3.0, 2, 2, 2, 60),
(38, 12, 1, 519.99, 11, 11, 3.0, 3, 3, 3, 65),
(39, 15, 1, 149.99, 12, 12, NULL, 4, 4, 4, 70),
(40, 17, 1, 299.99, 10, 10, NULL, 1, 1, 1, 75),
(41, 12, 1, 12.99, 13, 13, NULL, 2, 2, 2, 14),
(42, 15, 1, 29.99, 15, 15, NULL, 3, 3, 3, 16),
(43, 10, 1, 24.99, 17, 17, NULL, 4, 4, 4, 18),
(44, 14, 1, 19.99, 19, 19, NULL, 1, 1, 1, 21),
(45, 11, 1, 18.99, 14, 14, NULL, 2, 2, 2, 32),
(46, 16, 2, 19.98, 16, 16, NULL, 3, 3, 3, 35),
(47, 13, 1, 34.99, 18, 18, NULL, 4, 4, 4, 39),
(48, 17, 1, 49.99, 20, 20, NULL, 1, 1, 1, 45),
(49, 9, 1, 12.99, 13, 13, NULL, 2, 2, 2, 56),
(50, 12, 1, 29.99, 15, 15, NULL, 3, 3, 3, 60),
(51, 14, 1, 24.99, 17, 17, NULL, 4, 4, 4, 65),
(52, 16, 1, 19.99, 19, 19, NULL, 1, 1, 1, 70),
(53, 10, 1, 18.99, 14, 14, NULL, 2, 2, 2, 75),
(54, 13, 1, 9.99, 16, 16, NULL, 3, 3, 3, 77),
(55, 15, 1, 34.99, 18, 18, NULL, 4, 4, 4, 80),
(56, 18, 1, 49.99, 20, 20, NULL, 1, 1, 1, 85);


INSERT INTO sales_fact (transaction_id, time, quantity, sales_amount, product_id_bk, category_sub_id_bk, promotion_id_bk, customer_id_bk, cashier_id_bk, branch_id_bk, date_id)
VALUES
-- Transaction 1: 7 products purchased together
(1, 10, 1, 899.99, 1, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 2, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 3, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 4, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 5, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 6, 1, 1.0, 1, 1, 1, 1),
(1, 10, 1, 899.99, 7, 1, 1.0, 1, 1, 1, 1),

-- Transaction 2: 5 products purchased together
(2, 14, 1, 764.99, 2, 1, 1.0, 2, 2, 2, 3),
(2, 14, 1, 764.99, 3, 1, 1.0, 2, 2, 2, 3),
(2, 14, 1, 764.99, 4, 1, 1.0, 2, 2, 2, 3),
(2, 14, 1, 764.99, 5, 1, 1.0, 2, 2, 2, 3),
(2, 14, 1, 764.99, 6, 1, 1.0, 2, 2, 2, 3),

-- Transaction 3: 4 products purchased together
(3, 11, 2, 39.98, 5, 5, 2.0, 3, 3, 3, 6),
(3, 11, 2, 39.98, 6, 5, 2.0, 3, 3, 3, 6),
(3, 11, 2, 39.98, 7, 5, 2.0, 3, 3, 3, 6),
(3, 11, 2, 39.98, 8, 5, 2.0, 3, 3, 3, 6),

-- Transaction 4: 3 products purchased together
(4, 16, 1, 59.99, 7, 7, 2.0, 4, 4, 4, 11),
(4, 16, 1, 59.99, 8, 7, 2.0, 4, 4, 4, 11),
(4, 16, 1, 59.99, 9, 7, 2.0, 4, 4, 4, 11),

-- Transaction 5: 2 products purchased together
(5, 12, 1, 15.99, 5, 5, 2.0, 1, 1, 1, 39),
(5, 12, 1, 15.99, 6, 5, 2.0, 1, 1, 1, 39),

-- Transaction 6: 2 products purchased together
(6, 18, 1, 44.99, 7, 7, 2.0, 2, 2, 2, 41),
(6, 18, 1, 44.99, 8, 7, 2.0, 2, 2, 2, 41);