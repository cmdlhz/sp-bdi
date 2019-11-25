package com.sp.bdi.test.test2;

public class CarMaker {
	private String carMakerName;
	private Car car;
	
	public CarMaker(String carMakerName) {
		this.carMakerName = carMakerName;
	}
	
	public void setCar(Car car) {
		this.car = car;
	}
	
	public Car makeCar() {
		System.out.println(this.carMakerName + " makes cars.");
		return this.car;
	}
	
	@Override
	public String toString() {
		return "CarMaker [carMakerName=" + carMakerName + ", car=" + car + "]";
	}
}
