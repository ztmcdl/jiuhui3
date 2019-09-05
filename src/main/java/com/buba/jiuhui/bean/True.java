package com.buba.jiuhui.bean;

import java.sql.Date;

public class True {
    private int id;
    private String trueName;
    private String trueNum;
    private String newKehu;
    private String oldKehu;
    private String yixiangKehu;
    private String baofei;
    private Date huodongtime;
    private Date creattime;
private String shijishangbaoren;

    public String getShijishangbaoren() {
        return shijishangbaoren;
    }

    public void setShijishangbaoren(String shijishangbaoren) {
        this.shijishangbaoren = shijishangbaoren;
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

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getTrueNum() {
        return trueNum;
    }

    public void setTrueNum(String trueNum) {
        this.trueNum = trueNum;
    }

    public String getNewKehu() {
        return newKehu;
    }

    public void setNewKehu(String newKehu) {
        this.newKehu = newKehu;
    }

    public String getOldKehu() {
        return oldKehu;
    }

    public void setOldKehu(String oldKehu) {
        this.oldKehu = oldKehu;
    }

    public String getYixiangKehu() {
        return yixiangKehu;
    }

    public void setYixiangKehu(String yixiangKehu) {
        this.yixiangKehu = yixiangKehu;
    }

    public String getBaofei() {
        return baofei;
    }

    public void setBaofei(String baofei) {
        this.baofei = baofei;
    }

    public Date getHuodongtime() {
        return huodongtime;
    }

    public void setHuodongtime(Date huodongtime) {
        this.huodongtime = huodongtime;
    }
}
