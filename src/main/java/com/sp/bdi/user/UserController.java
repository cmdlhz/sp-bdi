package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/user/list", method=RequestMethod.GET)
	public @ResponseBody List<UserVO> getUserVOList(@ModelAttribute UserVO param){
		// @RequestBody : json 형태로 못받는다.
		log.debug("param : {}", param);
		return us.getUserVOList(param);
	}
	
	@RequestMapping(value="/user/view", method=RequestMethod.GET)
	public @ResponseBody UserVO getUserInfo(@ModelAttribute UserVO user){
		// @RequestBody : json 형태로 못받는다.
		log.debug("user : {}", user);
		return us.getUserVO(user);
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	// HttpServletRequest req 한다음 HttpSession hs = req.getSession() 이라고 해도 되지만... HttpSession hs 만으로도 호출해줌
	public @ResponseBody UserVO login(@RequestBody UserVO user, HttpSession hs){
		log.debug("user : {}", user);
		user = us.login(user);
		log.debug("select user : {}", user);
		if(user != null) hs.setAttribute("user", user);
		return user;
	}

	@RequestMapping(value="/user/list", method=RequestMethod.POST)
	// @RequestBody : json 형태로 받을 수 있다.
	public @ResponseBody Map<String, String> insertUser(@RequestBody UserVO user){ // @RequestBody : json일때만 작동
		log.debug("user : {}", user);
		return us.insertUserInfo(user);
	}
	
	@RequestMapping(value="/user/list", method=RequestMethod.PUT)
	public @ResponseBody Map<String, String> updateUser(@RequestBody UserVO user){
		log.debug("user : {}", user);
		return us.updateUserInfo(user);
	}
	
	@RequestMapping(value="/user/list", method=RequestMethod.DELETE)
	public @ResponseBody Map<String, String> deleteUser(@ModelAttribute UserVO user){
		log.debug("user : {}", user);
		return us.deleteUserInfo(user);
	}
}








