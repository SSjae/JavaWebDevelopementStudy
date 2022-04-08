package zoo;

public class Ground {
	public static void main(String[] args) {
		// 남방고주돌고래(LissodelphisPeronii)
		// 용가리(dragon chicken)
		// 수염수리(Beared Vulture)
		Cage<Mammal> cage1 = new Cage<Mammal>();
		Cage<Reptile> cage2 = new Cage<Reptile>();
		Cage<Bird> cage3 = new Cage<Bird>();
		
		Man464 man = new Man464();
		man.putAnimal(cage1, new LissodelphisPeronii("승희", "여자", 27));
		man.putAnimal(cage2, new DragonChicken("용가리", "남자", 24));
		man.putAnimal(cage3, new BearedVulture("벌쳐", "남자", 60));
		
//		System.out.println(cage1.getCage());
//		System.out.println(cage2.getCage());
//		System.out.println(cage3.getCage());
		
		((LissodelphisPeronii)cage1.getCage()).makeSomeNoise();
		((DragonChicken)cage2.getCage()).makeSomeNoise();
		((BearedVulture)cage3.getCage()).makeSomeNoise();
	}
}