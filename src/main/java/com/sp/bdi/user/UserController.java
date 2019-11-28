package com.sp.bdi.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
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

	@RequestMapping("/user/list")
	public String getUserList() {
		return "user/list";
	}
	
	@RequestMapping("/user/ajax/list")
	public @ResponseBody List<UserVO> getUserVOList(){ 
		return us.getUserVOList();
	}
}








