package day06;

import java.util.Scanner;

public class ArTask {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		// 10칸짜리 빈 배열 만들고 1부터 10까지 채워넣은 뒤
		// 배열의 각 방에 있는 값들 출력하기
		int[] arr1 = new int[10];
		for(int i = 0; i < arr1.length; i++) {
			arr1[i] = i + 1;
		}
		for(int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();
		
		// 10칸짜리 빈 배열 만들고 10부터 1까지 채워넣은 뒤
		// 배열의 각 방에 있는 값들 출력하기
		int[] arr2 = new int[10];
		for(int i = 0; i < arr1.length; i++) {
			arr1[i] = arr1.length - i;
		}
		for(int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();
		
		// 서울시, 해바라기, 고양이, Java, 레드벨벳, 한우오마카세
		// 반복문으로 출력하기
		String[] arr3 = {"서울시", "해바라기", "고양이", "Java", "레드벨벳", "한우오마카세"};
		for(int i = 0; i < arr3.length; i++) {
			System.out.print(arr3[i] + ", ");
		}
		System.out.println();
		
		// 사용자에게 5개의 정수 입력받아서(1,2,3,4,5)
		// 1번째 정수 : 1
		// 2번째 정수 : 2
		// ..0
		// 5번째 정수 : 5
		// 총합 : 15
		int[] arr4 = new int[5];
		int sum1 = 0;
		for(int i = 0; i < arr4.length; i++) {
			arr4[i] = sc.nextInt();
		}
		for(int i = 0; i < arr4.length; i++) {
			sum1 += arr4[i];
		}
		for(int i = 0; i < arr4.length; i++) {
			System.out.println((i + 1) +"번째 정수 : " + arr4[i]);
		}
		System.out.println("총합 : " + sum1);
		
		// 국어점수 , 영어점수, 수학점수 입력받아서 총점과 평균점수 출력하기
		// 국어점수 : 100
		// 영어점수 : 80
		// 수학점수 : 90
		// 총점 : 270
		// 평균 : 90.0점
		String[] subject = {"국어", "영어", "수학"};
		int[] arr5 = new int[subject.length];
		int sum2 = 0;
		for(int i = 0; i < arr5.length; i++) {
			System.out.print(subject[i] + "점수 : ");
			arr5[i] = sc.nextInt();
		}
		for(int i = 0; i < arr5.length; i++) {
			sum2 += arr5[i];
		}
		System.out.println("총점 : " + sum2);
		System.out.printf("평균 : %.1f", (double) sum2 / arr5.length);
	}
}
