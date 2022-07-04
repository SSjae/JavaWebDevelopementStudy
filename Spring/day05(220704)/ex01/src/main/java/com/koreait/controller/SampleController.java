package com.koreait.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.domain.SampleDTO;

import lombok.extern.log4j.Log4j;

// 이거를 적어줘야 servlet-context에서 스프링이 컨트롤러를 스캔해서 사용할 수 있다.
@Controller

// 이걸로 HandlerMapping이 컨트롤러를 찾게 된다. /sample/로 오는 모든 요청
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
//	// *(all)를 이 안에서 또 @RequestMapping으로 나눈다.
//	// /sample/ 뒤에 아무것도 없이 오면 basic 실행
//	@RequestMapping("")
//	public String basic() {
//		log.info("============basic============");
//		// a만 리턴해도 ViewResolver가 앞 뒤로 경로를 붙여서 보내준다.
//		return "a";
//	}
	@RequestMapping("basic1")
	// 만약 void면 요청명과 같은 jsp를 뷰로 반환한다. (basic1.jsp)
	public void asghdawhesasasfaaf(int age) {
		// 주소창에 basic1만 했을 때는 age로 날아온 것이 없기 때문에 오류가 난다.
		// 그래서 basic1?age=10 처럼 파라미터를 넘겨주면 정상적으로 작동된다.
		log.info("============basic1============");
		log.info(age);
	}
	
	// 같은 요청이름으로 Get, Post 둘다 가능하다.
	// Get은 주소창을 이용해서 사용해도 상관없지만 Post 방식은 Form 태그로 밖에 받지 못한다.
	// 그래서 사용하는 툴이 Postman
	@GetMapping("basic")
	public void basicGet() {
		log.info("=========get방식으로 요청==========");
	}
	
	@PostMapping("basic")
	public void basicPost(int age) {
		log.info("=========post방식으로 요청==========");
		log.info(age);
	}
	
	// GET 방식이든 POST 방식이든 url이 basic2이면 여기로 온다.
	// 단순 페이지 이동일 떄
	// 위에 것들은 value가 생략 되어있는 것
	@RequestMapping(value = "basic2", method = {RequestMethod.GET, RequestMethod.POST})
	public void basic2() {
		log.info("===========get, post방식으로 요청===========");
	}
	
	// Controller 파라미터 수집 방법
	
	// DTO 객체로 수집하기
	@GetMapping("ex01")
	public String ex01(SampleDTO dto, Model model) {
		// new SampleDTO를 따로 안해도 파라미터에 자동으로 바로 들어온다.
		log.info(dto);
		// 데이터를 뷰단으로 보낼 때에는 model를 매개변수로 선언해줘서 addAttribute로 해주면 된다.
		// 뷰단에서는 EL문을 사용해서 출력
		model.addAttribute("dto",dto);
		// WEB-INF/views/sample/ex01.jsp로 찾게 된다.
		return "/sample/ex01";
	}
	
	// 파라미터 명과 담을 변수명이 다른 경우 수집방법
	@GetMapping("ex02")
	// data1으로 날아오는 애는 name, data2로 날아오는 애는 age
	public String ex02(@RequestParam("data1")String name, @RequestParam("data2")int age, Model model) {
		model.addAttribute("name",name);
		model.addAttribute("age",age);
		return "/sample/ex02";
	}
	
	// 파라미터가 같은 이름으로 여러개 날라오는 경우(ex : checkbox) 수집 방법
	@GetMapping("ex03")
	// void일 때는 전체 @RequestMapping을 거쳐서 요청명 .jsp로 감
	public void ex03(@RequestParam("data")String[] datas, Model model) {
		model.addAttribute("datas",datas);
	}
	
	@GetMapping("ex04")
	public void ex04(@RequestParam("data")ArrayList<Integer> datas, Model model) {
		int sum = 0;
		for(int data : datas) {
			sum += data;
		}
		
		model.addAttribute("datas", datas);
		model.addAttribute("sum", sum);
	}
}
