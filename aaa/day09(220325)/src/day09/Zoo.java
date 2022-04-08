package day09;

public class Zoo {
	public static void main(String[] args) {
		// 동물 세마리 만들어서 울게하기
		Animal[] animal = {
				new Animal("검붉은코끼리땃쥐", 4, 1),
				new Animal("라이거", 10, 70),
				new Animal("파쿠피쉬", 3, 0.5),
				new Animal("마눌", 5, 4)
		};
		
		for (int i = 0; i < animal.length; i++) {
			animal[i].cry();
		}
	}
}

// 동물 클래스
// 이름, 나이, 몸무게, ...
// 먹기, 자기, 움직이기, 울기
class Animal {
	String name;
	int age;
	double weight;
	
	public Animal() {}

	public Animal(String name, int age, double d) {
		this.name = name;
		this.age = age;
		this.weight = d;
	}
	
	void eat() {
		System.out.println(name + " 먹는 중...");
	}
	void sleep() {
		System.out.println(name + " 자는 중...");
	}
	void move() {
		System.out.println(name + "움직이는 중...");
	}
	void cry() {
		System.out.println(name + " 우는 중...");
	}
}