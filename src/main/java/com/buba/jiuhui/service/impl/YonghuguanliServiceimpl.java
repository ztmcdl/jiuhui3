package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.bean.Yonghuguanli;
import com.buba.jiuhui.dao.YonghuguanliDao;
import com.buba.jiuhui.service.YonghuguanliService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YonghuguanliServiceimpl implements YonghuguanliService {

    @Autowired
    private YonghuguanliDao yonghuguanliDao;


    @Override
    public List<Yonghuguanli> findAllyonghu() {
        return yonghuguanliDao.findAllyonghu();
    }

    @Override
    public List<Yonghuguanli> finaAllzhanshiyonghu(Integer id) {
        return yonghuguanliDao.finaAllzhanshiyonghu(id);
    }

    @Override
    public int insertuser(String userName, Integer pId, String userCode, String password,String level) {
        return yonghuguanliDao.insertuser(userName,pId,userCode,password,level);
    }

    @Override
    public List<User> chaxunlevel(Integer id) {
        return yonghuguanliDao.chaxunlevel(id);
    }
}
