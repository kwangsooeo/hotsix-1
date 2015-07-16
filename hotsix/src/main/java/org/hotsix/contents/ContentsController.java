package org.hotsix.contents;


import java.util.List;

import javax.inject.Inject;

import org.hotsix.mapper.ContentsMapper;
import org.hotsix.page.Criteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/contents/*")
public class ContentsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Inject
	private ContentsService service;
	@Inject
	private ContentsMapper cMapper;

	//등록
	@RequestMapping(value="/contentsRegist", method = RequestMethod.POST)
	public String registPOST(@ModelAttribute("cri")Criteria cri, ContentsVO contents, Model model)throws Exception{
		
		service.regContents(contents);
		
		return "/contents/success";
	}
	

	//삭제
	@RequestMapping(value="/contentsRemove", method = RequestMethod.POST)
	public String remove(@ModelAttribute("cri")Criteria cri,ContentsVO vo)throws Exception{
		
		logger.info("제거 완료");
		
		service.deleteContents(vo);
		
		return "/suc/contentsSuccess";
	}
	
	//페이징
	@RequestMapping(value="/contentsListCri", method = RequestMethod.GET)
	public void listPaging(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		model.addAttribute("list", service.listPaging(cri));
		model.addAttribute("pageMaker",service.countPaging(cri).calcPage(cri));
	}
	
	@RequestMapping("ajax")
	@ResponseBody
	public String ajaxTest(int contentsNo, String link) throws Exception{
		System.out.println(link + "   " + contentsNo);
		cMapper.insertVideoID(contentsNo, link);
		return "들어옴";
	}

	@RequestMapping("ajaxtest")
	@ResponseBody
	public List<ContentsVO> ajaxTest2(Criteria cri, Model model) throws Exception{
		return service.listPaging(cri);
	}
	
	//페이징-조회
	@RequestMapping(value="/contentsReadPage", method=RequestMethod.GET)
	public void readPaging(@ModelAttribute("cri")Criteria cri, Model model)throws Exception{
		model.addAttribute(service.readContents(cri.getContentsNo()));
	}
	
	//페이징-수정(GET)
	@RequestMapping(value="/contentsModifyPage", method=RequestMethod.GET)
	public void modifyGET(@ModelAttribute("cri")Criteria cri, ContentsVO vo, Model model)throws Exception{
		
		model.addAttribute(service.readContents(vo.getContentsNo()));
	}
	
	//페이징-수정(POST)
	@RequestMapping(value="/contentsModifyPage", method=RequestMethod.POST)
	public String modifyPOST(@ModelAttribute("cri")Criteria cri, ContentsVO vo, Model model)throws Exception{
		
		service.update(vo);
		return "/suc/contentsSuccess";
		
	}

	
}
