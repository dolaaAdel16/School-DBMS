use SchoolDB


CREATE OR ALTER FUNCTION dbo.fn_GetStudentFullName
(
    @Student_Id INT
)
RETURNS VARCHAR(101)
AS
BEGIN

    DECLARE @FullName VARCHAR(101)

    SELECT @FullName =
        CONCAT(Fname, ' ', Lname)

    FROM Student

    WHERE Student_Id = @Student_Id

    RETURN @FullName

END
GO
----------------------------------

CREATE OR ALTER FUNCTION dbo.fn_GetStudentAverageGrade
(
    @Student_Id INT
)
RETURNS DECIMAL(5,2)
AS
BEGIN

    DECLARE @AverageGrade DECIMAL(5,2)

    SELECT @AverageGrade =
        AVG(Grade)

    FROM Enrollment

    WHERE Student_Id = @Student_Id

    RETURN @AverageGrade

END
GO
-----------------------------------------
CREATE OR ALTER FUNCTION dbo.fn_GetStudentCourseCount
(
    @Student_Id INT
)
RETURNS INT
AS
BEGIN

    DECLARE @CourseCount INT

    SELECT @CourseCount =
        COUNT(*)

    FROM Enrollment

    WHERE Student_Id = @Student_Id

    RETURN @CourseCount

END
GO
----------------------------------------------


CREATE OR ALTER FUNCTION dbo.fn_IsPassed
(
    @Grade DECIMAL(5,2)
)
RETURNS VARCHAR(10)
AS
BEGIN

    DECLARE @Result VARCHAR(10)

    IF @Grade IS NULL
        SET @Result = 'Pending'

    ELSE IF @Grade >= 50
        SET @Result = 'Passed'

    ELSE
        SET @Result = 'Failed'

    RETURN @Result

END
GO

SELECT dbo.fn_GetStudentFullName(1) AS StudentName

SELECT dbo.fn_IsPassed(85) AS Result
