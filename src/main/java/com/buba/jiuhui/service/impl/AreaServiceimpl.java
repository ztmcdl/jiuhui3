package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.Area;
import com.buba.jiuhui.dao.AreaDao;
import com.buba.jiuhui.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceimpl implements AreaService {

    @Autowired
    private AreaDao areaDao;

    @Override
    public List<Area> getAllArea( ) {
        return areaDao.getAllArea();
    }

    @Override
    public int insertOne(String name, Integer parentId,String code) {
        return areaDao.insertOne(name,parentId,code);
    }

}
