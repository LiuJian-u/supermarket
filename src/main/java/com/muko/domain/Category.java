package com.muko.domain;

import java.io.Serializable;

/**
 * @ description:
 */
public class Category implements Serializable {
    private String ct_code;
    private String ct_name;
    private Integer ct_level;
    private String uct_code;

    public String getCt_code() {
        return ct_code;
    }

    public void setCt_code(String ct_code) {
        this.ct_code = ct_code;
    }

    public String getCt_name() {
        return ct_name;
    }

    public void setCt_name(String ct_name) {
        this.ct_name = ct_name;
    }

    public Integer getCt_level() {
        return ct_level;
    }

    public void setCt_level(Integer ct_level) {
        this.ct_level = ct_level;
    }

    public String getUct_code() {
        return uct_code;
    }

    public void setUct_code(String uct_code) {
        this.uct_code = uct_code;
    }

    @Override
    public String toString() {
        return "Category{" +
                "ct_code='" + ct_code + '\'' +
                ", ct_name='" + ct_name + '\'' +
                ", ct_level=" + ct_level +
                ", uct_code='" + uct_code + '\'' +
                '}';
    }
}
