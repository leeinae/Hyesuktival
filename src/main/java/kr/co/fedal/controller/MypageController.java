package kr.co.fedal.controller;

import org.springframework.stereotype.Controller;

@Controller
public class MypageController {
	
	public String myPage() {
		System.out.println("마이마이~");
		return "mypage/myPage";
	}
}
