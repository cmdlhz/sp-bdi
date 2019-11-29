package com.sp.bdi.test.quiz_191129;

import java.util.Scanner;

public class Test7_9 {
	public static void main(String[] args) {
		System.out.println("구구단 계산을 위한 숫자를 입력해주세요.");
		Scanner scan = new Scanner(System.in);
		int dan = scan.nextInt();
		String danStr = "";
		
		for(int i=1; i<=9; i++) {
			danStr += dan + " x " + i + " = " + (dan * i) + ",";
		}
		danStr = danStr.substring(0, danStr.length() - 1);
		System.out.println(danStr);
	}
}
