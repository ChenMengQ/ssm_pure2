package com.java.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 计算两个时间差
 * time:15:32
 * author:丁鹏
 */
public class DateDiffUtil {

    /**
     * 计算两个日期差
     * @param beginDate  yyyy-MM-dd
     * @param endDate   yyyy-MM-dd
     * @return
     * @throws ParseException
     */
    public static long calc(String beginDate,String endDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //Date对象：getTime()
        Date date1 = sdf.parse(beginDate);
        Date date2 = sdf.parse(endDate);
        return date1.getTime()-date2.getTime();
    }

}
