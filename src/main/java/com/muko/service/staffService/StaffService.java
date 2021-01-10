package com.muko.service.staffService;

import com.muko.domain.Staff;
import com.muko.vo.LoginVo;

import java.util.List;

/**
 * @ description:
 */
public interface StaffService {

    public void addMember(Staff staff);
    public List<Staff> findAllStaff();
    public Integer checkLogin(LoginVo loginVo);
    public Staff findStaffByAP(LoginVo loginVo);
}
