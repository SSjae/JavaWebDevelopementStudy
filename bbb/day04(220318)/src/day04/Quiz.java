package day04;

import java.util.Scanner;

public class Quiz {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("다음 중 프로그래밍 언어가 아닌것은?\n1. C언어\n2. 파이썬\n3. 망둥어\n4. Java");
		int choice = sc.nextInt();
		
		if(choice == 3) {
			System.out.println("정답입니다.");
		}
		else if(choice == 1 || choice == 2 || choice == 4) {
			System.out.println("오답입니다.");
		}
		else {
			System.out.println("응애!");
		}
	}
}