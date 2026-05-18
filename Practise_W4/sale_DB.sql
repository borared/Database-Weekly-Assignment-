create database sale_db;
use sale_db;
CREATE TABLE employee_info (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  department ENUM('Sales', 'Marketing', 'Development') NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE contact_info (
  employee_id INT PRIMARY KEY,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20),
  FOREIGN KEY (employee_id) REFERENCES employee_info(employee_id)
);

CREATE TABLE sales_data (
  employee_id INT PRIMARY KEY,
  total_sales DECIMAL(10,2) NOT NULL,
  year INT NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employee_info(employee_id)
);

CREATE TABLE user_accounts (
  username VARCHAR(50) PRIMARY KEY,
  password VARCHAR(255) NOT NULL,
  role ENUM('sales_analyst', 'marketing_viewer', 'developer') NOT NULL
);


INSERT INTO employee_info (first_name, last_name, department, hire_date)
VALUES ('John', 'Doe', 'Sales', '2023-01-01'),
       ('Jane', 'Smith', 'Marketing', '2022-06-15'),
       ('David', 'Lee', 'Development', '2024-02-10'),
       ('Alice', 'Johnson', 'Marketing', '2020-12-01'),
       ('Bob', 'Williams', 'Sales', '2021-05-12'),
       ('Emily', 'Garcia', 'Development', '2023-08-25'),
       ('Charles', 'Brown', 'Sales', '2022-02-09'),
       ('Sarah', 'Davis', 'Marketing', '2024-04-18'),
       ('Michael', 'Clark', 'Development', '2021-09-10'),
       ('Jessica', 'Miller', 'Sales', '2023-03-14');



INSERT INTO contact_info (employee_id, email, phone_number)
VALUES (1, 'john.doe@company.com', '123-456-7890'),
       (2, 'jane.smith@company.com', '555-555-1212'),
       (3, 'david.lee@company.com', '987-654-3210'),
       (4, 'alice.johnson@company.com', '456-789-0123'),
       (5, 'bob.williams@company.com', '234-567-8901'),
       (6, 'emily.garcia@company.com', '789-012-3456'),
       (7, 'charles.brown@company.com', '101-234-5678'),
       (8, 'sarah.davis@company.com', '345-678-9012'),
       (9, 'michael.clark@company.com', '890-123-4567'),
       (10, 'jessica.miller@company.com', '567-890-1234');


INSERT INTO sales_data (employee_id, total_sales, year)
SELECT employee_id, 
       FLOOR(RAND() * 10000) + 5000,  -- Generate random sales between $5,000 and $15,000
       YEAR(CURDATE())  -- Insert current year
FROM employee_info
WHERE department = 'Sales'
LIMIT 10;


INSERT INTO user_accounts (username, password, role)
VALUES ('sales_user1', 'password123', 'sales_analyst'),
       ('sales_user2', 'secure_password', 'sales_analyst'),
       ('marketing_user', 'marketing_access', 'marketing_viewer'),
       ('dev_user', 'dev_access', 'developer'),
       ('manager_user', 'manager_credentials', 'sales_analyst'),  -- Additional sales analyst
       ('data_analyst', 'data_view_access', 'marketing_viewer'),  -- Marketing viewer
       ('data_editor1', 'edit_access1', 'developer'),  -- Developer
       ('data_editor2', 'edit_access2', 'developer'),  -- Developer
       ('auditor_user', 'audit_password', 'marketing_viewer'),  -- Marketing viewer
       ('inactive_user', 'old_password', 'sales_analyst');  -- Inactive account