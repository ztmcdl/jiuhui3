package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.Chakanshujub;

import java.util.List;

public interface ChakanshujuService {

    List<Chakanshujub> findAll(String startTime,String endTime);


    List<Chakanshujub>findxianAll(Integer id);

    List<Chakanshujub>findxianAll2(Integer id);

    public Boolean daochuExcel(Chakanshujub chakanshujub);

    List<Chakanshujub> findAll2();
}
