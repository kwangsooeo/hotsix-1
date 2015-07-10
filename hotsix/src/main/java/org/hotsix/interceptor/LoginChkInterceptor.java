package org.hotsix.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hotsix.mapper.MemberMapper;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginChkInterceptor extends HandlerInterceptorAdapter{

	@Inject
	private HttpSession session;
	
	@Inject
	private MemberMapper mMapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Cookie ck = WebUtils.getCookie(request, "login");
//		System.out.println(session.getAttribute(ck.getValue()));
//		System.out.println("name : "+ck.getName()+"  value : "+ck.getValue());
		if(session.getAttribute(ck.getValue()) == null){
//		if(ck == null){
			session.setAttribute(ck.getValue(), mMapper.logData(ck.getValue()));
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
