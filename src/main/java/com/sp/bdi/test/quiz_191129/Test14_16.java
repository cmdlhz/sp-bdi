package com.sp.bdi.test.quiz_191129;

import java.util.ArrayList;

class ArrayExam {
	private ArrayList list;
	ArrayExam(){
		list = new ArrayList();
	}
	public ArrayList getArrayList(int a, int b) {
		return list;
	}
}

public class Test14_16 {
	public static void main(String[] args) {
		ArrayExam ae = new ArrayExam();
		ArrayList al = ae.getArrayList(0, 0);
		for(int i=0; i<10; i++) {
			al.add(i);
		}
		System.out.println(al);
	}
}
