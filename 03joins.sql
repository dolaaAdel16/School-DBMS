use SchoolDB

SELECT
    S.Student_Id,
    S.Fname,
    S.Lname,
    S.Email,
    D.Name AS DepartmentName
FROM Student AS S
INNER JOIN Department AS D
    ON S.Dept_Id = D.Dept_Id

    SELECT
    T.Teacher_Id,
    T.Fname,
    T.Lname,
    T.Email,
    D.Name AS DepartmentName
FROM Teacher AS T
INNER JOIN Department AS D
    ON T.Dept_Id = D.Dept_Id

    SELECT
    C.Course_Id,
    C.Name AS CourseName,
    C.Code,

    T.Fname + ' ' + T.Lname AS TeacherName,

    D.Name AS DepartmentName

FROM Course AS C

INNER JOIN Teacher AS T
    ON C.Teacher_Id = T.Teacher_Id

INNER JOIN Department AS D
    ON C.Dept_Id = D.Dept_Id

    SELECT
    E.Enroll_Id,

    S.Student_Id,
    S.Fname + ' ' + S.Lname AS StudentName,

    C.Course_Id,
    C.Name AS CourseName,
    C.Code,

    E.EnrollmentDate,
    E.Grade

FROM Enrollment AS E

INNER JOIN Student AS S
    ON E.Student_Id = S.Student_Id

INNER JOIN Course AS C
    ON E.Course_Id = C.Course_Id

    
SELECT
    T.Teacher_Id,

    T.Fname + ' ' + T.Lname AS TeacherName,

    S.Teacher_Id AS Supervisor_Id,

    S.Fname + ' ' + S.Lname AS SupervisorName

FROM Teacher AS T

LEFT JOIN Teacher AS S
    ON T.Super_Id = S.Teacher_Id
