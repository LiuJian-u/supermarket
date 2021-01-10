package com.muko.vo;

import java.io.Serializable;

/**
 * @ description:
 */
public class LoginVo implements Serializable {


    private String login_account;
    private String login_password;

    public String getLogin_account() {
        return login_account;
    }

    public void setLogin_account(String login_account) {
        this.login_account = login_account;
    }

    public String getLogin_password() {
        return login_password;
    }

    public void setLogin_password(String login_password) {
        this.login_password = login_password;
    }

}
