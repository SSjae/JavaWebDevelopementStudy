package object;

public class ObjectTest2 {
	public static void main(String[] args) {
		// 상수로 받았기 때문에 같은 주소로 취급해 == 이 true 나옴
		String msg1 = "RedVelvet";
		String msg2 = "RedVelvet";
//		System.out.println(msg1 == msg2);
		
		// new를 하면 새로운 필드가 만들어지면서 주소가 다르기 때문에 == false 나옴
		String msg3 = new String("RedVelvet");
		String msg4 = new String("RedVelvet");
//		System.out.println(msg3 == msg4);
//		System.out.println(msg3.equals(msg4));
		
		// 동위객체
		User user1 = new User("1", "1234");
		User user2 = new User("1", "1234");
		System.out.println(user1.equals(user2));
		
		System.out.println(user1.hashCode());
		System.out.println(user2.hashCode());
	}
}

class User {
	String userId;
	String userPw;
	
	public User(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}

	@Override
	public String toString() {
		return userId + "아이디";
	}
	
	@Override
	public boolean equals(Object obj) {
		// 1. 타입비교(해당하는 클래스 타입의 객체가 매개변수로 넘어왔는지)
		if(obj instanceof User) {
			// 2. 다운캐스팅
			User target = (User) obj;
			// 3. 조건 판별
			if(this.userId.equals(target.userId) && this.userPw.equals(target.userPw)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return userId.length() + userPw.length();
	}
}