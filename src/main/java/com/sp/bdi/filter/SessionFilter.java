package com.sp.bdi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sp.bdi.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// web.xml에서 "url-pattern"을 변경하지만, @WebFilter("/") 이렇게는 Spring 3부터 적용됨
public class SessionFilter implements Filter {

	public void init() {
		
	}
	
    @Override
	public void destroy() {
    	
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest)request;
		HttpSession hs = hsr.getSession();
		String uri = hsr.getRequestURI();
		UserVO user = null;
		
		if(hs.getAttribute("user") != null) {
			user = (UserVO)hs.getAttribute("user");
			log.debug("user : {}", user);
		}
		
		if(user== null && uri.indexOf("login") == -1) {
			if(uri.indexOf("/views") == 0) { // 단순한 jsp 화면 요청 / login이 아닐 경우
				hsr.setAttribute("msg", "Please login.");
				hsr.setAttribute("url", "/views/user/login");
				RequestDispatcher rd = request.getRequestDispatcher("/views/msg");
				rd.forward(request, response);
				return;
			}
//			log.debug("uri => {}", uri);
//			throw new ServletException("Login needed"); // AOP의 근간
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}
}
