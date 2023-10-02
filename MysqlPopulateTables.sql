USE development_kasarini;

/*--------POPULATE INTO TABLES--------------------------------------------------------------------------------------*/

INSERT INTO Parent(
    NationalId,
    FirstName,
    MiddleName,
    Surname,
    PhoneNumber,
    Gender
)
VALUES
(10394827,'Teresiah','Njeri','Njoroge','0722992515','F'),
(19396726,'Simon','Mbugua','Chege','0707372834','M');

INSERT INTO Staff(
    NationalId,
    FirstName,
    MiddleName,
    Surname,
    PhoneNumber,
    Gender,
    EmploymentDate,
    Designation,
    DateOfBirth
)
VALUES
(32924927,'Faith','Njambi','Chege','0722992515','F','20140101','Teacher','20010101'),
(42956702,'Keziah','Wambui','Kimathi','0707372834','F','20100225','Accounts Manager','20010101'),
(12983563,'Esther','Karimi','Murathe','0707372834','F','20170322','Teacher','20010101');

INSERT INTO SubjectCategory(
    SubjectCategoryName
)
VALUES
('Compulsory'),
('Science'),
('Humanity'),
('Technical'),
('Humanity/Art');

INSERT INTO Subjects(
    Code,
    SubjectName,
    SubjectCategoryId
)
VALUES
(101,'English',1),
(102,'Kiswahili',1),
(121,'Mathematics',1),
(232,'Physics',2),
(233,'Chemistry',2),
(236,'Biology',2),
(311,'History & Government',3),
(312,'Geography',3),
(313,'Christian Religion',3),
(411,'Home Science',4),
(443,'Agriculture',4),
(565,'Business Studies',5);

INSERT INTO Grade(
    Grade,
    Points,
    Remarks,
    UpperLimit,
    LowerLimit
)
VALUES
('A',12,'Outstanding',100.00,81.00),
('A-',11,'Excellent',80.99,74.00),
('B+',10,'Very Good',73.99,67.00),
('B',9,'Good',66.99,60.00),
('B-',8,'Above Average',59.99,53.00),
('C+',7,'Average',52.99,46.00),
('C',6,'Below Average',45.99,39.00),
('C-',5,'Below Average',38.99,32.00),
('D+',4,'Poor performance',31.99,25.00),
('D',3,'Poor performance',24.99,18.00),
('D-',2,'Poor performance',17.99,11.00),
('E',1,'Fail',10.99,0.00);

INSERT INTO ExamType(
    ExamName,
    ExamDescription
)
VALUES
('Mid Term','Middle of the term examination'),
('End Term','End of the term examination');

INSERT INTO Teacher(
    TeacherType,
    TSCNumber,
    NationalId
)
VALUES
('Teachers Service Commission','4567778934',12983563),
('BOG','',32924927);

INSERT INTO SessionYear(
    StartDate,
    EndDate
)
VALUES
('20200101','20201201'),
('20210101','20211201'),
('20220101','20221201'),
('20230101','20231201');

INSERT INTO Form(
    Form
)
VALUES
(1),
(2),
(3),
(4);

INSERT INTO Stream(
    Stream
)
VALUES
('K'),
('W');

INSERT INTO Class(
    FormId,
    StreamId,
    SessionYearId,
    Capacity,
    TeacherId,
    GradeId
)
VALUES
(1,1,4,41,1,1),
(1,2,4,42,2,4),
(2,1,4,43,1,3),
(2,2,4,44,2,2),
(3,1,4,45,1,5),
(3,2,4,46,2,6),
(4,1,4,47,1,1),
(4,2,4,48,2,2);

INSERT INTO Student(
    StudentNumber,
    FirstName,
    MiddleName,
    Surname,
    Gender,
    DateOfBirth,
    AdmissionDate
)
VALUES
(6735,'Mercy','Njoki','Chege','F','19960801','20200101'),
(6743,'Kenneth','Kimaita','Kiambatih','M','19910513','20200101');

INSERT INTO StudentClass(
    ClassId,
    StudentNumber
)
VALUES
(5,6735),
(8,6735),
(5,6743),
(8,6743);

INSERT INTO Term(
    TermName
)
VALUES
('First'),
('Second'),
('Third');

INSERT INTO Exam(
    StartDate,
    EndDate,
    TermId,
    ExamTypeId
)
VALUES
('20230215','20230220',1,1),
('20230325','20230330',1,2),
('20230615','20230620',2,1),
('20230725','20230730',2,2),
('20230920','20230925',3,1),
('20231115','20231120',3,2);

INSERT INTO ExamResult(
    ExamId,
    StudentClassId,
    Code,
    GradeId,
    Marks
)
VALUES
(3,1,101,1,87),
(3,1,102,1,90),
(3,1,121,2,76),
(3,3,101,6,34),
(3,3,102,3,65),
(3,3,121,2,78),
(1,1,101,1,56),
(1,1,102,1,95),
(1,1,121,2,73),
(1,3,101,6,32),
(1,3,102,3,67),
(1,3,121,2,74),
(2,1,101,1,86),
(2,1,102,1,93),
(2,1,121,2,71),
(2,3,101,6,37),
(2,3,102,3,66),
(2,3,121,2,73),
(4,1,101,1,86),
(4,1,102,1,92),
(4,1,121,2,78),
(4,3,101,6,39),
(4,3,102,3,63),
(4,3,121,2,71),
(5,1,101,1,83),
(5,1,102,1,95),
(5,1,121,2,76),
(5,3,101,6,32),
(5,3,102,3,66),
(5,3,121,2,73),
(6,1,101,1,85),
(6,1,102,1,93),
(6,1,121,2,72),
(6,3,101,6,35),
(6,3,102,3,62),
(6,3,121,2,75),

(3,2,101,1,56),
(3,2,102,1,34),
(3,2,121,2,76),
(3,4,101,6,23),
(3,4,102,3,98),
(3,4,121,2,12),
(1,2,101,1,67),
(1,2,102,1,23),
(1,2,121,2,98),
(1,4,101,6,34),
(1,4,102,3,76),
(1,4,121,2,23),
(2,2,101,1,45),
(2,2,102,1,87),
(2,2,121,2,12),
(2,4,101,6,54),
(2,4,102,3,43),
(2,4,121,2,76),
(4,2,101,1,98),
(4,2,102,1,45),
(4,2,121,2,23),
(4,4,101,6,12),
(4,4,102,3,54),
(4,4,121,2,65),
(5,2,101,1,87),
(5,2,102,1,98),
(5,2,121,2,65),
(5,4,101,6,87),
(5,4,102,3,43),
(5,4,121,2,65),
(6,2,101,1,23),
(6,2,102,1,76),
(6,2,121,2,34),
(6,4,101,6,23),
(6,4,102,3,45),
(6,4,121,2,76);

INSERT INTO StudentSubject(
    StudentNumber,
    Code
)
VALUES
(6735,101),
(6735,102),
(6735,121),
(6735,233),
(6735,236),
(6735,411),
(6735,313),
(6743,101),
(6743,102),
(6743,121),
(6743,233),
(6743,236),
(6743,443),
(6743,565),
(6743,232);

INSERT INTO ParentStudent(
    StudentNumber,
    ParentNationalId
)
VALUES
(6735,10394827),
(6743,10394827),
(6743,19396726);

INSERT INTO TeacherSubject(
    TeacherId,
    Code
)
VALUES
(1,101),
(1,236),
(1,233),
(1,443),
(1,565),
(2,121),
(2,312),
(2,311),
(2,411),
(2,232),
(2,313);

INSERT INTO TimeSlot(
    StartTime,
    EndTime,
    IsBeforeBreak,
    IsAfterBreak
)
VALUES
('8:00','8:40','no','yes'),
('8:40','9:20','yes','no'),
('9:30','10:10','no','yes'),
('10:10','10:50','yes','no'),
('11:20','12:00','no','yes'),
('12:00','12:40','no','no'),
('12:40','1:20','yes','no'),
('2:00','2:40','no','yes'),
('2:40','3:20','no','no'),
('3:20','4:00','yes','no');

INSERT INTO TimeTable(
	ClassId,
    TimeslotId,
    DayOfTheWeek
)values
(6,1,'Monday');

INSERT INTO TimetableTeacherSubject(
	TimeTableId,
	TeacherSubjectId
)values
(1,2),
(1,7);
/*----------------------------------------------------------------------------------------------------------------
----------SELECT INTO TABLES--------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS StudentResults;
CREATE TABLE StudentResults
SELECT
	SessionYearId,
    ClassId,
    TermId,
    ExamTypeId,
    StudentNumber,
    FirstName,
    MiddleName,
    Surname,
SUM(CASE
  WHEN Code = 101 THEN Marks ELSE 0 END
) AS English,
SUM(CASE
  WHEN Code = 102 THEN Marks ELSE 0 END
) AS Kiswahili,
SUM(CASE
  WHEN Code = 121 THEN Marks ELSE 0 END
) AS Mathematics,
SUM(CASE
  WHEN Code = 232 THEN Marks ELSE 0 END
) AS Physics,
SUM(CASE
  WHEN Code = 233 THEN Marks ELSE 0 END
) AS Chemistry,
SUM(CASE
  WHEN Code = 236 THEN Marks ELSE 0 END
) AS Biology,
SUM(CASE
  WHEN Code = 311 THEN Marks ELSE 0 END
) AS HistoryandGovernment,
SUM(CASE
  WHEN Code = 312 THEN Marks ELSE 0 END
) AS Geography,
SUM(CASE
  WHEN Code = 313 THEN Marks ELSE 0 END
) AS ChristianReligion,
SUM(CASE
  WHEN Code = 411 THEN Marks ELSE 0 END
) AS HomeScience,
SUM(CASE
  WHEN Code = 443 THEN Marks ELSE 0 END
) AS Agriculture,
SUM(CASE
  WHEN Code = 565 THEN Marks ELSE 0 END
) AS BusinessStudies
FROM StudentPerformance
GROUP BY SessionYearId,
    ClassId,
    TermId,
    ExamTypeId,
    StudentNumber,
    FirstName,
    MiddleName,
    Surname;
