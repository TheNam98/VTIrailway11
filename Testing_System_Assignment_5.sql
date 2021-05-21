SELECT *
FROM `Account`
WHERE AccountID > ANY( SELECT AccountID
						FROM `Account`
                        WHERE AccountID IN(1,2,3));
				
CREATE VIEW view1 AS
SELECT AccountID, Email
FROM `Account`;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW view1 AS	
SELECT *
FROM `Account`
JOIN department USING (DepartmentID)
WHERE DepartmentName = 'Sale';

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW view2 AS
SELECT *, count(GroupID)
FROM GroupAccount
GROUP BY GroupID
HAVING COUNT(GroupID) = ( SELECT count(GroupID)
					FROM GroupAccount
                    GROUP BY GroupID
					ORDER BY count(GroupID) DESC
                    LIMIT 1);
                    
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
SET FOREIGN_KEY_CHECKS = 0;
CREATE VIEW view3 AS
SELECT *
FROM Question
WHERE LENGTH(Content) >300;
DELETE
FROM view3
WHERE LENGTH(Content) >300;

-- 	Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW view4 AS
SELECT *, COUNT(departmentID)
FROM `Account`
JOIN Department USING (DepartmentID)
GROUP BY DepartmentID
HAVING count(departmentID) = ( SELECT count(departmentID)
								FROM `Account`
								JOIN Department USING (DepartmentID)
								GROUP BY DepartmentID
                                ORDER BY COUNT(departmentID) DESC
                                LIMIT 1);

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW view5 AS
SELECT *
FROM Question Q
JOIN `Account` A ON Q.CreatorID =A.`AccountID`
WHERE FullName LIKE 'Nguyễn%';