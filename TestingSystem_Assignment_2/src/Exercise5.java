
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Exercise5 {
	public static void main(String[] args) throws ParseException {

		Scanner scanner = new Scanner(System.in);

		// Question 1
		System.out.println("Mời bạn nhập 3 số nguyên dương ");
		for (int i = 0; i < 3; i++) {
			int x = scanner.nextInt();
			System.out.println("Bạn đã nhập: " + x + "\n");
		}

		// Question 2
		System.out.println("Moi ban nhap vao 2 so thuc");
		for (int i = 0; i < 2; i++) {
			double d = scanner.nextDouble();
			System.out.println("Bạn đã nhập: " + d + "\n");
		}

		// Question 3
		System.out.println("Mời bạn nhập vào họ");
		String s1 = scanner.next();
		System.out.println("Mời bạn nhập vào tên");
		String s2 = scanner.next();
		System.out.println("Tên của bạn là: " + s1 + " " + s2 + "\n");

		// Question 4
		System.out.println("Mời bạn nhập vào ngày sinh");
		String dob = scanner.next();
		String pattern = "yyyy/MM/dd";
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		Date date = dateFormat.parse(dob);
		System.out.println("Sinh nhật: " + date);

		// Question 7
		System.out.println("Mời bạn nhập vào số chẵn");
		int number = scanner.nextInt();
		if (number % 2 == 0) {
			System.out.println("Số chẵn: " + number);
		} else {
			System.out.println("Nhập sai");
		}

	}

}
