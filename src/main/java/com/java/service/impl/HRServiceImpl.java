package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.mapper.HRMapper;
import com.java.pojo.Staff;
import com.java.pojo.StaffForUpdate;
import com.java.utils.TimeChaUtil;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 人事模块-Service实现层
 * time:10:59
 * author:丁鹏
 */
@Service
@Transactional(readOnly = false)//回滚
public class HRServiceImpl implements com.java.service.HRService {

    @Autowired
    private HRMapper hrMapper;

    /**
     * 根据条件查询员工信息
     * @return
     */
    @Override
    public PageInfo<Map<String,Object>> findStaffInfo(String pageNum, String pageSize, String flag, String keyword){
        //1、数据校验
        if(pageNum==null || pageSize==null || !(pageNum.matches("[1-9]\\d*")) || !(pageSize.matches("[1-9]\\d*"))){
            pageNum="1";
            pageSize="7";
        }
        if(keyword!=null){
            keyword=keyword.trim();
        }
        //2、调用DAO层
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("flag",flag);
        paramMap.put("keyword",keyword);
        //3、开始分页
        PageHelper.startPage(Integer.parseInt(pageNum),Integer.parseInt(pageSize));
        List<Map<String, Object>> resultList = hrMapper.selectStaffInfo(paramMap);
        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(resultList);
        return pageInfo;
    }


    /**
     * 获取所有部门信息
     * @return
     */
    public List<Map<String,Object>> findDept(){
        return hrMapper.selectDept();
    }

    /**
     * 添加员工信息
     * @param st
     * @return
     */
    public boolean saveYuanGong(Staff st,HttpSession session) throws SQLException {
        //查看手机号码、身份证是否重复
        int i = hrMapper.selectTelIsUnique(st);
        int j = hrMapper.selectIdCardIsUnique(st);
        Map<String,Object> errorMap = new HashMap<>();
        if(i==1){
            errorMap.put("tel","*手机号重复!");
        }
        if(j==1){
            errorMap.put("idCard","*身份证号重复!");
        }
        if(i==1 || j==1){
            session.setAttribute("errorMap",errorMap);
            return false;
        }
        //往yuanggong表中插入数据
        int flag1 = hrMapper.insertYuanGong(st);
        //往user表中插入数据
        int flag2 = hrMapper.insertUser(st.getYuanGongID());
        if(flag1==1 && flag2==1){
            return true;
        }else{
            //显示抛出异常让事务回滚
            throw new SQLException();
        }
    }

    /**
     * 员工信息编辑回显(所有部门、个人信息、员工格式是否正确)
     * @param yuanGongID
     * @return
     */
    public Map<String,Object> findYuanGongEditInfo(String yuanGongID){
        //1、数据校验
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("flag",true);
        //当不满足要求时
        if(yuanGongID==null || !(yuanGongID.matches("[1-9]\\d*"))){
            resultMap.put("flag",false);
            return resultMap;
        }
        //2、yuanGongID数据格式正确，则查询此员工编号是否存在
        int i = hrMapper.selectYuanGongIDIsExist(yuanGongID);
        if(i!=1){//此员工编号在数据库中不存在
            resultMap.put("flag",false);
            return resultMap;
        }
        //3、如果存在则再查询员工的具体信息
        List<Map<String, Object>> deptList = hrMapper.selectDept();
        Map<String, Object> yuanGongMap = hrMapper.selectYuanGongInfoByYuanGongID(yuanGongID);
        resultMap.put("deptList",deptList);
        resultMap.put("yuanGongMap",yuanGongMap);
        return resultMap;
    }

    /**
     * 修改员工信息
     * @param st
     * @return
     */
    public boolean modifyYuanGong(StaffForUpdate st, HttpServletRequest request) throws SQLException {
        Map<String,Object> errorMap = new HashMap<>();
        //先判断表单提交过来的手机号与身份证是否是自己数据库中原来的手机号
        Map<String, Object> telAndIdCardMap = hrMapper.selectTelAndIdCardByYuanGongID(st.getYuanGongID());
        String tel = (String) telAndIdCardMap.get("tel");
        String idCard = (String) telAndIdCardMap.get("idCard");
        int i=0,j=0;
        if(!(tel.equals(st.getTel()))){//手机号不是原来的
            //查看手机号码、身份证是否重复
            i = hrMapper.selectTelIsUniqueForUpdate(st);
            if(i==1){
                errorMap.put("tel","*手机号重复!");
            }
        }
        if(!(idCard.equals(st.getIdCard()))){//身份证号不是原来的
            j = hrMapper.selectIdCardIsUniqueForUpdate(st);
            if(j==1){
                errorMap.put("idCard","*身份证号重复!");
            }
        }
        if(i==1 || j==1){
            request.setAttribute("errorMap",errorMap);
            return false;
        }
        //可以开始执行修改操作
        int flag = hrMapper.updateYuanGongByYuanGongID(st);
        return flag==1;
    }

    /**
     * 删除员工信息
     * @param yuanGongID
     * @return
     */
    public Map<String,Object> removeYuanGong(String yuanGongID,String superAdminID){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("flag",true);//删除成功
        //1、校验数据是否满足格式要求
        if(yuanGongID==null || !(yuanGongID.matches("[1-9]\\d*"))){
            resultMap.put("flag",false);
            resultMap.put("msg","亲，要乖哦，不要瞎搞!");
            return resultMap;
        }
        //2、判断是否自己删除自己
        if(yuanGongID.equals(superAdminID)){
            resultMap.put("flag",false);
            resultMap.put("msg","亲，自己不能干掉自己!");
            return resultMap;
        }
        //3、此操作是否是超级管理员在执行
        int j = hrMapper.selectIsAdmin(superAdminID);
        if(j!=1){//不是超级管理员
            resultMap.put("flag",false);
            resultMap.put("msg","没有操作权限!");
            return resultMap;
        }
        //4、数据格式正确后，可以开始修改了
        int i = hrMapper.deleteUserStatus(yuanGongID);
        if(i!=1){//数据格式失败，此员工不存在
            resultMap.put("flag",false);
            resultMap.put("msg","删除失败，此员工不存在!");
            return resultMap;
        }
        return resultMap;
    }

    /**
     * 批量删除多个员工信息
     * @param idStr
     * @param superAdminID
     * @return
     */
    public Map<String,Object> removeBathchYuanGong(String idStr,String superAdminID){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("flag",true);
        //1、判断idStr中的所有员工ID是否满足格式要求
        //"2018001,2018002,2018003,"
        if(idStr==null || !(idStr.matches("([1-9]\\d*,)+"))){
            resultMap.put("flag",false);
            resultMap.put("msg","数据格式错误!");
            return resultMap;
        }
        //2、判断是否自己删除自己
        if(idStr.contains(superAdminID)){
            resultMap.put("flag",false);
            resultMap.put("msg","您删除的记录中包含自己!");
            return resultMap;
        }
        //3、此操作是否是超级管理员在执行
        int j = hrMapper.selectIsAdmin(superAdminID);
        if(j!=1){//不是超级管理员
            resultMap.put("flag",false);
            resultMap.put("msg","没有操作权限!");
            return resultMap;
        }
        //4、可以开始批量删除了
        idStr = idStr+"20180000";
        int i = hrMapper.deleteBatchUserStatus(idStr);
        if(i<=0){
            resultMap.put("flag",false);
            resultMap.put("msg","删除失败，员工不存在!");
            return resultMap;
        }
        return resultMap;
    }

    /**
     * 打卡
     * @return
     */
    public Map<String,Object> saveDaKa(String yuanGongID){
        Map<String,Object> resultMap = new HashMap<>();
        try {
            resultMap.put("flag",true);//打卡成功
            //1、接收员工ID
            //2、判断用户是第1次打卡，还是第2次打卡
            int i = hrMapper.selectIsDaKa(yuanGongID);
            String zhuangTai = "1";
            if(i==0){//没有打过卡，属于第一次打卡
                //严重迟到
                long cha1 = TimeChaUtil.calc("10:00:00");
                long cha2 = TimeChaUtil.calc("09:30:00");
                long cha3 = TimeChaUtil.calc("09:00:00");
                if(cha1>0){
                    zhuangTai="4";//旷工
                    resultMap.put("msg","旷工");
                }else if(cha2>0){//严重迟到    daka
                    zhuangTai="3";
                    resultMap.put("msg","严重迟到");
                }else if(cha3>0){
                    zhuangTai="2";
                    resultMap.put("msg","普通迟到");
                }
                //6插入操作
                int j = hrMapper.insertDaKaInfo(yuanGongID, new SimpleDateFormat("HH:mm:ss").format(new Date()),zhuangTai);
                if(j==0){//数据库出现错误
                    resultMap.put("flag",false);
                    resultMap.put("msg","系统崩溃!");
                }
                return resultMap;
            }
            //第2次打卡
            //5、判断是否早退
            long cha = TimeChaUtil.calc("18:00:00");
            if(cha<0){
                zhuangTai="5";
                resultMap.put("msg","早退");
            }
            int n = hrMapper.updateDaKaInfo(new SimpleDateFormat("HH:mm:ss").format(new Date()), zhuangTai,yuanGongID);
            if(n==0){//数据库出现错误
                resultMap.put("flag",false);
                resultMap.put("msg","系统崩溃!");
            }
            return resultMap;
        } catch (Exception e) {
            resultMap.put("flag",false);
            resultMap.put("msg","系统崩溃!");
            e.printStackTrace();
            return resultMap;
        }
    }

}
