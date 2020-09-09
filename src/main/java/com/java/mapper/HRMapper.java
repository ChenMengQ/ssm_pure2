package com.java.mapper;

import com.java.pojo.Staff;
import com.java.pojo.StaffForUpdate;
import org.apache.ibatis.annotations.*;

import java.util.*;

/**
 * 人事模块-DAO层
 * time:10:53
 * author:丁鹏
 */
public interface HRMapper {

    /**
     * 根据条件查询员工信息
     * @return
     */
    List<Map<String,Object>> selectStaffInfo(Map<String,Object> paramMap);


    /**
     * 获取所有部门信息
     * @return
     */
    @Select("SELECT * FROM dept")
    List<Map<String,Object>> selectDept();

    /**
     * 往yuangong表中插入员工的详细信息
     * @param st
     * @return
     */
    @Insert("INSERT INTO yuangong SET `name`=#{name},tel=#{tel},\n" +
            "gender=#{gender},idCard=#{idCard},deptID=#{deptID},address=#{address},\n" +
            "beginDate=#{beginDate},email=#{email}")
    @Options(keyProperty = "yuanGongID",useGeneratedKeys =true )
    int insertYuanGong(Staff st);

    /**
     * 往user表中插入数据
     * @param yuangGongId
     * @return
     */
    @Insert("INSERT INTO `user` SET yuanGongId=#{0}")
    int insertUser(String yuangGongId);

    /**
     * 查询手机是否重复
     * @param staff
     * @return
     */
    @Select("SELECT COUNT(*) FROM yuangong WHERE tel=#{tel}")
    int selectTelIsUnique(Staff staff);

    /**
     * 查询身份证号是否重复
     * @param staff
     * @return
     */
    @Select("SELECT COUNT(*) FROM yuangong WHERE idCard=#{idCard}")
    int selectIdCardIsUnique(Staff staff);

    /**
     * 查询指定的员工编号是否在数据库中存在
     * @param yuanGongID
     * @return
     */
    @Select("select count(*) from `user` where yuanGongID=#{0}")
    int selectYuanGongIDIsExist(String yuanGongID);


    /**
     * 根据员工编号查看某个员工的详细信息
     * @return
     */
    @Select("SELECT d.*,yg.*,u.*,d.`NAME` AS deptName,yg.`NAME` AS ygName\n" +
            "FROM `user` u INNER JOIN yuangong yg ON u.`yuanGongID`=yg.`id`\n" +
            "INNER JOIN dept d ON yg.`deptID`=d.id WHERE u.`yuanGongID`=#{0}")
    Map<String,Object> selectYuanGongInfoByYuanGongID(String yuanGongID);

    /**
     * 修改员工信息
     * @param sf
     * @return
     */
    @Update("UPDATE yuangong SET `name`=#{name},tel=#{tel},gender=#{gender},\n" +
            "idCard=#{idCard},deptID=#{deptID},address=#{address},email=#{email},\n" +
            "beginDate=#{beginDate} WHERE id=#{yuanGongID}")
    int updateYuanGongByYuanGongID(StaffForUpdate sf);

    /**
     * 查询手机是否重复-专门为update而生
     * @param staff
     * @return
     */
    @Select("SELECT COUNT(*) FROM yuangong WHERE tel=#{tel}")
    int selectTelIsUniqueForUpdate(StaffForUpdate staff);

    /**
     * 查询身份证号是否重复-专门为update而生
     * @param staff
     * @return
     */
    @Select("SELECT COUNT(*) FROM yuangong WHERE idCard=#{idCard}")
    int selectIdCardIsUniqueForUpdate(StaffForUpdate staff);

    /**
     * 根据员工ID查询员工原来在数据库中的电话和身份证
     * @param yuanGongID
     * @return
     */
    @Select("SELECT tel,idCard FROM yuangong WHERE id=#{0}")
    Map<String,Object> selectTelAndIdCardByYuanGongID(String yuanGongID);


    /**
     * 删除员工信息-做假删除
     * @param yuanGongID
     * @return
     */
    @Update("UPDATE `user` SET flag='0' WHERE yuanGongID=#{0}")
    int deleteUserStatus(String yuanGongID);

    /**
     * 判断指定的员工编号是否是超级管理员
     * @param yuanGongID
     * @return
     */
    @Select("SELECT COUNT(*) FROM `user` WHERE yuanGongID=#{0} AND isAdmin='1'")
    int selectIsAdmin(String yuanGongID);

    /**
     * 批量删除
     * @param idStr
     * @return
     */
    @Update("UPDATE `user` SET flag='0' WHERE yuanGongID IN(${idStr})")
    int deleteBatchUserStatus(@Param(value = "idStr") String idStr);

    /**
     * 判断是否已经打卡
     */
    @Select("SELECT COUNT(*) FROM kaoqin WHERE yuanGongID=#{0} \n" +
            "AND `date`=DATE_FORMAT(NOW(),'%Y-%m-%d')")
    int selectIsDaKa(String yuanGongID);

    /**
     * 第1次打卡
     * @return
     */
    @Insert("INSERT INTO `kaoqin` SET yuanGongID=#{0},daKa1=#{1},`date`=DATE_FORMAT(NOW(),'%Y-%m-%d'),DaKaCiShu=1,zhuangTai=#{2}")
    int insertDaKaInfo(String yuanGongID,String daKa1,String zhuangTai);

    /**
     * 第2次打卡
     */
    @Update("UPDATE kaoqin SET daKa2=#{0},DaKaCiShu='2',zhuangTai=#{1} WHERE yuanGongID=#{2}")
    int updateDaKaInfo(String daKa2,String zhuangTai,String yuanGongID);

}
