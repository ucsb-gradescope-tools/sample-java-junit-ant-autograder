public class Assignment {
	public int myNumber;

	public Assignment() {
		myNumber = -1;
	}

	public Assignment(int n) {
		myNumber = n;
	}

	public String hello() {
		return "Hello!";
	}

	public int add(int x) {
		return myNumber + x;
	}
}