package io;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ReaderTest {
	public static void main(String[] args) {
		try {
			ArrayList<String> datas = new ArrayList<String>();
			// 파일 경로도 경로지만 그 경로에 파일이 실제 있어야 하기 때문에 try~catch문 필요
			FileReader fr = new FileReader("lang.txt");
			System.out.println("파일 준비 완료!");
			
			BufferedReader br = new BufferedReader(fr);
			System.out.println("버퍼 준비 완료!");
			
			while(true) {
				// 엔터를 기준으로 한 줄씩 읽어오기
				String msg = br.readLine();
				if(msg == null) {
					break;
				}
				datas.add(msg);
			}
			
			System.out.println(datas);
			
		} catch (FileNotFoundException e) {
			System.out.println("존재하지 않는 파일");
		} catch (IOException ioe) {
			System.out.println("파일 읽기 실패!");
		}
	}
}
