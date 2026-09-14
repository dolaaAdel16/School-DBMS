Create DataBase SchoolDB

use SchoolDB

CREATE TABLE Department
(
    Dept_Id INT IDENTITY(1,1),

    Name VARCHAR(100) NOT NULL,

    Leader_Id INT NULL,

    CONSTRAINT PK_Department
        PRIMARY KEY (Dept_Id),

    CONSTRAINT UQ_Department_Name
        UNIQUE (Name)
)


CREATE TABLE Teacher
(
    Teacher_Id INT IDENTITY(1,1),

    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,

    Email VARCHAR(100) NOT NULL,

    Dept_Id INT NOT NULL,

    Super_Id INT NULL,

    CONSTRAINT PK_Teacher
        PRIMARY KEY (Teacher_Id),

    CONSTRAINT UQ_Teacher_Email
        UNIQUE (Email),

    CONSTRAINT FK_Teacher_Department
        FOREIGN KEY (Dept_Id)
        REFERENCES Department(Dept_Id)
        ON DELETE NO ACTION,

    CONSTRAINT FK_Teacher_Supervisor
        FOREIGN KEY (Super_Id)
        REFERENCES Teacher(Teacher_Id)
        ON DELETE NO ACTION,

    CONSTRAINT CK_Teacher_NotOwnSupervisor
        CHECK (Super_Id IS NULL OR Super_Id <> Teacher_Id)
)

ALTER TABLE Department
ADD CONSTRAINT FK_Department_Leader
    FOREIGN KEY (Leader_Id)
    REFERENCES Teacher(Teacher_Id)
    ON DELETE NO ACTION;

    CREATE TABLE Student
(
    Student_Id INT IDENTITY(1,1),

    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,

    Email VARCHAR(100) NOT NULL,

    Dept_Id INT NOT NULL,

    CONSTRAINT PK_Student
        PRIMARY KEY (Student_Id),

    CONSTRAINT UQ_Student_Email
        UNIQUE (Email),

    CONSTRAINT FK_Student_Department
        FOREIGN KEY (Dept_Id)
        REFERENCES Department(Dept_Id)
        ON DELETE NO ACTION
)

CREATE TABLE Course
(
    Course_Id INT IDENTITY(1,1),

    Name VARCHAR(100) NOT NULL,

    Code VARCHAR(20) NOT NULL,

    Dept_Id INT NOT NULL,

    Teacher_Id INT NOT NULL,

    CONSTRAINT PK_Course
        PRIMARY KEY (Course_Id),

    CONSTRAINT UQ_Course_Code
        UNIQUE (Code),

    CONSTRAINT FK_Course_Department
        FOREIGN KEY (Dept_Id)
        REFERENCES Department(Dept_Id)
        ON DELETE NO ACTION,

    CONSTRAINT FK_Course_Teacher
        FOREIGN KEY (Teacher_Id)
        REFERENCES Teacher(Teacher_Id)
        ON DELETE NO ACTION
)

CREATE TABLE Enrollment
(
    Enroll_Id INT IDENTITY(1,1),

    Student_Id INT NOT NULL,
    Course_Id INT NOT NULL,

    EnrollmentDate DATE NOT NULL
        CONSTRAINT DF_Enrollment_Date
        DEFAULT (CAST(GETDATE() AS DATE)),


    Grade DECIMAL(5,2) NULL,

    CONSTRAINT PK_Enrollment
        PRIMARY KEY (Enroll_Id),

    CONSTRAINT FK_Enrollment_Student
        FOREIGN KEY (Student_Id)
        REFERENCES Student(Student_Id)
        ON DELETE CASCADE,

    CONSTRAINT FK_Enrollment_Course
        FOREIGN KEY (Course_Id)
        REFERENCES Course(Course_Id)
        ON DELETE CASCADE,

    CONSTRAINT UQ_Enrollment_Student_Course
        UNIQUE (Student_Id, Course_Id),

    
    CONSTRAINT CK_Enrollment_Grade
        CHECK
        (
            Grade IS NULL
            OR Grade BETWEEN 0 AND 100
        ))
