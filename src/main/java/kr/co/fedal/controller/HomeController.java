package kr.co.fedal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

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

	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller 호출");

		// 전체 festivalVO를 담은 list
		List<FestivalVO> list = service.selectAll();
		// {title: -- , start:--, end:-- } 형식의 map을 담을 list
		List<String> festivalList = new ArrayList<>();
		String json = new String();

		// Map to JSON할 떄 필요
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

		System.out.println(festivalList);

		ModelAndView mav = new ModelAndView("/calendar/calendar");

		mav.addObject("festivalList", festivalList);
		return mav;
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupPage() {
		ModelAndView mav = new ModelAndView("/signup/signup");

		mav.addObject("signupRequest", new SignupRequest());
		return mav;
	}

	@RequestMapping(value = "/signupSuccess", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupSuccessPage(SignupRequest signReq, Errors errors) throws Exception {
		new SignupRequestValidator().validate(signReq, errors);
		if(errors.hasErrors()) {
			ModelAndView mav = new ModelAndView("/signup/signup");
			return mav;
		}
		try {
			service.signup(signReq);
		}catch(AlreadyExistingEmailException e) {
			errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
            ModelAndView mav = new ModelAndView("/signup/signup");
            return mav;
        } catch (AlreadyExistingIdException e) {
            errors.rejectValue("id", "duplicate", "이미 가입된 아이디입니다.");
            ModelAndView mav = new ModelAndView("/signup/signup");
            return mav;
        }
		ModelAndView mav = new ModelAndView("/signup/signupSuccess");
		
		//mav.addObject("signupRequest", new SignupRequest());
		return mav;
	}
}
