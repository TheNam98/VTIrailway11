USE TestingSystem;
DROP PROCEDURE IF EXiSTS getInfoAccount;
DELIMITER $$
-- những IN OUT được truyền vào PROCEDURE sẽ đuộc gọi là tham số || parameter

CREATE PROCEDURE getInfoAccount(IN userid INT,OUT user_name VARCHAR(50),OUT email1 VARCHAR(50))
	BEGIN
		SELECT Username,Email INTO user_name,email1
        FROM `Account`
        WHERE AccountID = userid;
    END $$
DELIMITER ;
SET @user_name = '',@email1 = '';
CALL getInfoAccount(6,@user_name,@email1);
SELECT @user_name,@email1;


DROP PROCEDURE IF EXiSTS getInfoAccount;
DELIMITER $$
CREATE PROCEDURE getInfoAccount(IN email VARCHAR(50),IN user_name VARCHAR(50))
	BEGIN
		SELECT *
        FROM question q
        JOIN `Account` acc ON acc.AccountID = q.CreatorID
        WHERE acc.Email = email || acc.Username = user_name;
    END $$
DELIMITER ;

CAll getInfoAccount( 'dapphatchetngay@gmail.com','huanhoahong');

DROP PROCEDURE IF EXiSTS getInfoAccount;
DELIMITER $$
CREATE PROCEDURE getInfoAccount(IN username VARCHAR(50))
	BEGIN
		DECLARE full_name VARCHAR(100);
        -- khai báo biến cục bộ
		SELECT acc.Fullname INTO full_name
        FROM `account` acc
        WHERE acc.Username = username;
        SELECT full_name;
    END $$
DELIMITER ;

CAll getInfoAccount('quanganh');

DROP FUNCTION IF EXiSTS tinhtong;
DELIMITER $$
CREATE FUNCTION tinhtong(so_thu1 INT,so_thu2 INT) RETURNS INT
	BEGIN
		RETURN so_thu1 + so_thu2;
    END $$
DELIMITER ;
SELECT tinhtong(1,3);

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXiSTS getInfoAccount1;
DELIMITER $$
CREATE PROCEDURE getInfoAccount1(IN DepartmentName1 NVARCHAR(30))
	BEGIN
		SELECT *
        FROM Department D
        JOIN `Account` Acc ON Acc.DepartmentID = D.DepartmentID
        WHERE D.DepartmentName = DepartmentName1;
    END $$
DELIMITER ;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXiSTS getInfoAccount2;
DELIMITER $$
CREATE PROCEDURE getInfoAccount2()
	BEGIN
		SELECT GroupID, COUNT(AccountID)
        FROM GroupAccount
		GROUP BY GroupID;
    END $$
DELIMITER ;
call testingsystem.getInfoAccount2();

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXiSTS getInfoquestion;
DELIMITER $$
CREATE PROCEDURE getInfoquestion()
	BEGIN
		SELECT *,COUNT(TypeID)
        FROM Question
        WHERE MONTH(CreateDate) = MONTH(Now()) AND year(CreateDate) = YEAR(Now())
        GROUP BY TypeID;
    END $$
DELIMITER ;
call testingsystem.getInfoquestion();

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXiSTS getInfoquestion4;
DELIMITER $$
CREATE PROCEDURE getInfoquestion4(OUT question1 INT)
	BEGIN
		SELECT Q.TypeID INTO question1
        FROM Question Q
        JOIN TypeQuestion T USING(TypeID)
        GROUP BY Q.TypeID
        HAVING COUNT(Q.TypeID) = ( SELECT COUNT(Q1.QuestionID)
									FROM   Question Q1
									GROUP BY  Q1.TypeID 	
									ORDER BY COUNT(Q1.QuestionID) DESC
									LIMIT  1)
		ORDER BY Q.TypeID DESC
		LIMIT 1;
    END $$
DELIMITER ;
set @question1 = 0;
call testingsystem.getInfoquestion4(@question1);
select @question1;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
-- C1 tạo hàm thủ tục (store PROCEDURE) có input là TypeID
-- C2
DROP PROCEDURE IF EXiSTS getInfoquestion5;
DELIMITER $$
CREATE PROCEDURE getInfoquestion5()
	BEGIN
		DECLARE TypeID INT;
        Set TypeID = 0;
        CALL testingsystem.getInfoquestion4(TypeID);
        SELECT *
        FROM Typequestion t
        WHERE t.TypeID = TypeID;
        
	END $$
DELIMITER ;
CALL testingsystem.getInfoquestion5();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
-- C1 dùng 2 câu lệnh select khác nhau
DROP PROCEDURE IF EXiSTS getInfoquestion6;
DELIMITER $$
CREATE PROCEDURE getInfoquestion6(IN input NVARChAR(50))
	BEGIN
		SELECT *
        FROM `Account`
        WHERE Username LIKE concat('%',input,'%');
        SELECT *
        FROM `Group`
        WHERE GroupName LIKE CONCAT('%',input,'%');
	END $$
DELIMITER ;
call testingsystem.getInfoquestion6('huan');

-- C2 dùng UNION kết hợp dữ liệu của 2 câu lệnh select này
DROP PROCEDURE IF EXiSTS getInfoquestion6;
DELIMITER $$
CREATE PROCEDURE getInfoquestion6(IN input NVARChAR(50))
	BEGIN
		SELECT AccountID, Username,'account'
        FROM `Account`
        WHERE Username LIKE concat('%',input,'%')
        UNION
        SELECT GroupID,GroupName,'group'
        FROM `Group`
        WHERE GroupName LIKE CONCAT('%',input,'%');
	END $$
DELIMITER ;
call testingsystem.getInfoquestion6('huan');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
SET FOREIGN_KEY_CHECKS = 0;
DROP PROCEDURE IF EXiSTS getInfoquestion9;
DELIMITER $$
CREATE PROCEDURE getInfoquestion9(IN ID INT)
	BEGIN
		DELETE
        FROM 	Exam
        WHERE 	ExamID = ID;
	END $$
DELIMITER ;
CALL getInfoquestion9(1);
SELECT * FROM Exam;

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi
SET FOREIGN_KEY_CHECKS = 0;
DROP PROCEDURE IF EXiSTS getInfoquestion10;
DELIMITER $$
CREATE PROCEDURE getInfoquestion10()
	BEGIN
        DECLARE ExamID_1 INT;
        CREATE OR REPLACE VIEW view1 AS	
				SELECT 	ExamID
				FROM 	Exam
				WHERE 	(YEAR(now()) - year(CreateDate)) >= 3;
		SELECT ExamID INTO ExamID_1
        FROM view1
        LIMIT 1;
        CALL getInfoquestion9(ExamID_1);
	END $$
DELIMITER ;
CALL getInfoquestion10();

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXiSTS getInfoquestion11;
DELIMITER $$
CREATE PROCEDURE getInfoquestion11(IN in_Department NVARCHAR(50))
	BEGIN
    -- khai báo biến in_Department_id để lưu lại id của phòng ban muốn xóa
		DECLARE in_Department_id INT;
        SET FOREIGN_KEY_CHECKS = 0;
        SELECT DepartmentID INTO in_Department_id
        FROM Department
        WHERE DepartmentName = in_Department;
        DELETE 
        FROM Department
        WHERE DepartmentName = in_Department;
	-- update deparmenID = 10 cho các account thuộc in_Department_id
        UPDATE `Account`
        SET DepartmentID = 10
        WHERE DepartmentID = in_Department_id;
	END $$
DELIMITER ;
CALL getInfoquestion11('Sale');

