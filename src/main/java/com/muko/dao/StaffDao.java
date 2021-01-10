package com.muko.dao;

import com.muko.domain.Staff;
import com.muko.vo.LoginVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ description:
 */
@Repository
public interface StaffDao {

    public void insertStaff(Staff staff);

    public List<Staff> findAll();

    public List<Staff> findByCondition(Staff staffMsg);

    public Staff findStaffByAP(LoginVo loginVo);

    public Integer checkLogin(LoginVo loginvo);

    public Integer findCountsByPrefix(String prefix);

    public Staff findStaffByS_code(String s_code);

    public String findS_postByS_code(String s_code);

    public void deleteStaffByS_code(String s_code);

    public void updateStaff(Staff staff);

    public void updateStaffPwByS_code(@Param("s_code") String s_code, @Param("s_password") String password);


}
