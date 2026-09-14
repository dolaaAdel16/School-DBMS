use SchoolDB

CREATE NONCLUSTERED INDEX IX_Enrollment_StudentId
ON Enrollment(Student_Id)
GO

CREATE NONCLUSTERED INDEX IX_Enrollment_CourseId
ON Enrollment(Course_Id)
GO


CREATE NONCLUSTERED INDEX IX_Teacher_DeptId
ON Teacher(Dept_Id)
GO


CREATE NONCLUSTERED INDEX IX_Student_DeptId
ON Student(Dept_Id)
GO

CREATE NONCLUSTERED INDEX IX_Course_DeptId
ON Course(Dept_Id)
GO

SELECT *
FROM Enrollment
WHERE Student_Id = 1
AND Course_Id = 2
