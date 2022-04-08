package day05;

import java.util.Scanner;

public class ForTask {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
//		// 초기식은 int i = 0; 증감식은 i++로 고정해놓고 풀어보기(다 하면)
		
//		// 1부터 10까지 출력하기
//		for(int i = 1; i <= 10; i++) {
//			System.out.print(i + " ");
//		}
//		System.out.println();
//		
//		// 10부터 1까지 출력하기
//		for(int i = 10; i >= 1; i--) {
//			System.out.print(i + " ");
//		}
//		System.out.println();
//		
//		// 12부터 3씩 증가하며 13번 출력하기
//		for(int i = 12; i < 51; i += 3) {
//			System.out.print(i + " ");
//		}
//		System.out.println();
//		
//		// 100 94 88 82 ... 28 출력하기
//		for(int i = 100; i > 27; i -= 6) {
//			System.out.print(i + " ");
//		}
//		System.out.println();

		
//		// 1부터 10까지의 총 합 구하기
//		int sum1 = 0;
//		for(int i = 1; i < 11; i++) {
//			sum1 += i;
//		}
//		System.out.println(sum1);
//		
//		// n 하나 입력받아서 1부터 n까지의 총 합 구하기
//		System.out.print("n1입력 : ");
//		int n1 = sc.nextInt();
//		int sum2 = 0;
//		for(int i = 1; i <= n1; i++) {
//			sum2 += i;
//		}
//		System.out.println(sum2);
//		
//		// n,m 입력받아서 n부터 m 까지 출력하기
//		System.out.print("n2입력 : ");
//		int n2 = sc.nextInt();
//		System.out.print("m2입력 : ");
//		int m2 = sc.nextInt();
//		for(int i = n2; i <= m2; i++) {
//			System.out.print(i + " ");
//		}
//		System.out.println();

		
		// 1부터 100까지 중 짝수만 출력하기
		for(int i = 1; i <= 100; i++) {
			if(i % 2 == 0) {
				System.out.print(i + " ");
			}
		}
		System.out.println();
		
		// 1부터 100까지 중 3과 5의 공배수만 출력하기
		// 3과 5의 공배수가 아닌 조건
		// if(i % 3 != 0 || i % 5 != 0)
		// if(!(i % 3 == 0 && i % 5 == 0))
		for(int i = 1; i <= 100; i++) {
			if(i % 3 == 0 && i % 5 == 0) {
				System.out.print(i + " ");
			}
		}
		System.out.println();
		
		// A부터 F까지 출력하기
		for(int i = 65; i <= 70; i++) {
			System.out.print((char)i + " ");
		}
		System.out.println();
		
		// AbCdEf...Yz 출력하기
		String result = "";
		for(int i = 0; i < 26; i++) {
			if(i % 2 == 0) {
				result += (char)(i + 65);
			}
			else {
				result += (char)(i + 97);
			}
		}
		System.out.println(result);
		
		// 중첩반복문 사용하지 않고 구구단 전부 출력하기
		for(int i = 1; i < 10; i++) {
			System.out.print("2 X "+ i + " = "+ (2*i) + "\t");
			System.out.print("3 X "+ i + " = "+ (3*i) + "\t");
			System.out.print("4 X "+ i + " = "+ (4*i) + "\t");
			System.out.print("5 X "+ i + " = "+ (5*i) + "\t");
			System.out.print("6 X "+ i + " = "+ (6*i) + "\t");
			System.out.print("7 X "+ i + " = "+ (7*i) + "\t");
			System.out.print("8 X "+ i + " = "+ (8*i) + "\t");
			System.out.print("9 X "+ i + " = "+ (9*i) + "\t");
			System.out.println();
		}
		
		// 10진수 숫자 입력받아서 2진수로 출력하기
		System.out.print("10진수 입력 : ");
		int num10 = sc.nextInt();
		String num2 = "";
		for(int i = num10; i >= 1; i /= 2) {
			num2 = (i % 2) + num2;
		}
		System.out.print("2진수 : ");
		System.out.println(Integer.parseInt(num2));
	}
}
