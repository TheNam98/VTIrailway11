DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

CREATE TABLE Trainee (
	TraineeID 			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Full_Name			NVARCHAR(50) NOT NULL,
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

INSERT INTO Trainee (Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,VTI_Account)
VALUES 			('NguyenVanA', '2003/01/02', 'male', '11','12','13','A'),
				('TranThiB','2001/05/03','female','13','15','16','B'),
                ('TranVanC','2001/02/20','male','15','18','11','C'),
                ('TranThiD','2001/05/10','female','15','14','19','D'),
                ('DoThiE','2001/01/22','female','18','18','16','E');


-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT *
FROM Trainee
ORDER BY MONTH(Birth_Date);

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT FUll_Name,2021-Year(Birth_Date) AS Age,Gender, LENGTH(Full_Name)
FROM Trainee
ORDER BY LENGTH(Full_Name) DESC
LIMIT 1;

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm...
SELECT *
FROM Trainee
WHERE ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;

-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE
FROM Trainee
WHERE TraineeID =3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE Trainee
SET Training_Class ='2'
WHERE TraineeID =5;