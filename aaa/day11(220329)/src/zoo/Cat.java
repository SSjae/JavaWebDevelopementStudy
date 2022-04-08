package zoo;

public class Cat extends Animal implements Mammal {
	// final 메소드는 재정의 불가
//	@Override
//	void intro() {
//		System.out.println("나는 식물입니다.");
//	}
	
	@Override
	void makeSomeNoise() {
		System.out.println("냐옹~");
	}
	
	@Override
	public void eungAe() {
		System.out.println("새끼를  한 네다섯마리 정도 낳는다.");
	}
}