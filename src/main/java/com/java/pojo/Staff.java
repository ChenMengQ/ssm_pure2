package com.java.pojo;

import lombok.Data;
import lombok.Getter;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * 员工信息
 * time:09:17
 * author:丁鹏
 */
@Data
public class Staff {
    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[\\u4e00-\\u9fa5]{2,20}",message = "*格式错误!")
    private String name;//员工名

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "1[356789]\\d{9}",message = "*格式错误!")
    private String tel;//员工电话号码

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[男女]",message = "*格式错误!")
    private String gender;//性别

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d{17}[0-9X]",message = "*格式错误!")
    private String idCard;//身份证号

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "[1-9]\\d*",message = "*格式错误!")
    private String deptID;//部门id

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = ".{2,200}",message = "*格式错误!")
    private String address;//地址

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\d{4}(\\-|\\/|\\.)\\d{1,2}\\1\\d{1,2}",message = "*格式错误!")
    private String beginDate;//入职时间

    @NotNull(message = "*格式错误!")
    @NotBlank(message = "*格式错误!")
    @Pattern(regexp = "\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+",message = "*格式错误!")
    private String email;//电子邮箱

    //不接受表单参数，往yuanggong表中插入数据时，接收主键
    private String yuanGongID;

    public String getYuanGongID() {
        return yuanGongID;
    }
}
