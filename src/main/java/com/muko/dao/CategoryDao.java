package com.muko.dao;

import com.muko.domain.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ description:
 */
@Repository
public interface CategoryDao {
    List<String> findNameByLevel(Integer ct_level);

    List<String> findNameByUctName(String name);

    String findCodeByName(String name);

    String findNameByCode(String ct_code);

    List<Category> findAll();

    List<Category> findByCondition(Category category);

    Category findByCode(String ct_code);

    Integer findCountsByLevel(Integer ct_level);

    List<String> findCtNamesByLevel(Integer ct_level);

    void addRecord(Category category);

    void deleteByCode(String ct_code);

    void updateRecord(Category category);


}
