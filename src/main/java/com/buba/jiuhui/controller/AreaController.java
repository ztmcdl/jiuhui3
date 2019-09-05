package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.Area;
import com.buba.jiuhui.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@RequestMapping("areas")
@Controller
public class AreaController {

    @Autowired
    private AreaService areaService;
@RequestMapping("getAllArea")
@ResponseBody
    public List<Area> getAllArea() {

    List<Area> allArea = areaService.getAllArea();
    return allArea;

}

    @ResponseBody
    @RequestMapping("insertOne")
    public int insertOne(String name, Integer parentId,String code) {

        int i = areaService.insertOne(name,parentId,code);
        return i;
    }
}
