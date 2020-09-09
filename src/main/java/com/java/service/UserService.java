package com.java.service;

/**
 * time:10:42
 * author:丁鹏
 */
public interface UserService {
    /**
     * 登陆
     * @param yuanGongId
     * @param password MD5加密后的密文
     * @return
     */
    boolean findLogin(String yuanGongId, String password);

    /**
     * 根据员工编号获取员工的名字
     * @param yuanGongId
     * @return
     */
    String findNameByYuanGongId(String yuanGongId);

    /**
     * 根据员工id查询此员工的头像信息
     * @param yuanGongId
     * @return
     */
    String findHeadIconByYuanGongId(String yuanGongId);

    /**
     * 修改密码
     * @param newPwd1
     * @param oldPwd
     * @param yuanGongID
     * @return
     */
    boolean modifyPwd(String newPwd1,String newPwd2,String oldPwd,String yuanGongID);

    /**
     * 修改头像
     * @param touXiangPath
     * @param yuanGongID
     * @return
     */
    boolean modifyTouXiang(String touXiangPath,String yuanGongID);
}
