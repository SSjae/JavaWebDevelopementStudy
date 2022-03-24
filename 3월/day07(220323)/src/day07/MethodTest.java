package day07;

public class MethodTest {
	public static void main(String[] args) {
		MethodTest m = new MethodTest();
//		System.out.println(m.f1(3));
		m.printName();
	}
	
	// f(x) = 2x + 1
	int f1(int x) {
		System.out.println("여기는 f1입니다.");
		return 2 * x + 1;
	}
	void f2(int x) {
		System.out.println("여기는 f2입니다.");
		System.out.println(2 * x + 1);
	}
	
	// 내 이름("이승재")을 10번 출력하는 메소드
	void printName() {
		for(int i = 0; i < 10; i++) {
			System.out.println("이승재");
		}
	}
	
	// 구구단의 특정 단을 출력하는 메소드
	void printDan(int dan) {
		for (int i = 0; i < 9; i++) {
			System.out.printf("%d X %d = %d\n", dan, i, dan * i);
		}
	}
	
	// 현재 시간 정보를 돌려주는 메소드
//	void getTime() {
//		return 시간정보;
//	}
}