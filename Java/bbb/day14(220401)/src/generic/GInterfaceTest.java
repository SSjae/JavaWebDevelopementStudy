package generic;

public interface GInterfaceTest<N1, N2> {
	// 매개변수 개수가 같은 오버로딩은 불가 N1, N2가 같은지 다른지 모르기 때문
	N1 add(N1 num1, N1 num2);
//  제네릭은 타입이 다르다고 확신할 수 없기 때문에 오버로딩 불가능
//	N2 add(N2 num1, N2 num2);
	N2 div(N2 num1, N1 num2);
}
