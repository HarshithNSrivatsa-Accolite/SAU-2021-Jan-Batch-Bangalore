package com.example.au.couchbasedemo.repository;



import org.springframework.data.repository.CrudRepository;

import com.example.au.couchbasedemo.model.Employee;

public interface employeeRepository extends CrudRepository<Employee, String> {
	
	Employee findByPin(String pin);
	Employee findByLocation(String location);
	
	   
}