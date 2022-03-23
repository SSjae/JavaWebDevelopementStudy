package day04;

import java.util.Scanner;

public class IfTest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		// 입력
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		// 처리 + 출력
		if(num > 0) {
			System.out.println("양수입니다.");
			if(num > 50) {
				System.out.println("양수이고, 50보다 큽니다.");
			}
		}
		else if(num < 0) {
			System.out.println("음수입니다.");
		}
		else {
			System.out.println("0입니다.");
		}
	}
}