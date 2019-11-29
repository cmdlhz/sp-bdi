package com.sp.bdi.test.quiz_191129;

import java.util.Scanner;

public class Test18_19 {
	public static void main(String[] args) {
		System.out.println("입력한 값에서 'test'라는 값이 몇개가 있는지 알려줍니다.");
		Scanner s = new Scanner(System.in);
		String str = s.nextLine();
		s.close();
		
		int cnt = 0;
		while(str.indexOf("test") != -1) {
			str = str.substring(str.indexOf("test") + 3);
			cnt++;
		}
		System.out.println(cnt);
	}
}
