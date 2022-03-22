package day03;

import java.util.Scanner;

public class Homework {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("----입력----");
		System.out.print("첫번째 정수 : ");
		String str1 = sc.next();
		System.out.print("두번째 정수 : ");
		String str2 = sc.next();
		
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		
		System.out.println("\n----결과----");
		System.out.println("덧셈결과 : " + (num1 + num2));
		System.out.println("뺄셈결과 : " + (num1 - num2));
		System.out.println("곱셈결과 : " + (num1 * num2));
		System.out.printf("나눗셈결과 : %.3f", ((double)num1 / num2));
	}
}