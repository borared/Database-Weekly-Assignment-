CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

-- 1. Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

-- 2. Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(255)
);

-- 3. Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    department_id INT,
    
    FOREIGN KEY (department_id) 
    REFERENCES Departments(department_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- 4. Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- 5. Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled',

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (doctor_id)
    REFERENCES Doctors(doctor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 6. Medical Records Table
CREATE TABLE Medical_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT, 
    diagnosis TEXT NOT NULL,
    treatment TEXT,
    record_date DATE NOT NULL,

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (doctor_id)
    REFERENCES Doctors(doctor_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE
);

-- 7. Lab Tests Table
CREATE TABLE Lab_Tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    test_name VARCHAR(100) NOT NULL,
    result VARCHAR(255),
    test_date DATE NOT NULL,

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 8. Billing Table
CREATE TABLE Billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    payment_status ENUM('Paid','Pending','Cancelled') DEFAULT 'Pending',
    bill_date DATE NOT NULL,

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO Departments (department_name, location) VALUES
('Cardiology', 'Building A'),
('Neurology', 'Building B'),
('Pediatrics', 'Building C'),
('Orthopedics', 'Building D'),
('Dermatology', 'Building E'),
('Oncology', 'Building F'),
('Radiology', 'Building G'),
('Emergency', 'Building H'),
('Gynecology', 'Building I'),
('General Surgery', 'Building J');



INSERT INTO Patients (first_name, last_name, gender, date_of_birth, phone, address) VALUES
('John','Doe','Male','1990-05-12','100000001','Phnom Penh'),
('Sarah','Smith','Female','1985-08-20','100000002','Siem Reap'),
('David','Brown','Male','2000-01-10','100000003','Battambang'),
('Emily','Johnson','Female','1995-11-25','100000004','Phnom Penh'),
('Michael','Davis','Male','1988-02-14','100000005','Kampot'),
('Jessica','Miller','Female','1992-06-30','100000006','Takeo'),
('Daniel','Wilson','Male','1997-03-18','100000007','Kandal'),
('Sophia','Moore','Female','2001-07-09','100000008','Phnom Penh'),
('James','Taylor','Male','1983-12-22','100000009','Siem Reap'),
('Olivia','Anderson','Female','1999-09-15','100000010','Battambang');


INSERT INTO Doctors (first_name, last_name, specialization, phone, department_id) VALUES
('Michael','Lee','Cardiologist','200000001',1),
('Anna','Kim','Neurologist','200000002',2),
('Robert','Wilson','Pediatrician','200000003',3),
('Sophia','Taylor','Orthopedic Surgeon','200000004',4),
('William','Clark','Dermatologist','200000005',5),
('Emma','Lewis','Oncologist','200000006',6),
('Oliver','Walker','Radiologist','200000007',7),
('Ava','Hall','Emergency Specialist','200000008',8),
('Ethan','Allen','Gynecologist','200000009',9),
('Isabella','Young','General Surgeon','200000010',10);



INSERT INTO Staff (first_name, last_name, role, phone, department_id) VALUES
('James','Clark','Nurse','300000001',1),
('Linda','White','Receptionist','300000002',2),
('Daniel','Hall','Lab Technician','300000003',3),
('Karen','Young','Pharmacist','300000004',4),
('Brian','King','Nurse','300000005',5),
('Laura','Scott','Administrator','300000006',6),
('Kevin','Green','Lab Technician','300000007',7),
('Nancy','Adams','Receptionist','300000008',8),
('Steven','Baker','Nurse','300000009',9),
('Angela','Nelson','Pharmacist','300000010',10);


INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1,1,'2026-03-15 09:00:00','Scheduled'),
(2,2,'2026-03-15 10:30:00','Completed'),
(3,3,'2026-03-16 11:00:00','Scheduled'),
(4,4,'2026-03-16 14:00:00','Cancelled'),
(5,5,'2026-03-17 09:30:00','Completed'),
(6,6,'2026-03-17 11:15:00','Scheduled'),
(7,7,'2026-03-18 13:00:00','Scheduled'),
(8,8,'2026-03-18 15:00:00','Completed'),
(9,9,'2026-03-19 10:00:00','Scheduled'),
(10,10,'2026-03-19 16:00:00','Scheduled');



INSERT INTO Medical_Records (patient_id, doctor_id, diagnosis, treatment, record_date) VALUES
(1,1,'High Blood Pressure','Medication prescribed','2026-03-15'),
(2,2,'Migraine','Pain relief medication','2026-03-15'),
(3,3,'Flu','Rest and hydration','2026-03-16'),
(4,4,'Fractured Arm','Arm cast applied','2026-03-16'),
(5,5,'Skin Allergy','Antihistamine treatment','2026-03-17'),
(6,6,'Cancer Screening','Further testing required','2026-03-17'),
(7,7,'Chest Scan','Normal result','2026-03-18'),
(8,8,'Minor Injury','Bandage applied','2026-03-18'),
(9,9,'Pregnancy Checkup','Routine monitoring','2026-03-19'),
(10,10,'Appendicitis','Surgery scheduled','2026-03-19');



INSERT INTO Lab_Tests (patient_id, test_name, result, test_date) VALUES
(1,'Blood Test','Normal','2026-03-15'),
(2,'MRI Scan','Minor abnormality','2026-03-15'),
(3,'COVID Test','Negative','2026-03-16'),
(4,'X-Ray','Fracture detected','2026-03-16'),
(5,'Allergy Test','Positive','2026-03-17'),
(6,'Biopsy','Pending','2026-03-17'),
(7,'CT Scan','Normal','2026-03-18'),
(8,'Blood Sugar','High','2026-03-18'),
(9,'Ultrasound','Normal','2026-03-19'),
(10,'Urine Test','Normal','2026-03-19');



INSERT INTO Billing (patient_id, total_amount, payment_status, bill_date) VALUES
(1,120.50,'Paid','2026-03-15'),
(2,250.00,'Pending','2026-03-15'),
(3,80.00,'Paid','2026-03-16'),
(4,300.75,'Pending','2026-03-16'),
(5,150.00,'Paid','2026-03-17'),
(6,500.00,'Pending','2026-03-17'),
(7,200.00,'Paid','2026-03-18'),
(8,175.50,'Pending','2026-03-18'),
(9,220.00,'Paid','2026-03-19'),
(10,450.00,'Pending','2026-03-19');

-- Show all patient appointments with doctor names
SELECT 
    Patients.first_name AS patient_first_name,
    Patients.last_name AS patient_last_name,
    Doctors.first_name AS doctor_first_name,
    Doctors.last_name AS doctor_last_name,
    Appointments.appointment_date,
    Appointments.status
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.patient_id
JOIN Doctors ON Appointments.doctor_id = Doctors.doctor_id;


-- Count how many patients each doctor has treated
SELECT 
    Doctors.first_name,
    Doctors.last_name,
    COUNT(Medical_Records.record_id) AS total_patients
FROM Doctors
JOIN Medical_Records ON Doctors.doctor_id = Medical_Records.doctor_id
GROUP BY Doctors.doctor_id;


-- Show doctors who treated more than 1 patient
SELECT 
    Doctors.first_name,
    Doctors.last_name,
    COUNT(Medical_Records.record_id) AS patient_count
FROM Doctors
JOIN Medical_Records ON Doctors.doctor_id = Medical_Records.doctor_id
GROUP BY Doctors.doctor_id
HAVING COUNT(Medical_Records.record_id) > 1;


-- Find patients who have bills greater than the average bill
SELECT 
    patient_id,
    total_amount
FROM Billing
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Billing
);



-- Show patient medical history with doctor and department
SELECT 
    Patients.first_name AS patient_name,
    Doctors.first_name AS doctor_name,
    Departments.department_name,
    Medical_Records.diagnosis,
    Medical_Records.treatment,
    Medical_Records.record_date
FROM Medical_Records
JOIN Patients ON Medical_Records.patient_id = Patients.patient_id
JOIN Doctors ON Medical_Records.doctor_id = Doctors.doctor_id
JOIN Departments ON Doctors.department_id = Departments.department_id;
