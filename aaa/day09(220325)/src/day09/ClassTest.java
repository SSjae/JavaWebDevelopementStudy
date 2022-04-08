package day09;

public class ClassTest {
	public static void main(String[] args) {
		Car mycar = new Car("Ferrari","Red",65000);
		Car momcar = new Car("K8","White",4000);
		Car dadcar = new Car(31000);
		
		System.out.println(mycar.brand);
		System.out.println(momcar.brand);
		
		mycar.engineStart();
		momcar.engineStart();
		dadcar.engineStart();
	}
}

class Car {
	String brand;
	String color;
	int price;
	
	// 생성자 오버로딩
	// 클래스이름 + 자동완성 : 기본 생성자 만들기
	public Car() {}
	// Alt + Shift + S > O : 필드를 이용해서 생성자 만들기
	public Car(String brand, String color, int price) {
		this.brand = brand;
		this.color = color;
		this.price = price;
	}
	public Car(int price) {
		this.price = price;
	}

	void engineStart() {
		System.out.println(this.brand + " 시동 켜기");
	}
	
	void engineStop() {
		System.out.println(this.brand + " 시동 끄기");
	}
}