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

	// 캘린더 -> 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView loginForm(Model model, HttpSession session, LoginCommand loginCommand,
			@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie) throws Exception {

		if (rememberCookie != null) {
			loginCommand.setId(rememberCookie.getValue());
			loginCommand.setRememberId(true);
		}

		// 네이버 로그인
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);

		ModelAndView mav = new ModelAndView("/login/login");

		return mav;
	}

	// 로그인 -> 로그인 성공
	@RequestMapping(value = "/loginS", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView loginSuccess(@Valid LoginCommand loginCommand, BindingResult bindingResult, HttpSession session,
			HttpServletResponse response) throws Exception {
		System.out.println("기본 로그인");
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
			bindingResult.rejectValue("password", "notMatch", "아이디와 비밀번호가 맞지않습니다.");
			ModelAndView mav = new ModelAndView("/login/login");
			return mav;
		}

		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		System.out.println(nickname);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", nickname); // 세션 생성
		model.addAttribute("result", apiResult);

		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}

	// 캘린더 -> 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
}
