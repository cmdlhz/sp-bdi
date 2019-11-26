package com.sp.bdi.test.test5;

import org.springframework.stereotype.Component;

@Component("star")
public class Star implements Game {

	@Override
	public void on() {
		System.out.println("Star on!");
	}

	@Override
	public void play() {
		System.out.println("Star PLAY!");
	}

	@Override
	public void off() {
		System.out.println("Star off!");
	}

}
