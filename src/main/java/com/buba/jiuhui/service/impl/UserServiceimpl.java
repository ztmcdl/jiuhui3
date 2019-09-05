package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.dao.UserDao;
import com.buba.jiuhui.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceimpl implements UserService {
    @Autowired
    private UserDao userDao;


    @Override
    public User login(String userCode, String password) {
        return userDao.login(userCode,password);
    }
}
