package com.sp.bdi.test;

import lombok.Data;

@Data
public class Human {
	
	private String name;
	private Integer age;
	
	public Human() {
		System.out.println("When will I be generated?!"); // lazy loading
	}
}
