CREATE TABLE Students (
Student_id INT PRIMARY KEY,
First_name VARCHAR (50),
Last_name VARCHAR (50),
Birth_date VARCHAR (50) NOT NULL,
Enrollment_year VARCHAR (4) NOT NULL,
);

CREATE TABLE Professors (
Professor_id INT PRIMARY KEY,
First_name VARCHAR (50),
Last_name VARCHAR (50),
Department VARCHAR (50),
Hire_date VARCHAR (4) NOT NULL,
);

CREATE TABLE Subjects (
Subject_id INT PRIMARY KEY,
Subject_name VARCHAR (50),
Professor_id INT UNIQUE,
FOREIGN KEY (Professor_id) REFERENCES Subjects (Professor_id),
);


INSERT INTO Students (Student_id, First_name, Last_name, Birth_date, Enrollment_year)
VALUES
(1, 'Jovan', 'Atanasov', 15/05/1995, 2014),
(2, 'Ana', 'Stojanova', 01/06/1996, 2014),
(3, 'Sotir', 'Jovanov', 25/10/1997, 2016),
(4, 'Vesna', 'Ivanova', 18/12/1999, 2018),
(5, 'Jovana', 'Jovanovska', 03/05/2000, 2020),
(6, 'Stojan', 'Arsov', 19/03/1998, 2019),
(7, 'Bojana', 'Arsova', 28/06/1997, 2017),
(8, 'Atanas', 'Eftimov', 16/02/2000, 2019),
(9, 'Tihomir', 'Sotirov', 08/07/2001, 2020),
(10, 'Aleksandar', 'Micev', 17/01/2000, 2019);


INSERT INTO Professors (Professor_id, First_name, Last_name, Department, Hire_date)
VALUES
(1, 'Aleksandar', 'Jovanov', 'Biologija', 1985),
(2, 'Jovan', 'Ivanovski', 'Sociologija', 1990),
(3, 'Elena', 'Atanasovska', 'Istorija', 1995),
(4, 'Ivana', 'Jovanova', 'Matematika',1999),
(5, 'Jovan', 'Josifov', 'Makedonski', 2000),
(6, 'Ivo', 'Ivanovski', 'Etika', 1991),
(7, 'Martina', 'Boskova', 'Logika', 1996),
(8, 'Petar', 'Petrov', 'Angliski', 1981),
(9, 'Vaska', 'Tanevska', 'Germanski', 1985),
(10, 'Goran', 'Panovski', 'Fizika', 1988);

INSERT INTO Subjects (Subject_id, Subject_name, Professor_id)
VALUES
(1, 'Fizika', 10),
(2, 'Angliski', 8),
(3, 'Biologija', 1),
(4, 'Istorija', 3),
(5, 'Makedonski', 5),
(6, 'Germanski', 9),
(7, 'Logika', 7),
(8, 'Etika', 6),
(9, 'Sociologija', 2),
(10, 'Matematika', 4);


SELECT * FROM Students WHERE Enrollment_year > 2016;

SELECT * FROM Subjects 
LEFT JOIN Professors ON Subjects.Professor_id = Professors.Professor_id;

SELECT First_name, Last_name, Enrollment_year FROM Students;



