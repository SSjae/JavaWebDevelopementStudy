package day05;

public class ArTest {
	public static void main(String[] args) {
		// 실제 값들이 저장되는 공간에 값이 채워진 상태
		int[] arData = {5, 10, 100, 99, 17134};
		// 실제 값들이 저장되는 공간은 현재 비어있는 상태(0으로 초기화 되어있는 상태)
		int[] arData2 = new int[10];
		// 비어있는 공간에 새로운 값을 대입함으로써 공간 사용
		arData2[0] = 10;
		
		System.out.println(arData);
		
//		System.out.println(arData[0]);
//		System.out.println(arData[1]);
//		System.out.println(arData[2]);
//		System.out.println(arData[3]);
//		System.out.println(arData[4]);
		
		for(int i = 0; i < arData.length; i++) {
			System.out.println(arData[i]);
		}
	}
}