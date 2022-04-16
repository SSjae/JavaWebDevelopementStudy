package view;

import java.util.Scanner;

import dao.ProductDAO;
import dao.UserDAO;

public class ProductInfoView {
	int prodnum;

	public ProductInfoView() {}

	public ProductInfoView(int prodnum) {
		this.prodnum = prodnum;
		
		Scanner sc = new Scanner(System.in);
		ProductDAO pdao = new ProductDAO();
		UserDAO udao = new UserDAO();
		
		while(true) {
			//내부메뉴
			//1. 좋아요 누르기
			//2. 판매자 연락처 보기
			//3. 돌아가기
			System.out.println(pdao.productInfo(prodnum));
			System.out.println("1. 좋아요 누르기\n2. 판매자 연락처 보기\n3. 돌아가기");
			int choice = sc.nextInt();
			
			if(choice == 3) {
				break;
			}
			
			switch (choice) {
			case 1 :
				//상품의 좋아요의 숫자를 하나 올리기 위해 상품번호를 넘겨준다.
				if(pdao.clickLike(prodnum)){
					System.out.println("좋아요! 감사합니다!!!!!!!\n");
				} else {
					System.out.println("알 수 없는 오류");
				}
				break;
			case 2 :
				//먼저 상품 정보를 보여주고
				//판매자의 연락처를 가져온다. 판매자의 연락처를 가져오기 위해서는
				//상품을 먼저 찾아야 함으로 상품번호를 매개변수로 같이 넘긴다.
				System.out.println(udao.sellerPhone(prodnum) + "\n");
				break;
			default:
				System.out.println("다시 입력해주세요");
			}
		}
	}
	
}
