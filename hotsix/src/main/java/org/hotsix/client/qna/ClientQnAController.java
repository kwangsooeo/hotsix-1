package org.hotsix.client.qna;

import javax.inject.Inject;

import org.hotsix.page.Criteria;
import org.hotsix.qna.QnAVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/hotsix/qna/*")
public class ClientQnAController {

	@Inject
	private ClientQnAService service;
	
	@RequestMapping("qnaList")
	public String clientQnA(@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		
		model.addAttribute("list", service.qna_List(cri));
		model.addAttribute("page", service.total(cri).calcPage(cri));
		
		return "/client/main/qna/qnaList";
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public String clientWrite(int memberNo) throws Exception{
		
		return "/client/main/qna/qnaWrite";
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	@ResponseBody
	public String clientWritePost(QnAVO qvo) throws Exception{
		service.qna_userQnA(qvo);
		service.qna_userQnAParent(service.qna_userParent());
		
		return "Completed";
	}
	
	@RequestMapping(value="qnaRead", method=RequestMethod.GET)
	public String clientqnaRead(Model model) throws Exception{
		int qnaNo= service.qna_userParent();
		model.addAttribute("qna", service.qna_userRead(qnaNo));
		return "/client/main/qna/qnaRead";
	}
	
	@RequestMapping(value="qnaRead2", method=RequestMethod.GET)
	public String clientqnaRead2(int qnaNo, Model model) throws Exception{

		model.addAttribute("qna", service.qna_userRead(qnaNo));
		return "/client/main/qna/qnaRead";
	}
	
	@RequestMapping(value="qnaModify", method=RequestMethod.GET)
	public String clientqnaModify(int qnaNo, Model model) throws Exception{

		model.addAttribute("qna", service.qna_userRead(qnaNo));
		return "/client/main/qna/qnaModify";
	}
	@RequestMapping(value="qnaModify", method=RequestMethod.POST)
	@ResponseBody
	public String clientqnaModifyPost(QnAVO vo) throws Exception{

		service.qna_ModifyUser(vo);
		
		return "Complete a modification";
	}
	
	@RequestMapping(value="qnaDelete/{qnaNo}", method=RequestMethod.POST)
	@ResponseBody
	public String clientqnaDelete(@PathVariable("qnaNo")int qnaNo) throws Exception{

		service.qna_userDelete(qnaNo);
		
		return "Delete a Question";
	}
}
