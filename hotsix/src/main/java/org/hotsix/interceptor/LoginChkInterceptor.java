package org.hotsix.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginChkInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Cookie ck = WebUtils.getCookie(request, "login");
		System.out.println("name : "+ck.getName()+"  value : "+ck.getValue());
		if(ck == null){
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
