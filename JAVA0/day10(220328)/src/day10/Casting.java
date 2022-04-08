package day10;

public class Casting {
	public static void main(String[] args) {
		// 부모는 자식을 품을 수 있음(업캐스팅)
		Parent up = new Child();
		// 자식은 불가능
//		Child c = new Parent();
//		up.f();
		
//		System.out.println(((Child)up).data2);
		Child down = (Child)up;
//		System.out.println(down.data2);
		
		Parent[] arr = {
				new Parent(),
				new Child(),	// 자동으로 업캐스팅 된 상태
				new Parent()
		};
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print(i + " : ");
			System.out.println(arr[i].data);
			
			// 0번, 2번방일 땐 부모객체가 Child 타입인지 묻는 것이므로 false
			// 1번방은 업캐스팅 객체가 있기 때문에 true
			if(arr[i] instanceof Child) {
				System.out.println(((Child)arr[i]).data2);
			}
		}
	}
}

class Parent {
	int data;
	
	void f() {
		System.out.println("부모의 메소드");
	}
}

class Child extends Parent {
	double data2;
	
	@Override
	void f() {
		System.out.println("자식의 메소드");
	}
}