CREATE DATABASE IF NOT EXISTS MAIL_ORDER;
USE MAIL_ORDER;

CREATE TABLE CUSTOMER (
    CustomerNumber INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10),
    CONSTRAINT chk_zip CHECK (LENGTH(ZipCode) >= 5)
);

CREATE TABLE PART (
    PartNumber INT PRIMARY KEY,
    PartName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT DEFAULT 0,
    CONSTRAINT chk_price CHECK (Price > 0),
    CONSTRAINT chk_stock CHECK (QuantityInStock >= 0)
);

CREATE TABLE ORDERS (
    OrderNumber INT PRIMARY KEY,
    CustomerNumber INT NOT NULL,
    EmployeeName VARCHAR(100),
    DateOfReceipt DATE NOT NULL,
    ExpectedShipDate DATE,
    ActualShipDate DATE,
    FOREIGN KEY (CustomerNumber) REFERENCES CUSTOMER(CustomerNumber),
    CONSTRAINT chk_dates CHECK (ExpectedShipDate >= DateOfReceipt),
    CONSTRAINT chk_actual_ship CHECK (ActualShipDate >= DateOfReceipt)
);



CREATE TABLE ORDER_LINE (
    OrderNumber INT,
    PartNumber INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderNumber, PartNumber),
    FOREIGN KEY (OrderNumber) REFERENCES ORDERS(OrderNumber) ON DELETE CASCADE,
    FOREIGN KEY (PartNumber) REFERENCES PART(PartNumber),
    CONSTRAINT chk_quantity CHECK (Quantity > 0)
);