package day02;

public class VariableTest {
	public static void main(String[] args) {
		int data = 10;
		char ch = 'A';
		String msg = "Hello";
		float num = 10.24f;
		double dnum = 10.24;
		
		System.out.println("data의 값 : " + data);
		System.out.println("ch의 값 : " + ch);
		// %.3f : 소수점 아래로 세자리까지 라는 뜻의 서식
		System.out.printf("num의 값 : %f\n", num);
		System.out.println("num의 값 : " + num);
	}
}