package com.sp.bdi.test.test3;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component("food")
@Data
public class Food {
//	public Food(String name) {
//		this.name = name;
//	}
	
	private String name;
	private Integer price;
}
