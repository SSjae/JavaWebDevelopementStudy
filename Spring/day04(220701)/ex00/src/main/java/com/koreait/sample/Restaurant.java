package com.koreait.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Setter;

@Component
public class Restaurant {
	// setter로 주입을 해줌
	@Setter(onMethod_ = @Autowired)
	Chef chef;
}