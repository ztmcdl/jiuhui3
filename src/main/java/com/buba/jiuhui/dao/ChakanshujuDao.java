package com.buba.jiuhui.dao;

import com.buba.jiuhui.bean.Chakanshujub;

import java.util.List;

public interface ChakanshujuDao {

    List<Chakanshujub> findAll();

    List<Chakanshujub>findxianAll(Integer id);
}
