package com.muko.domain;

import java.io.Serializable;

/**
 * @ description:
 */
public class Packing implements Serializable {
    private String pk_code;
    private String pk_unit;
    private Integer pk_level;
    private Integer pk_num;
    private String upk_code;

    @Override
    public String toString() {
        return "Packing{" +
                "pk_code='" + pk_code + '\'' +
                ", pk_unit='" + pk_unit + '\'' +
                ", pk_level=" + pk_level +
                ", pk_num=" + pk_num +
                ", upk_code='" + upk_code + '\'' +
                '}';
    }

    public String getPk_code() {
        return pk_code;
    }

    public void setPk_code(String pk_code) {
        this.pk_code = pk_code;
    }

    public String getPk_unit() {
        return pk_unit;
    }

    public void setPk_unit(String pk_unit) {
        this.pk_unit = pk_unit;
    }

    public Integer getPk_level() {
        return pk_level;
    }

    public void setPk_level(Integer pk_level) {
        this.pk_level = pk_level;
    }

    public Integer getPk_num() {
        return pk_num;
    }

    public void setPk_num(Integer pk_num) {
        this.pk_num = pk_num;
    }

    public String getUpk_code() {
        return upk_code;
    }

    public void setUpk_code(String upk_code) {
        this.upk_code = upk_code;
    }
}
