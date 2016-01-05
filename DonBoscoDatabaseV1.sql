PRAGMA foreign_keys = ON;

CREATE TABLE Address(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Street                  VARCHAR(30),
    City                    VARCHAR(30),
    State                   VARCHAR(20),
    Zip                     VARCHAR(10),
    Country                 TEXT
);

CREATE TABLE PrimaryContact(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName               NVARCHAR(20),
    MiddleInitial           VARCHAR(1),
    LastName                NVARCHAR(20),
    Relation                TEXT,
    PhoneNumber             NVARCHAR(30),
    Email                   NVARCHAR(100),
    AddressID               INT,
FOREIGN KEY (AddressID) REFERENCES Address(ID)
);

CREATE TABLE OriginAddress(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Region                  NVARCHAR(40),
    Country                 NVARCHAR(40) NOT NULL
);

CREATE TABLE Teacher(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    FirstName               NVARCHAR(40) NOT NULL,
    MiddleInitial           VARCHAR(1), 
    LastName                NVARCHAR(100) NOT NULL,
    Email                   NVARCHAR(100),
    PhoneNumber             NVARCHAR(20)
);

CREATE TABLE Course(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    TeacherID               INTEGER,
    CourseName              VARCHAR(40),
    TimeHeld                VARCHAR(20),
FOREIGN KEY(TeacherID) REFERENCES Teacher(ID)
);

CREATE TABLE Student(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    AddressID               INTEGER NOT NULL,
    OriginAddressID         INTEGER NOT NULL,
    FirstName               NVARCHAR(30) NOT NULL,
    MiddleInitial           VARCHAR(1),
    LastName                NVARCHAR(100) NOT NULL,
    SSN                     NVARCHAR(11), 
    RegistrationDate        TEXT NOT NULL,
    MaritalStatus           VARCHAR(20),
    Email                   NVARCHAR(100),
    PrimaryPhoneNumber      NVARCHAR(30),
    DOB                     TEXT,
    EthnicBackground        TEXT,
    ContactID               INTEGER,
FOREIGN KEY (ContactID) REFERENCES PrimaryContact(ID),
FOREIGN KEY (OriginAddressID) REFERENCES OriginAddress(ID),
FOREIGN KEY (AddressID) REFERENCES Address(ID)
);

CREATE TABLE Test(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    TestName                TEXT NOT NULL,
    TestDate                TEXT NOT NULL
);

CREATE TABLE Gradebook(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    StudentID               INTEGER NOT NULL,
    TestID                  INTEGER NOT NULL,
    Score                   INTEGER,
    FOREIGN KEY (StudentID) REFERENCES Student(ID),
    FOREIGN KEY (TestID) REFERENCES Test(ID)
);

CREATE TABLE StudentInCourse(
    StudentID               INTEGER NOT NULL,
    CourseID                INTEGER NOT NULL,
    PRIMARY KEY (StudentID,CourseID),
FOREIGN KEY (StudentID) REFERENCES Student(ID),
FOREIGN KEY (CourseID) REFERENCES Course(ID)
);