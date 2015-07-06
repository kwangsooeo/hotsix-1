package org.hotsix.aop;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginChkAOP extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("==============================");
		Cookie ck = WebUtils.getCookie(request, "login");
		System.out.println(ck);
		if(ck == null){
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
