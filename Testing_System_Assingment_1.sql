DROP DATABASE Exam;
CREATE DATABASE Exam;
USE Exam;

CREATE TABLE Department (
	DepartmentID		INT,
    DepartmentName		VARCHAR(50)
);

CREATE TABLE Position (
	PositionID			INT,
    PositionName		VARCHAR(50)
);

CREATE TABLE Account (
	AccountID			INT,
    Email				VARCHAR(50),
    Username			VARCHAR(50),
    Fullname			VARCHAR(50),
    DepartmenID			INT,
    PositionID			INT,
    CreateDate 			DATE
);
    
CREATE TABLE `Group` (
	GroupID				INT,
    GroupName			VARCHAR(50),
    CreatorID			INT,
    CreaDate			DATE
);

CREATE TABLE GroupAccount (
	GroupID				INT,
    AccountID			INT,
    JoinDate 			DATE
);

CREATE TABLE TypeQuestion (
	TypeID				INT,
    TypeName			VARCHAR(50)
);

CREATE TABLE CategoryQuestion (
	CategoryID			INT,
    CategoryName		VARCHAR(50)
);

CREATE TABLE Question (
	QuestionID			INT,
    Conten				VARCHAR(50),
    CategoryID			INT,
    TypeID				INT,
    CreatorID			INT,
    CreateDate			DATE
);

CREATE TABLE Answer (
	AnswerID			INT,
    Content				VARCHAR(50),
    QuestionID			INT,
    isCorrect			VARCHAR(50)
);

CREATE TABLE Exam (
	ExamID				INT,
    Code				INT,
    CategoryID			INT,
    DurationID			INT,
    CreatorID			INT,
    CeateDate			DATE
);

CREATE TABLE ExamQuestion (
	ExamID				INT,
    QuestionID			INT
);
