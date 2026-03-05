-- Group Member:
-- Red Bora
-- Sophat Panhaseth
-- Soth Noreaksattya
-- Tep Kheng Meng Khim
-- Sopheap Souchhy

create database hr_db1;
use hr_db1;

CREATE TABLE IF NOT EXISTS `countries` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `COUNTR_REG_FK` (`REGION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `DEPT_MGR_FK` (`MANAGER_ID`),
  KEY `DEPT_LOCATION_IX` (`LOCATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `EMP_JOB_IX` (`JOB_ID`),
  KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `job_history` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  KEY `JHIST_JOB_IX` (`JOB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `JOB_ID` varchar(10) NOT NULL DEFAULT '',
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `LOCATION_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`),
  KEY `LOC_CITY_IX` (`CITY`),
  KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `REGION_ID` decimal(5,0) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`),
  UNIQUE KEY `sss` (`REGION_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO `countries` (`COUNTRY_ID`, `COUNTRY_NAME`, `REGION_ID`) VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');




INSERT INTO `locations` 
(`LOCATION_ID`, `STREET_ADDRESS`, `POSTAL_CODE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_ID`)
VALUES
(1000, '1297 Via Cola di Rie', '989', 'Roma', '', 'IT'),
(1100, '93091 Calle della Testa', '10934', 'Venice', '', 'IT'),
(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
(1300, '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP'),
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
(1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
(1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
(1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
(2000, '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN'),
(2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
(2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
(2300, '198 Clementi North', '540198', 'Singapore', '', 'SG'),
(2400, '8204 Arthur St', '', 'London', '', 'UK'),
(2500, 'Magdalen Centre, The Oxford', 'OX9 9ZB', 'Oxford', 'Ox', 'UK'),
(2600, '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
(2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
(2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
(3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
(3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');



INSERT INTO `departments`
(`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`)
VALUES
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(30, 'Purchasing', 114, 1700),
(40, 'Human Resources', 203, 2400),
(50, 'Shipping', 121, 1500),
(60, 'IT', 103, 1400),
(70, 'Public Relations', 204, 2700),
(80, 'Sales', 145, 2500),
(90, 'Executive', 100, 1700),
(100, 'Finance', 108, 1700),
(110, 'Accounting', 205, 1700),
(120, 'Treasury', 0, 1700),
(130, 'Corporate Tax', 0, 1700),
(140, 'Control And Credit', 0, 1700),
(150, 'Shareholder Services', 0, 1700),
(160, 'Benefits', 0, 1700),
(170, 'Manufacturing', 0, 1700),
(180, 'Construction', 0, 1700),
(190, 'Contracting', 0, 1700),
(200, 'Operations', 0, 1700),
(210, 'IT Support', 0, 1700),
(220, 'NOC', 0, 1700),
(230, 'IT Helpdesk', 0, 1700),
(240, 'Government Sales', 0, 1700),
(250, 'Retail Sales', 0, 1700),
(260, 'Recruiting', 0, 1700),
(270, 'Payroll', 0, 1700);



INSERT INTO `job_history`
(`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`)
VALUES
(102, '1993-01-13', '1998-07-24', 'IT_PROG', 60),
(101, '1989-09-21', '1993-10-27', 'AC_ACCOUNT', 110),
(101, '1993-10-28', '1997-03-15', 'AC_MGR', 110),
(201, '1996-02-17', '1999-12-19', 'MK_REP', 20),
(114, '1998-03-24', '1999-12-31', 'ST_CLERK', 50),
(122, '1999-01-01', '1999-12-31', 'ST_CLERK', 50),
(200, '1987-09-17', '1993-06-17', 'AD_ASST', 90),
(176, '1998-03-24', '1998-12-31', 'SA_REP', 80),
(176, '1999-01-01', '1999-12-31', 'SA_MAN', 80),
(200, '1994-07-01', '1998-12-31', 'AC_ACCOUNT', 90);



INSERT INTO `employees`
(`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`,
 `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`,
 `MANAGER_ID`, `DEPARTMENT_ID`)
VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', 17000.00, 0.00, 100, 90),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', 17000.00, 0.00, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', 9000.00, 0.00, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', 4800.00, 0.00, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', 4800.00, 0.00, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', 4200.00, 0.00, 103, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', 12000.00, 0.00, 101, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-26', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-27', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-28', 'FI_ACCOUNT', 7700.00, 0.00, 108, 100),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1987-06-29', 'FI_ACCOUNT', 7800.00, 0.00, 108, 100),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-30', 'FI_ACCOUNT', 6900.00, 0.00, 108, 100),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1987-07-01', 'PU_MAN', 11000.00, 0.00, 100, 30),
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1987-07-02', 'PU_CLERK', 3100.00, 0.00, 114, 30),
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1987-07-03', 'PU_CLERK', 2900.00, 0.00, 114, 30),
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1987-07-04', 'PU_CLERK', 2800.00, 0.00, 114, 30),
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1987-07-05', 'PU_CLERK', 2600.00, 0.00, 114, 30),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1987-07-06', 'PU_CLERK', 2500.00, 0.00, 114, 30),
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1987-07-07', 'ST_MAN', 8000.00, 0.00, 100, 50),
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1987-07-08', 'ST_MAN', 8200.00, 0.00, 100, 50),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1987-07-09', 'ST_MAN', 7900.00, 0.00, 100, 50),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1987-07-10', 'ST_MAN', 6500.00, 0.00, 100, 50),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1987-07-11', 'ST_MAN', 5800.00, 0.00, 100, 50),
(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1987-07-12', 'ST_CLERK', 3200.00, 0.00, 120, 50),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1987-07-13', 'ST_CLERK', 2700.00, 0.00, 120, 50),
(127, 'James', 'Landry', 'JLANDRY', '650.124.1334', '1987-07-14', 'ST_CLERK', 2400.00, 0.00, 120, 50),
(128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '1987-07-15', 'ST_CLERK', 2200.00, 0.00, 120, 50),
(129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1987-07-16', 'ST_CLERK', 3300.00, 0.00, 121, 50),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1987-07-17', 'ST_CLERK', 2800.00, 0.00, 121, 50),
(131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1987-07-18', 'ST_CLERK', 2500.00, 0.00, 121, 50),
(132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1987-07-19', 'ST_CLERK', 2100.00, 0.00, 121, 50),
(133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1987-07-20', 'ST_CLERK', 3300.00, 0.00, 122, 50),
(134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1987-07-21', 'ST_CLERK', 2900.00, 0.00, 122, 50),
(135, 'Ki', 'Gee', 'KGEE', '650.127.1734', '1987-07-22', 'ST_CLERK', 2400.00, 0.00, 122, 50),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '1987-07-23', 'ST_CLERK', 2200.00, 0.00, 122, 50),
(137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1987-07-24', 'ST_CLERK', 3600.00, 0.00, 123, 50),
(138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1987-07-25', 'ST_CLERK', 3200.00, 0.00, 123, 50),
(139, 'John', 'Seo', 'JSEO', '650.121.2019', '1987-07-26', 'ST_CLERK', 2700.00, 0.00, 123, 50),
(140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1987-07-27', 'ST_CLERK', 2500.00, 0.00, 123, 50),
(141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1987-07-28', 'ST_CLERK', 3500.00, 0.00, 124, 50),
(142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1987-07-29', 'ST_CLERK', 3100.00, 0.00, 124, 50),
(143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1987-07-30', 'ST_CLERK', 2600.00, 0.00, 124, 50),
(144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1987-07-31', 'ST_CLERK', 2500.00, 0.00, 124, 50),
(145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '1987-08-01', 'SA_MAN', 14000.00, 0.40, 100, 80),
(146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '1987-08-02', 'SA_MAN', 13500.00, 0.30, 100, 80),
(147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '1987-08-03', 'SA_MAN', 12000.00, 0.30, 100, 80),
(148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '1987-08-04', 'SA_MAN', 11000.00, 0.30, 100, 80),
(149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '1987-08-05', 'SA_MAN', 10500.00, 0.20, 100, 80),
(150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '1987-08-06', 'SA_REP', 10000.00, 0.30, 145, 80),
(151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1987-08-07', 'SA_REP', 9500.00, 0.25, 145, 80),
(152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1987-08-08', 'SA_REP', 9000.00, 0.25, 145, 80),
(153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1987-08-09', 'SA_REP', 8000.00, 0.20, 145, 80),
(154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1987-08-10', 'SA_REP', 7500.00, 0.20, 145, 80),
(155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1987-08-11', 'SA_REP', 7000.00, 0.15, 145, 80),
(156, 'Janette', 'King', 'JKING', '011.44.1345.429268', '1987-08-12', 'SA_REP', 10000.00, 0.35, 146, 80),
(157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1987-08-13', 'SA_REP', 9500.00, 0.35, 146, 80),
(158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1987-08-14', 'SA_REP', 9000.00, 0.35, 146, 80),
(159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1987-08-15', 'SA_REP', 8000.00, 0.30, 146, 80),
(160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1987-08-16', 'SA_REP', 7500.00, 0.30, 146, 80),
(161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1987-08-17', 'SA_REP', 7000.00, 0.25, 146, 80),
(162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1987-08-18', 'SA_REP', 10500.00, 0.25, 147, 80),
(163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1987-08-19', 'SA_REP', 9500.00, 0.15, 147, 80),
(164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '1987-08-20', 'SA_REP', 7200.00, 0.10, 147, 80),
(165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', '1987-08-21', 'SA_REP', 6800.00, 0.10, 147, 80),
(166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '1987-08-22', 'SA_REP', 6400.00, 0.10, 147, 80),
(167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '1987-08-23', 'SA_REP', 6200.00, 0.10, 147, 80),
(168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1987-08-24', 'SA_REP', 11500.00, 0.25, 148, 80),
(169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1987-08-25', 'SA_REP', 10000.00, 0.20, 148, 80),
(170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1987-08-26', 'SA_REP', 9600.00, 0.20, 148, 80),
(171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1987-08-27', 'SA_REP', 7400.00, 0.15, 148, 80),
(172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1987-08-28', 'SA_REP', 7300.00, 0.15, 148, 80),
(173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '1987-08-29', 'SA_REP', 6100.00, 0.10, 148, 80),
(174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1987-08-30', 'SA_REP', 11000.00, 0.30, 149, 80),
(175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1987-08-31', 'SA_REP', 8800.00, 0.25, 149, 80),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1987-09-01', 'SA_REP', 8600.00, 0.20, 149, 80),
(177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1987-09-02', 'SA_REP', 8400.00, 0.20, 149, 80),
(178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1987-09-03', 'SA_REP', 7000.00, 0.15, 149, 0),
(179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '1987-09-04', 'SA_REP', 6200.00, 0.10, 149, 80),
(180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1987-09-05', 'SH_CLERK', 3200.00, 0.00, 120, 50),
(181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1987-09-06', 'SH_CLERK', 3100.00, 0.00, 120, 50),
(182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1987-09-07', 'SH_CLERK', 2500.00, 0.00, 120, 50),
(183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '1987-09-08', 'SH_CLERK', 2800.00, 0.00, 120, 50),
(184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1987-09-09', 'SH_CLERK', 4200.00, 0.00, 121, 50),
(185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1987-09-10', 'SH_CLERK', 4100.00, 0.00, 121, 50),
(186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1987-09-11', 'SH_CLERK', 3400.00, 0.00, 121, 50),
(187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1987-09-12', 'SH_CLERK', 3000.00, 0.00, 121, 50),
(188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1987-09-13', 'SH_CLERK', 3800.00, 0.00, 122, 50),
(189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1987-09-14', 'SH_CLERK', 3600.00, 0.00, 122, 50),
(190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', '1987-09-15', 'SH_CLERK', 2900.00, 0.00, 122, 50),
(191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1987-09-16', 'SH_CLERK', 2500.00, 0.00, 122, 50),
(192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1987-09-17', 'SH_CLERK', 4000.00, 0.00, 123, 50),
(193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1987-09-18', 'SH_CLERK', 3900.00, 0.00, 123, 50),
(194, 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1987-09-19', 'SH_CLERK', 3200.00, 0.00, 123, 50),
(195, 'Vance', 'Jones', 'VJONES', '650.501.4876', '1987-09-20', 'SH_CLERK', 2800.00, 0.00, 123, 50),
(196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1987-09-21', 'SH_CLERK', 3100.00, 0.00, 124, 50),
(197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1987-09-22', 'SH_CLERK', 3000.00, 0.00, 124, 50),
(198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1987-09-23', 'SH_CLERK', 2600.00, 0.00, 124, 50),
(199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '1987-09-24', 'SH_CLERK', 2600.00, 0.00, 124, 50),
(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-25', 'AD_ASST', 4400.00, 0.00, 101, 10),
(201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1987-09-26', 'MK_MAN', 13000.00, 0.00, 100, 20),
(202, 'Pat', 'Fay', 'PFAY', '603.123.6666', '1987-09-27', 'MK_REP', 6000.00, 0.00, 201, 20),
(203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1987-09-28', 'HR_REP', 6500.00, 0.00, 101, 40),
(204, 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1987-09-29', 'PR_REP', 10000.00, 0.00, 101, 70),
(205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1987-09-30', 'AC_MGR', 12000.00, 0.00, 101, 110),
(206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1987-10-01', 'AC_ACCOUNT', 8300.00, 0.00, 205, 110);



INSERT INTO `jobs`
(`JOB_ID`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`)
VALUES
('AD_PRES', 'President', 20000, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('AD_ASST', 'Administration Assistant', 3000, 6000),
('FI_MGR', 'Finance Manager', 8200, 16000),
('FI_ACCOUNT', 'Accountant', 4200, 9000),
('AC_MGR', 'Accounting Manager', 8200, 16000),
('AC_ACCOUNT', 'Public Accountant', 4200, 9000),
('SA_MAN', 'Sales Manager', 10000, 20000),
('SA_REP', 'Sales Representative', 6000, 12000),
('PU_MAN', 'Purchasing Manager', 8000, 15000),
('PU_CLERK', 'Purchasing Clerk', 2500, 5500),
('ST_MAN', 'Stock Manager', 5500, 8500),
('ST_CLERK', 'Stock Clerk', 2000, 5000),
('SH_CLERK', 'Shipping Clerk', 2500, 5500),
('IT_PROG', 'Programmer', 4000, 10000),
('MK_MAN', 'Marketing Manager', 9000, 15000),
('MK_REP', 'Marketing Representative', 4000, 9000),
('HR_REP', 'Human Resources Representative', 4000, 9000),
('PR_REP', 'Public Relations Representative', 4500, 10500);


INSERT INTO `regions`
(`REGION_ID`, `REGION_NAME`)
VALUES
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asia'),
(4, 'Middle East and Africa');



-- SELECT COUNTRY_NAME, COUNTRY_ID, REGION_NAME
-- from countries N join regions R Using(REGION_ID);


-- SELECT DISTINCT REGION_NAME 
-- FROM regions;


-- To find out how many employees are in each department
-- SELECT 
--     d.DEPARTMENT_NAME, 
--     COUNT(e.EMPLOYEE_ID) AS Number_of_Employees
-- FROM departments d
-- LEFT JOIN employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
-- GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME
-- ORDER BY Number_of_Employees DESC;


-- To find out how many employees are in each country
-- SELECT 
--     c.COUNTRY_NAME, 
--     COUNT(e.EMPLOYEE_ID) AS Employee_Count
-- FROM countries c
-- JOIN locations l ON c.COUNTRY_ID = l.COUNTRY_ID
-- JOIN departments d ON l.LOCATION_ID = d.LOCATION_ID
-- JOIN employees e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
-- GROUP BY c.COUNTRY_ID, c.COUNTRY_NAME
-- ORDER BY Employee_Count DESC; 


-- 1. Retrieve all the employees.
select * from employees;


-- 2. Retrieve the first name, last name, job id and salary for each Employee.
SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM employees;


-- 3. Retrieve the full name of each employee.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS "Full Name"
FROM employees;


-- 4. Retrieve the location id of all departments.
SELECT DISTINCT LOCATION_ID FROM departments;


-- 5. Retrieve the Salary+300 for each employee.
SELECT FIRST_NAME, LAST_NAME, (SALARY + 300) AS "NEW SALARY" FROM employees;



-- 6. Retrieve all employees sorted by their total salary in descending order, if there are two 
-- employees have the same total salary, then sort them by first name in ascending order, 
-- then by their last name.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM employees
ORDER BY SALARY DESC;


-- 7. Retrieve all employees sorted by their total salary. Total salary = salary + salary * 
-- commission_pct
SELECT *, (SALARY + SALARY * IFNULL(COMMISSION_PCT, 0)) AS Total_Salary 
FROM employees 
ORDER BY Total_Salary;


-- 8. Retrieve the sum of the salaries of all employees, the maximum salary, the minimum 
-- salary, and the average salary.
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY) FROM employees;

-- 9. Retrieve the total number of employees in the company.
SELECT COUNT(EMPLOYEE_ID) FROM employees;


-- 10. Retrieve the number of employees who can earn a commission.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID  FROM employees WHERE COMMISSION_PCT > 0;

-- 11. Count the number of distinct salary values in the database.
SELECT  COUNT(DISTINCT SALARY) FROM employees;

-- 12.Write a query to get any employee who is from department ‘Executive’
select e.*, d.DEPARTMENT_NAME
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.DEPARTMENT_NAME = 'Executive';

-- 13.Write a query to get all employee who is working on department 50, 70, 90
select e.*, d.DEPARTMENT_ID
from employees e 
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.DEPARTMENT_ID IN (50, 70, 90);

-- 14.Retrieve the average of the Commissions of the employees.
select AVG(COMMISSION_PCT) from employees;


-- 15.Retrieve department Id and department name for each employee.
select e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME, d.DEPARTMENT_ID
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- 16.Retrieve region id and region name for each country.
select c.COUNTRY_NAME, r.REGION_ID, r.REGION_NAME
from countries c
join regions r
on c.REGION_ID = r.REGION_ID;

 -- 17.Retrieve country name for each department
select d.DEPARTMENT_NAME, c.COUNTRY_NAME
from departments d
join locations l
on d.LOCATION_ID = l.LOCATION_ID
join countries c
on l.COUNTRY_ID = c.COUNTRY_ID;


-- 18.Write a query to retrieve departments' names and cities for all departments that has 
-- more than 5 employees
select d.DEPARTMENT_NAME, l.CITY
from departments d
join locations l
on d.LOCATION_ID = l.LOCATION_ID
join employees e
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, l.CITY
having count(e.EMPLOYEE_ID) > 5;

-- 19.Write a query to get any employee who has salary greater than or equal to 10000
select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.SALARY
from employees e
where e.SALARY >= 10000;

-- 20.Write a query to find employee who has salary from 5K to 10K
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY from employees
where SALARY BETWEEN 5000 AND 10000;

-- 21.Retrieve job id and job name for each employee.
select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, j.JOB_ID, j.JOB_TITLE
from employees e
join jobs j
on e.JOB_ID = j.JOB_ID;

-- 22.Retrieve all employees who are working in department 30
select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_ID
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.DEPARTMENT_ID = "30";

-- 23.Retrieve all employees whose first name is “David”
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME from employees
where FIRST_NAME = "David";

-- 24.Retrieve all employees who are hired on 7/6/2002.
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE from employees
where HIRE_DATE = '2002-6-7';


-- 25. Write a query to retrieve employees whose job has minimum salary 4200 and maximum 
-- salary 9000.
select e.FIRST_NAME, e.LAST_NAME, j.MIN_SALARY, j.MAX_SALARY
from employees e
join jobs j
on e.JOB_ID = j.JOB_ID
where j.MIN_SALARY=4200 and j.MAX_SALARY=9000;


-- 26. Retrieve all employees sorted by their first name.
select * from employees
order by FIRST_NAME asc;

-- 27. Retrieve all employees whose first name starts with “A” and the third letter is “e”
select * from employees
where FIRST_NAME like 'A_e%';


-- 28. Retrieve the names of all employees whose salary between 5000 and 6000.
select * from employees 
where SALARY between 5000 and 6000;

-- 29. Retrieve all employees who are working in departments: 60, 90, or 100.
select e.*
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.DEPARTMENT_ID=60 or d.DEPARTMENT_ID=90 or d.DEPARTMENT_ID=100;

-- 30. Retrieve all employees who are working in departments 100 AND their salary is greater 
-- than ALL employees in department 60.
SELECT * FROM employees 
WHERE DEPARTMENT_ID = 100 AND SALARY > ALL (SELECT SALARY FROM employees WHERE DEPARTMENT_ID = 60);

-- 31. Retrieve employee ID, employee last name, department ID and department name of all 
-- employees who are hired before 2004
select e.EMPLOYEE_ID, e.LAST_NAME, d.DEPARTMENT_ID, d.DEPARTMENT_NAME, e.HIRE_DATE
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.HIRE_DATE < '2004-01-01';


-- 32. Retrieve first name, last name, department name and city, for all employees whose salary 
-- is greater than 9000.
select e.FIRST_NAME, e.LAST_NAME, e.SALARY, d.DEPARTMENT_NAME, l.CITY
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join locations l
on  d.LOCATION_ID = l.LOCATION_ID
where e.SALARY > 9000;


-- 33. Retrieve first name, last name, job id, job title, department id, and department name for 
-- all employees who work in Toronto City.
select e.FIRST_NAME, e.LAST_NAME, j.JOB_ID, j.JOB_TITLE, d.DEPARTMENT_ID, d.DEPARTMENT_NAME, l.CITY
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join jobs j
on e.JOB_ID = j.JOB_ID
join locations l
on d.LOCATION_ID = l.LOCATION_ID
where l.CITY = 'Toronto';


-- 34. Retrieve the names and hire dates of all the employees who are hired before their 
-- managers, along with their managers’ names and hire dates.
select e.FIRST_NAME, e.LAST_NAME, e.HIRE_DATE as Emp_HIRE_DATE,m.FIRST_NAME as MANAGER_NAME, m.HIRE_DATE as MANAGER_HIRE_DATE
from employees e
join employees m
on e.MANAGER_ID = m.EMPLOYEE_ID
where e.HIRE_DATE < m.HIRE_DATE;


-- 35. For each department, retrieve the department number, the number of employees in the 
-- department, and their average salary.
select DEPARTMENT_ID, count(EMPLOYEE_ID), avg(SALARY)
from employees
group by DEPARTMENT_ID;

-- 36. Write SQL statement to insert a new record into JOBS table with the following 
-- information:
-- a. JOB_ID = C_ENG
-- b. JOB_TITLE = Computer Engineer 
-- c. MIN_SALARY = 20000
-- d. MAX_SALARY = 50000
insert into jobs
value ('C_ENG', 'Computer Engineer', 20000, 50000);
