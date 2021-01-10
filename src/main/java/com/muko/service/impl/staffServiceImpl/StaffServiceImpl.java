package com.muko.service.impl.staffServiceImpl;

import com.muko.dao.StaffDao;
import com.muko.domain.Staff;
import com.muko.service.staffService.StaffService;
import com.muko.vo.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ description:
 */
@Service("staffService")
public class StaffServiceImpl implements StaffService {



    private StaffDao staffDao;

    @Autowired
    public void setStaffDao(StaffDao staffDao) {
        this.staffDao = staffDao;
    }

    @Override
    public void addMember(Staff staff) {
        staffDao.insertStaff(staff);
    }

    @Override
    public List<Staff> findAllStaff() {
        return staffDao.findAll();
    }

    @Override
    public Integer checkLogin(LoginVo loginVo) {
        return staffDao.checkLogin(loginVo);
    }

    @Override
    public Staff findStaffByAP(LoginVo loginVo) {
        return staffDao.findStaffByAP(loginVo);
    }
}
