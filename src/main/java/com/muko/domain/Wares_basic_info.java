package com.muko.domain;

import java.io.Serializable;

/**
 * @ description:
 */
public class Wares_basic_info implements Serializable {
    private String wbi_code;
    private String wbi_name;
    private String wbi_imgURL;
    private String wbi_pk_code;
    private String wbi_ct_code;

    @Override
    public String toString() {
        return "Wares_basic_info{" +
                "wbi_code='" + wbi_code + '\'' +
                ", wbi_name='" + wbi_name + '\'' +
                ", wbi_imgURL='" + wbi_imgURL + '\'' +
                ", wbi_pk_code='" + wbi_pk_code + '\'' +
                ", wbi_ct_code='" + wbi_ct_code + '\'' +
                '}';
    }

    public String getWbi_code() {
        return wbi_code;
    }

    public void setWbi_code(String wbi_code) {
        this.wbi_code = wbi_code;
    }

    public String getWbi_name() {
        return wbi_name;
    }

    public void setWbi_name(String wbi_name) {
        this.wbi_name = wbi_name;
    }

    public String getWbi_imgURL() {
        return wbi_imgURL;
    }

    public void setWbi_imgURL(String wbi_imgURL) {
        this.wbi_imgURL = wbi_imgURL;
    }

    public String getWbi_pk_code() {
        return wbi_pk_code;
    }

    public void setWbi_pk_code(String wbi_pk_code) {
        this.wbi_pk_code = wbi_pk_code;
    }

    public String getWbi_ct_code() {
        return wbi_ct_code;
    }

    public void setWbi_ct_code(String wbi_ct_code) {
        this.wbi_ct_code = wbi_ct_code;
    }
}
