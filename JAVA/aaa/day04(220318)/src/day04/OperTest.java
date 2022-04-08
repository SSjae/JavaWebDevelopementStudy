package day04;

import java.util.Scanner;

public class OperTest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		// 입력
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		// 처리
		String result = num > 0 ? "양수입니다." :(num < 0 ? "음수입니다." : "0입니다.");
	
		// 출력
		System.out.println(result);
	}
}