package day09;

public class ClassArrayTest {
	public static void main(String[] args) {
//		int data0 = 10;
//		int data1 = 15;
//		int data2 = 20;
		int[] arData = {10,15,20};
		
//		Square choco = new Square("가나", 20, 8);
//		Square minimap = new Square("미니맵", 40, 40);
//		Square money = new Square("돈", 100, 25);
		
		Square[] arSquare = {
				new Square("가나", 20, 8),
				new Square("미니맵", 40, 40),
				new Square("돈", 100, 25)
		};
		
//		System.out.println(arSquare[0].getArea());
//		System.out.println(arSquare[1].getArea());
//		System.out.println(arSquare[2].getArea());
		
		for (int i = 0; i < arSquare.length; i++) {
			System.out.println(arSquare[i].getArea());
		}
		
		// NullPointException
		String[] arMsg = new String[3];
//		arMsg[1].length();
		
		int[] arData2 = null;
		System.out.println(arData2[1]);
	}
}

class Square {
	String name;
	double height;
	double width;

	public Square(String name, double height, double width) {
		this.name = name;
		this.height = height;
		this.width = width;
	}

	double getArea() {
		return height * width;
	}
}
