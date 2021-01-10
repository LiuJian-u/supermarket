package com.muko.domain;

import java.io.Serializable;

/**
 * @ description: 供货商
 */
public class Supplier implements Serializable {
    private String sup_code;
    private String sup_name;
    private String sup_shop_name;
    private String sup_phone;
    private String sup_category;
    private String sup_address;

    public String getSup_code() {
        return sup_code;
    }

    public void setSup_code(String sup_code) {
        this.sup_code = sup_code;
    }

    public String getSup_name() {
        return sup_name;
    }

    public void setSup_name(String sup_name) {
        this.sup_name = sup_name;
    }

    public String getSup_shop_name() {
        return sup_shop_name;
    }

    public void setSup_shop_name(String sup_shop_name) {
        this.sup_shop_name = sup_shop_name;
    }

    public String getSup_phone() {
        return sup_phone;
    }

    public void setSup_phone(String sup_phone) {
        this.sup_phone = sup_phone;
    }

    public String getSup_category() {
        return sup_category;
    }

    public void setSup_category(String sup_category) {
        this.sup_category = sup_category;
    }

    public String getSup_address() {
        return sup_address;
    }

    public void setSup_address(String sup_address) {
        this.sup_address = sup_address;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "sup_code='" + sup_code + '\'' +
                ", sup_name='" + sup_name + '\'' +
                ", sup_shop_name='" + sup_shop_name + '\'' +
                ", sup_phone='" + sup_phone + '\'' +
                ", sup_category='" + sup_category + '\'' +
                ", sup_address='" + sup_address + '\'' +
                '}';
    }
}
