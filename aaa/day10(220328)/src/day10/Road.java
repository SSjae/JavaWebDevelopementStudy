package day10;

public class Road {
	public static void main(String[] args) {
		Car momcar = new Car("K8", 4000);
		SuperCar mycar = new SuperCar("Ferrari", 65000, "스포츠모드");
		
		momcar.engineStart();
		mycar.engineStart();
		
		mycar.roofOpen();
	}
}

class Car{
	String brand;
	int price;
	static int wheel = 4;

	public Car() {}
	
	public Car(String brand, int price) {
		this.brand = brand;
		this.price = price;
	}

	void engineStart() {
		System.out.println(brand + " 열쇠로 시동 켜기");
	}
	
	void engineStop() {		
		System.out.println(brand + " 열쇠로 시동 끄기");
	}
}

class SuperCar extends Car{
	String mode;
	
	public SuperCar() {
		// super : 부모클래스의 이름
		// super(); : 부모클래스의 생성자
		super();
	}
	
	// Alt + Shift + S > C : 부모 클래스 생성자 받아와서 생성자 만들기
	public SuperCar(String brand, int price) {
		super(brand, price);
	}

	// Alt + Shift + S > O : 필드를 이용해서 생성자 만들기
	public SuperCar(String brand, int price, String mode) {
		super(brand, price);
		this.mode = mode;
	}
	
	// @ : 어노테이션
	@Override
	void engineStart() {
		System.out.println(brand + " 블루투스로 시동켜기");
	}
	@Override
	void engineStop() {
		System.out.println(brand + " 블루투스로 시동끄기");
	}
	
	void roofOpen() {
		System.out.println(brand + " 뚜껑 열기");
	}

	void roofClose() {
		System.out.println(brand + " 뚜껑 닫기");
	}
}