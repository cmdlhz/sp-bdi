package com.sp.bdi.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
class Param{
	private String a;
	private String b;
}

@Controller // @RESTController : @ResponseBody 없이도 json 형태로 배출해줌 ==> 4.x 부터
@Slf4j
public class AjaxController {
	private List<String> list = new ArrayList<String>();
	public AjaxController() {
		for(int i=1; i<=10; i++) {
			list.add("name" + i);
		}
	}
	
	@RequestMapping(value="/ajax", method=RequestMethod.GET)
	// jackson을 깔았기 때문에 @ResponseBody을 mapping함 (GSON이 해주던 걸)
//	public @ResponseBody Map<String, String> getAjax(@RequestParam Map<String, String> map){ // @RequestParam : 물음표에 있는 것과 반응
	public @ResponseBody List<String> getAjax(@RequestParam Map<String, String> map){
		// (@ModelAttribute Param map)도 가능
		// GET 방식 : RequestParam & ModelAttribute(생략 가능)만 쓸 수 있음
		log.debug("param=>{}", map);
		String searchName = map.get("searchName");
		
//		Map<String, String> rMap = new HashMap<String, String>();
		List<String> list = new ArrayList<String>();
		for(String str: this.list) {
			if(str.indexOf(searchName) != -1) {
				list.add(str);
			}
		}
//		rMap.put("greeting", "hello. jen");
//		return rMap;
		return list;
	}
	
	@RequestMapping(value="/ajax", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> postAjax(@RequestParam Map<String, String> map){
		log.debug("param=>{}", map);
		Map<String, String> rMap = new HashMap<String, String>();
		rMap.put("greeting", "hello. jen");
		return rMap;
	}
	
	@RequestMapping(value="/ajax/json", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> postJson(@RequestBody Map<String, String> map){
		log.debug("param=>{}", map);
		Map<String, String> rMap = new HashMap<String, String>();
		rMap.put("greeting", "hello. jen");
		return rMap;
	}
}
