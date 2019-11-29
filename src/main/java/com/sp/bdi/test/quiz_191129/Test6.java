package com.sp.bdi.test.quiz_191129;

public class Test6 {
	
	public static int num = 3;
	Test6(){
		num = 3;
	}
	
	public static void main(String[] args) {
		Test6 ts = new Test6();
		System.out.println(ts.num);
		
		ts.num = 10;
		ts = new Test6();
		System.out.println(ts.num);
		
		ts.num = 4;
		System.out.println(ts.num);
	}
}
