use SchoolDB

CREATE OR ALTER VIEW dbo.vw_StudentDetails
AS
SELECT
    S.Student_Id,

    CONCAT(S.Fname, ' ', S.Lname) AS StudentName,

    S.Email,

    S.Dept_Id,

    D.Name AS DepartmentName

FROM Student AS S

INNER JOIN Department AS D
    ON S.Dept_Id = D.Dept_Id

    SELECT * FROM dbo.vw_StudentDetails

    CREATE OR ALTER VIEW dbo.vw_TeacherDetails
AS
SELECT
    T.Teacher_Id,

    CONCAT(T.Fname, ' ', T.Lname) AS TeacherName,

    T.Email,

    D.Name AS DepartmentName,

    T.Super_Id,

    CONCAT(S.Fname, ' ', S.Lname) AS SupervisorName

FROM Teacher AS T

INNER JOIN Department AS D
    ON T.Dept_Id = D.Dept_Id

LEFT JOIN Teacher AS S
    ON T.Super_Id = S.Teacher_Id

    
    SELECT * FROM dbo.vw_TeacherDetails


    CREATE OR ALTER VIEW dbo.vw_CourseDetails
AS
SELECT
    C.Course_Id,

    C.Code AS CourseCode,

    C.Name AS CourseName,

    D.Name AS DepartmentName,

    T.Teacher_Id,

    CONCAT(T.Fname, ' ', T.Lname) AS TeacherName

FROM Course AS C

INNER JOIN Department AS D
    ON C.Dept_Id = D.Dept_Id

INNER JOIN Teacher AS T
    ON C.Teacher_Id = T.Teacher_Id

    SELECT * FROM dbo.vw_CourseDetails
  
  CREATE OR ALTER VIEW dbo.vw_EnrollmentDetails
AS
SELECT
    E.Enroll_Id,

    S.Student_Id,

    CONCAT(S.Fname, ' ', S.Lname) AS StudentName,

    C.Course_Id,

    C.Code AS CourseCode,

    C.Name AS CourseName,

    E.EnrollmentDate,

    E.Grade

FROM Enrollment AS E

INNER JOIN Student AS S
    ON E.Student_Id = S.Student_Id

INNER JOIN Course AS C
    ON E.Course_Id = C.Course_Id

    SELECT * FROM dbo.vw_EnrollmentDetails
