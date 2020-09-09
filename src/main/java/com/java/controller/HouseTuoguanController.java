package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.pojo.House;
import com.java.service.HouseTuoguanService;
import com.java.utils.ValidateBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * 房屋托管控制层
 * time:14:05
 * author:丁鹏
 */
@Controller
@RequestMapping("/tuoGuan")
public class HouseTuoguanController {
    @Autowired
    private HouseTuoguanService houseTuoguanService;
    /**
     * 添加房源链接----->toAddHousePage----->add_house.jsp页面
     * @return
     */
    @RequestMapping("/toAddHousePage.do")
    public String toAddHousePage(Model model){
        List<Map<String, Object>> ownerList =  houseTuoguanService.findOwns();
        model.addAttribute("ownerList",ownerList);
        return "admin/add_house.jsp";
    }

    /**
     * 添加房源数据到数据库中去
     * @return
     */
    @RequestMapping("/addHouse2DB.do")
    public String addHouse2DB(@Valid House house, BindingResult br, Model model, HttpSession session){
        System.out.println(house);
        //1、校验数据
        model.addAttribute("house",house);
        Map<String, Object> errorMap = ValidateBeanUtil.vlidateBean(br);
        List<Map<String, Object>> ownerList =  houseTuoguanService.findOwns();
        model.addAttribute("ownerList",ownerList);
        if(errorMap==null){//数据格式完全正确
            //2、调用业务层
            house.setYuanGongID((String) session.getAttribute("yuanGongId"));
            Map<String, Object> resultMap = houseTuoguanService.saveHouse(house);
            Boolean flag = (Boolean) resultMap.get("flag");
            if (flag){//业务层也执行成功
                return "redirect:/tuoGuan/toFangYuanListPage.do";
            }else{
                //带业务层中的错误信息过去
                model.addAttribute("resultMap",resultMap);
                return "admin/add_house.jsp";
            }
        }else{//数据格式有误
            model.addAttribute("errorMap",errorMap);
            return "admin/add_house.jsp";
        }
    }

    /**
     * 房源列表
     * @param pageNum
     * @param pageSize
     * @param flag
     * @param keyword
     * @param model
     * @return
     */
    @RequestMapping("/toFangYuanListPage.do")
    public String toFangYuanListPage(@RequestParam(defaultValue = "1") String pageNum,
                                     @RequestParam(defaultValue = "7")String pageSize,
                                     String flag,
                                     String keyword,
                                     Model model){
        PageInfo<Map<String, Object>> pageInfo = houseTuoguanService.findHouses(pageNum, pageSize, flag, keyword);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("flag",flag);
        model.addAttribute("keyword",keyword);
        return "admin/fy_list.jsp";
    }

    /**
     * 房东列表
     * @param pageNum
     * @param pageSize
     * @param flag
     * @param keyword
     * @param model
     * @return
     */
    @RequestMapping("/toFangDongListPage.do")
    public String toFangDongListPage(@RequestParam(defaultValue = "1") String pageNum,
                                     @RequestParam(defaultValue = "7")String pageSize,
                                     String flag,
                                     String keyword,
                                     Model model){
        PageInfo<Map<String, Object>> pageInfo = houseTuoguanService.findFangDongs(pageNum, pageSize, flag, keyword);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("flag",flag);
        model.addAttribute("keyword",keyword);
        return "admin/fd_list.jsp";
    }

}
