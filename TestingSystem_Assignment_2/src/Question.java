import java.util.Date;

public class Question {
	byte id;
	String content;
	CategoryQuestion Category;
	TypeQuesion Type;
	Account Creator;
	Date CreateDate;
	@Override
	public String toString() {
		return "Question [id=" + id + ", content=" + content + ", Category=" + Category + ", Type=" + Type
				+ ", Creator=" + Creator + ", CreateDate=" + CreateDate + "]";
	}
}
