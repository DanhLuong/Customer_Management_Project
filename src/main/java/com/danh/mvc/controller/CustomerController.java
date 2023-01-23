package com.danh.mvc.controller;


import com.danh.mvc.entity.Customer;
import com.danh.mvc.service.CustomerService;
import com.danh.mvc.utils.SortUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/list")
    public String helloCustomer(Model model, @RequestParam(required=false) String sort) {
        List<Customer> theCustomers = null;
        if(sort!=null) {
            int theSortField =Integer.parseInt(sort);
            theCustomers = customerService.getCustomers(theSortField);
        } else {
            theCustomers = customerService.getCustomers(SortUtils.LAST_NAME);
        }
        model.addAttribute("customers", theCustomers);
        return "list-customer";
    }
    @GetMapping("/showFormForAdd")
    public String showFromForAdd(Model model) {
        Customer theCustomer = new Customer();
        model.addAttribute("customer", theCustomer);
        return "customer-add-form";
    }
    @PostMapping("/saveCustomer")
    public String saveCustomer (@ModelAttribute("customer") Customer theCustomer) {
        customerService.saveCustomer(theCustomer);
        return "redirect:/customer/list";
    }
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId") int theId, Model model) {
        Customer theCustomer = customerService.getCustomer(theId);
        model.addAttribute("customer", theCustomer);
        return "customer-add-form";
    }
    @GetMapping("/delete")
    public String deleteCustomer(@RequestParam("customerId") int theId) {
        customerService.deleteCustomer(theId);
        return "redirect:/customer/list";
    }
    @GetMapping("/search")
    public String searchCustomer(@RequestParam("theSearchName") String theSearchName, Model model) {
        List<Customer> theCustomers = customerService.getCustomers(theSearchName);
        model.addAttribute("customers",theCustomers);
        return "list-customer";
    }
}
