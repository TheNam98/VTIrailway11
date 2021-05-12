

USE Exam;

INSERT INTO Department (DepartmentName)
VALUES		 ("phong1"),
			("phong2"),
			("phong3"),
			("phong4"),
            ("phong5");
		
INSERT INTO Position (PositionName)
VALUES	("Dev"),
		("Test"),
		("Scrum Master"),
        ("Dev"),
		("PM");
           
INSERT INTO `Account` (Email,Username,Fullname,DepartmentID,PositionID)
VALUES	("thenam@gmail.com","Nam","TheNam","1","1"),
		("nguyenthuong@gmail.com","Thuong","NguyenThuong","2","2"),
        ("buitoan@gmail.com","Toan","BuiToan","3","3"),
        ("tuannghia@gmail.com","Nghia","TuanNghia","4","4"),
        ("dooanh@gmail.com","Oanh","DoOanh","5","5");

INSERT INTO `Group` (GroupName,CreatorID)
VALUES	("nhomA","1"),
		("nhomB","2"),
        ("nhomC","3"),
        ("nhomD","4"),
        ("nhomE","5");

INSERT INTO GroupAccount (GroupID,AccountID)
VALUES	("1","1"),
		("2","2"),
        ("3","3"),
        ("4","4"),
        ("5","5");
        
INSERT INTO TypeQuestion (TypeName)
VALUES	("Essay"),
		("Essay"),
        ("Essay"),
        ("Multiple-Choice"),
        ("Multiple-Choice");
        
INSERT INTO CategoryQuestion (CategoryName)  
VALUES	("Java"),
		("NET"),
        ("Java"),
        ("SQL"),
        ("Ruby");
        
INSERT INTO Question (Conten,CategoryID,TypeID,CreatorID)
VALUES	("noi dung cau hoi 1","1","1","1"),
		("noi dung cau hoi 2","2","2","2"),
        ("noi dung cau hoi 3","3","3","3"),
        ("noi dung cau hoi 4","4","4","4"),
        ("noi dung cau hoi 5","5","5","5");
        
INSERT INTO Answer (Content,QuestionID)
VALUES	("noi dung cau tra loi 1","1"),
		("noi dung cau tra loi 2","2"),
        ("noi dung cau tra loi 3","3"),
        ("noi dung cau tra loi 4","4"),
        ("noi dung cau tra loi 5","5");

INSERT INTO Exam (`Code`,Title,CategoryID,Duration,CreatorID)
VALUES	("made1","de 1","1","1","1"),
		("made2","de 2","2","2","2"),
        ("made3","de 3","3","3","3"),
        ("made4","de 4","4","4","4"),
        ("made5","de 5","5","5","5");
        
INSERT INTO ExamQuestion (ExamID,QuestionID)
VALUES	("1","1"),
		("2","2"),
		("3","3"),
		("4","4"),
        ("5","5");
        