package com.muko.service.administratorService;

import com.muko.domain.Customer;
import com.muko.domain.Staff;
import com.muko.domain.Supplier;

import java.util.List;

/**
 * @ description:
 */

public interface PersonService {

//    public Integer checkLogin(Administrator administrator);

    List<Staff> findAllStaffs();

    List<Staff> findStaffsByCondition(Staff staffMsg);

    Staff addStaff(Staff staff);

    List<Staff> updateStaff(Staff staff);

    void removeStaffByS_code(String s_code);

    String resetStaffPassword(String s_code);

    List<String> findCategoryByLevel(Integer level);

    List<String> findSubCategoryByName(String name);

    String addSupplier(Supplier supplier);

    List<Supplier> findAllSuppliers();

    List<Supplier> findSuppliersByCondition(Supplier supplier);

    Supplier findSupplierByCode(String sup_code);

    String saveEditSupplier(Supplier supplier);

    String findInputCtNameByCode(String ct_code);

    String removeSupplierByCode(String sup_code);

    List<Customer> findAllCustomers();

    String addCustomer(Customer customer);

    List<Customer> findCustomersByCondition(Customer customer);

    Customer findCustomerByCode(String c_code);

    String removeCustomerByCode(String c_code);

    String saveEditCustomer(Customer customer);
}
