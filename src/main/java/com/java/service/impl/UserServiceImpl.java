package com.java.service.impl;

import cn.hutool.crypto.SecureUtil;
import com.java.mapper.UserMapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * time:10:31
 * author:丁鹏
 */
@Service
public class UserServiceImpl implements com.java.service.UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 登陆
     * @param yuanGongId
     * @param password MD5加密后的密文
     * @return
     */
    @Override
    public boolean findLogin(String yuanGongId, String password){
        //1、做数据校验
        if(yuanGongId==null || password==null || !(yuanGongId.matches("\\d{8,12}")) || !(password.matches("\\w{8,16}"))){
            return false;
        }
        //2、调用dao层
        password = SecureUtil.md5(password);
        return userMapper.selectLogin(yuanGongId,password)==1;
    }

    /**
     * 根据员工编号获取员工的名字
     * @param yuanGongId
     * @return
     */
    public String findNameByYuanGongId(String yuanGongId){
        return userMapper.selectNameByYuanGongId(yuanGongId);
    }

    /**
     * 根据员工id查询此员工的头像信息
     * @param yuanGongId
     * @return
     */
    public String findHeadIconByYuanGongId(String yuanGongId){
        return userMapper.selectHeadIconByYuanGongId(yuanGongId);
    }


    /**
     * 修改密码
     * @param newPwd1
     * @param oldPwd
     * @param yuanGongID
     * @return
     */
    public boolean modifyPwd(String newPwd1,String newPwd2,String oldPwd,String yuanGongID){
        if(newPwd1==null || newPwd2==null || oldPwd==null || yuanGongID==null){
            return false;
        }
        if(!(newPwd1.equals(newPwd2))){
            return false;
        }
        if(!(newPwd1.matches("\\w{8,16}")) || !(yuanGongID.matches("\\d{8,12}"))){
            return false;
        }
        return userMapper.updatePwd(SecureUtil.md5(newPwd1),SecureUtil.md5(oldPwd),yuanGongID)==1;
    }

    /**
     * 修改头像
     * @param touXiangPath
     * @param yuanGongID
     * @return
     */
    public boolean modifyTouXiang(String touXiangPath,String yuanGongID){
        if(touXiangPath==null || yuanGongID==null){
            return false;
        }
        return userMapper.updateTouXiang(touXiangPath,yuanGongID)==1;
    }


}
