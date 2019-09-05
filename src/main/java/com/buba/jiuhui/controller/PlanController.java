package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.Plan;
import com.buba.jiuhui.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("plans")
@Controller
public class PlanController {
@Autowired
    private PlanService planService;

    @RequestMapping("tianjiaplan")
    @ResponseBody
    public int tianjiaplan(Plan plan) {

        int tianjiaplan = planService.tianjiaplan(plan);
        return tianjiaplan;

    }



    @ResponseBody
    @RequestMapping("findPlanAll")
    public List<Plan> findPlanAll() {

        List<Plan> planAll = planService.findPlanAll();
        return planAll;
    }

    @ResponseBody
    @RequestMapping("findliebiao")
    public List<Plan> findliebiao() {

        List<Plan> findliebiao = planService.findliebiao();
        return findliebiao;



    }
    @ResponseBody
    @RequestMapping("xiugaizhungtai")
    public int xiugaizhungtai(Integer id) {
        int xiugaizhungtai = planService.xiugaizhungtai(id);
        return xiugaizhungtai;


    }
}
