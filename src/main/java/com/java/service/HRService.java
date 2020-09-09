package com.java.service;

import com.github.pagehelper.PageInfo;
import com.java.pojo.Staff;
import com.java.pojo.StaffForUpdate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 人事模块-Service接口
 * time:11:19
 * author:丁鹏
 */
public interface HRService {
    /**
     * 根据条件查询员工信息
     * @return
     */
    PageInfo<Map<String,Object>> findStaffInfo(String pageNum, String pageSize, String flag, String keyword);


    /**
     * 获取所有部门信息
     * @return
     */
    List<Map<String,Object>> findDept();

    /**
     * 添加员工信息
     * @param st
     * @return
     */
    boolean saveYuanGong(Staff st, HttpSession session) throws SQLException;

    /**
     * 员工信息编辑回显(所有部门、个人信息、员工格式是否正确)
     * @param yuanGongID
     * @return
     */
    Map<String,Object> findYuanGongEditInfo(String yuanGongID);

    /**
     * 修改员工信息
     * @param st
     * @return
     */
    boolean modifyYuanGong(StaffForUpdate st, HttpServletRequest request) throws SQLException;

    /**
     * 删除员工信息
     * @param yuanGongID
     * @return
     */
    Map<String,Object> removeYuanGong(String yuanGongID,String superAdminID);

    /**
     * 批量删除多个员工信息
     * @param idStr
     * @param superAdminID
     * @return
     */
    Map<String,Object> removeBathchYuanGong(String idStr,String superAdminID);

    /**
     * 打卡
     * @return
     */
    Map<String,Object> saveDaKa(String yuanGongID);
}
