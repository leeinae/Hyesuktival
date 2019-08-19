package kr.co.fedal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fedal.exception.AlreadyExistingEmailException;
import kr.co.fedal.exception.AlreadyExistingIdException;
import kr.co.fedal.service.FestivalService;
<<<<<<< HEAD
import kr.co.fedal.service.FreviewService;
=======
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.util.SignupRequestValidator;
>>>>>>> origin/Vote
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;

@Controller
public class HomeController {

	@Autowired
	private FestivalService service;

<<<<<<< HEAD
	//硫붿씤 罹섎┛�뜑 �럹�씠吏�
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller �샇異�");
		
		//�쟾泥� �럹�뒪�떚踰� �씪�젙 由ъ뒪�듃 諛쏆븘�삤湲�
		List<FestivalVO> list = service.selectAll();
		
		//fullcalendar �쓣�슦湲� �쐞�븳 json 媛숈� string
=======
	// 메인 캘린더 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller 호출");

		// 전체 페스티벌 일정 리스트 받아오기
		List<FestivalVO> list = service.selectAll();

		// fullcalendar 띄우기 위한 json 같은 string
>>>>>>> origin/Vote
		StringBuffer festivalList = new StringBuffer();

		for (FestivalVO vo : list) {
			festivalList.append("{ start : \"" + vo.getStartDate() + "\", end :\"" + vo.getEndDate() + "\", title : \""
					+ vo.getFname() + "\", url : \"festival/" + vo.getFid() + "\" },");
		}

<<<<<<< HEAD
		//ModelAndView �깮�꽦 + �꽆寃⑥쨪 View 吏��젙
		ModelAndView mav = new ModelAndView("calendar/calendar");
		
		//List 怨듭쑀�쁺�뿭�뿉 �벑濡�
=======
		// ModelAndView 생성 + 넘겨줄 View 지정
		ModelAndView mav = new ModelAndView("calendar/calendar");

		// List 공유영역에 등록
>>>>>>> origin/Vote
		mav.addObject("festivalList", festivalList);

		return mav;
	}
<<<<<<< HEAD
	
	//�럹�뒪�떚踰� �긽�꽭 �젙蹂� �럹�씠吏�
	@RequestMapping(value="festival/{fid}" , method=RequestMethod.GET)
	//url�쓽  fid瑜� param�쑝濡� 諛쏅뒗�떎
	public ModelAndView viewFestivalDetail(@PathVariable("fid") String fid) {
		System.out.println("view Festival Detail Controller �샇異�");
		
		//fid媛� �씪移섑븯�뒗 fesival �젙蹂� 諛쏆븘�삤湲� 
		FestivalVO fvo = service.selectDetail(fid);
		
		//�럹�뒪�떚踰뚯뿉 異쒖뿰�븯�뒗 �븘�떚�뒪�듃 �젙蹂� 諛쏆븘�삤湲� 
		List<ArtistVO> avoList= service.selectAllArtist(fid);
		
		ModelAndView mav = new ModelAndView("festival/detailFestival");
		
		//怨듭쑀�쁺�뿭�뿉 媛앹껜 �벑濡� (�럹�뒪�떚踰�, �씪�씤�뾽, �뙎湲�)
		mav.addObject("festival", fvo);
		mav.addObject("artistList",avoList);

		return mav;
	}
	
	// �븘�떚�뒪�듃 �긽�꽭�젙蹂� �럹�씠吏� (�럹�뒪�떚踰� -> �븘�떚�뒪�듃)
	@RequestMapping(value="/artist/{aid}", method=RequestMethod.GET)
	public ModelAndView viewArtist(@PathVariable("aid") String aid) {
		
		//aid �씪移섑븯�뒗 �븘�떚�뒪�듃 �젙蹂�
		ArtistVO avo = service.selectArtist(aid);
		
		//aid媛� �씪移섑븯�뒗 music 媛��졇�삤湲�
=======

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
>>>>>>> origin/Vote
		List<MusicVO> mvoList = service.selectAllMusic(aid);

		ModelAndView mav = new ModelAndView("festival/detailArtist");
		mav.addObject("musicList", mvoList);
		mav.addObject("artist", avo);

		return mav;
	}

<<<<<<< HEAD
	//寃��깋寃곌낵 �럹�씠吏�
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView searchFestival(@RequestParam("search") String keyword) {
		//�꽆�뼱�삩 param �솗�씤
=======
	// 검색결과 페이지
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView searchFestival(@RequestParam("search") String keyword) {
		// 넘어온 param 확인
>>>>>>> origin/Vote
		System.out.println(keyword);

		List<FestivalVO> searchList = service.searchAllFestival(keyword);

		ModelAndView mav = new ModelAndView("search/searchFestival");
		mav.addObject("searchList", searchList);

		return mav;
	}

<<<<<<< HEAD

=======
	@RequestMapping(value = "/festival/{fid}", method = RequestMethod.POST)
	@ResponseBody
	public void insertComment(FreviewVO review) {
		System.out.println(review.toString());
		System.out.println("post 방식 전송 완료");

		service.insertFestivalComment(review);
	}
>>>>>>> origin/Vote

	@RequestMapping(value = "/signup", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView signupPage() {
		ModelAndView mav = new ModelAndView("/signup/signup");

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
		ModelAndView mav = new ModelAndView("redirect:/");

		return mav;
	}

	@RequestMapping(value = "/artist/{aid}/{mid}/up", method = RequestMethod.POST)
	@ResponseBody
	public int voteUp(@PathVariable("mid") String mid) {
		System.out.println("mid: " + mid);
		
		MusicVO musicVO = service.selectCnt(mid);
		int mCnt = musicVO.getmCnt();
		mCnt++;
		service.voteCnt(mid);
		
		return mCnt;
	}
	
	@RequestMapping(value = "/artist/{aid}/{mid}/down", method = RequestMethod.POST)
	@ResponseBody
	public int voteDown(@PathVariable("mid") String mid) {
		System.out.println("mid: " + mid);
		
		MusicVO musicVO = service.selectCnt(mid);
		int mCnt = musicVO.getmCnt();
		mCnt--;
		service.voteCntCancel(mid);
		
		return mCnt;
	}
}