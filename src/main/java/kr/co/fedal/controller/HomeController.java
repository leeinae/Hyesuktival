package kr.co.fedal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.fedal.dao.FestivalDAO;
import kr.co.fedal.service.FestivalService;
import kr.co.fedal.vo.FestivalVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private FestivalService service;

	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller 호출");
		
		// 전체 festivalVO를 담은 list
		List<FestivalVO> list = service.selectAll();
		// {title: -- , start:--, end:-- } 형식의 map을 담을 list
		StringBuffer festivalList = new StringBuffer();
		
		for (FestivalVO vo : list) {
			festivalList.append("{ start : \"" +vo.getStartDate()+"\", end :\"" +vo.getEndDate()+"\", title : \""+ vo.getFname()+"\" },");
		}
		System.out.println(festivalList);

		ModelAndView mav = new ModelAndView("calendar/calendar");
		mav.addObject("festivalList", festivalList);
		return mav;
	}


}
