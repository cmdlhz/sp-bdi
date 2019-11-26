package com.sp.bdi.test.test3;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component("pasta")
@Data
public class Pasta extends Food {
	private String name;
	private Integer price;
}
