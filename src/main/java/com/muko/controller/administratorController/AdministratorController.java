package com.muko.controller.administratorController;

import com.muko.domain.Administrator;
import com.muko.service.administratorService.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ description:
 */
@Controller
@RequestMapping("/administrator")
public class AdministratorController {

    private AdministratorService administratorService;

    @Autowired
    public void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    /**
     * 系统管理员登录
     * @return 系统功能页面
     */
    @RequestMapping("/login")
    public String adminLogin() {
        return "administrator/function_choose";
    }

    /**
     * 登录检查
     * @param administrator 管理员用户
     * @param request 请求
     * @return 用户数
     */
    @RequestMapping("/checkLogin")
    public @ResponseBody
    Integer checkLogin(@RequestBody Administrator administrator, HttpServletRequest request) {
        Integer result = administratorService.checkLogin(administrator);
        if (result.equals(1)) {
            HttpSession session = request.getSession();
            session.setAttribute("login_user", administrator.getAdmin_account());
            System.out.println(session.getAttribute("login_user"));
        }
        return result;
    }

    /**
     * 返回主功能页面
     * @return 功能页面
     */
    @RequestMapping("/home")
    public String to_Home() {
        return "administrator/function_choose";
    }


}
