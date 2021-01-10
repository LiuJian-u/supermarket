package com.muko.domain;

import java.io.Serializable;

/**
 * @ description:
 */
public class Staff implements Serializable {
    private String s_code;
    private String s_account;
    private String s_password;
    private String s_name;
    private String s_sex;
    private String s_phone;
    private String s_post;
    private String s_imgURL;

    public Staff() {
    }

    public String getS_code() {
        return s_code;
    }

    public String getS_account() {
        return s_account;
    }

    public String getS_password() {
        return s_password;
    }

    public String getS_name() {
        return s_name;
    }

    public String getS_sex() {
        return s_sex;
    }

    public String getS_phone() {
        return s_phone;
    }

    public String getS_post() {
        return s_post;
    }

    public String getS_imgURL() {
        return s_imgURL;
    }

    public void setS_code(String s_code) {
        this.s_code = s_code;
    }

    public void setS_account(String s_account) {
        this.s_account = s_account;
    }

    public void setS_password(String s_password) {
        this.s_password = s_password;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public void setS_sex(String s_sex) {
        this.s_sex = s_sex;
    }

    public void setS_phone(String s_phone) {
        this.s_phone = s_phone;
    }

    public void setS_post(String s_post) {
        this.s_post = s_post;
    }

    public void setS_imgURL(String s_imgURL) {
        this.s_imgURL = s_imgURL;
    }



    @Override
    public String toString() {
        return "Staff{" +
                "s_code='" + s_code + '\'' +
                ", s_account='" + s_account + '\'' +
                ", s_password='" + s_password + '\'' +
                ", s_name='" + s_name + '\'' +
                ", s_sex='" + s_sex + '\'' +
                ", s_phone='" + s_phone + '\'' +
                ", s_post='" + s_post + '\'' +
                ", s_imgURL='" + s_imgURL + '\'' +
                '}';
    }
}
