package collection;

import java.util.HashMap;

public class HMapTest {
	public static void main(String[] args) {
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		
		// HashMap에 데이터 추가하기
		map.put(1, "하나");
		map.put(2, "둘");
		map.put(3, "셋");
		map.put(4, "넷");
		map.put(5, "다섯");
		
		// HashMap의 데이터 수정하기
		map.put(2, "둘리");
		
		// HashMap에서 요소 가져오기
		System.out.println(map.get(2));
		
		//HashMap에서 요소 삭제하기(키값만 넘기는 경우) - value를 리턴
		String duly = map.remove(2);
		System.out.println(duly);
		
		// HashMap 간단하게 구조 파악하기
		System.out.println(map);
		
		// HashMap에서 요소 삭제하기(Key, Value 둘다 넘기는 경우) - boolean타입 리턴(정상적으로 넘기면 삭제하며 true)
		System.out.println(map.remove(4, "넷"));
		System.out.println(map.remove(5, "하나"));
		
		System.out.println(map);
		
		// HashMap의 데이터 개수(길이) - 한 쌍을 하나로 셈
		System.out.println(map.size());
	}
}
