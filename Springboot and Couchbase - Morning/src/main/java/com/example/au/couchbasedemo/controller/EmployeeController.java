package com.example.au.couchbasedemo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.example.au.couchbasedemo.model.Employee;
import com.example.au.couchbasedemo.repository.employeeRepository;

@RestController
public class EmployeeController {
    
    @Autowired
    employeeRepository EmployeeRepository;
    
	/*
	 * @RequestMapping("/") public String index() { return
	 * "Welcome to the CRUD application!!"; }
	 */
    
    @PostMapping("/employee")
    public Employee addBlogPost(@RequestBody Employee newEmployee) {
        return EmployeeRepository.save(newEmployee);
    }
    
    @GetMapping("/employee/{Pin}")
    public Employee getEmployeeByPin(@PathVariable String Pin) {
        return EmployeeRepository.findByPin(Pin);
    }
    @GetMapping("/employee/location/{location}")
    public Employee getEmployeeByLocation(@PathVariable String location) {
    	return EmployeeRepository.findByLocation(location);
    }
}