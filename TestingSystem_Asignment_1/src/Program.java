import java.util.Date;

public class Program {

	public static void main(String[] args) {
// khởi tạo department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "sale";
		
		System.out.println(department1.toString());
		
		Department department2 = new Department();
		department2.id = 2;
		department2.name = "marketing";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "nhân sự";
		
// khởi tạo position		
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.DEV;
		
		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.TEST;
		
		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.PM;

// khởi tạo Account
		Account	acc1 = new Account();
		acc1.id = 1;
		acc1.email = "cuongnm@gmail.com";
		acc1.userName = "cuongnm";
		acc1.fullName = "cuong";
		acc1.department = department1;
		acc1.position = position1;
		acc1.CreateDate = new Date();
		System.out.println(acc1.toString());
		
		Account	acc2 = new Account();
		acc2.id = 2;
		acc2.email = "congrose@gmail.com";
		acc2.userName = "congrose";
		acc2.fullName = "cong";
		acc2.department = department2;
		acc2.position = position2;
		acc2.CreateDate = new Date();
		
		Account	acc3 = new Account();
		acc3.id = 3;
		acc3.email = "toanbt@gmail.com";
		acc3.userName = "toanbt";
		acc3.fullName = "toan";
		acc3.department = department2;
		acc3.position = position2;
		acc3.CreateDate = new Date();
		
// khởi tạo group		
		Group gr1 = new Group();
		gr1.id = 1;
		gr1.name = "múa quạt";
		gr1.creatorID = acc1;
		gr1.CreateDate = new Date();
		
		System.out.println(gr1.toString());
		Group gr2 = new Group();
		gr2.id = 2;
		gr2.name = "vinahouse";
		gr2.creatorID = acc2;
		gr2.CreateDate = new Date();
		
		Group gr3 = new Group();
		gr3.id = 3;
		gr3.name = "edm";
		gr3.creatorID = acc3;
		gr3.CreateDate = new Date();

// khởi tạo groupAccount		
		GroupAccount gracc1 = new GroupAccount();
		gracc1.groupID = gr1;
		gracc1.accountID = acc1;
		gracc1.joinDate = new Date();
		
		System.out.println(gracc1.toString());
		GroupAccount gracc2 = new GroupAccount();
		gracc2.groupID = gr2;
		gracc2.accountID = acc2;
		gracc2.joinDate = new Date();
		
		GroupAccount gracc3 = new GroupAccount();
		gracc3.groupID = gr3;
		gracc3.accountID = acc3;
		gracc3.joinDate = new Date();
			
// khởi tạo TypeQuesion
		TypeQuesion tq1 = new TypeQuesion();
		tq1.id = 1;
		tq1.name = TypeQuestionName.ESSAY;
		
		System.out.println(tq1.toString());
		TypeQuesion tq2 = new TypeQuesion();
		tq2.id = 2;
		tq2.name = TypeQuestionName.MULTIPLECHOICE;
		
		TypeQuesion tq3 = new TypeQuesion();
		tq3.id = 3;
		tq3.name = TypeQuestionName.MULTIPLECHOICE;

// khởi tạo CategoryQuestion
		CategoryQuestion cq1 = new CategoryQuestion();
		cq1.id = 1;
		cq1.name = "Java";
		System.out.println(cq1.toString());
		
		CategoryQuestion cq2 = new CategoryQuestion();
		cq2.id = 2;
		cq2.name = "Java";
		
		CategoryQuestion cq3 = new CategoryQuestion();
		cq3.id = 3;
		cq3.name = "SQL";
		
// khởi tạo Question
		Question q1 = new Question();
		q1.id = 1;
		q1.content = "abc";
		q1.Category = cq1;
		q1.Type = tq1;
		q1.Creator = acc1;
		q1.CreateDate = new Date();
		System.out.println(q1.toString());
		
		Question q2 = new Question();
		q2.id = 2;
		q2.content = "bcd";
		q2.Category = cq2;
		q2.Type = tq2;
		q2.Creator = acc2;
		q2.CreateDate = new Date();
		
		Question q3 = new Question();
		q3.id = 3;
		q3.content = "def";
		q3.Category = cq3;
		q3.Type = tq3;
		q3.Creator = acc3;
		q3.CreateDate = new Date();
		
//khởi tạo Answer
		Answer an1 = new Answer();
		an1.id = 1;
		an1.content = "111";
		an1.Question = q1;
		System.out.println(an1.toString());
		
		Answer an2 = new Answer();
		an2.id = 2;
		an2.content = "222";
		an2.Question = q2;
		
		Answer an3 = new Answer();
		an3.id = 3;
		an3.content = "333";
		an3.Question = q3;
		
// khởi tạo Exam
		Exam ex1 = new Exam();
		ex1.id = 1;
		ex1.code = 111;
		ex1.title = "aaa";
		ex1.Category = cq1;
		ex1.Duration = 60;
		ex1.Creator = acc1;
		ex1.CreateDate = new Date();
		System.out.println(ex1.toString());
		
		Exam ex2 = new Exam();
		ex2.id = 2;
		ex2.code = 112;
		ex2.title = "bbb";
		ex2.Category = cq2;
		ex2.Duration = 45;
		ex2.Creator = acc2;
		ex2.CreateDate = new Date();
		
		Exam ex3 = new Exam();
		ex3.id = 3;
		ex3.code = 113;
		ex3.title = "ccc";
		ex3.Category = cq3;
		ex3.Duration = 90;
		ex3.Creator = acc3;
		ex3.CreateDate = new Date();
		
// khởi tạo ExamQuestion
		ExamQuestion exq1 = new ExamQuestion();
		exq1.Exam = ex1;
		exq1.Question = q1;
		System.out.println(exq1.toString());
		
		ExamQuestion exq2 = new ExamQuestion();
		exq2.Exam = ex2;
		exq2.Question = q2;
		
		ExamQuestion exq3 = new ExamQuestion();
		exq3.Exam = ex3;
		exq3.Question = q3;
		
	}

}
