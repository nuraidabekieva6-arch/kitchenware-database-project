CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO Categories (category_name) VALUES ('Посуда для готовки'), ('Сервировка'), ('Кухонная утварь');

INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES 
('Кастрюля нерж. 3л', 1, 2500.00, 15),
('Свородка антипригарная 24см', 1, 1800.00, 20),
('Набор фарфоровых тарелок (6 шт)', 2, 3200.00, 8),
('Набор кухонных лопаток', 3, 650.00, 50);

INSERT INTO Customers (full_name, email) VALUES 
('Айбек Токтогулов', 'aibek@example.com'),
('Елена Смирнова', 'elena@example.com');

SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;
