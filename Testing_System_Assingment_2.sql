DROP DATABASE IF EXISTS Exam;
CREATE DATABASE Exam;
USE Exam;

CREATE TABLE Department (
	DepartmentID		TINYINT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName		VARCHAR(50) NOT NULL UNIQUE KEY
);
	
CREATE TABLE `Position` (
	PositionID			TINYINT AUTO_INCREMENT PRIMARY KEY,
    PositionName		ENUM('Dev','Test','Scrum','Master','PM')
);

CREATE TABLE `Account` (
	AccountID			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Email				VARCHAR(50) NOT NULL UNIQUE KEY,
    Username			NVARCHAR(50) NOT NULL,
    Fullname			NVARCHAR(50) NOT NULL,
    DepartmentID		TINYINT NOT NULL,
    PositionID			TINYINT NOT NULL,
    CreateDate 			DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
    );
    
CREATE TABLE `Group` (
	GroupID				TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName			VARCHAR(50) NOT NULL,
    CreatorID			SMALLINT NOT NULL,
    CreaDate			DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

CREATE TABLE GroupAccount (
	GroupID				TINYINT NOT NULL,
    AccountID			SMALLINT NOT NULL,
    JoinDate 			DATE,
    PRIMARY KEY(GroupID,AccountID),
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
																																	
CREATE TABLE TypeQuestion (
	TypeID				TINYINT AUTO_INCREMENT PRIMARY KEY,
    TypeName			ENUM('Essay','Multiple-Choice')
);

CREATE TABLE CategoryQuestion (
	CategoryID			TINYINT AUTO_INCREMENT PRIMARY KEY,
    CategoryName		NVARCHAR(50) NOT NULL
);

CREATE TABLE Question (
	QuestionID			TINYINT AUTO_INCREMENT PRIMARY KEY,
    Conten				TEXT NOT NULL,
    CategoryID			TINYINT	NOT NULL,
    TypeID				TINYINT NOT NULL,
    CreatorID			SMALLINT NOT NULL,
    CreateDate			DATE,
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

CREATE TABLE Answer (
	AnswerID			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Content				TEXT NOT NULL,
    QuestionID			TINYINT NOT NULL,
    isCorrect			BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

CREATE TABLE Exam (
	ExamID				TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Code`				VARCHAR(50) NOT NULL,
    Title				NVARCHAR(50),
    CategoryID			TINYINT UNSIGNED NOT NULL,
    Duration			TINYINT UNSIGNED NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CeateDate			DATE,
    FOREIGN KEY (CategoryQuestion) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

CREATE TABLE ExamQuestion (
	ExamID				TINYINT,
    QuestionID			TINYINT,
    PRIMARY KEY(ExamID,QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
