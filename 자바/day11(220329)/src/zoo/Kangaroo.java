package zoo;

public class Kangaroo extends Animal implements Mammal{
	@Override
	void makeSomeNoise() {
		System.out.println("음메~~!");
	}
	
	@Override
	public void eungAe() {
		System.out.println("새끼를 한마리 낳아서 주머니에 넣고 다닌다.");
	}
}