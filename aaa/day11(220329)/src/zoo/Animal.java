package zoo;

public abstract class Animal {
	String name;
	String gender;
	int age;
	
	// final 메소드는 자식 클래스에서 재정의가 불가능하다.
	final void intro() {
		System.out.println("나는 동물입니다.");
	}
	abstract void makeSomeNoise();
	// 추상 클래스는 일반 메소드도 선언 가능하다.
	void eat() {
		System.out.println(name + "이(가) 냠냠 먹는중...");
	}
}