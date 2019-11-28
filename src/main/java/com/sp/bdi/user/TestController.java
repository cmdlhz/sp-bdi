package com.sp.bdi.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/test")
@Slf4j
public class TestController {
	@RequestMapping(method=RequestMethod.GET)
	public @ResponseBody Map<String, String> test(){
		Map<String, String> rMap = new HashMap<String, String>();
		return rMap;
	}

//	public @ResponseBody Map<String, String> test(@RequestParam Map<String, String> param){
//	public @ResponseBody Map<String, String> test(@ModelAttribute UserVO param){
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody Map<String, String> test(@RequestBody Map<String, String> param){
		log.debug("param: {}", param);
		Map<String, String> rMap = new HashMap<String, String>();
		rMap.put("key", "난 test1");
		return rMap;
	}
	// @RequestMapping(value="/test", method=RequestMethod.GET)
	// 이렇게 쓸 수는 있지만, 선생님은 잘 안 쓰신다고
}