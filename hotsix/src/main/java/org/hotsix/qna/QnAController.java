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
	public String qnalistPage2(@ModelAttribute("cri")Criteria cri, Model model) throws Exception {

		//model.addAttribute("pageMaker", service.total(cri).calcPage(cri));
	
		return "/qna/qnaList";
	}
	
	@RequestMapping("/listData")
	@ResponseBody
	public List<QnAVO> qnalist(Criteria cri) throws Exception{
		logger.info(cri.toString());
		return service.qnaList(cri);
	}
	
	@RequestMapping("/deleteQnA/{qnaNo}")
	@ResponseBody
	public String deleteQnA(@PathVariable("qnaNo")int qnaNo) throws Exception{
		service.qnaRemove(qnaNo);
		service.qnaRemoveWith(qnaNo);
		return qnaNo+" Delete 삭제";
	}
	
	@RequestMapping(value="/registQnA", method= RequestMethod.POST)
	@ResponseBody
	public String registReply(QnAVO qvo) throws Exception{
		logger.info(qvo.getContents());
		logger.info("등록");
		service.qnaRegist(qvo);
		return "completed";
	}
	
	@RequestMapping("/deleteReply/{qnaNo}")
	@ResponseBody
	public String deleteReply(@PathVariable("qnaNo")int qnaNo) throws Exception{
		service.qnaRemove(qnaNo);
		
		return qnaNo+" Delete 삭제";
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
