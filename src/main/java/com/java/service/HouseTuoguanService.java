package com.java.service;

import com.github.pagehelper.PageInfo;
import com.java.pojo.House;

import java.util.List;
import java.util.Map;

/**
 * time:14:15
 * author:丁鹏
 */
public interface HouseTuoguanService {
    /**
     * 查询所有房东信息
     * @return
     */
    List<Map<String,Object>> findOwns();

    /**
     * 添加房源
     * @return
     */
    Map<String,Object> saveHouse(House house);

    /**
     * 查询房源信息
     * @return
     */
    PageInfo<Map<String,Object>> findHouses(String pageNum, String pageSize, String flag, String keyword);

    /**
     * 查询房东信息
     * @return
     */
    PageInfo<Map<String,Object>> findFangDongs(String pageNum, String pageSize, String flag, String keyword);
}
