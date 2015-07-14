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
		if(searchData == null|| searchData.equals("")){
			list.add("1ukHX-1mUc0");
			list.add("R9sy2WcxHcY");
		}else if(searchData.equals("교사") || searchData.equals("선생님")){
			list.add("Bi1qs0D9SVE");
			list.add("b7USKW-Db2o");
		}else if(searchData.equals("셰프") || searchData.equals("요리사")){
			list.add("FVS22aC8BV4");
			list.add("6hmaCRXz358");
			list.add("9lvr4uAqzKo");
		}else if(searchData.equals("변호사") || searchData.equals("변호")){
			list.add("kDw6bLs6l98");
			list.add("Pfst9EG2aZM");
			list.add("pOcEYz9ifos");
		}else if(searchData.equals("pd") || searchData.equals("프로듀서")){
			list.add("EYgL1oiUozM");
			list.add("toLz3r0qYhg");
		}
		
		model.addAttribute("link", list);
		return "/client/sub/main";
	}
	
	@RequestMapping("intro")
	public String siteIntro(){
		return "/client/main/introduce";
	}
	
}
