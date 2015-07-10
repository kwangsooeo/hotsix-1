package org.hotsix.client.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotsix/qna/*")
public class ClientQnAController {

	@RequestMapping("qnaList")
	public String clientQnA(){
		return "/client/main/qna";
	}
}
