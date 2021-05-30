import java.util.Date;
public class Account {
	byte id;
	String email;
	String userName;
	String fullName;
	Department department;
	Position position;
	Date CreateDate;
	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", fullName=" + fullName + ", department=" + department
				+ ", position=" + position + ", CreateDate=" + CreateDate + "]";
	}
	
}
