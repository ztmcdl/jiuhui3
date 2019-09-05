package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.Pictures;
import com.buba.jiuhui.dao.PicDao;
import com.buba.jiuhui.dao.PlanDao;
import com.buba.jiuhui.service.PicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PicServiceimpl implements PicService {
@Autowired
private PicDao picDao;
    public int uploadFiles(List<Pictures> list) {
        int  i= 1;
        for (Pictures pictures : list) {
            picDao.uploadFiles(pictures);
            i++;
        }
        return i;
    }
}
