package com.muko.dao;

import com.muko.domain.Administrator;
import org.springframework.stereotype.Repository;

/**
 * @ description: 系统管理员dao接口
 */
@Repository
public interface AdministratorDao {

    /**
     * 查询账户信息
     * @return
     */
//    @Select("select count(*) from administrator where admin_account=#{admin_account} and admin_password=#{admin_password}")
    public Integer findByAp(Administrator administrator);
}
