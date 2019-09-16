package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.Chakanshujub;
import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.service.ChakanshujuService;
import com.buba.jiuhui.utils.TemplateExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@RequestMapping("chakans")
@Controller
public class ChakanshujuController {

    @Autowired
    private ChakanshujuService chakanshujuService;



    @ResponseBody
    @RequestMapping("findAll")
    public List<Chakanshujub> findAll(String startTime,String endTime) {


        List<Chakanshujub> all = chakanshujuService.findAll(startTime,endTime);
        return all;


    }

    @ResponseBody
    @RequestMapping("findxianAll")
    public List<Chakanshujub> findxianAll(Integer id) {
        List<Chakanshujub> chakanshujubs = chakanshujuService.findxianAll(id);
        return chakanshujubs;


    }
    @ResponseBody
    @RequestMapping("findxianAll2")
    public List<Chakanshujub> findxianAll2(Integer id) {

        List<Chakanshujub> chakanshujubs = chakanshujuService.findxianAll2(id);
        return chakanshujubs;

    }

    @ResponseBody
    @RequestMapping("daochuExcel")
    public Boolean daochuExcel(Chakanshujub chakanshujub, HttpSession session) {
        boolean falg=true;
        String temp = "devicesTemp.xlsx";
        temp=session.getServletContext().getRealPath("/tamplate")+ File.separator+temp;
        String target="D:"+File.separator+"jiuhui"+File.separator+System.currentTimeMillis()+".xlsx";
        List<Chakanshujub> list = chakanshujuService.findAll2();
        User user= (User) session.getAttribute("user");
        String[] params=new String[2];
        params[0]=user.getUserName();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        params[1]=sdf.format(new Date());
        List<String> tlist=titleList();
        new TemplateExcelUtil().exportExcel(temp, target, params, tlist, list);
        return true;
    }


    private List<String> titleList() {
        List<String> list=new ArrayList<String>();
        list.add("userName");
        list.add("planNum");
        list.add("trueNum");
        list.add("newKehu");
        list.add("yixiangKehu");
        list.add("baofei");
        return list;
    }
}
