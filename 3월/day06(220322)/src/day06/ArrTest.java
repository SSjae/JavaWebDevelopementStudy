package day06;

public class ArrTest {
	public static void main(String[] args) {
		int[][] arrData = {
				{10,20,30},
				{40,50,60}
		};

//		System.out.println(arrData[0][0]);
//		System.out.println(arrData[0][1]);
//		System.out.println(arrData[0][2]);

//		System.out.println(arrData[1][0]);
//		System.out.println(arrData[1][1]);
//		System.out.println(arrData[1][2]);
		
		for(int i = 0; i < arrData.length; i++) {
			for(int j = 0; j < arrData[i].length; j++) {
				System.out.println(arrData[i][j]);
			}
		}
	}
}
