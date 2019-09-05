package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.bean.Yonghuguanli;

import java.util.List;

public interface YonghuguanliService {

    List<Yonghuguanli> findAllyonghu();

    List<Yonghuguanli>finaAllzhanshiyonghu(Integer id);


    int insertuser( String userName,Integer pId, String userCode,String password,String level);
    List<User>chaxunlevel(Integer id);
}
