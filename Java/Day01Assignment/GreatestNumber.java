package com.sonata;

public class GreatestNumber {

	public static void main(String[] args) {
		int num1=12;
		int num2=25;
		int num3=89;
		if(num1>num2  && num1>num3) {
			System.out.println("Largest number is :"+num1);
		}
		if(num2>num1  && num2>num3) {
			System.out.println("Largest number is :"+num2);
		}
		else
			System.out.println("Largest number is :"+num3);
	}

}
