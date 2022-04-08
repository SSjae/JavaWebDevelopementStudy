package access1;

public class AccessMain1 {
	public static void main(String[] args) {
		AccessTest obj = new AccessTest();
		// System.out.println(obj.data3);
		System.out.println(obj.getData3());
		
		// obj.data3 = 3000;
		obj.setData3(3000);
		
		System.out.println(obj.getData3());
	}
}

// public 키워드는 해당 파일명과 동일한 클래스 하나에만 붙일 수 있다.
// 외부 패키지에서 사용하고자 하는 클래스를 만들 때에는 public을 붙여야 하므로
// 새로운 클래스 파일을 만들어서 선언해준다.
// public class Test {
//	
// }