package com.java.pojo;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * description:添加房源实体类
 * author:丁鹏
 * time:2019/12/517:24
 */
public class House {
    private String houseID;//房子id

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = ".{2,40}",message = "*格式错误!")
    private String xiaoQuMing;//小区名

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9]\\d*",message = "*格式错误!")
    private String ownerId;//房东ID

    private String yuanGongID;//业务员ID

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9a-zA-Z][0-9a-zA-Z]*",message = "*格式错误!")
    private String dong;//栋

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9]\\d*",message = "*格式错误!")
    private String danYuan;//单元

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9a-zA-Z][0-9a-zA-Z]*",message = "*格式错误!")
    private String fangHao;//房号

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9]",message = "*格式错误!")
    private String shi;//室

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d",message = "*格式错误!")
    private String ting;//厅

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d",message = "*格式错误!")
    private String chu;//厨

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d",message = "*格式错误!")
    private String wei;//卫

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9]\\d*|0",message = "*格式错误!")
    private String mianJi;//面积

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = ".{0,}",message = "*格式错误!")
    private String xiangQing;//详情

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d{4}(\\-|\\/|\\.)\\d{1,2}\\1\\d{1,2}",message = "*格式错误!")
    private String tuoGuanBegin;//托管开始时间

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d{4}(\\-|\\/|\\.)\\d{1,2}\\1\\d{1,2}",message = "*格式错误!")
    private String tuoGuanEnd;//托管结束时间

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9]\\d*|0",message = "*格式错误!")
    private String shouFangMoney;//托管金额

    public String getHouseID() {
        return houseID;
    }

    public void setHouseID(String houseID) {
        this.houseID = houseID;
    }

    public String getXiaoQuMing() {
        return xiaoQuMing;
    }

    public void setXiaoQuMing(String xiaoQuMing) {
        this.xiaoQuMing = xiaoQuMing;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getYuanGongID() {
        return yuanGongID;
    }

    public void setYuanGongID(String yuanGongID) {
        this.yuanGongID = yuanGongID;
    }

    public String getDong() {
        return dong;
    }

    public void setDong(String dong) {
        this.dong = dong;
    }

    public String getDanYuan() {
        return danYuan;
    }

    public void setDanYuan(String danYuan) {
        this.danYuan = danYuan;
    }

    public String getFangHao() {
        return fangHao;
    }

    public void setFangHao(String fangHao) {
        this.fangHao = fangHao;
    }

    public String getShi() {
        return shi;
    }

    public void setShi(String shi) {
        this.shi = shi;
    }

    public String getTing() {
        return ting;
    }

    public void setTing(String ting) {
        this.ting = ting;
    }

    public String getChu() {
        return chu;
    }

    public void setChu(String chu) {
        this.chu = chu;
    }

    public String getWei() {
        return wei;
    }

    public void setWei(String wei) {
        this.wei = wei;
    }

    public String getMianJi() {
        return mianJi;
    }

    public void setMianJi(String mianJi) {
        this.mianJi = mianJi;
    }

    public String getXiangQing() {
        return xiangQing;
    }

    public void setXiangQing(String xiangQing) {
        this.xiangQing = xiangQing;
    }

    public String getTuoGuanBegin() {
        return tuoGuanBegin;
    }

    public void setTuoGuanBegin(String tuoGuanBegin) {
        this.tuoGuanBegin = tuoGuanBegin;
    }

    public String getTuoGuanEnd() {
        return tuoGuanEnd;
    }

    public void setTuoGuanEnd(String tuoGuanEnd) {
        this.tuoGuanEnd = tuoGuanEnd;
    }

    public String getShouFangMoney() {
        return shouFangMoney;
    }

    public void setShouFangMoney(String shouFangMoney) {
        this.shouFangMoney = shouFangMoney;
    }

    @Override
    public String toString() {
        return "House{" +
                "houseID='" + houseID + '\'' +
                ", xiaoQuMing='" + xiaoQuMing + '\'' +
                ", ownerId='" + ownerId + '\'' +
                ", yuanGongID='" + yuanGongID + '\'' +
                ", dong='" + dong + '\'' +
                ", danYuan='" + danYuan + '\'' +
                ", fangHao='" + fangHao + '\'' +
                ", shi='" + shi + '\'' +
                ", ting='" + ting + '\'' +
                ", chu='" + chu + '\'' +
                ", wei='" + wei + '\'' +
                ", mianJi='" + mianJi + '\'' +
                ", xiangQing='" + xiangQing + '\'' +
                ", tuoGuanBegin='" + tuoGuanBegin + '\'' +
                ", tuoGuanEnd='" + tuoGuanEnd + '\'' +
                ", shouFangMoney='" + shouFangMoney + '\'' +
                '}';
    }
}

