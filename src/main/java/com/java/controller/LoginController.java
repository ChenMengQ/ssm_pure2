package com.java.controller;

import com.java.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * time:10:24
 * author:丁鹏
 */
@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private UserService userService;

    /**
     * 登陆
     * @param yuanGongId
     * @param password
     * @return
     */
    @RequestMapping("/login.do")
    public String login(String yuanGongId, String password, HttpSession session){
        boolean flag = userService.findLogin(yuanGongId, password);
        if(flag){//登陆成功
            session.setAttribute("name",userService.findNameByYuanGongId(yuanGongId));
            session.setAttribute("yuanGongId",yuanGongId);
            session.setAttribute("touXiangPath",userService.findHeadIconByYuanGongId(yuanGongId));
            return "redirect:/pages/admin/main.jsp";
        }else{
            return "redirect:/pages/admin/login.jsp";
        }
    }

    /**
     * 安全退出
     * @return
     */
    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        session.invalidate();//让session失效
        return "redirect:/pages/admin/login.jsp";
    }

    /**
     * 修改密码
     * @return
     */
    @RequestMapping("/xgpwd.do")
    public @ResponseBody boolean xgPwd(String jiupwd,String newpwd1,String newpwd2,HttpSession session){
        Object yuanGongId = session.getAttribute("yuanGongId");
        String ygid = yuanGongId==null?null:(String)yuanGongId;
        System.out.println(jiupwd+","+newpwd1+","+newpwd2+","+ygid);
        return userService.modifyPwd(newpwd1,newpwd2,jiupwd,ygid);
    }

    /**
     * 图像上传
     * @return
     */
    @RequestMapping("/uploadHeadIcon.do")
    public String uploadHeadIcon(MultipartFile touXiang,HttpServletRequest request,HttpSession session){
        try {
            //1、动态获取工程在本地磁盘的绝对路径
            ServletContext application = request.getServletContext();
            String realPath = application.getRealPath("/static/uploads");
            //2、动态产生子文件夹
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd\\HH\\mm\\ss");
            String dateStr = sdf.format(new Date());//  2020\\12\\12\12
            //3、将工程路径与子文件夹进行拼接
            String directoryPath = realPath+"\\"+dateStr+"\\";
            File dFile = new File(directoryPath);
            if(!dFile.exists()){
                dFile.mkdirs();
            }
            //4、动态生成文件名
            String uuid = UUID.randomUUID().toString();
            //5、获取图片后缀名
            String oriName = touXiang.getOriginalFilename();//c:\\abc\\a.b.c.jpg
            int len = oriName.lastIndexOf(".");
            String ext = oriName.substring(len);//.jpg   .gif   .png
            //6、构建出上传的图片在磁盘的具体路径和名字
            String finalPath = directoryPath+uuid+ext;
            touXiang.transferTo(new File(finalPath));
            //7、将文件路径存放到数据库中去
            String touXiangPath = dateStr+"\\"+uuid+ext;
            Object yuanGongId = session.getAttribute("yuanGongId");
            boolean flag = userService.modifyTouXiang(touXiangPath, yuanGongId == null ? null : (String) yuanGongId);
            if(flag){
                session.setAttribute("touXiangPath",touXiangPath);
                return "admin/index1.jsp";
            }else{
                return "admin/xiuGaiTouXiang.jsp";
            }
        } catch (Exception e) {
            //打印异常
            e.printStackTrace();
            return "admin/xiuGaiTouXiang.jsp";
        }
    }


}
