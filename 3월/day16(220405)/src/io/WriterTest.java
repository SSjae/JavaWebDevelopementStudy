package io;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class WriterTest {
	public static void main(String[] args) {
		try {
			// 파일이 아니라 폴더에 문제가 있을까봐 오류가 뜸(그래서 try~catch문)
			// 이 파일에 test.txt가 없으면 자동으로 생성해준다.
			// 경로 미작성시 현재폴더(프로젝트 폴더)
//			FileWriter fw = new FileWriter("test.txt");
//			FileWriter fw = new FileWriter("test.txt", true);
//			System.out.println("파일 준비 완료!"); // 로그
//			
//			BufferedWriter bw = new BufferedWriter(fw);
			BufferedWriter bw = new BufferedWriter(new FileWriter("test.txt", true));
			System.out.println("버퍼 준비 완료!");
			
			// 버퍼에 쓰여진 상태
//			bw.write("HTML");
			bw.write("\nJava");
			System.out.println("파일 작성 완료!");
			
			// 버퍼에서 플러쉬를 해줌
//			bw.flush();
			// close는 버퍼를 닫아주면서 플러쉬까지 해줌
			bw.close();
			
			
		} catch (IOException e) {
			System.out.println("파일 경로 문제");
		}
	}
}