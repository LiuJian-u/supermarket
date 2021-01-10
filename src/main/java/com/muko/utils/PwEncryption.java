package com.muko.utils;

import java.security.MessageDigest;

/**
 * @ description:
 */
public class PwEncryption {


    public static String md5Ep(String password){
        String newPw;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(password.getBytes());
            byte[] b = md5.digest();
            int i;
            StringBuilder sb = new StringBuilder();
            for (byte value : b) {
                i = value;
                if (i < 0)
                    i += 256;
                if (i < 16)
                    sb.append("0");
                sb.append(Integer.toHexString(i));
            }
            newPw = sb.toString();
        } catch (Exception e){
            throw new RuntimeException("MD5加密时异常");
        }
        return newPw;
    }
}
