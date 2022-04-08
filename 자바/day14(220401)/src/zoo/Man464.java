package zoo;

public class Man464 {
	void putAnimal(Object obj, Animal animal) {
		if(animal instanceof Mammal) {
			((Cage<Mammal>)obj).setCage((Mammal)animal);
		} else if(animal instanceof Bird) {
			((Cage<Bird>)obj).setCage((Bird)animal);
		} else if(animal instanceof Reptile){
			((Cage<Reptile>)obj).setCage((Reptile)animal);
		}
	}
}