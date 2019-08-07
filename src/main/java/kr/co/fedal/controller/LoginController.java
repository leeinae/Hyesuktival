package kr.co.fedal.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.fedal.exception.IdPasswordNotMatchingException;
import kr.co.fedal.naver.NaverLoginBO;
import kr.co.fedal.service.FestivalService;
import kr.co.fedal.util.AuthInfo;
import kr.co.fedal.util.LoginCommand;

@RestController
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private FestivalService service;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// Ķ���� -> �α���
	@RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView loginForm(Model model, HttpSession session, LoginCommand loginCommand,
			@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie) throws Exception {

		if (rememberCookie != null) {
			loginCommand.setId(rememberCookie.getValue());
			loginCommand.setRememberId(true);
		}

		// ���̹� �α���
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);

		ModelAndView mav = new ModelAndView("/login/login");

		return mav;
	}

	// �α��� -> �α��� ����
	@RequestMapping(value = "/loginS", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView loginSuccess(@Valid LoginCommand loginCommand, BindingResult bindingResult, HttpSession session,
			HttpServletResponse response) throws Exception {
		System.out.println("�⺻ �α���");
		if (bindingResult.hasErrors()) {
			ModelAndView mav = new ModelAndView("/login/login");
			return mav;
		}

		try {

			AuthInfo authInfo = service.loginAuth(loginCommand);
			session.setAttribute("authInfo", authInfo);

			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
			rememberCookie.setPath("/");
			if (loginCommand.isRememberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);

		} catch (IdPasswordNotMatchingException e) {
			bindingResult.rejectValue("password", "notMatch", "���̵�� ��й�ȣ�� �����ʽ��ϴ�.");
			ModelAndView mav = new ModelAndView("/login/login");
			return mav;
		}

		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}

	// ���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {
		System.out.println("����� callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. �α��� ����� ������ �о�´�.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String������ json������
		/**
		 * apiResult json ���� {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String������ apiResult�� json���·� �ٲ�
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. ������ �Ľ�
		// Top���� �ܰ� _response �Ľ�
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response�� nickname�� �Ľ�
		String nickname = (String) response_obj.get("nickname");
		System.out.println(nickname);
		// 4.�Ľ� �г��� �������� ����
		session.setAttribute("sessionId", nickname); // ���� ����
		model.addAttribute("result", apiResult);

		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}

	// Ķ���� -> �α׾ƿ�
	@RequestMapping(value = "/logout", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
}
