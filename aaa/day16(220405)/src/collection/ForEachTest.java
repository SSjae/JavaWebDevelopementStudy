package collection;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Set;

public class ForEachTest {
	public static void main(String[] args) {
		int[] arData = {10,20,30,40,50};
//		for (int i = 0; i < arData.length; i++) {
//			System.out.println(arData[i]);
//		}
		
		for(int data : arData) {
			System.out.println(data);
		}
		
		HashSet<String> redvelvet = new HashSet<String>();
		redvelvet.add("아이린");
		redvelvet.add("슬기");
		redvelvet.add("웬디");
		redvelvet.add("조이");
		redvelvet.add("예리");
		
		for(String name : redvelvet) {
			System.out.println(name);
		}
		
		HashMap<String, Integer> shinee = new HashMap<String, Integer>();
		shinee.put("온유", 34);
		shinee.put("종현", 33);
		shinee.put("키", 32);
		shinee.put("민호", 32);
		shinee.put("태민", 30);
		
		Set<Entry<String, Integer>> entryset =  shinee.entrySet();
		
		for(Entry<String, Integer> entry : entryset) {
			System.out.println("이름 : " + entry.getKey() + " / 나이 : " + entry.getValue());
		}
	}
}
