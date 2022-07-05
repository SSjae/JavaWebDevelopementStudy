package com.koreait.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

// 모든 오류나 예외는 이곳으로 오게 해서 처리

// root-context에다가 SampleController에서 예외가 발생하면 이 곳으로 오라고 길을 미리 알려줘야 한다.

// Controller에서 문제가 생기면 충고를 해주게 이곳으로 와라!
// 오류가 나면 이쪽으로 올 것이다.
// 해당 클래스가 스프링의 컨트롤러에서 발생하는 예외를 처리하는 존재임을 명시
@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	// @ExceptionHandler()로 오는 예외 클래스마다 분류
	@ExceptionHandler(Exception.class)
	// 매개변수로 예외 객체 받음
	public String except(Exception e, Model model) {
		log.error("=======Exception=======");
		log.error(e.getMessage());
		model.addAttribute("exception", e);
		return "error_page";
	}
	
//	@ExceptionHandler(NumberFormatException.class)
	
	// servlet-context.xml에다가 추가해줘야 함
	// 404페이지(페이지가 없을 떄)
	// 500 메세지는 문법 오류 발생시 @ExceptionHandler를 이용해서 처리가 가능하지만,
	// 404 메세지는 오류가 아닌 URL, URI를 잘못 호출했을 때 처리해야 한다. 따라서 서블릿이
	// web.xml에 간 후 어디로 가야할 지 모를 때 NoHandlerFoundException을 발생시키도록
	// 설정을 해놓고, 실제로 매핑을 못 찾았을 때 그 예외가 발생되고, 예외 발생시
	// CommonExceptionAdvice 객체가 잡아준다. 따라서 404 메세지 대신에 원하는 페이지로
	// 응답할 수 있게 된다.
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException nhfe) {
		return "error_404";
	}
}
