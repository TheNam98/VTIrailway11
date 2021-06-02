import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Exercise3 {

	public static void main(String[] args) {
		// Question 1
		Exam ex1 = new Exam();
		ex1.id = 1;
		ex1.code = 111;
		ex1.title = "aaa";
		ex1.Duration = 60;
		ex1.CreateDate = new Date();

		Locale locale = new Locale("vi", "VN");
		DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
		String date = dateformat.format(ex1.CreateDate);
		System.out.println(ex1.toString());

		// Question 2
		String pattern = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat simpledateformat = new SimpleDateFormat(pattern);
		String date1 = simpledateformat.format(ex1.CreateDate);
		System.out.println(date);

		// Question 3
		String pattern1 = "yyyy";
		SimpleDateFormat simpledateformat1 = new SimpleDateFormat(pattern);
		String date2 = simpledateformat.format(ex1.CreateDate);
		System.out.println(date);

		// Question 4
		String pattern2 = "MM-dd";
		SimpleDateFormat simpledateformat2 = new SimpleDateFormat(pattern);
		String date3 = simpledateformat.format(ex1.CreateDate);
		System.out.println(date);

	}

}
