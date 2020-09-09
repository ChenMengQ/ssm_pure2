package com.java.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

/**
 * time:10:29
 * author:丁鹏
 */
public interface UserMapper {

    /**
     * 登陆
     * @param yuanGongId
     * @param password MD5加密后的密文
     * @return
     */
    @Select("SELECT COUNT(*) FROM USER WHERE yuanGongId=#{0} AND PASSWORD=#{1} AND flag='1'")
    int selectLogin(String yuanGongId,String password);

    /**
     * 根据员工编号获取员工的名字
     * @param yuanGongId
     * @return
     */
    @Select("SELECT NAME FROM yuangong WHERE id=#{0}")
    String selectNameByYuanGongId(String yuanGongId);

    /**
     * 根据员工id查询此员工的头像信息
     * @param yuanGongId
     * @return
     */
    @Select("SELECT touXiangPath FROM USER WHERE yuanGongID=#{0}")
    String selectHeadIconByYuanGongId(String yuanGongId);

    /**
     * 修改密码
     * @param newPwd1
     * @param oldPwd
     * @param yuanGongID
     * @return
     */
    @Update("UPDATE `user` SET `password`=#{0} WHERE `password`=#{1} and yuanGongID=#{2}")
    int updatePwd(String newPwd1,String oldPwd,String yuanGongID);

    /**
     * 修改头像
     * @param touXiangPath
     * @param yuanGongID
     * @return
     */
    @Update("UPDATE `user` SET touXiangPath=#{0} WHERE yuanGongID=#{1}")
    int updateTouXiang(String touXiangPath,String yuanGongID);

}
