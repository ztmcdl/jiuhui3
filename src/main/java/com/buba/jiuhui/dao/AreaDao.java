package com.buba.jiuhui.dao;

import com.buba.jiuhui.bean.Area;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AreaDao {



    List<Area> getAllArea();


    int insertOne(@Param("name") String name, @Param("parentId")Integer parentId, @Param("code")String code);
}
