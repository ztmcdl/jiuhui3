package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.Plan;
import com.buba.jiuhui.bean.User;
import org.apache.ibatis.annotations.Param;


public interface UserService {
    User login(String userCode,String password);


}
