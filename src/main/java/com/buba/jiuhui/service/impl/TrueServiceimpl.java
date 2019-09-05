package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.True;
import com.buba.jiuhui.dao.TrueDao;
import com.buba.jiuhui.service.TrueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrueServiceimpl implements TrueService {


@Autowired
    private TrueDao trueDao;

    @Override
    public int tianjiatrue(True true1) {
        return trueDao.tianjiatrue(true1);
    }
}
