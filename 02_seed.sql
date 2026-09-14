use SchoolDB

INSERT INTO Department (Name, Leader_Id)
VALUES
    ('Computer Science', NULL),
    ('Mathematics', NULL),
    ('Physics', NULL)


    INSERT INTO Teacher
(
    Fname,
    Lname,
    Email,
    Dept_Id,
    Super_Id
)
VALUES
(
    'Ahmed',
    'Hassan',
    'ahmed.hassan@school.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science'),
    NULL
),

(
    'Mona',
    'Ali',
    'mona.ali@school.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Mathematics'),
    NULL
),

(
    'Omar',
    'Mahmoud',
    'omar.mahmoud@school.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Physics'),
    NULL
)

UPDATE Department
SET Leader_Id =
(
    SELECT Teacher_Id
    FROM Teacher
    WHERE Email = 'ahmed.hassan@school.com'
)
WHERE Name = 'Computer Science';


UPDATE Department
SET Leader_Id =
(
    SELECT Teacher_Id
    FROM Teacher
    WHERE Email = 'mona.ali@school.com'
)
WHERE Name = 'Mathematics';


UPDATE Department
SET Leader_Id =
(
    SELECT Teacher_Id
    FROM Teacher
    WHERE Email = 'omar.mahmoud@school.com'
)
WHERE Name = 'Physics'

INSERT INTO Teacher
(
    Fname,
    Lname,
    Email,
    Dept_Id,
    Super_Id
)
VALUES

(
    'Sara',
    'Mohamed',
    'sara.mohamed@school.com',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'ahmed.hassan@school.com')
),

(
    'Youssef',
    'Khaled',
    'youssef.khaled@school.com',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'ahmed.hassan@school.com')
),

(
    'Nour',
    'Ibrahim',
    'nour.ibrahim@school.com',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Mathematics'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'mona.ali@school.com')
),

(
    'Hany',
    'Mostafa',
    'hany.mostafa@school.com',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Physics'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'omar.mahmoud@school.com')
)

INSERT INTO Student
(
    Fname,
    Lname,
    Email,
    Dept_Id
)
VALUES

(
    'Mohamed',
    'Salah',
    'mohamed.salah@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science')
),

(
    'Ali',
    'Ahmed',
    'ali.ahmed@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science')
),

(
    'Salma',
    'Hassan',
    'salma.hassan@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science')
),

(
    'Mariam',
    'Adel',
    'mariam.adel@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Mathematics')
),

(
    'Yara',
    'Khaled',
    'yara.khaled@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Mathematics')
),

(
    'Karim',
    'Tarek',
    'karim.tarek@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Physics')
),

(
    'Nada',
    'Mahmoud',
    'nada.mahmoud@student.com',
    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Physics')
)

INSERT INTO Course
(
    Name,
    Code,
    Dept_Id,
    Teacher_Id
)
VALUES

(
    'Database Systems',
    'CS101',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'ahmed.hassan@school.com')
),

(
    'Programming Fundamentals',
    'CS102',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'sara.mohamed@school.com')
),

(
    'Data Structures',
    'CS201',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Computer Science'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'youssef.khaled@school.com')
),

(
    'Calculus',
    'MATH101',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Mathematics'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'mona.ali@school.com')
),

(
    'Linear Algebra',
    'MATH201',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Mathematics'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'nour.ibrahim@school.com')
),

(
    'Classical Mechanics',
    'PHY101',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Physics'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'omar.mahmoud@school.com')
),

(
    'Electricity and Magnetism',
    'PHY201',

    (SELECT Dept_Id
     FROM Department
     WHERE Name = 'Physics'),

    (SELECT Teacher_Id
     FROM Teacher
     WHERE Email = 'hany.mostafa@school.com')
)

INSERT INTO Enrollment
(
    Student_Id,
    Course_Id,
    EnrollmentDate,
    Grade
)
VALUES


(
    (SELECT Student_Id FROM Student
     WHERE Email = 'mohamed.salah@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS101'),

    '2026-09-01',
    88
),

(
    (SELECT Student_Id FROM Student
     WHERE Email = 'mohamed.salah@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS102'),

    '2026-09-01',
    91
),

(
    (SELECT Student_Id FROM Student
     WHERE Email = 'mohamed.salah@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS201'),

    '2026-09-02',
    NULL
),


(
    (SELECT Student_Id FROM Student
     WHERE Email = 'ali.ahmed@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS101'),

    '2026-09-01',
    72
),

(
    (SELECT Student_Id FROM Student
     WHERE Email = 'ali.ahmed@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS102'),

    '2026-09-02',
    NULL
),


(
    (SELECT Student_Id FROM Student
     WHERE Email = 'salma.hassan@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS101'),

    '2026-09-01',
    95
),

(
    (SELECT Student_Id FROM Student
     WHERE Email = 'salma.hassan@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'CS201'),

    '2026-09-03',
    87
),



(
    (SELECT Student_Id FROM Student
     WHERE Email = 'mariam.adel@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'MATH101'),

    '2026-09-01',
    84
),

(
    (SELECT Student_Id FROM Student
     WHERE Email = 'mariam.adel@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'MATH201'),

    '2026-09-03',
    NULL
),



(
    (SELECT Student_Id FROM Student
     WHERE Email = 'yara.khaled@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'MATH101'),

    '2026-09-01',
    67
),


(
    (SELECT Student_Id FROM Student
     WHERE Email = 'karim.tarek@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'PHY101'),

    '2026-09-02',
    79
),

(
    (SELECT Student_Id FROM Student
     WHERE Email = 'karim.tarek@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'PHY201'),

    '2026-09-03',
    NULL
),



(
    (SELECT Student_Id FROM Student
     WHERE Email = 'nada.mahmoud@student.com'),

    (SELECT Course_Id FROM Course
     WHERE Code = 'PHY101'),

    '2026-09-02',
    93
)

SELECT * FROM Department
SELECT * FROM Teacher
SELECT * FROM Student
SELECT * FROM Course
SELECT * FROM Enrollment