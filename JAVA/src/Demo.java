
public class Demo {

	public static void main(String[] args) {
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "múa quạt";
		group1.showInfo();
		
// phải gán group cho stundent thì mới in được các thuộc tính của group
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "rẩy đầm";
		group2.showInfo();
		
		Student student1 = new Student();
		student1.id = 1;
		student1.fullName = "công rose";
//		student1.group = group1;
		
		Student student2 = new Student();
		student2.id = 1;
		student2.fullName = "công rose";
// student1 tham gia 2 groups
		Group[] dsGroup = {group1,group2};
		student1.groups = dsGroup;
		System.out.println(student1.fullName);
		student1.groups[0].showInfo();
		student1.groups[1].showInfo();
		
//		System.out.println(student1.fullName);
//		System.out.println(student1.group.id);
//		student1.group.showInfo();
	}

}
