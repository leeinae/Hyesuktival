package kr.co.fedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fedal.service.FestivalService;
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;

@Controller
public class HomeController {

	@Autowired
	private FestivalService service;

	// 메인 캘린더 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller 호출");

		// 전체 페스티벌 일정 리스트 받아오기
		List<FestivalVO> list = service.selectAll();

		// fullcalendar 띄우기 위한 json 같은 string
		StringBuffer festivalList = new StringBuffer();

		for (FestivalVO vo : list) {
			String genre = vo.getGenre().trim();
			String color = "";
			switch (genre) {
			case "R":
				color = "purple";
				break;
			case "E":
				color = "pink";
				break;
			case "H":
				color = "blue";
				break;
			case "J":
				color = "orange";
				break;
			default:
				color = "red";
				break;
			}

			festivalList.append("{ start : \"" + vo.getStartDate() + "\", end :\"" + vo.getEndDate() + "\", title : \""
					+ vo.getFname() + "\", url : \"festival/" + vo.getFid() + "\", color : \"" + color + "\"},");
		}

		// ModelAndView 생성 + 넘겨줄 View 지정
		ModelAndView mav = new ModelAndView("calendar/calendar");

		// List 공유영역에 등록
		mav.addObject("festivalList", festivalList);

		return mav;
	}

	// 페스티벌 상세 정보 페이지
	@RequestMapping(value = "festival/{fid}", method = RequestMethod.GET)
	// url의 fid를 param으로 받는다
	public ModelAndView viewFestivalDetail(@PathVariable("fid") String fid) {
		System.out.println("view Festival Detail Controller 호출");

		// fid가 일치하는 fesival 정보 받아오기
		FestivalVO fvo = service.selectDetail(fid);

		// 페스티벌에 출연하는 아티스트 정보 받아오기
		List<ArtistVO> avoList = service.selectAllArtist(fid);

		ModelAndView mav = new ModelAndView("festival/detailFestival");

		// 공유영역에 두 가지 객체 등록 (페스티벌, 라인업)
		mav.addObject("festival", fvo);
		mav.addObject("artistList", avoList);

		return mav;
	}

	// 아티스트 상세정보 페이지 (페스티벌 -> 아티스트)
	@RequestMapping(value = "/artist/{aid}", method = RequestMethod.GET)
	public ModelAndView viewArtist(@PathVariable("aid") String aid) {

		// aid 일치하는 아티스트 정보
		ArtistVO avo = service.selectArtist(aid);

		// aid가 일치하는 music 가져오기
		List<MusicVO> mvo = service.selectAllMusic(aid);
		List<MusicVO> mvoList = service.selectMusic(aid);

		ModelAndView mav = new ModelAndView("festival/detailArtist");
		mav.addObject("musicAll", mvo);
		mav.addObject("musicList", mvoList);
		mav.addObject("artist", avo);

		return mav;
	}

	// 검색결과 페이지
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView searchFestival(@RequestParam("search") String keyword) {
		// 넘어온 param 확인
		System.out.println(keyword);

		List<FestivalVO> searchList = service.searchAllFestival(keyword);

		ModelAndView mav = new ModelAndView("search/searchFestival");
		mav.addObject("searchList", searchList);

		return mav;
	}

}