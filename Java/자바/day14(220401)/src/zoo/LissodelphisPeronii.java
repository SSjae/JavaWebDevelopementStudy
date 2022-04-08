package zoo;

public class LissodelphisPeronii extends Animal implements Mammal{
	
	public LissodelphisPeronii(String name, String gender, int age) {
		super(name, gender, age);
	}

	@Override
	void makeSomeNoise() {
		System.out.println("Da-da-da-da");
	}
}
