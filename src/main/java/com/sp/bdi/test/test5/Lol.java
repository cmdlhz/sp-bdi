package com.sp.bdi.test.test5;

import org.springframework.stereotype.Component;

@Component("lol")
public class Lol implements Game {

	@Override
	public void on() {
		System.out.println("LOL on!");
	}

	@Override
	public void play() {
		System.out.println("LOL PLAY!");
	}

	@Override
	public void off() {
		System.out.println("LOL off!");
	}

}
