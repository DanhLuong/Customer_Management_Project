package com.danh.mvc.service;

import com.danh.mvc.entity.Customer;

import java.util.List;

public interface CustomerService {

    void saveCustomer(Customer theCustomer);

    Customer getCustomer(int theId);

    void deleteCustomer(int theId);

    List<Customer> getCustomers(String theSearchName);

    List<Customer> getCustomers(int theSortField);
}
