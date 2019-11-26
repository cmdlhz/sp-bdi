package com.sp.bdi.test4;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component // 메모리 생성
@Scope("prototype")
public class Monitor {
	private String name="LG 24";
	
	@Override
	public String toString() {
		return name;
	}
}
