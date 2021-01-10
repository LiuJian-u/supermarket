package com.muko.domain;

import java.io.Serializable;

/**
 * @ description:
 */
public class Administrator implements Serializable {
    private String admin_account;
    private String admin_password;
    private String login_session;

    public String getLogin_session() {
        return login_session;
    }

    public void setLogin_session(String login_session) {
        this.login_session = login_session;
    }

    public String getAdmin_account() {
        return admin_account;
    }

    public void setAdmin_account(String admin_account) {
        this.admin_account = admin_account;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    @Override
    public String toString() {
        return "Administrator{" +
                "admin_account='" + admin_account + '\'' +
                ", admin_password='" + admin_password + '\'' +
                '}';
    }
}
