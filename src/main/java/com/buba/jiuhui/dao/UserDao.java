package com.buba.jiuhui.dao;


import com.buba.jiuhui.bean.User;
import org.apache.ibatis.annotations.Param;


public interface UserDao {
    /*用户登录*/
    User login(@Param("userCode") String userCode,@Param("password") String password);
}
