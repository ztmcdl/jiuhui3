package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.Area;

import java.util.List;

public interface AreaService {
    List<Area> getAllArea();

    int insertOne(String name, Integer parentId,String code);
}
