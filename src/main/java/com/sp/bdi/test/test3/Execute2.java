package com.sp.bdi.test.test3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Execute2 {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("ioc/ioc-3.xml");
		Cook c = new Cook();
		Food f = new Food();
//		c.setF(f);
		System.out.println(c.getF()); // Food(name=null, price=null) 위의 코드가 주석이면 null
	}
}
