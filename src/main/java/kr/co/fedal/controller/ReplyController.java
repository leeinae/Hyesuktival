package kr.co.fedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.fedal.service.FreviewService;
import kr.co.fedal.vo.FreviewVO;

@Controller
@RequestMapping("/festival")
@RestController
public class ReplyController {
	
	@Autowired
	private FreviewService service;
	
	//��� �Է� -> DB ����
	@RequestMapping(value="/comments/{fid}", method=RequestMethod.POST)
	public void insertComment(@PathVariable("fid") String fid, FreviewVO review){	
		//��� db�� ����
		service.insertFestivalComment(review);
		System.out.println("��� ���� �Ϸ�");
	}
	
	//DB�� ����� �ش� �佺Ƽ�� �ı� ��� �޾ƿ���
	@RequestMapping(value="/comments/{fid}", method=RequestMethod.GET)
	public List<FreviewVO> getComments(@PathVariable("fid") String fid) {
		List<FreviewVO> cList = service.selectFestivalComments(fid);
		return cList;
	}
	
	@RequestMapping(value="/comments/delete/{no}", method=RequestMethod.POST)
	public void deleteComment(@PathVariable("no") int no) {
		service.deleteFestivalComment(no);		
	}
	
	@RequestMapping(value="/comments/update/{no}", method=RequestMethod.POST)
	public void updateComment(@PathVariable("no") int no, FreviewVO fvo) {
		service.updateFestivalComment(fvo);
	}
	
}
