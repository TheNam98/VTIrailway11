import java.util.Date;

public class GroupAccount {
	Group groupID;
	@Override
	public String toString() {
		return "GroupAccount [groupID=" + groupID + ", accountID=" + accountID + ", joinDate=" + joinDate + "]";
	}
	Account accountID;
	Date joinDate;
}
