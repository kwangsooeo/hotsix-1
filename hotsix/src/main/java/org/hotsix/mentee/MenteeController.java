package org.hotsix.mentee;

import javax.inject.Inject;

import org.hotsix.page.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mentee/*")
public class MenteeController {

	@Inject
	private MenteeService service;
	
	@RequestMapping("list")
	public String menteeList(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		model.addAttribute("list",service.criAll(cri));
		model.addAttribute("pm", service.totalCount(cri).calcPage(cri));
		return "/mentee/menteeList";
	}
	
	@RequestMapping("delete")
	public String delete(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		service.delete(cri.getMenteeNo());
		return "/suc/menteeSuccess";
	}
}
