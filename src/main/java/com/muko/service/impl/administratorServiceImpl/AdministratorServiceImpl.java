package com.muko.service.impl.administratorServiceImpl;

import com.muko.dao.AdministratorDao;
import com.muko.domain.Administrator;
import com.muko.service.administratorService.AdministratorService;
import com.muko.utils.PwEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ description:
 */
@Service("administratorService")
public class AdministratorServiceImpl implements AdministratorService {

    private AdministratorDao administratorDao;

    @Autowired
    public void setAdministratorDao(AdministratorDao administratorDao) {
        this.administratorDao = administratorDao;
    }

    @Override
    public Integer checkLogin(Administrator administrator) {
        System.out.println("Service业务层，查询");
        String newPw = PwEncryption.md5Ep(administrator.getAdmin_password());
        administrator.setAdmin_password(newPw);
        Integer result = administratorDao.findByAp(administrator);
        if (result == 1)
            return 1;
        else
            return 0;
    }

}
