# SQL-PROJECT-ADS
This project is a simple student information system database implemented using SQL. It allows you to manage student data, courses, grades, and course enrollments. The database schema includes tables for students, courses, grades, and enrollments.

## Tables

### StudentInfo

- `StudentID` (Primary Key): Unique identifier for each student.
- `StudentName`: Name of the student.
- `DateOfBirth`: Date of birth of the student.
- `Address`: Address of the student.
- `MobileNumber`: Mobile phone number of the student.

### Course

- `CourseID` (Primary Key): Unique identifier for each course.
- `Name`: Name of the course.
- `Description`: Description of the course.
- `Credits`: Number of credits for the course.

### Grade

- `GradeID` (Primary Key): Unique identifier for each grade.
- `StudentID` (Foreign Key): References the `StudentInfo` table.
- `CourseID` (Foreign Key): References the `Course` table.
- `Grade`: The grade received by the student for the course.

### Enrollment

- `EnrollmentID` (Primary Key): Unique identifier for each enrollment.
- `StudentID` (Foreign Key): References the `StudentInfo` table.
- `CourseID` (Foreign Key): References the `Course` table.
- `EnrollmentDate`: Date when the student enrolled in the course.
- `EnrollmentStatus`: Status of the enrollment (e.g., Enrolled, Completed).
- `PaymentMethod`: Payment method used for enrollment.

## Sample Data

The database includes sample data for students, courses, grades, and enrollments to demonstrate its functionality. You can add, update, and query this data using SQL queries.

## Queries

The README file includes sample SQL queries that demonstrate how to perform various operations on the database, such as inserting data, retrieving information, and calculating averages.

## Usage

You can clone this repository and use it as a starting point for your own student information system project. Modify the schema, add more data, or customize it to fit your specific requirements.

## Contributors

- [Your Name](https://github.com/yourusername)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Feel free to contribute to this project or use it for your own educational purposes.

