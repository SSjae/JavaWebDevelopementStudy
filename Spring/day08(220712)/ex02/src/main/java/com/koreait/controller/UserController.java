package com.koreait.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.domain.UserDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {
//	@GetMapping("/join")
//	public void join() {
//		
//	}
//	@GetMapping("/login")
//	public void login() {
//		
//	}
	@GetMapping({"/join","/login"})
	public void replace() {	}
	
//	@PostMapping("/join")
//	public String join(UserDTO user) {
//		
//	}
}