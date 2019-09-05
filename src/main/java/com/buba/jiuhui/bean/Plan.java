package com.buba.jiuhui.bean;

import java.sql.Date;

public class Plan {


    private int id;
    private String planName;
    private String planNum;
    private Date startTime;
    private Date endTime;
    private String planDis;
    private Date creattime;
    private String sahngbaoren;

    public String getSahngbaoren() {
        return sahngbaoren;
    }

    public void setSahngbaoren(String sahngbaoren) {
        this.sahngbaoren = sahngbaoren;
    }

    public Date getCreattime() {
        return creattime;
    }

    public void setCreattime(Date creattime) {
        this.creattime = creattime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public String getPlanNum() {
        return planNum;
    }

    public void setPlanNum(String planNum) {
        this.planNum = planNum;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getPlanDis() {
        return planDis;
    }

    public void setPlanDis(String planDis) {
        this.planDis = planDis;
    }
}
