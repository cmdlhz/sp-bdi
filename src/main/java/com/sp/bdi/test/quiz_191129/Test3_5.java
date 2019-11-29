package com.sp.bdi.test.quiz_191129;

import java.util.Random;
import java.util.Scanner;

public class Test3_5 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Random r = new Random();
		int rNum = r.nextInt(10) + 1;
		System.out.println("숫자를 맞춰주세요");

		int num = 0;
		while(rNum != num){
			String numStr = scan.next();
			num = Integer.parseInt(numStr);
			if(rNum == num){
				System.out.println("Correct!");
			} else { 
				System.out.println("Please enter a number again.");
			}
		}
	}
}
