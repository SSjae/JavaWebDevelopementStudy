package day02;

public class VariableTask {
	public static void main(String[] args) {
		//------ ȫ�浿 ���� ���� ------
		//�̸� : ȫ�浿
		//���� : 10��
		//Ű : 170.24cm
		//������ : 69.24kg
		//���� : C
		//------ \O/ ------
		
		String name = "ȫ�浿";
		int age = 10;
		double height = 170.24;
		float weight = 69.24f;
		char grade = 'C';
		
		System.out.printf("------ %s ���� ���� ------\n", name);
		System.out.printf("�̸� : %s\n", name);
		System.out.printf("���� : %d��\n", age);
		System.out.printf("Ű : %.2fcm\n", height);
		System.out.printf("������ : %.2fkg\n", weight);
		System.out.printf("���� : %c\n", grade);
		System.out.print("------ \\O/ ------\n\n");
		
		System.out.println("------ " + name + "���� ���� ------");
		System.out.println("�̸� : " + name);
		System.out.println("���� : " + age + "��");
		System.out.println("Ű : " + height + "cm");
		System.out.println("������ : " + weight + "kg");
		System.out.println("���� : " + grade);
		System.out.print("------ \\O/ ------");
	}
}