package com.muko.dao;

import com.muko.domain.Packing;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ description:
 */
@Repository
public interface PackingDao {
    List<String> findUtilsByLevel(Integer pk_level);
    void addRecord(Packing packing);
    List<Packing> findAll();
    Packing findByCode(String pk_code);
    Integer findCountsByLevel(Integer pk_level);
    String findCodeByUnit(@Param("pk_unit") String pk_unit, @Param("pk_level") Integer pk_level);
    void deleteByCode(String pk_code);
    List<Packing> findByCondition(Packing packing);
    void updateEdit(Packing packing);
}
