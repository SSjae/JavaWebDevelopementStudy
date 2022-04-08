package day07;

public class MethodTask {
	public static void main(String[] args) {
		MethodTask m = new MethodTask();
		m.printNum();
		System.out.println(m.sumNum1());
		System.out.println(m.sumNum2(10));
		System.out.println(m.devideNum(5, 2));
		m.printStr("이승재", 5);
		System.out.println(m.sumNum3(5, 10));
		System.out.println(m.changeStr1("HelloZz"));;
		System.out.println(m.backStr("Hello"));
		System.out.println(m.testStr("1312"));
		System.out.println(m.changeStr2("AbCdEfGhIjKlMnZz"));
		System.out.println(m.changeIntToStr(789456));
	}
	// 1~10까지 출력하는 메소드
	void printNum() {
		for(int i = 0; i < 10; i++) {
			System.out.print(i + 1);
		}
		System.out.println();
	}
	// 1~10까지 합 구해주는 메소드
	int sumNum1() {
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum += i;
		}
		return sum;
	}
	
	// 1~n까지의 합 구해주는 메소드
	int sumNum2(int n) {
		int sum = 0;
		for(int i = 1; i <= n; i++) {
			sum += i;
		}
		return sum;
	}
	// 두 정수의 나눗셈 결과를 구해주는 메소드
	double devideNum(int a, int b) {
		return ((double)a / b);
	}
	
	// 어떤 문자열을 n번만큼 출력하는 메소드
	void printStr(String str, int n) {
		for(int i = 0; i < n; i++) {
			System.out.print(str + " ");
		}
		System.out.println();
	}
	// n부터 m까지의 합 구해주는 메소드
	int sumNum3(int n, int m) {
		int sum = 0;
		for(int i = n; i <= m; i++) {
			sum += i;
		}
		return sum;
	}
	
	// 문자열을 전부 대문자로 바꿔주는 메소드("Hello~" -> "HELLO~")
	String changeStr1(String str) {
		String result = "";
		for(int i = 0; i < str.length(); i++) {
			char a = str.charAt(i);
			if(a >= 97 && a <= 122) {
				a -= 32;
			}
			result += a;
		}
		return result;
	}
	// 문자열을 거꾸로 바꿔주는 메소드("Hello" -> "olleH")
	String backStr(String str) {
		String result = "";
		for(int i = 0; i < str.length(); i++) {
			char a = str.charAt(str.length() - (i + 1));
			result += a;
		}
		return result;
	}
	
	// 문자열이 숫자로 이루어져 있는지 검사하는 메소드("H312" -> false / "1162" -> true)
	boolean testStr(String str) {
		for(int i = 0; i < str.length(); i++) {
			char a = str.charAt(i);
			if((a >= 65 && a <= 90) || (a >= 97 && a <= 122)) {
				return false;
			}
		}
		return true;
	}
	// 문자열의 소문자는 대문자로, 대문자는 소문자로 바꿔주는 메소드
	String changeStr2(String str) {
		String result = "";
		for(int i = 0; i < str.length(); i++) {
			char a = str.charAt(i);
			if(a >= 97 && a <= 122) {
				a -= 32;
			} else {
				a += 32;
			}
			result += a;
		}
		return result;
	}
	// 정수를 한글로 바꿔주는 메소드(1024 -> "일공이사")
	String changeIntToStr(int num) {
		String a = Integer.toString(num);
		String result = "";
		char[] numStr = {'공','일','이','삼','사','오','육','칠','팔','구'};
		for(int i = 0; i < a.length(); i++) {
			char c = a.charAt(i);
			for(int j = 48; j <= 57; j++) {
				if(c == j) {
					result += numStr[(j - 48)];
					break;
				}
			}
		}
		return result;
	}
}