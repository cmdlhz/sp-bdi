package com.sp.bdi.test.test2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Execute {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("ioc/ioc-car.xml");
//		Car c = (Car)ac.getBean("car");
//		System.out.println(c); // Car(carName=Sonata, price=null)
		
		CarMaker cm = (CarMaker)ac.getBean("carMaker");
		System.out.println(cm); // CarMaker [carMakerName=Ford, car=null]
		
//		cm.setCar(c);
		System.out.println(cm.makeCar()); // Car(carName=Sonata, price=null)
	}
}
