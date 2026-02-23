create database UNIVERSITY;
use UNIVERSITY;

CREATE TABLE DEPARTMENT (
    DepartmentCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    OfficeNumber VARCHAR(20),
    OfficePhone VARCHAR(20),
    College VARCHAR(100)
);

CREATE TABLE STUDENT (
    StudentNumber INT PRIMARY KEY,
    SSN CHAR(11) UNIQUE NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    CurrentAddress TEXT,
    CurrentPhone VARCHAR(20),
    PermanentAddress TEXT,
    PermanentCity VARCHAR(50),
    PermanentState VARCHAR(50),
    PermanentZip VARCHAR(10),
    PermanentPhone VARCHAR(20),
    BirthDate DATE,
    Sex CHAR(1),
    Class ENUM('Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate'),
    MajorDeptCode VARCHAR(10),
    MinorDeptCode VARCHAR(10),
    DegreeProgram ENUM('BA', 'BS', 'PHD'),
    FOREIGN KEY (MajorDeptCode) REFERENCES DEPARTMENT(DepartmentCode),
    FOREIGN KEY (MinorDeptCode) REFERENCES DEPARTMENT(DepartmentCode)
);

CREATE TABLE COURSE (
    CourseNumber VARCHAR(20) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Description TEXT,
    SemesterHours INT,
    Level VARCHAR(20),
    OfferingDeptCode VARCHAR(10),
    FOREIGN KEY (OfferingDeptCode) REFERENCES DEPARTMENT(DepartmentCode)
);


CREATE TABLE SECTION (
    SectionID INT AUTO_INCREMENT PRIMARY KEY,
    SectionNumber INT NOT NULL,
    Instructor VARCHAR(100),
    Semester VARCHAR(20),
    Year INT,
    CourseNumber VARCHAR(20),
    FOREIGN KEY (CourseNumber) REFERENCES COURSE(CourseNumber)
);


CREATE TABLE GRADE_REPORT (
    StudentNumber INT,
    SectionID INT,
    Grade CHAR(2),
    PRIMARY KEY (StudentNumber, SectionID),
    FOREIGN KEY (StudentNumber) REFERENCES STUDENT(StudentNumber),
    FOREIGN KEY (SectionID) REFERENCES SECTION(SectionID)
);