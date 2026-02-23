create database MAIL_ORDER;
use MAIL_ORDER;

CREATE TABLE CUSTOMER (
    CustomerNumber INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10)
);

CREATE TABLE PART (
    PartNumber INT PRIMARY KEY,
    PartName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT DEFAULT 0
);

CREATE TABLE ORDERS (
    OrderNumber INT PRIMARY KEY,
    CustomerNumber INT,
    EmployeeName VARCHAR(100),
    DateOfReceipt DATE NOT NULL,
    ExpectedShipDate DATE,
    ActualShipDate DATE,
    FOREIGN KEY (CustomerNumber) REFERENCES CUSTOMER(CustomerNumber)
);

CREATE TABLE ORDER_LINE (
    OrderNumber INT,
    PartNumber INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderNumber, PartNumber),
    FOREIGN KEY (OrderNumber) REFERENCES ORDERS(OrderNumber),
    FOREIGN KEY (PartNumber) REFERENCES PART(PartNumber)
);
