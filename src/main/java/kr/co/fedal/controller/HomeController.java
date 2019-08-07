package kr.co.fedal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.fedal.exception.AlreadyExistingEmailException;
import kr.co.fedal.exception.AlreadyExistingIdException;
import kr.co.fedal.service.FestivalService;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.util.SignupRequestValidator;
import kr.co.fedal.vo.FestivalVO;

/**
 * Handles requests for the application home page.
 */
@RestController
public class HomeController {

	@Autowired
	private FestivalService service;

	// Ķ����
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller ȣ��");

		// ��ü festivalVO�� ���� list
		List<FestivalVO> list = service.selectAll();
		// {title: -- , start:--, end:-- } ������ map�� ���� list
		List<String> festivalList = new ArrayList<>();
		String json = new String();

		// Map to JSON�� �� �ʿ�
		ObjectMapper mapper = new ObjectMapper();

		for (FestivalVO vo : list) {
			// {title: -- , start:--, end:-- }
			Map<String, String> festivalMap = new HashMap<String, String>();

			festivalMap.put("title", vo.getFname());
			festivalMap.put("start", vo.getStartDate());
			festivalMap.put("end", vo.getEndDate());

			try {
				json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(festivalMap);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			festivalList.add(json);
		}

		/* System.out.println(festivalList); */

		ModelAndView mav = new ModelAndView("/calendar/calendar");

		mav.addObject("festivalList", festivalList);
		return mav;
	}

	// Ķ���� -> ȸ������
	@RequestMapping(value = "/signup", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupPage() {
		ModelAndView mav = new ModelAndView("/signup/signup");

		mav.addObject("signupRequest", new SignupRequest());
		return mav;
	}

	// ȸ������ -> ȸ������ ����
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
			errors.rejectValue("email", "duplicate", "�̹� ���Ե� �̸����Դϴ�.");
			ModelAndView mav = new ModelAndView("/signup/signup");
			return mav;
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("id", "duplicate", "�̹� ���Ե� ���̵��Դϴ�.");
			ModelAndView mav = new ModelAndView("/signup/signup");
			return mav;
		}
		ModelAndView mav = new ModelAndView("/signup/signupSuccess");

		return mav;
	}

	/*
	 * // Ķ���� -> �α���
	 * 
	 * @RequestMapping(value = "/login", method = RequestMethod.GET, produces =
	 * "text/plain;charset=UTF-8") public ModelAndView loginForm(LoginCommand
	 * loginCommand,
	 * 
	 * @CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie)
	 * throws Exception {
	 * 
	 * if (rememberCookie != null) { loginCommand.setId(rememberCookie.getValue());
	 * loginCommand.setRememberId(true); } ModelAndView mav = new
	 * ModelAndView("/login/login");
	 * 
	 * return mav; }
	 * 
	 * // �α��� -> �α��� ����
	 * 
	 * @RequestMapping(value = "/login", method = RequestMethod.POST, produces =
	 * "text/plain;charset=UTF-8") public ModelAndView loginSuccess(@Valid
	 * LoginCommand loginCommand, BindingResult bindingResult, HttpSession session,
	 * HttpServletResponse response) throws Exception {
	 * 
	 * if (bindingResult.hasErrors()) { ModelAndView mav = new
	 * ModelAndView("/login/login"); return mav; }
	 * 
	 * try {
	 * 
	 * AuthInfo authInfo = service.loginAuth(loginCommand);
	 * session.setAttribute("authInfo", authInfo);
	 * 
	 * Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
	 * rememberCookie.setPath("/"); if (loginCommand.isRememberId()) {
	 * rememberCookie.setMaxAge(60 * 60 * 24 * 30); } else {
	 * rememberCookie.setMaxAge(0); } response.addCookie(rememberCookie);
	 * 
	 * } catch (IdPasswordNotMatchingException e) {
	 * bindingResult.rejectValue("password", "notMatch", "���̵�� ��й�ȣ�� �����ʽ��ϴ�.");
	 * ModelAndView mav = new ModelAndView("/login/login"); return mav; }
	 * 
	 * ModelAndView mav = new ModelAndView("redirect:/"); return mav; }
	 * 
	 * // Ķ���� -> �α׾ƿ�
	 * 
	 * @RequestMapping(value = "/logout", method = RequestMethod.GET, produces =
	 * "text/plain;charset=UTF-8") public ModelAndView logout(HttpSession session) {
	 * session.invalidate(); ModelAndView mav = new ModelAndView("redirect:/");
	 * return mav; }
	 */
}
