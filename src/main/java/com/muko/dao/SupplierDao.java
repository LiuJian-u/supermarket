package com.muko.dao;

import com.muko.domain.Supplier;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ description:
 */
@Repository
public interface SupplierDao {
    void insertRecord(Supplier supplier);

    Integer findCountsByPrefix(String prefix);

    List<Supplier> findAll();

    List<Supplier> findByCondition(Supplier supplier);

    Supplier findByCode(String sup_code);

    void updateRecord(Supplier supplier);

    String findCtByCode(String sup_code);

    void deleteByCode(String sup_code);
}
