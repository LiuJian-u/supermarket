package com.muko.dao;

import com.muko.domain.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ description:
 */
@Repository
public interface CustomerDao {
    List<Customer> findAll();
    void addRecord(Customer customer);
    List<Customer> findByCondition(Customer customer);
    Customer findByCode(String c_code);
    void deleteByCode(String c_code);
    void updateRecord(Customer customer);
}
