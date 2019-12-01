package com.sp.bdi.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AjaxControllerRepeat {
	private List<String> list = new ArrayList<String>();
	public AjaxControllerRepeat() {
		for(int i=1; i<=5; i++) {
			list.add("name" + i);
		}
	}
	
	@RequestMapping(value="/ajaxRepeat", method=RequestMethod.GET)
	public @ResponseBody List<String> getAjax(@RequestParam Map<String, String> map){
		log.debug("param=>{}", map);
		String search = map.get("search");
		List<String> list = new ArrayList<String>();
		for(String str: this.list) {
			if(str.indexOf(search) != -1) {
				list.add(str);
			}
		}
		return list;
	}
	
	@RequestMapping(value="/ajaxRepeat", method=RequestMethod.POST)
	public @ResponseBody List<String> postAjax(@RequestParam Map<String, String> map){
		log.debug("param=>{}", map);
		String search = map.get("search");
		if(list.indexOf(search) != -1) {
			list.add(search);
		}
		return list;
	}
}
























