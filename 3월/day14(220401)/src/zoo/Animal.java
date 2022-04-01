package zoo;

public abstract class Animal {
	String name;
	String gender;
	int age;
	
	public Animal(String name, String gender, int age) {
		this.name = name;
		this.gender = gender;
		this.age = age;
	}
	
	void eat() {
		System.out.println(name + "이(가) 냠냠 먹는중...");
	}
	
	abstract void makeSomeNoise();
}
