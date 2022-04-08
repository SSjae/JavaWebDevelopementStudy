package wrapper;

public class WrapperTest2 {
	public static void main(String[] args) {
		Test t = new Test();
		
//		t.f1(10);
//		t.f2(10);
		
//		// 편한길로 --> Integer는 오토박싱이라는 일을 하나더 하기 때문에 편한 int로 호출됨
//		t.f(10); 
//		// 편한길로 --> int는 오토언박싱이라는 일을 하나더 하기 때문에 편한 Integer로 호출됨
//		t.f((Integer)10);
		t.f((Integer)10);
	}
}
class Test {
	void f(int data) {
		System.out.println("int 자료형으로 호출한 f() : " + data);
	}
	
	void f(Integer data) {
		System.out.println("Integer 클래스로 호출한 f() : " + data);
	}
	
	// 어떤 것이든 넘겨라! / 객체를 넘겨라!
	void f(Object obj) {
		System.out.println("Object 클래스로 호출한 f() : " + obj);
	}
}