package zoo;

public class BearedVulture extends Animal implements Bird{
	
	public BearedVulture(String name, String gender, int age) {
		super(name, gender, age);
	}

	@Override
	void makeSomeNoise() {
		System.out.println("수염 벅벅 긁기!");
	}
}
