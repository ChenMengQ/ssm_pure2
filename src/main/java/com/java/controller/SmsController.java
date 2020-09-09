package com.java.controller;

import com.java.utils.SMSUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * time:16:18
 * author:丁鹏
 */
@Controller
@RequestMapping("/sms")
public class SmsController {

    /**
     * 发送短信
     * @param phone
     * @return
     */
    @RequestMapping("/sendSms.do")
    public @ResponseBody boolean sendSms(String phone){
        //1、对数据校验
        System.out.println(phone);
        int smsCode = (int) (Math.random()*100000);
        System.out.println("smsCode="+smsCode);
        int status = SMSUtil.sendSMS(smsCode + "",phone);
        System.out.println("status="+status);
        return status>=1;
    }

}
