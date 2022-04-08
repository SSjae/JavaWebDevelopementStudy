package day08;

public class StorageTest {
	int data2 = 20;	// 전역변수
	static int data3 = 30;
	
	public static void main(String[] args) {
		// static 메소드 내부에서는 일반 전역변수를 사용할 수 없다.
//		System.out.println(data2);
		System.out.println(data3);
	}
	void f1() {
		int data1 = 10;	// 지역변수
		System.out.println(data2);
	}
	
	void f2() {
//		System.out.println(data1);
		System.out.println(data2);
	}
}
