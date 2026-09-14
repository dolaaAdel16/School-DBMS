use SchoolDB

CREATE OR ALTER PROCEDURE dbo.sp_GetStudentsByDepartment
    @Dept_Id INT
AS
BEGIN
    SET NOCOUNT ON

    -- Check if department exists
    IF NOT EXISTS
    (
        SELECT 1
        FROM Department
        WHERE Dept_Id = @Dept_Id
    )
    BEGIN
        THROW 50001, 'Department does not exist.', 1
    END


    SELECT
        S.Student_Id,
        S.Fname,
        S.Lname,
        S.Email,
        D.Name AS DepartmentName

    FROM Student AS S

    INNER JOIN Department AS D
        ON S.Dept_Id = D.Dept_Id

    WHERE S.Dept_Id = @Dept_Id
END
---------------------------------------------
CREATE OR ALTER PROCEDURE dbo.sp_EnrollStudent

    @Student_Id INT,
    @Course_Id INT,
    @EnrollmentDate DATE = NULL

AS
BEGIN

    SET NOCOUNT ON

    IF NOT EXISTS
    (
        SELECT 1
        FROM Student
        WHERE Student_Id = @Student_Id
    )
    BEGIN
        THROW 50002, 'Student does not exist.', 1
    END


    IF NOT EXISTS
    (
        SELECT 1
        FROM Course
        WHERE Course_Id = @Course_Id
    )
    BEGIN
        THROW 50003, 'Course does not exist.', 1
    END

    IF NOT EXISTS
    (
        SELECT 1

        FROM Student AS S

        INNER JOIN Course AS C
            ON S.Dept_Id = C.Dept_Id

        WHERE S.Student_Id = @Student_Id
          AND C.Course_Id = @Course_Id
    )
    BEGIN
        THROW 50004,
        'Student cannot enroll in a course from another department.',
        1
    END


    IF EXISTS
    (
        SELECT 1

        FROM Enrollment

        WHERE Student_Id = @Student_Id
          AND Course_Id = @Course_Id
    )
    BEGIN
        THROW 50005,
        'Student is already enrolled in this course.',
        1
    END

    INSERT INTO Enrollment
    (
        Student_Id,
        Course_Id,
        EnrollmentDate,
        Grade
    )

    VALUES
    (
        @Student_Id,
        @Course_Id,
        ISNULL(@EnrollmentDate, CAST(GETDATE() AS DATE)),
        NULL
    )


    SELECT 'Student enrolled successfully.' AS Message;

END
-------------------------------------------------

CREATE OR ALTER PROCEDURE dbo.sp_TransferStudent

    @Student_Id INT,
    @New_Dept_Id INT

AS
BEGIN

    SET NOCOUNT ON

    BEGIN TRY

        BEGIN TRANSACTION

        IF NOT EXISTS
        (
            SELECT 1
            FROM Student
            WHERE Student_Id = @Student_Id
        )
        BEGIN
            THROW 50006,
            'Student does not exist.',
            1
        END


        IF NOT EXISTS
        (
            SELECT 1
            FROM Department
            WHERE Dept_Id = @New_Dept_Id
        )
        BEGIN
            THROW 50007,
            'New department does not exist.',
            1
        END



        IF EXISTS
        (
            SELECT 1

            FROM Student

            WHERE Student_Id = @Student_Id
              AND Dept_Id = @New_Dept_Id
        )
        BEGIN
            THROW 50008,
            'Student already belongs to this department.',
            1
        END


        UPDATE Student

        SET Dept_Id = @New_Dept_Id

        WHERE Student_Id = @Student_Id;


        COMMIT TRANSACTION


        SELECT
            'Student transferred successfully.'
            AS Message

    END TRY


    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION

        THROW

    END CATCH

END
