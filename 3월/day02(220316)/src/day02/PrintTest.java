package day02;

public class PrintTest {
	// Ctrl + SpaceBar : �ڵ� �ϼ� ����Ű
	// main > Ctrl + SpaceBar : main �޼ҵ� �����
	// Ctrl + M : ���� â �ִ�ȭ(Ǯ��)
	public static void main(String[] args) {
		System.out.print(10);
		System.out.print(5);
		System.out.print("\n");
		System.out.print("�̽���\n");
		// "�ڸ���"
		System.out.print("\"�ڸ���\"\n");
		
		// ������ ����� ����� �ϳ��� ���ƾ� �Ѵ�.
		System.out.println(10+5);
		
		// syso + �ڵ��ϼ� : println() ����Ű
		// ���ڿ� + �� --> ����(��� : ����� ���ڿ�)
		System.out.println("Hello " + "Java! " + 2022);
	}
}