CREATE SCHEMA EXAMQ3;
USE EXAMQ3;

-- Q.3.1 
-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50) NOT NULL,
    StudentSurname VARCHAR(50) NOT NULL,
    StudentNumber VARCHAR(20) UNIQUE NOT NULL
);

-- Q.3.2 
-- Create Lecturer table
CREATE TABLE Lecturer (
    LecturerID INT PRIMARY KEY AUTO_INCREMENT,
    LecturerName VARCHAR(50) NOT NULL,
    LecturerSurname VARCHAR(50) NOT NULL
);

-- Q.3.3 
-- Create Tutorial table
CREATE TABLE Tutorial (
    TutorialID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    LecturerID INT NOT NULL,
    TutorialDate DATE NOT NULL,
    TutorialTime TIME NOT NULL,
    TutorialDuration INT NOT NULL, -- duration in minutes

    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (LecturerID) REFERENCES Lecturer(LecturerID)
    );
    
    
    -- Q.3.4 
    -- Insert data into Student table

INSERT INTO Student (StudentName, StudentSurname, StudentNumber)
VALUES ('Debbie', 'Theart', '123456');
INSERT INTO Student (StudentName, StudentSurname, StudentNumber)
VALUES ('Thomas', 'Duncan', '654321');

INSERT INTO Lecturer (LecturerID, LecturerName, LecturerSurname)
VALUES ('1', 'Zintle', 'Nukani');
INSERT INTO Lecturer (LecturerID, LecturerName, LecturerSurname)
VALUES ('2', 'Ravi', 'Maharaj');

INSERT INTO Tutorial (TutorialID, TutorialDate, TutorialTime, TutorialDuration,  StudentID, LecturerID)
VALUES ('1', '2025-01-15', '9:00', '180', '2', '1');
INSERT INTO Tutorial (TutorialID, TutorialDate, TutorialTime, TutorialDuration,  StudentID, LecturerID)
VALUES ('2', '2025-01-18', '15:00', '240', '2', '2');
INSERT INTO Tutorial (TutorialID, TutorialDate, TutorialTime, TutorialDuration,  StudentID, LecturerID)
VALUES ('3', '2025-01-20', '10:00', '180', '1', '1');
INSERT INTO Tutorial (TutorialID, TutorialDate, TutorialTime, TutorialDuration,  StudentID, LecturerID)
VALUES ('4', '2025-01-21', '11:00', '180', '2', '1');

-- Q.3.5
-- Select tutorials scheduled between 2025-01-16 and 2025-01-20 inclusive
SELECT *
FROM Tutorial
WHERE TutorialDate BETWEEN '2025-01-16' AND '2025-01-20';


-- Q.3.6 
-- Get students with their total number of tutorials, sorted by count descending
SELECT 
    S.StudentName,
    S.StudentSurname,
    COUNT(T.TutorialID) AS TotalTutorials
FROM 
    Student S
JOIN 
    Tutorial T ON S.StudentID = T.StudentID
GROUP BY 
    S.StudentID, S.StudentName, S.StudentSurname
ORDER BY 
    TotalTutorials DESC;
    
    
    -- Q.3.7
    -- Create a view for students who booked tutorials with Lecturer ID 2
CREATE VIEW StudentsWithLecturer2 AS
SELECT DISTINCT 
    S.StudentName,
    S.StudentSurname
FROM 
    Student S
JOIN 
    Tutorial T ON S.StudentID = T.StudentID
WHERE 
    T.LecturerID = 2
ORDER BY 
    S.StudentSurname ASC;
    
    SELECT * FROM StudentsWithLecturer2;




