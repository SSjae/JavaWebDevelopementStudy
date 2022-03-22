package day03;

import java.util.Scanner;

public class InputTest1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름 : ");
		String name = sc.next();
		System.out.println("안녕하세요 잘생긴 " + name + "님~");
		
		System.out.print("주소 : ");
		// 위에서 내려온 enter를 먹어 치워주는 역할, 방패막이
		sc.nextLine();
		String addr = sc.nextLine();
		System.out.println("당신이 사는 곳 : " + addr);
		
		System.out.print("나이 : ");
		int age = sc.nextInt();
		System.out.println("당신은 5년 뒤에 " + (age + 5) + "살이 됩니다.");
	}
}