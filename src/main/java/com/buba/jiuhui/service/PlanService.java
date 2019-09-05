package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.Plan;

import java.util.List;

public interface PlanService {
    int tianjiaplan(Plan plan);
    List<Plan> findPlanAll();
    List<Plan>findliebiao();
    int xiugaizhungtai(Integer id);
}
