CREATE DATABASE IF NOT EXISTS NaekWatch_Movie_Streaming;
USE NaekWatch_Movie_Streaming;


-- 1. ACCOUNTS
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(20),
    date_of_birth DATE,
    total_points INT DEFAULT 0 CHECK (total_points >= 0),
    last_watch_content_id INT NULL,
    last_watch_position INT DEFAULT 0 CHECK (last_watch_position >= 0),
    account_status ENUM('PENDING','ACTIVE','SUSPENDED','BANNED') DEFAULT 'PENDING',
    last_login_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

INSERT INTO accounts(email,password_hash,username,first_name,last_name,phone_number,date_of_birth,total_points,account_status)
VALUES
('user1@mail.com','hash1','IronMan','Tony','Stark','0854693147','1980-01-01',5000,'ACTIVE'),
('user2@mail.com','hash2','Captain','Steve','Rogers','089394991','1981-01-01',3000,'ACTIVE'),
('user3@mail.com','hash3','Hulk','Bruce','Banner','081323681','1982-01-01',2000,'ACTIVE'),
('user4@mail.com','hash4','Widow','Natasha','Romanoff','012859743','1983-01-01',4500,'ACTIVE'),
('user5@mail.com','hash5','Thor','Thor','Odinson','0114596325','1984-01-01',3000,'ACTIVE'),
('user6@mail.com','hash6','Scarlet','Wanda','Maximoff','016785236','1985-01-01',6000,'ACTIVE'),
('user7@mail.com','hash7','Vision','Vision','AI','015897532','1986-01-01',3500,'ACTIVE'),
('user8@mail.com','hash8','Hawkeye','Clint','Barton','017852146','1987-01-01',2000,'ACTIVE'),
('user9@mail.com','hash9','Spiderman','Peter','Parker','089963654','2001-01-01',1200,'ACTIVE'),
('user10@mail.com','hash10','Strange','Stephen','Strange','089963652','1978-01-01',900,'ACTIVE'),
('user11@mail.com','hash11','User11','John','Doe','089963650','1995-01-01',1000,'ACTIVE'),
('user12@mail.com','hash12','User12','Jane','Smith','089963651','1996-01-01',1500,'ACTIVE'),
('user13@mail.com','hash13','User13','Mike','Lee','089963648','1997-01-01',1800,'ACTIVE'),
('user14@mail.com','hash14','User14','Anna','Kim','089963674','1998-01-01',2000,'ACTIVE'),
('user15@mail.com','hash15','User15','David','Park','089963699','1999-01-01',2200,'ACTIVE');


-- 2. CONTENT (With Rating & Price Constraints)
CREATE TABLE content (
    content_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type ENUM('movie','series') NOT NULL,
    director VARCHAR(255),
    year YEAR,
    rating DECIMAL(3,1) CHECK (rating >= 0 AND rating <= 10),
    duration_minutes INT CHECK (duration_minutes > 0),
    content_description TEXT,
    poster_url VARCHAR(500),
    price DECIMAL(10,2) DEFAULT 0.00 CHECK (price >= 0)
);

INSERT INTO content(title,type,director,year,rating,duration_minutes,content_description,poster_url,price)
VALUES
('Avengers Infinity War','movie','Russo Brothers',2018,8.4,149,'Marvel battle','url1',5.99),
('The Dark Knight','movie','Christopher Nolan',2008,9.0,152,'Batman Joker','url2',4.99),
('Inception','movie','Christopher Nolan',2010,8.8,148,'Dream thriller','url3',4.99),
('Interstellar','movie','Christopher Nolan',2014,8.7,169,'Space travel','url4',5.99),
('Spider-Man No Way Home','movie','Jon Watts',2021,8.2,148,'Multiverse','url5',6.99),
('Joker','movie','Todd Phillips',2019,8.4,122,'Dark DC','url6',5.99),
('Avatar','movie','James Cameron',2009,7.8,162,'Pandora world','url7',4.99),
('Titanic','movie','James Cameron',1997,7.9,195,'Love story','url8',3.99),
('Top Gun Maverick','movie','Joseph Kosinski',2022,8.3,130,'Jet action','url9',6.99),
('Doctor Strange','movie','Scott Derrickson',2016,7.5,115,'Magic hero','url10',4.99),
('LOKI','series','Michael Waldron',2021,8.2,45,'Marvel timeline','url11',0),
('Stranger Things','series','Duffer Brothers',2016,8.7,50,'Supernatural','url12',0),
('Breaking Bad','series','Vince Gilligan',2008,9.5,47,'Crime drama','url13',0),
('The Mandalorian','series','Jon Favreau',2019,8.7,40,'Star Wars','url14',0),
('Game of Thrones','series','David Benioff',2011,9.2,60,'Fantasy war','url15',0);


-- 3. GENRES
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO genres(genre_name) VALUES
('Action'),('Adventure'),('Sci-Fi'),('Drama'),('Comedy'),
('Fantasy'),('Animation'),('Mystery'),('Horror'),('Crime'),
('Romance'),('Thriller'),('History'),('War'),('Trending');


-- 4. ACTORS
CREATE TABLE actors(
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL
);

INSERT INTO actors(actor_name) VALUES
('Robert Downey Jr'),('Chris Evans'),('Scarlett Johansson'),('Chris Hemsworth'),
('Tom Holland'),('Leonardo DiCaprio'),('Matthew McConaughey'),('Christian Bale'),
('Heath Ledger'),('Joaquin Phoenix'),('Pedro Pascal'),('Millie Bobby Brown'),
('Bryan Cranston'),('Henry Cavill'),('Jenna Ortega');


-- 5. CONTENT GENRES (linked with movie and tv-show)
CREATE TABLE content_genres(
    content_id INT,
    genre_id INT,
    PRIMARY KEY(content_id,genre_id),
    FOREIGN KEY(content_id) REFERENCES content(content_id) ON DELETE CASCADE,
    FOREIGN KEY(genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE
);

INSERT INTO content_genres VALUES
(1,1),(1,2),(2,1),(2,10),(3,3),(4,3),(5,1),(6,4),(7,6),(8,11),
(9,1),(10,3),(11,3),(12,8),(13,10);


-- 6. CONTENT ACTORS (Linked with content)
CREATE TABLE content_actors(
    content_id INT,
    actor_id INT,
    PRIMARY KEY(content_id,actor_id),
    FOREIGN KEY(content_id) REFERENCES content(content_id) ON DELETE CASCADE,
    FOREIGN KEY(actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE
);

INSERT INTO content_actors VALUES
(1,1),(1,2),(1,3),(5,5),(3,6),(4,7),(2,8),(2,9),(6,10),(14,11),
(12,12),(13,13),(7,6),(15,15),(10,4);


-- 7. MOVIE PURCHASES
CREATE TABLE movie_purchases(
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    content_id INT NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL CHECK (amount_paid >= 0),
    payment_status ENUM('PENDING','COMPLETED','FAILED','REFUNDED') DEFAULT 'PENDING',
    transaction_id VARCHAR(100) UNIQUE,
    purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id),
    FOREIGN KEY(content_id) REFERENCES content(content_id)
);

INSERT INTO movie_purchases(account_id,content_id,amount_paid,payment_status,transaction_id)
VALUES
(1,1,5.99,'COMPLETED','TXN001'),(2,2,4.99,'COMPLETED','TXN002'),
(3,3,4.99,'COMPLETED','TXN003'),(4,4,5.99,'COMPLETED','TXN004'),
(5,5,6.99,'COMPLETED','TXN005'),(6,6,5.99,'COMPLETED','TXN006'),
(7,7,4.99,'COMPLETED','TXN007'),(8,8,3.99,'COMPLETED','TXN008'),
(9,9,6.99,'COMPLETED','TXN009'),(10,10,4.99,'COMPLETED','TXN010'),
(11,1,5.99,'COMPLETED','TXN011'),(12,2,4.99,'COMPLETED','TXN012'),
(13,3,4.99,'COMPLETED','TXN013'),(14,4,5.99,'COMPLETED','TXN014'),
(15,5,6.99,'COMPLETED','TXN015');


-- 8. WATCH HISTORY
CREATE TABLE watch_history(
    watch_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    content_id INT NOT NULL,
    watched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY(content_id) REFERENCES content(content_id) ON DELETE CASCADE
);

INSERT INTO watch_history(account_id,content_id)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15);


-- 9. WATCHLIST 
CREATE TABLE watchlist(
    watchlist_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    content_id INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(account_id, content_id),
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY(content_id) REFERENCES content(content_id) ON DELETE CASCADE
);

INSERT INTO watchlist(account_id,content_id)
VALUES
(1,5),(2,6),(3,7),(4,8),(5,9),(6,10),(7,11),(8,12),(9,13),(10,14),
(11,15),(12,1),(13,2),(14,3),(15,4);


-- 10. TASK
CREATE TABLE Task(
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(100) NOT NULL,
    description TEXT,
    required_movie_count INT NOT NULL CHECK (required_movie_count > 0),
    reward_points INT NOT NULL CHECK (reward_points >= 0),
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Task(task_name,description,required_movie_count,reward_points)
VALUES
('Watch 2 Movies','Complete 2 movies',2,100),
('Watch 5 Movies','Complete 5 movies',5,300),
('Watch 10 Movies','Complete 10 movies',10,600),
('Watch Action Movie','Watch 1 action',1,50),
('Watch Series','Watch 1 series',1,80),
('Weekend Viewer','Watch weekend',2,120),
('Night Watcher','Watch at night',3,150),
('Movie Lover','Watch 20 movies',20,1200),
('SciFi Fan','Watch SciFi',3,200),
('Marvel Fan','Watch Marvel',4,250),
('Drama Watch','Watch drama',2,100),
('Mystery Watch','Watch mystery',2,100),
('Comedy Night','Watch comedy',2,100),
('Thriller Time','Watch thriller',2,100),
('Fantasy Quest','Watch fantasy',2,100);


-- 11. USER TASKS
CREATE TABLE User_Tasks(
    user_task_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    task_id INT NOT NULL,
    progress INT DEFAULT 0 CHECK (progress >= 0),
    task_status ENUM('in_progress','completed','expired') DEFAULT 'in_progress',
    start_date DATE NOT NULL,
    completion_date DATE,
    FOREIGN KEY(account_id) REFERENCES accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY(task_id) REFERENCES Task(task_id) ON DELETE CASCADE
);

INSERT INTO User_Tasks(account_id,task_id,progress,task_status,start_date)
VALUES
(1,1,2,'completed','2026-01-01'),(2,2,3,'in_progress','2026-01-02'),
(3,3,5,'in_progress','2026-01-03'),(4,4,1,'completed','2026-01-04'),
(5,5,1,'completed','2026-01-05'),(6,6,2,'completed','2026-01-06'),
(7,7,1,'in_progress','2026-01-07'),(8,8,4,'in_progress','2026-01-08'),
(9,9,2,'completed','2026-01-09'),(10,10,3,'in_progress','2026-01-10'),
(11,11,2,'completed','2026-01-11'),(12,12,3,'completed','2026-01-12'),
(13,13,1,'in_progress','2026-01-13'),(14,14,2,'completed','2026-01-14'),
(15,15,1,'completed','2026-01-15');

-- ===============================
-- 12. PRODUCT (With Stock Constraints)
-- ===============================
CREATE TABLE Product(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    points_required INT NOT NULL CHECK (points_required > 0),
    stock INT DEFAULT 0 CHECK (stock >= 0)
);

INSERT INTO Product(product_name,description,points_required,stock)
VALUES
('Anime Hoodie','Cool hoodie',1200,10),('Superman Keychain','DC keychain',300,50),
('Premium Cap','NaekWatch cap',800,20),('Movie Poster','Poster',600,15),
('Metal Bottle','Bottle',1200,30),('Funko Pop','Figure',1500,5),
('Marvel Shirt','T-Shirt',1000,25),('Sticker Pack','Stickers',150,100),
('Mousepad','Gaming pad',700,40),('NaekWatch Mug','Mug',400,30),
('Thor Keychain','Marvel keychain',250,50),('Batman Hoodie','DC hoodie',1300,10),
('Notebook','Movie notebook',350,40),('Backpack','Bag',1600,15),
('Phone Case','Case',650,35);

-- ===============================
-- 13. REDEMPTIONS
-- ===============================
CREATE TABLE Redemptions(
    redemption_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    product_id INT NOT NULL,
    points_used INT NOT NULL CHECK (points_used >= 0),
    redemption_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending','approved','rejected') DEFAULT 'pending',
    FOREIGN KEY(account_id) REFERENCES accounts(account_id),
    FOREIGN KEY(product_id) REFERENCES Product(product_id)
);

INSERT INTO Redemptions(account_id,product_id,points_used,status)
VALUES
(1,1,1200,'approved'),(2,2,300,'approved'),(3,3,800,'approved'),
(4,4,600,'approved'),(5,5,1200,'approved'),(6,6,1500,'pending'),
(7,7,1000,'approved'),(8,8,150,'approved'),(9,9,700,'pending'),
(10,10,400,'approved'),(11,11,250,'approved'),(12,12,1300,'pending'),
(13,13,350,'approved'),(14,14,1600,'approved'),(15,15,650,'approved');


-- Scenario 


-- INNER JOIN: Get account details with their movie purchases
SELECT 
    a.username,
    a.email,
    c.title AS movie_title,
    mp.amount_paid,
    mp.purchased_at
FROM accounts a
INNER JOIN movie_purchases mp ON a.account_id = mp.account_id
INNER JOIN content c ON mp.content_id = c.content_id
WHERE c.type = 'movie'
ORDER BY mp.purchased_at DESC;


-- LEFT JOIN: All accounts with their watch history
SELECT 
    a.username,
    a.email,
    c.title AS content_watched,
    wh.watched_at
FROM accounts a
LEFT JOIN watch_history wh ON a.account_id = wh.account_id
LEFT JOIN content c ON wh.content_id = c.content_id
ORDER BY a.username, wh.watched_at;


-- RIGHT JOIN: All content with users who watched (including unwatched content)
SELECT 
    c.title,
    c.type,
    a.username,
    wh.watched_at
FROM watch_history wh
RIGHT JOIN content c ON wh.content_id = c.content_id
LEFT JOIN accounts a ON wh.account_id = a.account_id
ORDER BY c.title, wh.watched_at;


-- FULL OUTER JOIN simulation: All users and all content interactions
SELECT 
    a.username,
    c.title AS content_title,
    'Purchased' AS interaction_type,
    mp.purchased_at AS interaction_date
FROM accounts a
LEFT JOIN movie_purchases mp ON a.account_id = mp.account_id
LEFT JOIN content c ON mp.content_id = c.content_id
WHERE mp.purchase_id IS NOT NULL

UNION ALL

SELECT 
    a.username,
    c.title AS content_title,
    'Watched' AS interaction_type,
    wh.watched_at AS interaction_date
FROM accounts a
LEFT JOIN watch_history wh ON a.account_id = wh.account_id
LEFT JOIN content c ON wh.content_id = c.content_id
WHERE wh.watch_id IS NOT NULL

ORDER BY username, interaction_date;


-- GROUP BY: Calculate total spending per user
SELECT 
    a.username,
    a.email,
    COUNT(mp.purchase_id) AS movies_purchased,
    SUM(mp.amount_paid) AS total_spent,
    AVG(mp.amount_paid) AS avg_price_paid,
    MIN(mp.purchased_at) AS first_purchase,
    MAX(mp.purchased_at) AS last_purchase
FROM accounts a
LEFT JOIN movie_purchases mp ON a.account_id = mp.account_id
GROUP BY a.account_id, a.username, a.email
ORDER BY total_spent DESC;



-- HAVING: Find users who spent more than $15 and bought at least 3 movies
SELECT 
    a.username,
    COUNT(mp.purchase_id) AS purchase_count,
    SUM(mp.amount_paid) AS total_spent,
    ROUND(AVG(mp.amount_paid), 2) AS avg_spent
FROM accounts a
INNER JOIN movie_purchases mp ON a.account_id = mp.account_id
GROUP BY a.account_id, a.username
HAVING COUNT(mp.purchase_id) >= 3 
   AND SUM(mp.amount_paid) > 15
ORDER BY total_spent DESC;


-- CREATE: Add new movie to database
INSERT INTO content (
    title, 
    type, 
    director, 
    year, 
    rating, 
    duration_minutes, 
    content_description, 
    poster_url, 
    price
) VALUES (
    'Oppenheimer',
    'movie',
    'Christopher Nolan',
    2023,
    8.8,
    180,
    'The story of American scientist J. Robert Oppenheimer and the atomic bomb',
    'url_oppenheimer_2023',
    7.99
);



-- Find all action movies starring Robert Downey Jr.
SELECT a.actor_name, c.title, c.year, c.rating, c.duration_minutes
FROM content c
JOIN content_genres cg ON c.content_id = cg.content_id
JOIN genres g ON cg.genre_id = g.genre_id
JOIN content_actors ca ON c.content_id = ca.content_id
JOIN actors a ON ca.actor_id = a.actor_id
WHERE g.genre_name = 'Action'
  AND c.type = 'movie'
  AND a.actor_name = 'Robert Downey Jr';
  
  
  -- Check point balance and see redeemable items for a user (user ID = 1)
   -- Check point balance
SELECT username, total_points
FROM accounts
WHERE account_id = 1;
