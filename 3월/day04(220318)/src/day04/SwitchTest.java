package day04;

import java.util.Scanner;

public class SwitchTest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("다음 중 프로그래밍 언어가 아닌것은?\n1. C언어\n2. 파이썬\n3. 망둥어\n4. Java");
		int choice = sc.nextInt();
		
		// Ctrl + Alt + ↑(↓) : 위(아래)로 선택한 줄 복사
		// Alt + ↑(↓) : 위(아래)로 선택한 줄 이동
		switch (choice) {
		case 3:
			System.out.println("정답입니다.");
			break;
		case 1: case 2: case 4:
			System.out.println("오답입니다.");
			break;
		default:
			System.out.println("응애!");
		}
	}
}
