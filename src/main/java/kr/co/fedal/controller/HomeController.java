package kr.co.fedal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fedal.service.FestivalService;
import kr.co.fedal.service.FreviewService;
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;

@Controller
public class HomeController {

	@Autowired
	private FestivalService service;

	//硫붿씤 罹섎┛�뜑 �럹�씠吏�
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView viewCalendar() {
		System.out.println("Festival Controller �샇異�");
		
		//�쟾泥� �럹�뒪�떚踰� �씪�젙 由ъ뒪�듃 諛쏆븘�삤湲�
		List<FestivalVO> list = service.selectAll();
		
		//fullcalendar �쓣�슦湲� �쐞�븳 json 媛숈� string
		StringBuffer festivalList = new StringBuffer();
		
		for (FestivalVO vo : list) {
			festivalList.append("{ start : \"" +vo.getStartDate()+"\", end :\"" +vo.getEndDate()+"\", title : \""+ vo.getFname()+"\", url : \"festival/"+vo.getFid()+"\" },");
		}

		//ModelAndView �깮�꽦 + �꽆寃⑥쨪 View 吏��젙
		ModelAndView mav = new ModelAndView("calendar/calendar");
		
		//List 怨듭쑀�쁺�뿭�뿉 �벑濡�
		mav.addObject("festivalList", festivalList);
		
		return mav;
	}
	
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
		List<MusicVO> mvoList = service.selectAllMusic(aid);
		
		ModelAndView mav = new ModelAndView("festival/detailArtist");
		mav.addObject("musicList", mvoList);
		mav.addObject("artist",avo);
		
		return mav;
	}

	//寃��깋寃곌낵 �럹�씠吏�
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView searchFestival(@RequestParam("search") String keyword) {
		//�꽆�뼱�삩 param �솗�씤
		System.out.println(keyword);
		
		List<FestivalVO> searchList = service.searchAllFestival(keyword);
		
		ModelAndView mav = new ModelAndView("search/searchFestival");
		mav.addObject("searchList",searchList);
		
		return mav;
	}



}
