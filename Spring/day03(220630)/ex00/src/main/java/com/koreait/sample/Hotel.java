package com.koreait.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 생성자로 주입
// 우리가 new로 생성하면 주입이 안됨
// 이렇게 해야 스프링이 알아서 주입해줌
// @AllArgsConstructor --> 모든 변수를 생성자로
// 인스턴스 변수로 선언된 모든 것을 파라미터로 받는 생성자를 작성

@RequiredArgsConstructor //--> @NonNull이 붙은 애들만 생성자
// 특정 변수에 대해서만 생성자를 작성할 때 사용한다. @NonNull이나 final이 붙은 인스턴스 변수에 대한 생성자를 만들어 낸다.

@Component
@Setter
@Getter
@ToString
public class Hotel {
	@NonNull
	Chef chef;
	int data;
}