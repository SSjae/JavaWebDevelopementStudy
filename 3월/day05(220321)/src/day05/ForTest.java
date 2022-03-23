package day05;

public class ForTest {
	public static void main(String[] args) {
		for(int i = 0; i < 10; i++) {
			System.out.println(i);
		}
		// 초기식 -> 조건식 연산 -> 결과가 참이면 반복, 거짓이면 탈출
		// -> 증감식 -> 조건식 연산 -> 결과가 참이면 반복, 거짓이면 탈출
		// -> 증감식 -> 조건식 연산 -> 결과가 참이면 반복, 거짓이면 탈출
		// ...
		
		// 3부터 5번 반복하는 반복문
		for(int i = 3; i > -7; i -= 2) {
			System.out.println(i);
		}
		
		// (끝값 - 초기값) / 증감값 = 반복횟수
		// 100부터 22번 반복하는 반복문
		// 끝값 = 반복횟수 * 증감값 + 초기값
		for(int i = 100; i > 34; i -= 3) {
			System.out.println(i);
		}
	}
}