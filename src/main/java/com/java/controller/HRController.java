package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.pojo.Staff;
import com.java.pojo.StaffForUpdate;
import com.java.service.HRService;
import com.java.utils.ValidateBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 人事模块-控制层
 * time:10:41
 * author:丁鹏
 */
@Controller
@RequestMapping("/hr")
public class HRController {

    @Autowired
    private HRService hrService;

    /**
     * 获取员工信息-分页与条件查询
     * @param pageNum
     * @param pageSize
     * @param flag
     * @param keyword
     * @return
     */
    @RequestMapping("/getStaffInfo.do")
    public String getStaffInfo(@RequestParam(defaultValue = "1") String pageNum,
                               @RequestParam(defaultValue = "7")String pageSize,
                               String flag,
                               String keyword,
                               Model model){

        PageInfo<Map<String, Object>> pageInfo = hrService.findStaffInfo(pageNum, pageSize, flag, keyword);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("keyword",keyword);
        model.addAttribute("flag",flag);
        return "admin/yuangong.jsp";
    }

    /**
     * 跳转到添加员工页面
     * @return
     */
    @RequestMapping("/toAddYuanGongPage.do")
    public String toAddYuanGongPage(Model model){
        List<Map<String, Object>> deptList = hrService.findDept();
        model.addAttribute("deptList",deptList);
        return "admin/yuangongtianjia.jsp";
    }

    /**
     * 添加员工信息到数据库中去
     * @return
     */
    @RequestMapping("/addStaff.do")
    public String addStaff(@Valid Staff st, BindingResult br, HttpSession session) throws InterruptedException {
        try {
            session.setAttribute("st",st);
            Map<String, Object> errorMap = ValidateBeanUtil.vlidateBean(br);
            if(errorMap==null){//实体类中的数据格式全部正确
                //调用业务层，将数据保存到数据库中去
                boolean flag = hrService.saveYuanGong(st,session);
                if(flag){//业务层执行成功
                    session.removeAttribute("st");
                    session.removeAttribute("errorMap");
                    //跳转到getInfoStaff.do
                    return "redirect:/hr/getStaffInfo.do";
                }else{//业务层执行失败
                    return "redirect:/hr/toAddYuanGongPage.do";
                }
            }else{//数据格式有错误
                session.setAttribute("errorMap",errorMap);
                return "redirect:/hr/toAddYuanGongPage.do";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "redirect:/hr/toAddYuanGongPage.do";
        }
    }

    /**
     * 点击yuangong.jsp中的编辑按钮时，跳转到yuangongedit.jsp页面
     * @param yuanGongID
     * @return
     */
    @RequestMapping("/toYuanGongEditPage.do")
    public String toYuanGongEditPage(String yuanGongID,Model model){
        Map<String, Object> resultMap = hrService.findYuanGongEditInfo(yuanGongID);
        boolean flag = (boolean) resultMap.get("flag");
        if(flag){//查询个人信息成功
            model.addAttribute("resultMap",resultMap);
            return "admin/yuangongedit.jsp";
        }else{//查询个人信息失败
            return "redirect:/hr/getStaffInfo.do";
        }
    }

    /**
     * 提交修改
     * @param st
     * @param br
     * @return
     */
    @RequestMapping("/xgYuanGongInfo.do")
    public String xgYuanGongInfo(@Valid StaffForUpdate st,BindingResult br,HttpServletRequest request){
        try {
            request.setAttribute("sft",st);
            request.setAttribute("deptList",hrService.findDept());
            //1、数据校验
            Map<String, Object> errorMap = ValidateBeanUtil.vlidateBean(br);
            //2、数据格式没有问题后，调用业务层，存数据
            if(errorMap==null){
                boolean flag = hrService.modifyYuanGong(st, request);
                if(flag){//业务层修改成功
                    //跳转到getInfoStaff.do
                    return "redirect:/hr/getStaffInfo.do";
                }else{//业务层修改失败(手机号码与身份证重复)
                    return "admin/yuangongedit.jsp";
                }
            }else{//数据格式有错误
                request.setAttribute("errorMap",errorMap);
                return "admin/yuangongedit.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;//跳回编辑页面
        }
    }

    /**
     *单个删除
     * @return
     */
    @RequestMapping("/scYuanGong.do")
    public @ResponseBody Map<String,Object> scYuanGong(String yuanGongID,HttpSession session){
        return  hrService.removeYuanGong(yuanGongID, (String) session.getAttribute("yuanGongId"));
    }


    /**
     *批量删除删除
     * @return
     */
    @RequestMapping("/scBatchYuanGong.do")
    public @ResponseBody Map<String,Object> scBatchYuanGong(String idStr,HttpSession session){
        return  hrService.removeBathchYuanGong(idStr, (String) session.getAttribute("yuanGongId"));
    }

    /**
     *考勤打卡
     * @return
     */
    @RequestMapping("/addDaKa.do")
    public @ResponseBody Map<String,Object> addDaKa(HttpSession session){
        return  hrService.saveDaKa((String) session.getAttribute("yuanGongId"));
    }


}
