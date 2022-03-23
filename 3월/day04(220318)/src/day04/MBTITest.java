package day04;

import java.util.Scanner;

public class MBTITest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("당신의 MBTI를 입력하세요 : ");
		String mbti = sc.next();
		
		// ESTJ INFP ESTP ISFJ YMCA
		// 문자열은 == 으로 값을 비교하지 않는다.
		// 문자열1.equals(문자열2) : 문자열1과 문자열2가 서로 같으면 true, 아니라면 false
		if(mbti.equals("ESTJ")) {
			System.out.println("굉장한 똑똑한 mbti입니다.\n"
					+ "JAVA 공부를 하시면 좋을 것 같아요.");
		}
		else if(mbti.equals("INFP")) {
			System.out.println("낯을 많이 가리는 mbti입니다.\n"
					+ "집에서 혼자 JAVA 공부를 하시면 좋을 것 같아요.");
		}
		else if(mbti.equals("ESTP")) {
			System.out.println("극한의 현실주의적 mbti입니다.\n"
					+ "현실을 살기 위해 JAVA 공부를 하시면 좋을 것 같아요.");
		}
		else if(mbti.equals("ISFJ")) {
			System.out.println("배려심이 깊은 mbti입니다.\n"
					+ "높은 배려심으로 강사를 배려하여 JAVA 공부를 하시면 좋을 것 같아요.");
		}
		else {
			System.out.println("당신은 외계인입니다.");
		}
	}
}
