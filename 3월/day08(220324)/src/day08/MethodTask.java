package day08;

public class MethodTask {
	public static void main(String[] args) {
		MethodTask m = new MethodTask();
		System.out.println(m.changeToUpperCase("HelloZz"));;
		System.out.println(m.reverse("Hello"));
		System.out.println(m.isdigit("1312"));
		System.out.println(m.changeCase("AbCdEfGhIjKlMnZz"));
		System.out.println(m.changeIntToStr(789456));
	}
	// "문자열".chatAt(n)	: 문자열의 n번째 문자(0부터 시작)
	// "문자열".length()	: "문자열"의 길이
	// 문자열을 전부 대문자로 바꿔주는 메소드("Hello~" -> "HELLO~")
	String changeToUpperCase(String str) {
		int len = str.length();
		String result = "";
		for(int i = 0; i < len; i++) {
			char a = str.charAt(i);
			if(a >= 'a' && a <= 'z') {
				result += (char)(a - 32);
			}
			else {
				result += a;
			}
		}
		return result;
	}
	// 문자열을 거꾸로 바꿔주는 메소드("Hello" -> "olleH")
	String reverse(String str) {
		int len = str.length();
		String result = "";
//		for(int i = 0; i < len; i++) {
//			char a = str.charAt(i);
//			result = a + result;
//		}
		for(int i = str.length() - 1; i >= 0; i--) {
			char a = str.charAt(i);
			result += a;
		}
		return result;
	}
	
	// 문자열이 숫자로 이루어져 있는지 검사하는 메소드("H312" -> false / "1162" -> true)
	// is~~, has~~ : 웬만하면 boolean타입을 리턴
	boolean isdigit(String str) {
		int len = str.length();
		for(int i = 0; i < len; i++) {
			char a = str.charAt(i);
			if(a < '0' || a > '9') {
				return false;
			}
		}
		return true;
	}
	// 문자열의 소문자는 대문자로, 대문자는 소문자로 바꿔주는 메소드
	String changeCase(String str) {
		int len = str.length();
		String result = "";
		for(int i = 0; i < len; i++) {
			char a = str.charAt(i);
			if(a >= 'a' && a <= 'z') {
				result += (char)(a - 32);
			}
			else if(a >= 'A' && a <= 'Z') {
				result += (char)(a + 32);
			}
			else {
				result += a;
			}
		}
		return result;
	}
	// 정수를 한글로 바꿔주는 메소드(1024 -> "일공이사")
	String changeIntToStr(int num) {
		String result = "";
		String hangle = "공일이삼사오육칠팔구";
		String data = num + "";
		for(int i = 0; i < data.length(); i++) {
			char c = data.charAt(i);
			int idx = c - 48;
			result += hangle.charAt(idx);
		}
		return result;
	}
}
