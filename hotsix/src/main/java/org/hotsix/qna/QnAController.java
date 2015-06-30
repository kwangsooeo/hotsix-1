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
		return qnaNo+"번 질문이 삭제되었습니다.";
	}
	
	
	@RequestMapping("/reply/insert")
	@ResponseBody
	public void replyInsert(QnAVO qvo) throws Exception{
		
		service.qnaRegist(qvo);
	}
	
	@RequestMapping(value="/read/{parents}")
	public String reRead(@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		
		return "/qna/qnaRead";
	}
}
