package object;

public class ObjectTest {
	public static void main(String[] args) {
		Car mycar = new Car("Ferrari");
		System.out.println(mycar);
		
		String str = mycar.toString();
		System.out.println(str);
		
		Car momcar = new Car("K8");
		System.out.println(momcar);
	}
}

class Car {
	String brand;

	public Car(String brand) {
		super();
		this.brand = brand;
	}
	
	@Override
	public String toString() {
		return "브랜드 : " + brand;
	}
}
