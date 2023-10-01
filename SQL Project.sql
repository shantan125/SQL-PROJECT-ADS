CREATE SCHEMA `student` ;
CREATE TABLE student.StudentInfo (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Address VARCHAR(255),
    MobileNumber VARCHAR(20)
);
-- Inserting sample data into the StudentInfo table
INSERT INTO student.StudentInfo (StudentName, DateOfBirth, Address, MobileNumber)
VALUES
    ('John Doe', '2000-01-15', '123 Main St, Cityville', '555-123-4567'),
    ('Jane Smith', '2001-03-22', '456 Elm St, Townsville', '555-987-6543'),
    ('David Johnson', '1999-07-10', '789 Oak St, Villageton', '555-456-7890'),
    ('Emily Brown', '2002-05-05', '101 Pine St, Hamletville', '555-789-1234');
select * from student.StudentInfo;
CREATE TABLE student.Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Credits INT
);
-- Inserting sample data into the Course table without specifying CourseID
INSERT INTO student.Course (Name, Description, Credits)
VALUES
    ('Introduction to Programming', 'An introductory course on programming concepts.', 3),
    ('Database Management', 'Learn about database design and management.', 4),
    ('Web Development', 'Build dynamic websites and web applications.', 4),
    ('Data Analysis', 'Analyze and visualize data using statistical techniques.', 3);
select * from student.Course;
CREATE TABLE student.Grade (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(3, 2),
    FOREIGN KEY (StudentID) REFERENCES student.StudentInfo(StudentID),
    FOREIGN KEY (CourseID) REFERENCES student.Course(CourseID)
);
-- Inserting sample data into the Grade table
INSERT INTO student.Grade (StudentID, CourseID, Grade)
VALUES
    (1, 1, 3.75), -- John Doe, Introduction to Programming, Grade: 3.75
    (2, 2, 4.0),  -- Jane Smith, Database Management, Grade: 4.0
    (3, 3, 3.9),  -- David Johnson, Web Development, Grade: 3.9
    (4, 4, 3.2);  -- Emily Brown, Data Analysis, Grade: 3.2;
CREATE TABLE student.Enrollment (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    EnrollmentStatus VARCHAR(20),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES student.StudentInfo(StudentID),
    FOREIGN KEY (CourseID) REFERENCES student.Course(CourseID)
);
-- Inserting sample data into the Enrollment table
INSERT INTO student.Enrollment (StudentID, CourseID, EnrollmentDate, EnrollmentStatus, PaymentMethod)
VALUES
    (1, 1, '2022-08-15', 'Enrolled', 'Credit Card'),
    (2, 2, '2022-09-01', 'Enrolled', 'PayPal'),
    (3, 3, '2022-09-10', 'Enrolled', 'Check'),
    (4, 4, '2022-08-20', 'Enrolled', 'Wire Transfer'),
    (1, 2, '2022-08-16', 'Enrolled', 'Credit Card'),
    (2, 3, '2022-08-18', 'Enrolled', 'PayPal'),
    (3, 4, '2022-08-25', 'Enrolled', 'Credit Card'),
    (4, 1, '2022-08-30', 'Enrolled', 'PayPal');
select * from student.Enrollment;  
-- Inserting a new student into the StudentInfo table
INSERT INTO student.StudentInfo (StudentName, DateOfBirth, Address, MobileNumber)
VALUES ('New Student', '2000-01-15', '123 Main St, City, Country', '+1234567890');
-- Retrieve all student information from the StudentInfo table
SELECT * FROM student.StudentInfo;
-- Inserting a new course into the Course table
INSERT INTO student.Course (Name, Description, Credits)
VALUES ('New Course', 'Description of the new course', 3);
-- Retrieve information for the new course from the Course table
SELECT * FROM student.Course WHERE Name = 'New Course';
-- Insert a new grade record for a specific student and course
INSERT INTO student.Grade (StudentID, CourseID, Grade)
VALUES (5, 5, 3.8); -- Replace with the actual StudentID, CourseID, and grade value
-- Update a student's grade for a specific course
UPDATE student.Grade
SET Grade = 4.2 -- Replace with the new grade value
WHERE StudentID = 5 -- Replace with the student's ID
  AND CourseID = 5; -- Replace with the course's ID
-- Enroll a new student in a course
INSERT INTO student.Enrollment (StudentID, CourseID, EnrollmentDate, EnrollmentStatus, PaymentMethod)
VALUES
    (6, 3, '2023-09-15', 'Enrolled', 'Credit Card');
INSERT INTO student.StudentInfo (StudentName, DateOfBirth, Address, MobileNumber)
VALUES ('New Student', '2000-01-01', '456 Elm St', '555-555-5555');
INSERT INTO student.Enrollment (StudentID, CourseID, EnrollmentDate, EnrollmentStatus, PaymentMethod)
VALUES (NewStudentID, CourseID, '2023-10-01', 'Enrolled', 'Credit Card');
--  query to calculate the average grade for a student
SELECT StudentID, AVG(Grade) AS AverageGrade
FROM student.Grade
WHERE StudentID = 1
GROUP BY StudentID;
-- Top 3 students in the data base 
SELECT s.StudentName, AVG(g.Grade) AS AverageGrade
FROM student.StudentInfo AS s
JOIN student.Grade AS g ON s.StudentID = g.StudentID
GROUP BY s.StudentName
ORDER BY AverageGrade DESC
LIMIT 3;


