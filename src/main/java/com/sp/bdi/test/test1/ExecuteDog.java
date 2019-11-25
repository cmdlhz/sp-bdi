package com.sp.bdi.test.test1;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class ExecuteDog {
	public static void main(String[] args) {
		FileSystemResource fsr = new FileSystemResource("src/main/resources/ioc/ioc-2.xml");
		BeanFactory bf = new XmlBeanFactory(fsr);
		Dog d = (Dog)bf.getBean("d");
		
		List<Dog> dogList = new ArrayList<Dog>();
		dogList.add(d);
		dogList.add(d);
		dogList.add(d);
		System.out.println(dogList); // [Dog(name=null, age=null), Dog(name=null, age=null), Dog(name=null, age=null)]
	}
}
