package generic;

import java.util.Scanner;

public class GenericMain {
	public static void main(String[] args) {
//		Storage<String> obj = new Storage<String>();
//		obj.data = "두번째 고백";
//		Storage<Scanner> obj2 = new Storage<Scanner>();
		
//		GClassTest<Integer> obj = new GClassTest<Integer>();
//		obj.data = 10;
//		System.out.println(obj.getData() + 5);
		
//		GMethodTest obj2 = new GMethodTest();
//		obj2.<String>f("Hello");
////		obj2.<String>f(10);
//		// 제네릭 메소드는 보통 키워드를 유추할 수 있기 때문에 따로 명시적으로 작성해주지 않아도 된다.
//		obj2.f(10);
		
		GInterfaceTest<Integer, Double> obj3 = new GInterfaceTest<Integer, Double>() {
			
			@Override
			public Double div(Double num1, Integer num2) {
				return num1 / num2;
			}
			
			@Override
			public Integer add(Integer num1, Integer num2) {
				return num1 + num2;
			}
		};
	}
}
