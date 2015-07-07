package org.hotsix.qna;

import java.util.List;

import javax.inject.Inject;

import org.hotsix.page.Criteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/qna/*")
public class QnAController {
	private static final Logger logger = LoggerFactory
			.getLogger(QnAController.class);
	@Inject
	private QnAService service;


	@RequestMapping(value="/list", method= RequestMethod.GET)
	public String qnalistPage(@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.qna_aList(cri));
		model.addAttribute("pageMaker", service.total(cri).calcPage(cri));
		return "/qna/qnaList";
	}
	
	@RequestMapping("/listData/{qnaNo}")
	@ResponseBody
	public List<QnAVO> qnalist(@PathVariable("qnaNo")int qnaNo) throws Exception{
		
		List<QnAVO> list =service.qna_bList(qnaNo);
		
		return list;
	}
	@RequestMapping("/deleteQnA/{qnaNo}")
	@ResponseBody
	public String deleteQnA(@PathVariable("qnaNo")int qnaNo) throws Exception{
		service.qnaRemove(qnaNo);
		service.qnaRemoveWith(qnaNo);
		return qnaNo+" Delete";
	}
	
	@RequestMapping(value="/registQnA", method= RequestMethod.POST)
	@ResponseBody
	public String registReply(QnAVO qvo) throws Exception{
		
		service.qnaRegist(qvo);
		service.qna_cntplus(qvo);
		
		return "completed";
	}
	
	@RequestMapping("/deleteReply")
	@ResponseBody
	public String deleteReply(QnAVO qvo) throws Exception{
		service.qna_delreply(qvo);
		service.qna_cntminus(qvo);
		
		return qvo.getQnaNo()+" Delete";
	}
	
	@RequestMapping(value="/readReply/{qnaNo}", method=RequestMethod.GET)
	@ResponseBody
	public QnAVO modifyReply(@PathVariable("qnaNo")int qnaNo) throws Exception{
		
		return service.qnaRead(qnaNo);
	}
	
	@RequestMapping(value="/modifyReply", method=RequestMethod.POST)
	@ResponseBody
	public String modifyReplypost(QnAVO qvo) throws Exception{
		service.qnaModify(qvo);
		
		return "update";
	}

	
}
