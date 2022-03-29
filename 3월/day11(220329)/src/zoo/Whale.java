package zoo;

public class Whale extends Animal implements Mammal {
	@Override
	void makeSomeNoise() {
		System.out.println("멍멍!!");
	}
	
	@Override
	public void eungAe() {
		System.out.println("한마리만 낳아서 잘 키우자");
	}
}