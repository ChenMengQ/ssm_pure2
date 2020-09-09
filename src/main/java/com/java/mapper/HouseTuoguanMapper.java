package com.java.mapper;

import com.java.pojo.House;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * time:14:12
 * author:丁鹏
 */
public interface HouseTuoguanMapper {

    /**
     * 查询房东信息
     * @return
     */
    @Select("SELECT * FROM `owner`")
    List<Map<String,Object>> selectOwners();

    /**
     * 判断指定房东是否存在
     * @param ownerId
     * @return
     */
    @Select("SELECT COUNT(*) FROM `owner` WHERE id=#{0}")
    int selectOwnerIsExist(String ownerId);

    /**
     * 插入房子基本信息
     * @param house
     * @return
     */
    @Insert("INSERT  INTO `house`\n" +
            "(`id`,`xiaoQuMing`,`dong`,`danYuan`,`fangHao`,`shi`,`ting`,`chu`,\n" +
            "`wei`,`mianJi`,`xiangQing`,`yeZhuID`) \n" +
            "VALUES (NULL,#{xiaoQuMing},#{dong},#{danYuan},#{fangHao},#{shi}," +
            "#{ting},#{chu},#{wei},#{mianJi},#{xiangQing},#{ownerId})")
    @Options(keyProperty = "houseID",useGeneratedKeys = true)
    int insertHouse(House house);

    /**
     * 插入托管信息
     * @param house
     * @return
     */
    @Insert("INSERT  INTO `housetuoguan`(`id`,`houseID`,`yuanGongID`,\n" +
            "`tuoGuanBegin`,`tuoGuanEnd`,`shouFangMoney`,`zhuangXiu`) \n" +
            "VALUES (NULL,#{houseID},#{yuanGongID},\n" +
            "#{tuoGuanBegin},#{tuoGuanEnd},#{shouFangMoney},4)")
    int insertHouseTuoGuan(House house);

    /**
     * 查询房源信息
     * @return
     */
    List<Map<String,Object>> selectHouses(Map<String,Object> paramMap);

    /**
     * 查询房东信息
     * @return
     */
    List<Map<String,Object>> selectFangDongs(Map<String,Object> paramMap);

}
