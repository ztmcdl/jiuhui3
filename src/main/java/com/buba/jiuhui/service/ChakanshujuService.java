package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.Chakanshujub;

import java.util.List;

public interface ChakanshujuService {

    List<Chakanshujub> findAll();


    List<Chakanshujub>findxianAll(Integer id);
}
