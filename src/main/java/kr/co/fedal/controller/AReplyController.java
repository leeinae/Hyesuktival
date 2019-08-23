package kr.co.fedal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.fedal.paging.Paging;
import kr.co.fedal.service.AreviewService;
import kr.co.fedal.vo.AreviewVO;

@Controller
@RequestMapping("/artist/comments")
@RestController
public class AReplyController {
	@Autowired
	private AreviewService service;
	
	//댓글 입력 -> DB 저장
	@RequestMapping(value="/{aid}", method=RequestMethod.POST)
	public void insertComment(@PathVariable("aid") String aid, AreviewVO review){	
		//댓글 db에 저장
		service.insertArtistComment(review);
		System.out.println("댓글 저장 완료");
	}
	
	//DB에 저장된 해당 페스티벌 후기 댓글 받아오기
	@RequestMapping(value="/{aid}/{page}", method=RequestMethod.POST)
	public Map<String, Object> getComments(
			@PathVariable("aid") String aid,
			@PathVariable("page") Integer page, HttpSession session)	
	{
		//db에서 댓글 개수 받아오기, paging 객체 생성 후 현재 페이지, 전체 페이지 수 설정
		int count = service.countArtistComments(aid);
		Paging paging = new Paging(count ,page);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		String id;
		
		if(session.getId() != null && session.getAttribute("sessionName") != null) {
			id = (String) session.getAttribute("sessionName");
		} else if(session.getId() != null && session.getAttribute("AuthInfoId") != null) {
			id = (String) session.getAttribute("AuthInfoId");
		} else {
			id ="";
		}
		System.out.println("id: " + id);
		List<Integer> likeList = service.selectLikeCheck(id);
		List<AreviewVO> avoList = new ArrayList<>();
		ModelAndView mav = new ModelAndView();

		for(Integer likeno: likeList) { // map 결과 = 글 번호 / 아이디
			AreviewVO vo = new AreviewVO();
			vo.setNo(likeno);
			avoList.add(vo);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<AreviewVO> cList = service.selectArtistCommentsPaging(aid, start, end);

		for(AreviewVO vo : avoList) {
			for(Integer inte : likeList) {
				
				if(vo.getNo()==inte) {
					vo.setLike(true);
				}
			}
		}
		mav.addObject("trueList", likeList);
		map.put("list",cList);
		map.put("paging",paging);
		map.put("trueList", avoList);
		System.out.println("avoList: " + avoList);
		System.out.println("likeList:"+likeList);
		return map;
	}
	
	@RequestMapping(value="/delete/{no}", method=RequestMethod.POST)
	public void deleteComment(@PathVariable("no") int no) {
		service.deleteArtistComment(no);		
	}
	
	@RequestMapping(value="/update/{no}", method=RequestMethod.POST)
	public void updateComment(@PathVariable("no") int no, AreviewVO avo) {
		service.updateArtistComment(avo);
	}
}
