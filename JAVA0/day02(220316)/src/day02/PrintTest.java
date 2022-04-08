package day02;

public class PrintTest {
	// Ctrl + SpaceBar : 자동 완성 단축키
	// main > Ctrl + SpaceBar : main 메소드 만들기
	// Ctrl + M : 현재 창 최대화(풀기)
	public static void main(String[] args) {
		System.out.print(10);
		System.out.print(5);
		System.out.print("\n");
		System.out.print("이승재\n");
		// "코리아"
		System.out.print("\"코리아\"\n");
		
		// 수식은 연산된 결과값 하나로 보아야 한다.
		System.out.println(10+5);
		
		// syso + 자동완성 : println() 단축키
		// 문자열 + 값 --> 연결(결과 : 연결된 문자열)
		System.out.println("Hello " + "Java! " + 2022);
	}
}