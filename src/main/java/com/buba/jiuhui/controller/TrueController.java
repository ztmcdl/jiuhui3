package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.True;
import com.buba.jiuhui.service.TrueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@RequestMapping("trues")
@Controller
public class TrueController {


    @Autowired
    private TrueService trueService;


    @ResponseBody
    @RequestMapping("tianjiatrue")
    public int tianjiatrue(True true1) {

        int tianjiatrue = trueService.tianjiatrue(true1);
        return tianjiatrue;
    }
}
