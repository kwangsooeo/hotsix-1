package org.hotsix.client.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotsix/*")
public class MainController {

	
	@RequestMapping("main")
	public String mainPage(){
		
		return "/client/sub/main";
	}
}
