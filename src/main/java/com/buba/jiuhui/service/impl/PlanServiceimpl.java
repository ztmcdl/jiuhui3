package com.buba.jiuhui.service.impl;

import com.buba.jiuhui.bean.Plan;
import com.buba.jiuhui.dao.PlanDao;
import com.buba.jiuhui.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlanServiceimpl implements PlanService {

@Autowired
    private PlanDao planDao;

    @Override
    public int tianjiaplan(Plan plan) {
        return planDao.tianjiaplan(plan);
    }

    @Override
    public List<Plan> findPlanAll() {
        return planDao.findPlanAll();
    }

    @Override
    public List<Plan> findliebiao() {
        return planDao.findliebiao();
    }

    @Override
    public int xiugaizhungtai(Integer id) {
        return planDao.xiugaizhungtai(id);
    }
}
