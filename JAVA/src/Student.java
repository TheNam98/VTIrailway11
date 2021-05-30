import java.util.Date;

public class Student {
	int id;
	float salary;
	String fullName;
	char a;
	boolean isPassCourse;
	Date birthDay;
	Gender gender;
	int[] diems;
	Group[] groups;
	
	void goToSchool() {
		System.out.println(fullName +  " đi học ...");
	}
	void doHomeWork() {
		System.out.println(" đi chơi HomeWork ...");
	}
}
