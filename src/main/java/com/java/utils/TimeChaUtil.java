package com.java.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 计算打卡时间差
 * time:15:32
 * author:丁鹏
 */
public class TimeChaUtil {

    /**
     * 计算当前系统时间与公司规定时间差值
     * @param time
     * @return
     * @throws ParseException
     */
    public static long calc(String time) throws ParseException {
        //long daKaTime = System.currentTimeMillis(); //16:05
        SimpleDateFormat commSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date d1 = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dStr1 = sdf1.format(d1);//2019-12-05 16:18:15
        System.out.println("下班打卡时间:"+dStr1);
        long daKaTime = commSdf.parse(dStr1).getTime();

        //4、格式化公司规定的打卡时间
        Date d2 = new Date();
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd "+time);
        String dStr2 = sdf2.format(d2);//2019-12-05 18:00:00
        System.out.println("公司规定下班时间:"+dStr2);
        long companyDaKaTime = commSdf.parse(dStr2).getTime();
        //5、判断是否迟到
        long cha = daKaTime - companyDaKaTime;
        return cha;
    }

}
