package collection;

import java.util.ArrayList;

public class ArListTest1 {
	public static void main(String[] args) {
		ArrayList<String> arr1 = new ArrayList<String>();
		
		// ArrayList에 요소 추가하기
		arr1.add("Hello");
		arr1.add("Java!");
		arr1.add("Very");
		arr1.add("Sleepy");
		
		// ArrayList의 구조 간단히 파악하기
		System.out.println(arr1);
		
		// ArrayList의 요소 수정하기
		arr1.set(3, "Happy");
		System.out.println(arr1);
		
		// ArrayList의 요소 개수(길이) : size()
		for (int i = 0; i < arr1.size(); i++) {
			// ArrayList에서 요소 가져오기
			System.out.println(arr1.get(i));
		}
		
//		arr1.remove("Very");
		arr1.remove(2);
		System.out.println(arr1);
	}
}
