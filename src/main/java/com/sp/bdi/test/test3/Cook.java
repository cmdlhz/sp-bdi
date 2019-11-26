package com.sp.bdi.test.test3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("cook")
public class Cook {
	private Food f;

	public Food getF() {
		return f;
	}
	
	@Qualifier("pasta") // Food라고 부를 수 있는 게 한 개 이상일 경우 명시해줘야 함
	@Autowired
	public void setF(Food f) {
		this.f = f;
	}
	
}
