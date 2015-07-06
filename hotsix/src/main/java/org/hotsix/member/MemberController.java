package org.hotsix.member;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hotsix.mapper.MemberMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberMapper mMapper;
	
	@RequestMapping(value="login",method= RequestMethod.GET)
	public String memberLogin(){
		return "/member/memberLogin";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String memberLoginPost(MemberVO vo, HttpServletResponse response){
		MemberVO member = mMapper.loginChk(vo);
		String userId = vo.getId();
		if(member.getMemberChkCount() == 1 && member.getAuthority().equals("admin")){
			Cookie loginCookie = new Cookie("login", userId);
			loginCookie.setMaxAge(((60*60)*24)*7);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			return "redirect:/member/chk";
		}else if(member.getMemberChkCount() == 1 && !member.getAuthority().equals("admin")){
			return "/suc/loginNotAdmin";
		}else{
			return "/suc/loginFail";
		}
	}
	
	@RequestMapping(value="chk")
	public String chkLogin(@CookieValue("login")String userId, HttpServletRequest request){
		Cookie ck = WebUtils.getCookie(request, "login");
		System.out.println("userId : " + userId +"  cookie : "+ck);
		return "/suc/loginSuccess";
	}
}
