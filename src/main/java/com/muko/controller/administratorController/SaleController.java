package com.muko.controller.administratorController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ description:
 */
@Controller
@RequestMapping("/administrator/sale_info_manage")
public class SaleController {
    SaleController() {
    }

    @RequestMapping("/main")
    public String toMain(){
        return "administrator/sale_management";
    }

}
