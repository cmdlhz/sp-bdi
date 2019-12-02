package com.sp.bdi.test;

class Father{
	 public void test() {
		 System.out.println("test of Father");
	 }
}

public class Prototype {
	 public void test() {
		 System.out.println("test of Son");
	 }
	 public void test1() {
		 System.out.println("test of Son1");
	 }
	 public static void main(String[] args) {
		 Prototype p = new Prototype();
		 p.test(); 	// test of Son
		 p.test1();	// test of Son1
	 }
}
