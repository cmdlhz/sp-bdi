package com.sp.bdi.test.quiz_191129;

import java.util.HashMap;
import java.util.Map;

public class Test12 {
	public static void setMap(Map<String, String> map) {
		map = null;
	}
	public static void setMap2(Map<String, String> map) {
		map.put("test", "test");
	}
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		setMap(map);
		System.out.println(map);
		setMap2(map);
		System.out.println(map);
	}
}
