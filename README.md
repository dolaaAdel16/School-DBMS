# School Database Management System

## Project Overview

This project is a School Database Management System built using Microsoft SQL Server and T-SQL.

The database manages:

- Departments
- Teachers
- Students
- Courses
- Enrollments

The project includes database design, relationships, constraints, sample data, joins, views, stored procedures, functions, indexes, and performance testing.

---

## ERD

The database contains the following main entities:

- Department
- Teacher
- Student
- Course
- Enrollment

Main relationships:

- One Department has many Teachers
- One Department has many Students
- One Department offers many Courses
- One Teacher can teach many Courses
- One Teacher can supervise many Teachers
- Students can enroll in many Courses
- Courses can contain many Students

The many-to-many relationship between Student and Course is resolved using the Enrollment table.

![ERD](erd/erd.png)

---

## Database Tables

### Department

Stores department information.

Main columns:

- Dept_Id
- Name
- Leader_Id

### Teacher

Stores teacher information.

Main columns:

- Teacher_Id
- Fname
- Lname
- Email
- Dept_Id
- Super_Id

### Student

Stores student information.

Main columns:

- Student_Id
- Fname
- Lname
- Email
- Dept_Id

### Course

Stores course information.

Main columns:

- Course_Id
- Name
- Code
- Dept_Id
- Teacher_Id

### Enrollment

Stores student course registrations.

Main columns:

- Enroll_Id
- Student_Id
- Course_Id
- EnrollmentDate
- Grade

---

## Constraints

The project uses several constraints to maintain data integrity:

- Primary Keys
- Foreign Keys
- NOT NULL
- UNIQUE
- CHECK
- DEFAULT

Examples:

- Student email must be unique
- Teacher email must be unique
- Course code must be unique
- Grade must be between 0 and 100
- A student cannot enroll in the same course twice
- A teacher cannot supervise himself

---

## SQL Files

Run the scripts in the following order:

1. `01_schema.sql`
2. `02_seed.sql`
3. `03_joins.sql`
4. `04_views.sql`
5. `05_procedures.sql`
6. `06_functions.sql`
7. `07_indexes.sql`


---

## JOIN Queries

The project contains several JOIN queries including:

- Student with Department
- Teacher with Department
- Course with Teacher and Department
- Enrollment with Student and Course
- Teacher with Supervisor using Self Join

---

## Views

The project includes the following views:

- `vw_StudentDetails`
- `vw_TeacherDetails`
- `vw_CourseDetails`
- `vw_EnrollmentDetails`

---

## Stored Procedures

### sp_GetStudentsByDepartment

Returns all students in a selected department.

### sp_EnrollStudent

Enrolls a student in a course after validating:

- Student exists
- Course exists
- Student and course belong to the same department
- Student is not already enrolled

### sp_TransferStudent

Transfers a student to another department using:

- Transaction
- TRY
- CATCH
- COMMIT
- ROLLBACK

---

## Functions

The project includes:

- `fn_GetStudentFullName`
- `fn_GetStudentAverageGrade`
- `fn_GetStudentCourseCount`
- `fn_IsPassed`

The `fn_IsPassed` function returns:

- Passed
- Failed
- Pending

depending on the student's grade.

---

## Indexes

Indexes were created to improve query performance.

Examples:

- Index on Enrollment Student_Id
- Index on Enrollment Course_Id
- Index on Teacher Dept_Id
- Index on Student Dept_Id
- Index on Course Dept_Id

The project also uses a composite unique index on:

`Student_Id + Course_Id`

---

## Performance Analysis

SQL Server Actual Execution Plans were used to compare query performance.

The analysis focuses on:

- Index Seek
- Index Scan
- Table Scan
- Logical Reads
- Execution Time
- Index Selectivity


---

## How to Run the Project

1. Open SQL Server Management Studio
2. Run `01_schema.sql`
3. Run `02_seed.sql`
4. Run the remaining files in order


---

## Technologies

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio
- GitHub

---

## Author

Ahmed Adel Hassan
