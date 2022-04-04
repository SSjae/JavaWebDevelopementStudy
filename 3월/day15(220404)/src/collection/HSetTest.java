package collection;

import java.util.HashSet;
import java.util.Iterator;

public class HSetTest {
	public static void main(String[] args) {
		HashSet<Integer> set1 = new HashSet<Integer>();
		
		// HashSet에 요소 추가하기
		set1.add(10);
		set1.add(20);
		set1.add(30);
		set1.add(40);
		set1.add(50);
		set1.add(50);
		set1.add(50);
		set1.add(50);
		set1.add(50);
		set1.add(50);
		set1.add(50);
		
		// HashSet의 구조 간단히 파악하기
		System.out.println(set1);
		
		// HashSet의 요소 개수(길이)
		System.out.println(set1.size());
		
		// HashSet의 요소 포함여부 확인하기
		System.out.println(set1.contains(30));
		
		// HashSet에서 요소 삭제하기
		// set은 인덱스가 없기 때문에 오토박싱으로 알아서 됨
		set1.remove(30);
		System.out.println(set1);
		
		HashSet<User> set2 = new HashSet<User>();
		set2.add(new User("apple"));
		set2.add(new User("banana"));
		// HashSet은 기존의 개체와 같은 객체인지 판별할 때 hashCode()로 비교를 한다.
		// 정상적으로 이용하려면 우리가 담아줄 객체의 타입 클래스에서 hashCode()도 재정의 해야 한다.
		set2.add(new User("apple"));
		
		System.out.println(set2);
		
		Iterator<Integer> iter = set1.iterator();
		
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		iter = set1.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		
	}
}