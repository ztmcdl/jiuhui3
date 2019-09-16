package com.buba.jiuhui.service;

import com.buba.jiuhui.bean.Plan;

import java.util.List;

public interface PlanService {
    int tianjiaplan(Plan plan);
    List<Plan> findPlanAll(Integer id);
    List<Plan>findliebiao(Integer id);
    int xiugaizhungtai(Integer id);
}
