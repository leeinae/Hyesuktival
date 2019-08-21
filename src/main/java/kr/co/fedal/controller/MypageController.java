package kr.co.fedal.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
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

	@RequestMapping(value = "/myPage")
	public ModelAndView myPage(HttpSession session) {

		// 네이버, 구글 로그인 세션 존재하면
		if (session.getAttribute("sessionId") != null) {
			ModelAndView mav = new ModelAndView("/mypage/myPageFail");
			return mav;
		}

		// load user data , flag return
		String id = session.getAttribute("AuthInfoId").toString();
		System.out.println("true 호출 " + id);

		SignupVO vo = service.selectUserDataById(id);

		ModelAndView mav = new ModelAndView("/mypage/myPage");
		mav.addObject("userData", vo);
		mav.addObject("vo", new SignupVO());

		return mav;
	}

	@RequestMapping(value = "/myPageEdit", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView editInfo(SignupVO vo, HttpSession session, Errors errors) {
		String id = session.getAttribute("AuthInfoId").toString();
		vo.setId(id);

		if (!vo.getPassword().isEmpty()) {
			if (!vo.isPwEqualToCheckPw()) {
				ModelAndView mav = new ModelAndView("/mypage/myPage");
				mav.addObject("errors", "패스워드가 일치하지 않습니다.");
				mav.addObject("userData", vo);
				mav.addObject("vo", new SignupVO());
				return mav;
			}
		}
		
		service.updateUserInfo(vo);

		// session 새로 생성
		session.setAttribute("sessionName", vo.getNickname());
		session.setAttribute("AuthInfoId", vo.getId());

		ModelAndView mav = new ModelAndView("redirect:/");
		mav.addObject("vo", new SignupVO());
		return mav;
	}
}
