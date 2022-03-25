package day08;

public class ClassTest {
	public static void main(String[] args) {
//		Car mycar = new Car();
//		mycar.brand = "Ferrari";
//		mycar.color = "Red";
//		mycar.price = 65000;
		Car mycar = new Car("Ferrari","Red",65000);
		
//		Car momcar = new Car();
//		momcar.brand = "K8";
//		momcar.color = "White";
//		momcar.price = 4000;
		Car momcar = new Car("K8","White",4000);
		
		System.out.println(mycar.brand);
		System.out.println(momcar.brand);
	}
}

class Car {
	String brand;
	String color;
	int price;
	
	Car(String a, String b, int c) {
		brand = a;
		color = b;
		price = c;
	}
	
	void engineStart() {
		System.out.println("");
	}
	
	void engineStop() {
		System.out.println("");
	}
}