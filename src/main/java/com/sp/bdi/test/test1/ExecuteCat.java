package com.sp.bdi.test.test1;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class ExecuteCat {
	public static void main(String[] args) {
		FileSystemResource fsr = new FileSystemResource("src/main/resources/ioc/ioc-1.xml");
		BeanFactory beanFactory = new XmlBeanFactory(fsr); // INFO : org.springframework.beans.factory.xml.XmlBeanDefinitionReader - Loading XML bean definitions from file [C:\Users\Administrator\eclipse-workspace\sp-bdi\src\main\resources\ioc\ioc-1.xml]
		
		// "When will I be generated?!" 출력 안 됨 (Human은 호출 안 했으니까)
		
		Cat c = (Cat)beanFactory.getBean("c");	// like "onloadstartup" (해당 servlet 요청 안 하면 안 불러드림)
//		System.out.println(c);
		
		List<Cat> catList = new ArrayList<Cat>();
		catList.add(c);
		catList.add(c);
		catList.add(c);
//		c.setAge(20); // [Cat(name=null, age=20), Cat(name=null, age=20), Cat(name=null, age=20)]
		c = null; // [Cat(name=null, age=null), Cat(name=null, age=null), Cat(name=null, age=null)]
		
		/*
		 * call by reference vs call by value (Java는 둘 다!)
		 */
		
		System.out.println(catList);  
	}
}

// lazy loading : 호출될 때만 data 불러들임
// Singleton : 한 번 메모리 생성 다시 하지 않는다 
