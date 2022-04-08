package multi;

public class E extends C implements A,B {
	// 같은 이름의 메소드를 가져 왔을 때 인터페이스보다 클래스(상속)가 우선순위가 높아
	// 이미 C의 f()로 재정의 된 것이다.
	@Override
	public void f() {
		System.out.println("E 클래스의 f()");
	}
	
	void doSomething() {
		A.super.f();
		B.super.f();
		super.f(); // 그냥 super는 부모를 뜻함
		this.f();
	}
}
