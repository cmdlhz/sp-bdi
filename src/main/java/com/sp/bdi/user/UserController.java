package com.sp.bdi.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	@Autowired
	@Qualifier("userService")
	private UserService us;
	
//	@RequestMapping("/user/list")
//	public String getUserList(Model m) {	//  
//		// 저장은 model에 하는데 jsp가 활용하는 건 request scope
//		m.addAttribute("userList", us.getUserList());
//		System.out.println(m);
//		return "user/list";
//	}

	// JSTL 기반이라면 이게 맞는거고, ajax 기반이면 URIController 만들어서 이동시켜도 됨
//	@RequestMapping("/user/list")
//	public String getUserList() {
//		return "user/list";
//	}
	
	@RequestMapping("/user/ajax/list")
	public @ResponseBody List<UserVO> getUserVOList(@ModelAttribute UserVO param){
		log.debug("param : {}", param);
		return us.getUserVOList(param);
	}
}








