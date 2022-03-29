package zoo;

public class Ground {
	public static void main(String[] args) {
//		Animal a1 = new Animal();
//		Animal a2 = new Animal();
//		Animal a3 = new Animal();
//		
//		a1.makeSomeNoise();
//		a2.makeSomeNoise();
//		a3.makeSomeNoise();
//		Animal[] arr = {
//				new Animal(),
//				new Animal(),
//				new Animal()
//		};
//		for (int i = 0; i < arr.length; i++) {
//			arr[i].makeSomeNoise();
//		}
		
//		Dog dog = new Dog();
//		Cow cow = new Cow();
//		Cat cat = new Cat();
//		
//		dog.makeSomeNoise();
//		cow.makeSomeNoise();
//		cat.makeSomeNoise();
		
		Animal[] arr = {
			new Whale(),
			new Snake(),
			new Kangaroo(),
			new Avialae(),
			new Cat()
		};
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] instanceof Bird) {
				System.out.println(i + "번 방은 새가 있어요");
			}
		}
	}
}











