
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS trigger1;
DELIMITER $$
	CREATE TRIGGER trigger1
    BEFORE INSERT ON `Group`
    FOR EACH ROW
    BEGIN
		IF NEW.CreateDate < DATE_SUB(NOW(), INTERVAL 1 YEAR) THEN
			SIGNAL SQLSTATE '12345' -- 10000 - 99999
			SET MESSAGE_TEXT = "lỗi CreateDate";
		END IF ;
	END $$
DELIMITER ;
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"
DROP TRIGGER IF EXISTS trigger2;
DELIMITER $$
	CREATE TRIGGER trigger2
    BEFORE INSERT ON `Account`
    FOR EACH ROW
    BEGIN
		IF NEW.DepartmentID= 2 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = "Department Sale cannot add more user";
		END IF;
	END $$
DELIMITER ;	
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidag29productions@gmail.com'	, 'dagblack'		,'guyễn hải Đăng'		,   '2'			,   '1'		,'2020-03-05');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS trigger3;
DELIMITER $$
	CREATE TRIGGER trigger3
    BEFORE INSERT ON `GroupAccount`
	    FOR EACH ROW
    BEGIN
		DECLARE count_user_of_group INT;
        SET count_user_of_group = 0;
        SELECT count(1) INTO count_user_of_group
        FROM groupaccount
        WHERE GroupID = NEW.GroupID
        GROUP BY GroupID;
        
        IF count_user_of_group >= 5 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = "không thể thêm account vào group";
		END IF;
	END $$
DELIMITER ;
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    5		,'2019-03-05');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS trigger4;
DELIMITER $$
	CREATE TRIGGER trigger4
    BEFORE INSERT ON examquestion
	    FOR EACH ROW
    BEGIN
		DECLARE count_Questionr_of_exam INT;
        SET count_Questionr_of_exam = 0;
        SELECT count(ExamID) INTO count_Questionr_of_exam
        FROM examquestion
        WHERE ExamID = NEW.ExamID
        GROUP BY ExamID;
        
        IF count_Questionr_of_exam >= 10 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = "không thể thêm question vào exam";
		END IF;
	END $$
DELIMITER ;
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		12		);
SET FOREIGN_KEY_CHECKS = 0;

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa)
DROP TRIGGER IF EXISTS trigger5;
DELIMITER $$
	CREATE TRIGGER trigger5
    BEFORE DELETE ON `Account`
    FOR EACH ROW
    BEGIN
		IF OLD.Email= 'admin@gmail.com' THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = "đây là tài khoản admin, không cho phép user xóa";
		END IF;
	END $$
DELIMITER ;	

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
DROP TRIGGER IF EXISTS trigger6;
DELIMITER $$
	CREATE TRIGGER trigger6			
    BEFORE INSERT ON `Account`
    FOR EACH ROW
    BEGIN
		IF NEW.DepartmentID IS NULL THEN
			SET NEW.DepartmentID = 10;
		END IF ;
	END $$
DELIMITER ;
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29podutions@gmail.com'	, 'danback'		,'Ngyễn ải Đăng'		,   	NULL	,   '1'		,'2020-03-05');
SELECT * FROM `Account`;

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS trigger7;
DELIMITER $$
	CREATE TRIGGER trigger7			
    BEFORE INSERT ON Answer
    FOR EACH ROW
    BEGIN
		DECLARE count_Answer_true INT;
        DECLARE count_Answer INT;
        SET count_Answer_true = 0;
        SET count_Answer = 0;
        SELECT count(1) INTO count_Answer
        FROM Answer
        WHERE QuestionID = NEW.QuestionID
        GROUP BY QuestionID; 
        IF count_Answer >= 4 THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = "Question đã có đủ 4 câu trả lời";
		END IF;
        
		SELECT count(1) INTO count_Answer_true
        FROM Answer
        WHERE QuestionID = NEW.QuestionID AND isCorrect = 1
        GROUP BY QuestionID; 
        IF count_Answer_true >= 2 AND NEW.isCorrect = 1 THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = "Question đã có đủ 2 câu trả lời đúng";
		END IF;
	END $$
DELIMITER ;
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   2			,	1		);

-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
SELECT *,
	CASE
    WHEN Duration <= 30 THEN "Short time"
    WHEN Duration > 30 && Duration <=60 THEN "Medium time"
	ELSE "Long time"
END ABC
FROM Exam;


-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
SELECT*,COUNT(GroupID),
	CASE
    WHEN COUNT(GroupID) <= 5 THEN "few"
    WHEN 5 < COUNT(GroupID) <= 20 THEN "normal"
    ELSE "higher"
END the_number_user_amount
FROM GroupAccount
GROUP BY GroupID
