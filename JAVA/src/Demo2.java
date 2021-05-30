import java.util.Scanner;
public class Demo2 {
	

	public static void main(String[] args) {
//		for(int i = 1; i <=10;i = i+4) {
//			System.out.println(i);
//			System.out.println("Lession 2");
//		}

//		int[]points = {1,2,3,4,5};
//		
//		for(int point : points) {
//			System.out.println(point);
//		}
//
//		int i = 1;
//		while (i <= 10) {
//			System.out.println(i);
//			i++;
//		}

//		do {
//			System.out.println(i);
//			i++;
//		} while (i < 10);

		Scanner scanner = new Scanner(System.in);
		System.out.println("mời bạn nhập tên:");
		String ten = scanner.nextLine();
		System.out.println(ten);
		
		System.out.println("mời bạn nhập tuổi:");
		int tuoi = scanner.nextInt();
		System.out.println(tuoi);
		scanner.close();
	}
}
