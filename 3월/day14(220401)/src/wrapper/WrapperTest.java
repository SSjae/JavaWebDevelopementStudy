package wrapper;

public class WrapperTest {
	public static void main(String[] args) {
//		Object[] arr = {"Hello", 10};
		
		// 박싱
		Integer obj = new Integer(10);
		Integer obj2 = (Integer)10;
//		Double obj3 = (Double)10.24;
		
		// 언박싱
		int data = obj.intValue();
//		double data2 = obj3.doubleValue();
		
		// 오토박싱
		obj = 20;
		
		// 오토언박싱
		data = obj;
	}
}
