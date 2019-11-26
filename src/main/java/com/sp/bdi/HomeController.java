package com.sp.bdi;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller // 어떻게 메모리가 생성이 되는 걸까
// src > main > webapp > WEB-INF > spring > appServlet > servlet-context.html 
// <context:component-scan base-package="com.sp.bdi" /> ==> 여기 있는건 다 읽어들여라!
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 * 하나의 method에서 urlpattern & method 정의
	 * Servlet이 작동해서 link 이동시켜줌 (@Controller)
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		List<String> strList = new ArrayList<String>();
		strList.add("가");
		strList.add("나");
		strList.add("test3");
		strList.add("test4");
		strList.add("test5");
		model.addAttribute("strList", strList); // key-value
		
		return "home";
	}
	
	
	@RequestMapping(value = "/test") // GET, POST 상관없이 이 글자만 맞으면 다 탐
	public String test(Model m) {
		// WEB-INF/views/test/test.jsp
		// 누군가 new를 해준다!
		System.out.println(m); // {}
		return "test/test";
	}
	
	public static void main(String[] args) {
		System.out.println("this gets executed..");
	}
}
