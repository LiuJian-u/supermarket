package com.muko.test;

import com.muko.service.administratorService.PersonService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @ description:
 */
public class TestSpring {

    @Test
    public void run1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        PersonService as = (PersonService) ac.getBean("administratorService");
//        as.checkLogin();
    }


}
