package day03;

public class NumTest {
	public static void main(String[] args) {
		String data1 = "10";
		String data2 = "5";
		
		// Integer.parseInt("정수로된문자열") : 문자열을 정수로 변환
		int num1 = Integer.parseInt(data1);
		int num2 = Integer.parseInt(data2);
		
		System.out.println(num1 + num2);
	}
}