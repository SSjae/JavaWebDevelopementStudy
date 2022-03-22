package day02;

public class VariableTask {
	public static void main(String[] args) {
		//------ 홍길동 님의 정보 ------
		//이름 : 홍길동
		//나이 : 10살
		//키 : 170.24cm
		//몸무게 : 69.24kg
		//성적 : C
		//------ \O/ ------
		
		String name = "홍길동";
		int age = 10;
		double height = 170.24;
		float weight = 69.24f;
		char grade = 'C';
		
		System.out.printf("------ %s 님의 정보 ------\n", name);
		System.out.printf("이름 : %s\n", name);
		System.out.printf("나이 : %d살\n", age);
		System.out.printf("키 : %.2fcm\n", height);
		System.out.printf("몸무게 : %.2fkg\n", weight);
		System.out.printf("성적 : %c\n", grade);
		System.out.print("------ \\O/ ------\n\n");
		
		System.out.println("------ " + name + "님의 정보 ------");
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age + "살");
		System.out.println("키 : " + height + "cm");
		System.out.println("몸무게 : " + weight + "kg");
		System.out.println("성적 : " + grade);
		System.out.print("------ \\O/ ------");
	}
}