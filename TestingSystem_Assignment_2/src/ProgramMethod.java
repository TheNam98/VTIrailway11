import java.util.Date;

public class ProgramMethod {

	public static void main(String[] args) {
		ProgramMethod programmethod = new ProgramMethod();
//		programmethod.gotoSchool();
//		System.out.println(programmethod.tinhtong(1, 2));
//		gotoSchool();
//		System.out.println(tinhtong(1, 2));
//	}
//	static void gotoSchool() {
//		System.out.println("gotoschool ...");
//	}
//	static int tinhtong(int sothu1, int sothu2) {
//		return sothu1 + sothu2;
//		
//		programmethod.inSoChan();

		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "cuongnm@gmail.com";
		acc1.userName = "cuongnm";
		acc1.fullName = "cuong";
		acc1.CreateDate = new Date();

		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "congrose@gmail.com";
		acc2.userName = "congrose";
		acc2.fullName = "cong";
		acc2.CreateDate = new Date();
		Account[] dsAccount = new Account[] { acc1, acc2 };
		accountinfo(dsAccount);
	}

//	static void inSoChan() {
//		for (int i = 1; i < 10; i++) {
//			if (i % 2 == 0) {
//				System.out.println(i);
//			}
//		}
//	}
	static void accountinfo(Account[] listAccount) {
		for (Account account : listAccount) {
			System.out.println(account.toString());
		}
	}

}
