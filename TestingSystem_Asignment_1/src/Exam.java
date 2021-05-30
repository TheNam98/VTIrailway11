import java.util.Date;

public class Exam {
	byte id;
	byte code;
	String title;
	CategoryQuestion Category;
	byte Duration;
	Account Creator;
	@Override
	public String toString() {
		return "Exam [id=" + id + ", code=" + code + ", title=" + title + ", Category=" + Category + ", Duration="
				+ Duration + ", Creator=" + Creator + ", CreateDate=" + CreateDate + "]";
	}
	Date CreateDate;
}
