package collection;

import java.util.ArrayList;

public class ArListTest2 {
	public static void main(String[] args) {
		ArrayList<Integer> arr1 = new ArrayList<Integer>();
		
		arr1.add(10);
		arr1.add(20);
		arr1.add(30);
		arr1.add(40);
		arr1.add(50);
		
		arr1.remove((Integer)40);
//		System.out.println(arr1);
		
		ArrayList<User> arr2 = new ArrayList<User>();
		
		arr2.add(new User("apple"));
		arr2.add(new User("banana"));
		arr2.add(new User("cherry"));
		
		// 이렇게 되면 다른 객체라 다른 주소 이기에 제거가 안된다.
		// 그래서 equals를 재정의 해서 두개의 객체가 동일객체로 될수 있게 해준다.
		arr2.remove(new User("banana"));
		
		System.out.println(arr2);
	}
}

class User {
	String userid;

	public User(String userid) {
		this.userid = userid;
	}
	
	@Override
	public String toString() {
		return "아이디 : " + this.userid;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof User) {
			User target = (User) obj;
			if(this.userid.equals(target.userid)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return this.userid.length();
	}
}