-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `Account`
JOIN Department USING(DepartmentID);

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `Account`
WHERE CreateDate < 20/12/2019;

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM `Account` 
JOIN position USING(PositionID)
WHERE PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT *, COUNT(AccountID)
FROM Department
JOIN `Account` USING (DepartmentID)
GROUP BY DepartmentID
HAVING COUNT(AccountID) >=3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT  *, COUNT(eq.QuestionID)
FROM   ExamQuestion eq
JOIN   Question q ON   q.QuestionID =eq.QuestionID
GROUP BY  eq.QuestionID
HAVING  COUNT(eq.QuestionID) = ( 	SELECT  COUNT(QuestionID)
									FROM   ExamQuestion
									GROUP BY  QuestionID 	
									ORDER BY COUNT(QuestionID) DESC
 LIMIT  1);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT *, count(CategoryID)
FROM Question
JOIN CategoryQuestion USING (CategoryID)
GROUP BY CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT *, count(ExamID)
FROM ExamQuestion
JOIN Question USING (QuestionID)
GROUP BY QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT  *, COUNT(eq.QuestionID)
FROM   Answer eq
JOIN   Question q ON   q.QuestionID =eq.QuestionID
GROUP BY  eq.QuestionID
HAVING  COUNT(eq.QuestionID) = ( 	SELECT  COUNT(QuestionID)
									FROM   Answer
									GROUP BY  QuestionID 	
									ORDER BY COUNT(QuestionID) DESC
 LIMIT  1);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT *, count(AccountID)
FROM `Account`
JOIN GroupAccount USING (AccountID)
GROUP BY GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT * , count(1)
FROM `Account`
GROUP BY PositionID
HAVING COUNT(1) = ( SELECT count(1)
					FROM `Account`
                    GROUP BY PositionID
					ORDER BY count(1)
                    LIMIT 1);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu thuộc dev, test, scrum master, PM
SELECT *,group_concat(PositionName), COUNT(DepartmentID) AS soluongnhanvien
FROM `Account`
JOIN position USING(PositionID)
WHERE PositionName IN ('Dev','Test','Scrum Master','PM')
GROUP BY DepartmentID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...	
SELECT		q.Content AS 'Cau hoi', tq.TypeName AS 'Loai cau hoi', acc.UserName AS 'Nguoi tao cau hoi', an.Content AS 'Cau tra loi'
FROM		question q
LEFT JOIN	answer an ON an.QuestionID = q.QuestionID
JOIN		typequestion tq ON tq.TypeID = q.TypeID
JOIN		`account` acc ON acc.AccountID = q.CreatorID
ORDER BY 	q.Content ASC;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT *, COUNT(TypeID)
FROM Question
JOIN TypeQuestion USING (TypeID)
GROUP BY TypeID;

-- Question 14:Lấy ra group không có account nào
SELECT *
FROM Groupaccount
RIGHT JOIN `Group` USING(GroupID)
WHERE AccountID IS NULL;

SELECT *
FROM `Group`
LEFT JOIN Groupaccount USING(GroupID)
WHERE AccountID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question
LEFT JOIN Answer USING(QuestionID)
WHERE AnswerID IS NULL;