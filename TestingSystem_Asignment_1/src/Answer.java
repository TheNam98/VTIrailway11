
public class Answer {
	byte id;
	String content;
	Question Question;
	boolean isCorrect;
	@Override
	public String toString() {
		return "Answer [id=" + id + ", content=" + content + ", Question=" + Question + ", isCorrect=" + isCorrect
				+ "]";
	}
}
