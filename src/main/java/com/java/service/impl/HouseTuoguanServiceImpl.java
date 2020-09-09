package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.java.mapper.HouseTuoguanMapper;
import com.java.pojo.House;
import com.java.utils.DateDiffUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * time:14:13
 * author:丁鹏
 */
@Service
@Transactional(readOnly = false)
public class HouseTuoguanServiceImpl implements com.java.service.HouseTuoguanService {

    @Autowired
    private HouseTuoguanMapper houseTuoguanMapper;

    /**
     * 查询所有房东信息
     * @return
     */
    @Override
    public List<Map<String,Object>> findOwns(){
        return houseTuoguanMapper.selectOwners();
    }

    /**
     * 添加房源
     * @return
     */
    public Map<String,Object> saveHouse(House house) {
        Map<String,Object> resultMap = new HashMap<>();
        try {
            //1、判断房东id是否存在
            resultMap.put("flag",true);//添加成功
            int flag = houseTuoguanMapper.selectOwnerIsExist(house.getOwnerId());
            if(flag!=1){
                resultMap.put("flag",false);
                resultMap.put("msg1","房东不存在!");
                return  resultMap;
            }
            //2、托管起始时间<托管结束时间
            long num = DateDiffUtil.calc(house.getTuoGuanBegin(), house.getTuoGuanEnd());
            if(num>=0){
                resultMap.put("flag",false);
                resultMap.put("msg2","起始时间不能大于结束时间!");
                return  resultMap;
            }
            //3、往house、housetuoguan表中插入数据
            int i = houseTuoguanMapper.insertHouse(house);
            int j = houseTuoguanMapper.insertHouseTuoGuan(house);
            if(i==1 && j==1){
                return resultMap;
            }else{
                throw new SQLException();
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("flag",false);
            resultMap.put("msg3","服务器错误!");
            return resultMap;
        }
    }

    /**
     * 查询房源信息
     * @return
     */
    public PageInfo<Map<String,Object>> findHouses(String pageNum, String pageSize, String flag, String keyword){
        //数据校验
        if(pageNum==null || pageSize==null || !(pageNum.matches("[1-9]\\d*")) || !(pageSize.matches("[1-9]\\d*"))){
            pageNum="1";
            pageSize="7";
        }
        if(keyword!=null){
            keyword=keyword.trim();
        }
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("flag",flag);
        paramMap.put("keyword",keyword);
        //开始分页
        PageHelper.startPage(Integer.parseInt(pageNum),Integer.parseInt(pageSize));
        List<Map<String, Object>> fangYuangList = houseTuoguanMapper.selectHouses(paramMap);
        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(fangYuangList);
        return pageInfo;
    }

    /**
     * 查询房东信息
     * @return
     */
    public PageInfo<Map<String,Object>> findFangDongs(String pageNum, String pageSize, String flag, String keyword){
        //数据校验
        if(pageNum==null || pageSize==null || !(pageNum.matches("[1-9]\\d*")) || !(pageSize.matches("[1-9]\\d*"))){
            pageNum="1";
            pageSize="7";
        }
        if(keyword!=null){
            keyword=keyword.trim();
        }
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("flag",flag);
        paramMap.put("keyword",keyword);
        //开始分页
        PageHelper.startPage(Integer.parseInt(pageNum),Integer.parseInt(pageSize));
        List<Map<String, Object>> fangYuangList = houseTuoguanMapper.selectFangDongs(paramMap);
        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(fangYuangList);
        return pageInfo;
    }

}
