package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.bean.Yonghuguanli;
import com.buba.jiuhui.service.YonghuguanliService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@RequestMapping("yonghus")
@Controller
public class YonghuguanliController {

    @Autowired
    private YonghuguanliService yonghuguanliService;



    @RequestMapping("findAllyonghu")
    @ResponseBody
    public List<Yonghuguanli> findAllyonghu() {

        List<Yonghuguanli> allyonghu = yonghuguanliService.findAllyonghu();
        return allyonghu;

    }

    @RequestMapping("finaAllzhanshiyonghu")
    @ResponseBody
    public List<Yonghuguanli> finaAllzhanshiyonghu(Integer id) {

        List<Yonghuguanli> yonghuguanlis = yonghuguanliService.finaAllzhanshiyonghu(id);
        return yonghuguanlis;
    }

    @RequestMapping("insertuser")
    @ResponseBody
    public int insertuser(String userName, Integer pId, String userCode, String password,String level) {

        int insertuser = yonghuguanliService.insertuser(userName, pId, userCode, password,level);
        return insertuser;

    }

    @RequestMapping("chaxunlevel")
    @ResponseBody
    public List<User> chaxunlevel(Integer id) {
        List<User> chaxunlevel = yonghuguanliService.chaxunlevel(id);
        return chaxunlevel;

    }
}
