import java.time.LocalDate;
import java.util.Random;

public class Exercise4 {

	public static void main(String[] args) {

//		// Question 1
		Random random = new Random();
		int i = random.nextInt();
		System.out.println(i);
//		// Question 2
//
		float i1 = random.nextFloat();
		System.out.println(i1);

		// Question 4
		int minDay = (int) LocalDate.of(1995, 05, 24).toEpochDay();
		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();

		long randomInt = minDay + random.nextInt(maxDay - minDay);

		LocalDate randomDay = LocalDate.ofEpochDay(randomInt);

		System.out.println(randomDay);

		// Question 5
		int minDay1 = (int) LocalDate.of(2020, 06, 02).toEpochDay();
		int maxDay1 = (int) LocalDate.of(2021, 06, 02).toEpochDay();

		long randomInt1 = minDay + random.nextInt(maxDay1 - minDay1);

		LocalDate randomDay1 = LocalDate.ofEpochDay(randomInt1);

		System.out.println(randomDay);

		// Question 6
		int minDay2 = (int) LocalDate.of(0001, 01, 01).toEpochDay();
		int maxDay2 = (int) LocalDate.of(2021, 03, 02).toEpochDay();

		long randomInt2 = minDay + random.nextInt(maxDay2 - minDay2);

		LocalDate randomDay2 = LocalDate.ofEpochDay(randomInt);

		System.out.println(randomDay);

		// Question 7
		int i2 = random.nextInt(900) + 100;
		System.out.println(i2);

	}
}