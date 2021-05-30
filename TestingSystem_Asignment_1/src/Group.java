import java.util.Date;

public class Group {
	byte id;
	String name;
	Account creatorID;
	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", creatorID=" + creatorID + ", CreateDate=" + CreateDate + "]";
	}
	Date CreateDate;
}
