package com.muko.domain;

import java.io.Serializable;

/**
 * @ description:
 */
public class Customer implements Serializable {
    private String c_code;
    private String c_name;
    private String c_phone;
    private Integer c_point;

    public String getC_code() {
        return c_code;
    }

    public void setC_code(String c_code) {
        this.c_code = c_code;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_phone() {
        return c_phone;
    }

    public void setC_phone(String c_phone) {
        this.c_phone = c_phone;
    }

    public Integer getC_point() {
        return c_point;
    }

    public void setC_point(Integer c_point) {
        this.c_point = c_point;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "c_code='" + c_code + '\'' +
                ", c_name='" + c_name + '\'' +
                ", c_phone='" + c_phone + '\'' +
                ", c_point=" + c_point +
                '}';
    }
}
