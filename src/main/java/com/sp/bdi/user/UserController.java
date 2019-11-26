package com.sp.bdi.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@Autowired
	private UserService us;
	
	@RequestMapping("/user/list")
	public String getUserList(Model m) {
		m.addAttribute("userList", us.getUserList());
		return "user/list";
	}
}
