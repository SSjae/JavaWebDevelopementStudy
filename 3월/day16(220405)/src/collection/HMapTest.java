package collection;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class HMapTest {
	public static void main(String[] args) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("하나", 1);
		map.put("둘", 2);
		map.put("셋", 3);
		map.put("넷", 4);
		map.put("다섯", 5);
		
		Set<String> keyset = map.keySet();
		Iterator<String> keyiter = keyset.iterator();
		while(keyiter.hasNext()) {
			System.out.println(keyiter.next());
		}
		
		Collection<Integer> values = map.values();
		Iterator<Integer> valueiter = values.iterator();
		while(valueiter.hasNext()) {
			System.out.println(valueiter.next());
		}
		
		Set<Entry<String, Integer>> entryset = map.entrySet();
		Iterator<Entry<String, Integer>> entryiter= entryset.iterator();
		while(entryiter.hasNext()) {
			Entry<String, Integer> entry = entryiter.next();
			System.out.println(entry.getKey() + " : " + entry.getValue());
		}
	}
}