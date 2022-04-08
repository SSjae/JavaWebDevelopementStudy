package day03;

public class Casting {
	public static void main(String[] args) {
		// 자바는 정수와 정수의 연산 결과가 정수로 나온다.
		System.out.println(10/3);
		System.out.println((10 + 0.0)/3);
		
		System.out.println('A' + 5);
		
		String data = 10 + ""; // "10"
		
		System.out.println((char)('A' + 5));
		// 아스키 코드 : 각 문자마다 대응되는 숫자값들을 가지고 있고
		// 그 값을 아스키코드라고 한다.
		// 'A' : 65 / 'a' : 97 / '0' : 48
		
		System.out.println("10" + "5");
	}
}