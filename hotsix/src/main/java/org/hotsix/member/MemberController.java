package org.hotsix.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@RequestMapping("login")
	public String memberLogin(){
		return "/member/memberLogin";
	}
}
