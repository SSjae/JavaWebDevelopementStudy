package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 매핑 - /MyServlet 요청이 들어오면 이 서블릿 실행
// 서블릿 버전 3.0 이상부터 가능
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// /MyServlet 요청이 GET 방식으로 요청했을 때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청할 때 같이 보낸 값을 받는 것
		// input 태그에서 같이 써준 name(식별자)의 이름으로 받는다.
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		// 연산
		int result = num1 + num2;
		
		// 사용자의 요청에 대한 응답의 타입을 html파일로 응답한다.
		response.setContentType("text/html; charset=UTF-8");
		// 응답의 데이터를 작성하기 위한 PrintWriter 객체 생성(데이터를 대신 써줄 사람)
		PrintWriter out = response.getWriter();
		
		out.print("<html><body><p>결과 : ");
		out.print(result);
		out.print("</p></body></html>");
		// servlet으로 하면 불편하기 때문에 jsp를 쓴다.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}