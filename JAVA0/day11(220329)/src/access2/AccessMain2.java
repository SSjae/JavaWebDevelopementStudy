package access2;

import access1.AccessTest;

public class AccessMain2 extends AccessTest{
	public static void main(String[] args) {
		// 다른 패키지의 클래스를 사용하려면 import 필요
		AccessTest obj = new AccessTest();
	}
	void f2() {
//		System.out.println(data1); --> 오류(default)
		System.out.println(data4);
	}
}
