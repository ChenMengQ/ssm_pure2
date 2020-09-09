package com.java.utils;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 实体类校验工具类
 * time:09:31
 * author:丁鹏
 */
public class ValidateBeanUtil {

    /**
     * 校验实体类中的数据是否有格式错误
     * @param br
     * @return  如果Map集合返回null，则数据格式完全正确
     */
    public static Map<String,Object> vlidateBean(BindingResult br){
        try {
            boolean flag = br.hasErrors();
            Map<String,Object> errorMap = new HashMap<>();
            if(flag){//有错误
                List<FieldError> errorList = br.getFieldErrors();
                for (FieldError tempFieldError:errorList){
                    errorMap.put(tempFieldError.getField(),tempFieldError.getDefaultMessage());
                }
                return errorMap;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
