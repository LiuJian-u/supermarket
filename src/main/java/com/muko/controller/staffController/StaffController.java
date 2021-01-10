package com.muko.controller.staffController;

import com.muko.domain.Staff;
import com.muko.service.staffService.StaffService;
import com.muko.vo.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @ description:
 */
@Controller
@RequestMapping("/staff")
public class StaffController {


    private StaffService staffService;

    @Autowired
    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }

    @RequestMapping("/addMember")
    public String addMember(Staff staff){
        staffService.addMember(staff);
        return "access";
    }

    @RequestMapping("/checkLogin")
    public String checkLogin(LoginVo loginVo, HttpServletRequest request){
        System.out.println("表现层，查询");
        if(staffService.checkLogin(loginVo) != 0){
            Staff staff = staffService.findStaffByAP(loginVo);
            request.setAttribute("login_user", staff);
            return "staffs/staff";
        }
        else {
            request.setAttribute("error_msg", "用户名或密码错误！");
            request.setAttribute("input_account", loginVo.getLogin_account());
        }
        return "index";
    }
}
