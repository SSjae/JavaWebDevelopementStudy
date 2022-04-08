package multi;

public interface A {
	// 인터페이스는 추상메소드만 선언 가능하기 때문에
	// 그냥 선언해도 추상메소드, 상수로 선언된다.
	// void f();
	
	default void f() {
		System.out.println("A 인터페이스의 f()");
	}
}
