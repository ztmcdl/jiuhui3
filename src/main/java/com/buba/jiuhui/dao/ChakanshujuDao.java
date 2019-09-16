package com.buba.jiuhui.dao;

import com.buba.jiuhui.bean.Area;
import com.buba.jiuhui.bean.Chakanshujub;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChakanshujuDao {

    List<Chakanshujub> findAll(@Param("startTime") String startTime, @Param("endTime")String endTime);

    List<Chakanshujub>findxianAll(Integer id);
    List<Chakanshujub>findxianAll2(Integer id);

    public Boolean daochuExcel(Chakanshujub chakanshujub);
    List<Chakanshujub> findAll2();
}
