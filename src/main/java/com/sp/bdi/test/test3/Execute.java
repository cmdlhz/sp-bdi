package com.sp.bdi.test.test3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Execute {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("ioc/ioc-3.xml");
//		System.out.println(ac.getBean("food")); // No bean named 'food' is defined (ioc-3.xml에 아무것도 추가해주지 않으면
		Cook cook = (Cook)ac.getBean("cook");
		System.out.println(cook.getF()); // null
		// @Autowired를 java 파일에 
		// 넣어주면 자동으로 생성됨
	}
}
