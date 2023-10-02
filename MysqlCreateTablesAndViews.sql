DROP database development_kasarini;

create database development_kasarini;

USE development_kasarini;
/*--------------TABLES---------------------------------------*/
CREATE TABLE Parent(
    NationalId INT NOT NULL,
    FirstName VARCHAR(45) NOT NULL,
    MiddleName VARCHAR(45),
    Surname VARCHAR(45) NOT NULL,
    PhoneNumber VARCHAR(45) NOT NULL,
    Gender CHAR NOT NULL,
    PRIMARY KEY (NationalId)
);
CREATE TABLE Staff(
    NationalId INT NOT NULL,
    FirstName VARCHAR(200) NOT NULL,
    MiddleName VARCHAR(200),
    Surname VARCHAR(200) NOT NULL,
    DateOfBirth DATE NOT NULL,
    EmploymentDate DATE NOT NULL,
    PhoneNumber VARCHAR(45) NOT NULL,
    Gender CHAR NOT NULL,
    Designation VARCHAR(200),
    PRIMARY KEY (NationalId)
);
CREATE TABLE SubjectCategory(
    SubjectCategoryId INT NOT NULL AUTO_INCREMENT,
    SubjectCategoryName VARCHAR(45) NOT NULL,
    PRIMARY KEY (SubjectCategoryId)
);
CREATE TABLE Subjects(
    Code INT NOT NULL,
    SubjectName VARCHAR(200) NOT NULL,
    SubjectCategoryId INT ,
	PRIMARY KEY (Code),
    FOREIGN KEY (SubjectCategoryId) REFERENCES SubjectCategory(SubjectCategoryId)
);
CREATE TABLE Grade(
    GradeId INT NOT NULL AUTO_INCREMENT,
    Grade CHAR(4) NOT NULL,
    Points INT NOT NULL,
    Remarks VARCHAR(200) NOT NULL,
    UpperLimit DECIMAL(5,2) NOT NULL,
    LowerLimit DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (GradeId)
);
CREATE TABLE ExamType(
    ExamTypeId INT NOT NULL AUTO_INCREMENT,
    ExamName VARCHAR(45) NOT NULL,
    ExamDescription VARCHAR(200) NOT NULL,
    PRIMARY KEY (ExamTypeId)
);
CREATE TABLE Term(
    TermId INT NOT NULL AUTO_INCREMENT,
    TermName VARCHAR(45) NOT NULL,
    PRIMARY KEY (TermId)
);
CREATE TABLE Teacher(
    TeacherId INT NOT NULL AUTO_INCREMENT,
    TeacherType VARCHAR(45) NOT NULL,
    TSCNumber VARCHAR(45),
    NationalId INT,
	UNIQUE (TSCNumber),
	PRIMARY KEY (TeacherId),
    FOREIGN KEY (NationalId) REFERENCES Staff(NationalId)
);
CREATE TABLE SessionYear(
    SessionYearId INT NOT NULL AUTO_INCREMENT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PRIMARY KEY (SessionYearId)
);
CREATE TABLE Form(
    FormId INT NOT NULL AUTO_INCREMENT,
    Form INT NOT NULL,
    PRIMARY KEY (FormId)
);
CREATE TABLE Stream(
    StreamId INT NOT NULL AUTO_INCREMENT,
    Stream VARCHAR(45) NOT NULL,
    PRIMARY KEY (StreamId)
);
CREATE TABLE Class(
    ClassId INT NOT NULL AUTO_INCREMENT,
    FormId INT,
    StreamId INT,
    SessionYearId INT,                        
    TeacherId INT,
    GradeId INT,
    Capacity INT,
    PRIMARY KEY (ClassId),
    FOREIGN KEY (FormId) REFERENCES Form(FormId),
    FOREIGN KEY (StreamId) REFERENCES Stream(StreamId),
    FOREIGN KEY (SessionYearId) REFERENCES SessionYear(SessionYearId),
    FOREIGN KEY (TeacherId) REFERENCES Teacher(TeacherId),
    FOREIGN KEY (GradeId) REFERENCES Grade(GradeId)
);
CREATE TABLE Student(
    StudentNumber INT NOT NULL auto_increment,
    FirstName VARCHAR(200) NOT NULL,
    MiddleName VARCHAR(200) NOT NULL,
    Surname VARCHAR(200) NOT NULL,
    Gender CHAR NOT NULL,
    DateOfBirth DATE NOT NULL,
    AdmissionDate DATE NOT NULL,
    PRIMARY KEY (StudentNumber)
);
CREATE TABLE ParentStudent(
    ParentStudentId INT NOT NULL AUTO_INCREMENT,
    StudentNumber INT ,
    ParentNationalId INT,
	PRIMARY KEY (ParentStudentId),
    FOREIGN KEY (StudentNumber) REFERENCES Student(StudentNumber),
    FOREIGN KEY (ParentNationalId) REFERENCES Parent(NationalId) 
);
CREATE TABLE StudentClass(
    StudentClassId INT NOT NULL AUTO_INCREMENT,
    ClassId INT ,
    StudentNumber INT,
	PRIMARY KEY (StudentClassId),
    FOREIGN KEY (ClassId) REFERENCES Class(ClassId),
    FOREIGN KEY (StudentNumber) REFERENCES Student (StudentNumber) 
);
CREATE TABLE Exam(
    ExamId INT NOT NULL AUTO_INCREMENT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TermId INT ,
    ExamTypeId INT,
	PRIMARY KEY (ExamId),
    FOREIGN KEY (TermId) REFERENCES Term(TermId),
    FOREIGN KEY (ExamTypeId) REFERENCES ExamType(ExamTypeId) 
);
CREATE TABLE ExamResult(
    ExamResultId INT NOT NULL AUTO_INCREMENT,
    ExamId INT,
    StudentClassId INT ,
    Code INT,
    GradeId INT,
    Marks DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (ExamResultId),
    FOREIGN KEY (ExamId) REFERENCES Exam(ExamId),
    FOREIGN KEY (StudentClassId) REFERENCES StudentClass(StudentClassId),
    FOREIGN KEY (Code) REFERENCES Subjects(Code),
    FOREIGN KEY (GradeId) REFERENCES Grade( GradeId)
);
CREATE TABLE StudentSubject(
    StudentSubjectId INT NOT NULL AUTO_INCREMENT,
    StudentNumber INT,
    Code INT,
	PRIMARY KEY (StudentSubjectId),
    FOREIGN KEY (StudentNumber) REFERENCES Student(StudentNumber),
    FOREIGN KEY (Code) REFERENCES Subjects(Code)
);
CREATE TABLE TeacherSubject(
    TeacherSubjectId INT NOT NULL AUTO_INCREMENT,
    TeacherId INT,
    Code INT,
	PRIMARY KEY (TeacherSubjectId),
    FOREIGN KEY (TeacherId) REFERENCES Teacher(TeacherId),
    FOREIGN KEY (Code) REFERENCES Subjects(Code)
);
CREATE TABLE TimeSlot(
    TimeslotId INT NOT NULL AUTO_INCREMENT,
    StartTime VARCHAR(20) NOT NULL,
    EndTime VARCHAR(20) NOT NULL,
    IsBeforeBreak VARCHAR(20) NOT NULL,
    IsAfterBreak VARCHAR(20) NOT NULL,
    PRIMARY KEY (TimeslotId)
);
CREATE TABLE TimeTable(
    TimeTableId INT NOT NULL AUTO_INCREMENT,
    ClassId INT,
    TimeslotId INT,
    DayOfTheWeek varchar(45) NOT NULL,
    PRIMARY KEY (TimeTableId),
    FOREIGN KEY (ClassId) REFERENCES Class(ClassId),
    FOREIGN KEY (TimeslotId) REFERENCES TimeSlot(TimeslotId)
);
CREATE TABLE TimetableTeacherSubject(
    TimetableSubjectId INT NOT NULL AUTO_INCREMENT,
    TimeTableId INT,
    TeacherSubjectId INT ,
	PRIMARY KEY (TimetableSubjectId),
    FOREIGN KEY (TimeTableId) REFERENCES TimeTable(TimeTableId),
    FOREIGN KEY (TeacherSubjectId) REFERENCES TeacherSubject(TeacherSubjectId)
);
/*-----------------------------------------------------------------------------------------------------
----------VIEWS--------------------------------------------------------------------------------------*/
DROP VIEW IF EXISTS SubjectList;
CREATE VIEW SubjectList
AS
SELECT  
    StudentClass.ClassId AS ClassId,
    StudentSubject.Code AS SubjectCode,
    Subjects.SubjectName AS SubjectName,
    COUNT(StudentSubject.StudentNumber) AS StudentCount
FROM StudentSubject
INNER JOIN Subjects ON Subjects.Code = StudentSubject.Code
INNER JOIN Student ON Student.StudentNumber = StudentSubject.StudentNumber
    INNER JOIN StudentClass ON StudentClass.StudentNumber = Student.StudentNumber
GROUP BY StudentSubject.Code, Subjects.SubjectName, StudentClass.ClassId;

DROP VIEW IF EXISTS ClassList;
CREATE VIEW ClassList 
AS
SELECT
    Student.StudentNumber,
    Student.FirstName,
    Student.MiddleName,
    Student.Surname,
    Student.AdmissionDate,
    DATEDIFF(Student.DateOfBirth,CURRENT_DATE())/8766 AS StudentAge,
    Class.ClassId
FROM Student AS Student
    INNER JOIN StudentClass AS StudentClass
        ON StudentClass.StudentNumber = Student.StudentNumber
    INNER JOIN Class AS Class
        ON StudentClass.ClassId = Class.ClassId;

DROP VIEW IF EXISTS StudentPerformance;
CREATE VIEW StudentPerformance
AS
SELECT
    Class.SessionYearId AS SessionYearId,
    Class.ClassId AS ClassId,
    Class.FormId AS FormId,
    Class.StreamId  AS StreamId,
    Student.StudentNumber AS StudentNumber,
    Student.FirstName AS FirstName,
    Student.MiddleName AS MiddleName,
    Student.Surname AS Surname,
    ExamResult.Code AS Code,
    Exam.TermId AS TermId,
    Exam.ExamTypeId AS ExamTypeId,
    ExamResult.Marks AS Marks
FROM ExamResult
    INNER JOIN Exam ON ExamResult.ExamId = Exam.ExamId
    INNER JOIN StudentClass ON ExamResult.StudentClassId = StudentClass.StudentClassId
        INNER JOIN Student ON Student.StudentNumber = StudentClass.StudentNumber
        INNER JOIN Class ON StudentClass.ClassId = Class.ClassId
    INNER JOIN Subjects ON ExamResult.Code = Subjects.Code     

/*-------------------------------------------------------------------------------------------------------------*/

