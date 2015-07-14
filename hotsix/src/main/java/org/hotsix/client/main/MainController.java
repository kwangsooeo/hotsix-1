package org.hotsix.client.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/hotsix/*")
public class MainController {

	@RequestMapping("main")
	public String mainPage(String searchData ,Model model){
		System.out.println(searchData);
		List<String> list = new ArrayList<>();
		if(searchData.equals("")){
			list.add("JgC0byKDoZ0");
			model.addAttribute("link", list);
			System.out.println("빈값들어감");
		}else{
			list.add("R9sy2WcxHcY");
			list.add("PyLMLqBxK-c");
			list.add("JgC0byKDoZ0");
			list.add("rg2LPC6GN0I");
			list.add("CBd3b4FR5RM");
			model.addAttribute("link", list);
		}
		return "/client/sub/main";
	}
	
	@RequestMapping("intro")
	public String siteIntro(){
		return "/client/main/introduce";
	}
	
	@RequestMapping("search")
	public String youtubeLink(Model model){
		List<String> list = new ArrayList<>();
		list.add("R9sy2WcxHcY");
		list.add("PyLMLqBxK-c");
		list.add("JgC0byKDoZ0");
		list.add("7m-dnk9jm2E");
		list.add("yiUvchj9Xfg");
		model.addAttribute("link", list);
		return "/client/sub/main";
	}
}
