CREATE DATABASE google_calendar;
USE google_calendar;

CREATE TABLE USER (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nickname VARCHAR(50),
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other')
);


 CREATE TABLE EVENT (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    event_name VARCHAR(150) NOT NULL,
    description TEXT,
    event_location VARCHAR(200),
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    google_meet_link VARCHAR(255),
    notify_before INT,
    
    FOREIGN KEY (user_id) REFERENCES USER(user_id)
    ON DELETE CASCADE,
    
    CHECK (end_datetime >= start_datetime)
);



CREATE TABLE PROFILE_IMAGE (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES USER(user_id)
    ON DELETE CASCADE
);


INSERT INTO USER (name, nickname, email, password, phone_number, dob, gender)
VALUES 
('John Smith', 'johnny', 'john@example.com', 'password123', '1234567890', '2005-06-15', 'Male'),
('Emily Davis', 'em', 'emily@example.com', 'mypassword456', '0987654321', '2006-02-20', 'Female');



INSERT INTO EVENT 
(user_id, event_name, description, event_location, start_datetime, end_datetime, start_time, end_time, google_meet_link, notify_before)
VALUES
(1, 'Math Study Group', 'Prepare for algebra test', 'Library Room 2', '2026-03-01', '2026-03-02', '15:00:00', '17:00:00', 'https://meet.google.com/abc-xyz', 30),

(2, 'Birthday Party', 'Emily’s 20th Birthday Celebration', 'Emily’s House', '2026-03-05', '18:00:00', '22:00:00', NULL, 60);



INSERT INTO PROFILE_IMAGE (image_url, user_id)
VALUES
('https://example.com/images/john.jpg', 1),
('https://example.com/images/emily.jpg', 2);


ALTER TABLE EVENT
ADD CONSTRAINT chk_time
CHECK (end_time > start_time);

SELECT * FROM USER;
SELECT * FROM EVENT;
SELECT * FROM PROFILE_IMAGE;

update EVENT
set end_time = "20:00:00"
where event_id = 1;






