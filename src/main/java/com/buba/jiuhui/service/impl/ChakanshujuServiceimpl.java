package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.Chakanshujub;
import com.buba.jiuhui.dao.ChakanshujuDao;
import com.buba.jiuhui.service.ChakanshujuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChakanshujuServiceimpl implements ChakanshujuService {
    @Autowired
    private ChakanshujuDao chakanshujuDao;

    @Override
    public List<Chakanshujub> findAll() {
        return chakanshujuDao.findAll();
    }

    @Override
    public List<Chakanshujub> findxianAll(Integer id) {
        return chakanshujuDao.findxianAll(id);
    }
}
