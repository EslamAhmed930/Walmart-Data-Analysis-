-- Category table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Sub_category table
CREATE TABLE Sub_category (
    sub_category_id INT PRIMARY KEY,
    sub_name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    sub_category_id INT,
    FOREIGN KEY (sub_category_id) REFERENCES Sub_category(sub_category_id)
);

-- Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(100),
    marital_status VARCHAR(20),
    has_children BOOLEAN
);

-- State table
CREATE TABLE State (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL
);

-- City table
CREATE TABLE City (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Branch table
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    area VARCHAR(50),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id)
);

-- Cashier table
CREATE TABLE Cashier (
    cashier_id INT PRIMARY KEY,
    cashier_name VARCHAR(100) NOT NULL,
    age INT,
    phone VARCHAR(20),
    gender VARCHAR(20),
    hire_date date,
    salary DECIMAL(10,2),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Promotion table
CREATE TABLE Promotion (
    promotion_id INT PRIMARY KEY,
    promotion_name VARCHAR(100) NOT NULL
   
);

-- Buy (Transaction) table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    cashier_id INT,
    date DATE,
    time TIME,
    quantity INT,
    sales_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (cashier_id) REFERENCES Cashier(cashier_id)
);

-- Product_Promotion junction table (for Many-to-Many relationship)
CREATE TABLE Product_Promotion (
    product_id INT,
    promotion_id INT,
    PRIMARY KEY (product_id, promotion_id),
	start_date DATE,
    end_date DATE,
    discount DECIMAL(5,2),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (promotion_id) REFERENCES Promotion(promotion_id)
);