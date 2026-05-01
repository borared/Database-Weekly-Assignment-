DROP DATABASE IF EXISTS bike_rental_db;
CREATE DATABASE bike_rental_db;
USE bike_rental_db;


-- DDL 


CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    gender ENUM('Male','Female','Other'),
    DOB DATE,
    address VARCHAR(255),
    phone_number VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    type VARCHAR(50)
);

CREATE TABLE Partnership (
    partnership_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(30),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    joinDate DATE,
    commissionRate DECIMAL(5,2) DEFAULT 75.00,
    address VARCHAR(255),
    type VARCHAR(50)
);

CREATE TABLE Bike (
    bike_id INT AUTO_INCREMENT PRIMARY KEY,
    partnership_id INT,
    location_id INT,
    brand VARCHAR(50),
    model VARCHAR(50),
    type VARCHAR(50),
    category ENUM('Bicycle','Motorbike'),
    rentalRate DECIMAL(10,2),
    bike_condition VARCHAR(50),
    status VARCHAR(30),
    FOREIGN KEY (partnership_id) REFERENCES Partnership(partnership_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    bike_id INT,
    partnership_id INT,
    location_id INT,
    startTime DATETIME,
    pickupDate DATE,
    duration INT,
    expected_returnDate DATE,
    actualReturnDate DATE,
    extraCharge DECIMAL(10,2) DEFAULT 0,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (bike_id) REFERENCES Bike(bike_id),
    FOREIGN KEY (partnership_id) REFERENCES Partnership(partnership_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT UNIQUE,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    commission_rate DECIMAL(5,2),
    commission_amount DECIMAL(10,2),
    platform_amount DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Technician (
    technician_id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    bike_id INT,
    technician_id INT,
    maintenance_date DATE,
    description VARCHAR(255),
    status VARCHAR(30),
    FOREIGN KEY (bike_id) REFERENCES Bike(bike_id),
    FOREIGN KEY (technician_id) REFERENCES Technician(technician_id)
);


-- DML 


INSERT INTO Customer VALUES
(NULL,'Ali','Tan','Male','2000-01-01','KL','0111111111','ali@gmail.com'),
(NULL,'Sara','Lim','Female','1999-02-02','Penang','0111111112','sara@gmail.com'),
(NULL,'John','Lee','Male','1998-03-03','Johor','0111111113','john@gmail.com'),
(NULL,'Mei','Wong','Female','2001-04-04','Sabah','0111111114','mei@gmail.com'),
(NULL,'David','Chan','Male','1997-05-05','Perak','0111111115','david@gmail.com'),
(NULL,'Lily','Ng','Female','1996-06-06','Melaka','0111111116','lily@gmail.com'),
(NULL,'Noah','Lim','Male','2002-07-07','KL','0111111117','noah@gmail.com'),
(NULL,'Emma','Tan','Female','2003-08-08','Selangor','0111111118','emma@gmail.com'),
(NULL,'Aliya','Rahman','Female','1995-09-09','Kelantan','0111111119','aliya@gmail.com'),
(NULL,'Zack','Yeo','Male','1994-10-10','Sarawak','0111111120','zack@gmail.com');

INSERT INTO Location VALUES
(NULL,'KL Sentral','Kuala Lumpur','Main'),
(NULL,'Sunway','Selangor','Branch'),
(NULL,'Penang Hub','Penang','Branch'),
(NULL,'JB Center','Johor','Branch'),
(NULL,'Ipoh Station','Perak','Branch'),
(NULL,'Melaka Point','Melaka','Branch'),
(NULL,'KK Plaza','Sabah','Branch'),
(NULL,'Kuching Hub','Sarawak','Branch'),
(NULL,'Cyberjaya','Selangor','Branch'),
(NULL,'Putrajaya','Putrajaya','Branch');

INSERT INTO Partnership(status,phone_number,email,joinDate,address,type) VALUES
('Active','012000001','p1@gmail.com','2024-01-01','KL','Company'),
('Active','012000002','p2@gmail.com','2024-01-02','Selangor','Company'),
('Active','012000003','p3@gmail.com','2024-01-03','Johor','Individual'),
('Active','012000004','p4@gmail.com','2024-01-04','Penang','Company'),
('Active','012000005','p5@gmail.com','2024-01-05','Perak','Company'),
('Active','012000006','p6@gmail.com','2024-01-06','Sabah','Individual'),
('Active','012000007','p7@gmail.com','2024-01-07','Sarawak','Company'),
('Active','012000008','p8@gmail.com','2024-01-08','KL','Company'),
('Active','012000009','p9@gmail.com','2024-01-09','Putrajaya','Company'),
('Active','012000010','p10@gmail.com','2024-01-10','Cyberjaya','Company');

INSERT INTO Bike VALUES
(NULL,1,1,'Giant','Escape','Hybrid','Bicycle',25,'Good','Available'),
(NULL,2,2,'Trek','FX','Hybrid','Bicycle',30,'Good','Available'),
(NULL,3,3,'Specialized','Rockhopper','Mountain','Bicycle',35,'Good','Available'),
(NULL,4,4,'Polygon','Heist','Hybrid','Bicycle',28,'Good','Available'),
(NULL,5,5,'Cannondale','Quick','Road','Bicycle',32,'Good','Available'),
(NULL,6,6,'Honda','Wave','Scooter','Motorbike',80,'Good','Available'),
(NULL,7,7,'Yamaha','R15','Sport','Motorbike',120,'Good','Available'),
(NULL,8,8,'Kawasaki','Ninja','Sport','Motorbike',150,'Good','Available'),
(NULL,9,9,'Suzuki','GSX','Sport','Motorbike',130,'Good','Available'),
(NULL,10,10,'Modenas','Kriss','Standard','Motorbike',70,'Good','Available');

INSERT INTO Booking VALUES
(NULL,1,1,1,1,'2024-06-01 09:00:00','2024-06-01',1,'2024-06-02','2024-06-02',0,'Completed'),
(NULL,2,2,2,2,'2024-06-02 10:00:00','2024-06-02',2,'2024-06-04','2024-06-04',5,'Completed'),
(NULL,3,3,3,3,'2024-06-03 09:00:00','2024-06-03',1,'2024-06-04','2024-06-04',0,'Completed'),
(NULL,4,4,4,4,'2024-06-04 09:00:00','2024-06-04',1,'2024-06-05','2024-06-05',0,'Completed'),
(NULL,5,5,5,5,'2024-06-05 09:00:00','2024-06-05',2,'2024-06-07','2024-06-07',10,'Completed'),
(NULL,6,6,6,6,'2024-06-06 09:00:00','2024-06-06',1,'2024-06-07','2024-06-07',0,'Completed'),
(NULL,7,7,7,7,'2024-06-07 09:00:00','2024-06-07',1,'2024-06-08','2024-06-08',0,'Completed'),
(NULL,8,8,8,8,'2024-06-08 09:00:00','2024-06-08',2,'2024-06-10','2024-06-10',0,'Completed'),
(NULL,9,9,9,9,'2024-06-09 09:00:00','2024-06-09',1,'2024-06-10','2024-06-10',15,'Completed'),
(NULL,10,10,10,10,'2024-06-10 09:00:00','2024-06-10',1,'2024-06-11','2024-06-11',0,'Completed');


INSERT INTO Payment
(booking_id,payment_date,payment_method,amount,commission_rate,commission_amount,platform_amount,status)
SELECT
b.booking_id,
CURDATE(),
'Card',
(bk.rentalRate*b.duration)+b.extraCharge,
p.commissionRate,
((bk.rentalRate*b.duration)+b.extraCharge)*p.commissionRate/100,
((bk.rentalRate*b.duration)+b.extraCharge)*(100-p.commissionRate)/100,
'Paid'
FROM Booking b
JOIN Bike bk ON b.bike_id=bk.bike_id
JOIN Partnership p ON b.partnership_id=p.partnership_id;

select * from Payment;



-- DQL 

-- All customers
SELECT * FROM Customer;

-- Available bikes
SELECT * FROM Bike WHERE status='Available';

-- Booking history
SELECT c.firstName, b.booking_id, b.status
FROM Customer c
JOIN Booking b ON c.customer_id=b.customer_id;

-- Payment report
SELECT * FROM Payment;

-- Company profit
SELECT SUM(platform_amount) AS Total_Profit FROM Payment;

-- Partner payout
SELECT SUM(commission_amount) AS Total_Payout FROM Payment;

-- Most expensive bikes
SELECT * FROM Bike ORDER BY rentalRate DESC;

-- Customer spending
SELECT c.firstName, SUM(p.amount) AS TotalSpent
FROM Payment p
JOIN Booking b ON p.booking_id=b.booking_id
JOIN Customer c ON b.customer_id=c.customer_id
GROUP BY c.customer_id
ORDER BY TotalSpent DESC;