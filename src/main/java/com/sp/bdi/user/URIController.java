package com.sp.bdi.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/views/**", method=RequestMethod.GET)
public class URIController {
	@RequestMapping
	public String goPage(HttpServletRequest req) {
		String uri = req.getRequestURI();
		return uri.substring(7); // /views/
	}
}

// WARN : org.springframework.web.servlet.PageNotFound - No mapping found for HTTP request with URI [/views/user/list] in DispatcherServlet with name 'appServlet'
