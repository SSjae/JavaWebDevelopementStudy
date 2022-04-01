package zoo;

public class DragonChicken extends Animal implements Reptile{
	
	public DragonChicken(String name, String gender, int age) {
		super(name, gender, age);
	}

	@Override
	void makeSomeNoise() {
		System.out.println("갈래화살");
	}
}
