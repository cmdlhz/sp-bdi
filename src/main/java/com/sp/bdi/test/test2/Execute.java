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
		Car car = cm.makeCar();
//		cm.setCar(c);
		System.out.println(car); // Car(carName=Sonata, price=null)
		Car car2 = (Car)ac.getBean("car1");
		System.out.println(car == car2); // true(scope="prototype" 이라고 하지 않으면 매번 같은 메모리 생성) vs false(scope="prototype" 이라고 하면)
	}
}
