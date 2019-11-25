package com.sp.bdi.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class Execute {
	public static void main(String[] args) {
//		Human h = new Human();
		FileSystemResource fsr = new FileSystemResource("src/main/resources/ioc/ioc-1.xml");
		// 파일 읽어들이기
		BeanFactory beanFactory = new XmlBeanFactory(fsr); // INFO : org.springframework.beans.factory.xml.XmlBeanDefinitionReader - Loading XML bean definitions from file [C:\Users\Administrator\eclipse-workspace\sp-bdi\src\main\resources\ioc\ioc-1.xml]
		
		// 해당 아이디를 호출할 때 메모리를 생성함
		// "When will I be generated?!"
//		System.out.println(beanFactory.getBean("h")); // Human(name=null, age=null)		만들지는 않았지만, 알고는 있다.
		Human h = (Human)beanFactory.getBean("h");
		System.out.println(h); // Human(name=null, age=null)
		
//		Human h2 = new Human();
//		Human h3 = new Human();
		
		// 앞에 생성이 되서 또 호출이 안 됨 ("When will I be generated?!" 안 찍힘)
		Human h4 = (Human)beanFactory.getBean("h"); // ***** singleton pattern
		
//		System.out.println(h2 == h3);	// false
//		System.out.println(h == h2);	// false
		System.out.println(h == h4);	// true (lazy loading 방식 / 아까 만들어진 걸 불러낼 뿐!)
		
		h4.setAge(50);
		System.out.println(h);	//	Human(name=null, age=50)
		
		// connection이 not null일 경우에만 session 생성
		// 
	}
}
