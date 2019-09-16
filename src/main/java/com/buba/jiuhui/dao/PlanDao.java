package com.buba.jiuhui.dao;

import com.buba.jiuhui.bean.Plan;

import java.util.List;

public interface PlanDao {
    /*添加计划数据*/
    int tianjiaplan(Plan plan);
    /*查询预报数据*/
    List<Plan>findPlanAll(Integer id);
    /*查询为上报的数据*/
    List<Plan>findliebiao(Integer id);
    /*修改上报数据的状态*/
    int xiugaizhungtai(Integer id);



}
