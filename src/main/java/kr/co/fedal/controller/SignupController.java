package kr.co.fedal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fedal.exception.AlreadyExistingEmailException;
import kr.co.fedal.exception.AlreadyExistingIdException;
import kr.co.fedal.service.FestivalService;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.util.SignupRequestValidator;

@Controller
public class SignupController {

	@Autowired
	private FestivalService service;

	private String referer;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/signup/signup");
		
		//이전 페이지 기억
		referer = (String)request.getHeader("REFERER");
		
		mav.addObject("signupRequest", new SignupRequest());
		return mav;
	}

	@RequestMapping(value = "/signupSuccess", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupSuccessPage(SignupRequest signReq, Errors errors) throws Exception {
		new SignupRequestValidator().validate(signReq, errors);
		if (errors.hasErrors()) {
			ModelAndView mav = new ModelAndView("/signup/signup");
			return mav;
		}
		try {
			service.signup(signReq);
		} catch (AlreadyExistingEmailException e) {
			errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
			ModelAndView mav = new ModelAndView("/signup/signup");
			return mav;
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("id", "duplicate", "이미 가입된 아이디입니다.");
			ModelAndView mav = new ModelAndView("/signup/signup");
			return mav;
		}
		
		ModelAndView mav = new ModelAndView("redirect:"+ referer);
		return mav;
	}
	
	@RequestMapping(value = "/signupCancel", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupCancelPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:"+ referer);
		return mav;
	}
}
