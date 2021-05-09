DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

CREATE TABLE Trainee (
	TraineeID 			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Full_Nam			NVARCHAR(50) NOT NULL,
    Birth_Date			DATE,
    Gender				ENUM('male','female','unknown'),
    ET_IQ				TINYINT CHECK(0 <=ET_IQ<= 20),
    ET_Gmath			TINYINT CHECK(0 <=ET_Gmath<= 20),
    ET_English			TINYINT CHECK(0 <=ET_English<= 50),
    Training_Class		VARCHAR(50),
    Evaluation_Notes	TEXT
);

ALTER TABLE Trainee
ADD VTI_Account CHAR(50) NOT NULL UNIQUE KEY;