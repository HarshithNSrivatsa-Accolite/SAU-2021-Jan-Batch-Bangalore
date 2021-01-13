package com.example.au.couchbasedemo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.couchbase.core.mapping.Document;

import net.bytebuddy.asm.Advice.Return;

@Document
public class Employee {
	
	@Id
	private String Emp_Id;
	private String Emp_Name;
	private String address;
	private String pin;
	private String location;
	public Employee(String eId, String eName, String address,String pin,String location) {
		this.Emp_Id = eId;
		this.Emp_Name = eName;
		this.address = address;
		this.pin=pin;
		this.location=location;
	}

	public String getEmpId() {
		return Emp_Id;
	}

	public void setEmpId(String eId) {
		this.Emp_Id = eId;
	}

	public String getEmpName() {
		return Emp_Name;
	}

	public void setEmpName(String eName) {
		this.Emp_Name = eName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public String getPin() {
		return pin; 
	}
	public void setPin(String pin) {
		this.pin=pin;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location=location;
	}
	
	

}
