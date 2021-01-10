package com.muko.controller.administratorController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ description:
 */
@Controller
@RequestMapping("/administrator/pur_info_manage")
public class PurchaseController {
    PurchaseController() {
    }

    @RequestMapping("/main")
    public String toMain(){
        return "administrator/purchase_management";
    }

}
