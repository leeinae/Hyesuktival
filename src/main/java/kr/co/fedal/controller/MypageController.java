package kr.co.fedal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fedal.service.FestivalService;
import kr.co.fedal.vo.SignupVO;

@Controller
public class MypageController {
	
	@Autowired
	private FestivalService service;
	
	@RequestMapping(value="/myPage")
	public ModelAndView myPage(HttpSession session) {
		String msg = "";
		
		ModelAndView mav = new ModelAndView("mypage/myPage");

		//네이버, 구글 로그인 세션 존재하면
		if(session.getAttribute("sessionId") != null) {
			msg = "false";
		} else {
			//load user data , flag return 
			String id = session.getAttribute("AuthInfoId").toString();
			System.out.println("true 호출 " + id);
			
			SignupVO vo = service.selectUserDataById(id);
			
			mav.addObject("userData", vo);
			msg = "true";
		}
		
		mav.addObject("msg",msg);
		
		return mav;
	}
	
	@RequestMapping(value="/myPageEdit", method=RequestMethod.POST)
	public String editInfo(@ModelAttribute SignupVO vo, HttpSession session) {
		String id = session.getAttribute("AuthInfoId").toString();
		vo.setId(id);
		
		service.updateUserInfo(vo);
		
		//session 새로 생성
		session.setAttribute("sessionName", vo.getNickname());
		session.setAttribute("AuthInfoId", vo.getId());
		
		return "redirect:/";
	}
}
