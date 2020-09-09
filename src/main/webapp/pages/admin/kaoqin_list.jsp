<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>考勤</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/editor/kindeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 100 
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>
<style type="text/css">
/* diy_select */
.f_wid{width:80px;}
.diy_select{height:35px;width:100%;position:relative;font-size:12px;color:#666;float:left;text-align:center;}
.diy_select_btn,.diy_select_txt{float:left;height:100%;}
.diy_select,.diy_select_list{}
.diy_select_txt,.diy_select_list li{overflow:hidden;width:100%;text-align:center;}
.diy_select_list{position:absolute;top:35px;left:-1px;z-index:88888;background:#fff;border-top:none;width:100%;display:none;_top:29px}
.diy_select_list li{list-style:none;height:35px;line-height:35px;cursor:default;_background:#fff}
.diy_select_list li.focus{background:#3399FF;color:#fff}
</style>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统设置</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab2">员工考勤表</a></li>
      </ul>
    </div>
    <div id="tab2" class="tabson">
      <ul class="seachform">
        <li>
          <label>查询方式</label>
          <div class="vocation">
            <select class="select3">
              <option>按编号查询</option>
              <option>按姓名查询</option>
              <option>模糊查询</option>
            </select>
          </div>
        </li>
        <li>
          <input name="" type="text" class="scinput" />
        </li>
        <li>
          <label>&nbsp;</label>
          <input name="" type="button" class="scbtn" value="查询"/>
        </li>
      </ul>
      <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=basePath %>/static/images/t01.png"></span>添加</li>
        <li><span><img src="<%=basePath %>/static/images/t03.png"></span>删除</li>
        </ul>   
    </div>
      <div class="clear"></div>
      <table class="tablelist">
        <thead>
          <tr>           
            <th>编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>所属部门</th>
            <th>月份</th>
            <th>全勤</th>>
            <th>事假</th>
            <th>迟到</th>
            <th>早退</th>
            <th>旷工</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            
            <td>1</td>
            <td>101</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
              <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
               <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
              <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
             <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
           
           <tr>
            
            <td>2</td>
            <td>101</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
             <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>3</td>
            <td>103</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td> 
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>4</td>
            <td>104</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>5</td>
            <td>105</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>6</td>
            <td>106</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
             <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>7</td>
            <td>107</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
             <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>8</td>
            <td>108</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
             <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          
          <tr>
            
            <td>9</td>
            <td>109</td>
            <td>张三</td>
            <td>业务部</td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>1月</li>
              <li>2月</li>
              <li>3月</li>
              <li>4月</li>
              <li>5月</li>
              <li>6月</li>
              <li>7月</li>
              <li>8月</li>
              <li>9月</li>
              <li>10月</li>
              <li>11月</li>
              <li>12月</li>
          </ul>
      </div>
              
            </td>
            <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>  <td class="f_wid">
             <div class='diy_select'>
		<input type='hidden' name='' class='diy_select_input'/>
		<div class='diy_select_txt'>-选择-</div>
		<div class='diy_select_btn'></div>
		<ul class='diy_select_list'>
              <li>是</li>
              <li>否</li>
          </ul>
      </div>
              
            </td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
           
            
            
          
        </tbody>
      </table>
      <div class="pagin">
        <div class="message">共<i class="blue">8</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
          <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
          <li class="paginItem  current"><a href="javascript:;">1</a></li>
          <li class="paginItem"><a href="javascript:;">2</a></li>
          <li class="paginItem"><a href="javascript:;">3</a></li>
          <li class="paginItem"><a href="javascript:;">4</a></li>
          <li class="paginItem"><a href="javascript:;">5</a></li>
          <li class="paginItem more"><a href="javascript:;">...</a></li>
          <li class="paginItem"><a href="javascript:;">10</a></li>
          <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
      </div>
    </div>
  </div>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script> 
    
    <script type="text/javascript">
function diy_select(){this.init.apply(this,arguments)};
diy_select.prototype={
	 init:function(opt)
	 {
		this.setOpts(opt);
		this.o=this.getByClass(this.opt.TTContainer,document,'div');//容器
		this.b=this.getByClass(this.opt.TTDiy_select_btn);//按钮
		this.t=this.getByClass(this.opt.TTDiy_select_txt);//显示
		this.l=this.getByClass(this.opt.TTDiv_select_list);//列表容器
		this.ipt=this.getByClass(this.opt.TTDiy_select_input);//列表容器
		this.lengths=this.o.length;
		this.showSelect();
	 },
	 addClass:function(o,s)//添加class
	 {
		o.className = o.className ? o.className+' '+s:s;
	 },
	 removeClass:function(o,st)//删除class
	 {
		var reg=new RegExp('\\b'+st+'\\b');
		o.className=o.className ? o.className.replace(reg,''):'';
	 },
	 addEvent:function(o,t,fn)//注册事件
	 {
		return o.addEventListener ? o.addEventListener(t,fn,false):o.attachEvent('on'+t,fn);
	 },
	 showSelect:function()//显示下拉框列表
	 {
		var This=this;
		var iNow=0;
		this.addEvent(document,'click',function(){
			 for(var i=0;i<This.lengths;i++)
			 {
				This.l[i].style.display='none';
			 }
		})
		for(var i=0;i<this.lengths;i++)
		{
			this.l[i].index=this.b[i].index=this.t[i].index=i;
			this.t[i].onclick=this.b[i].onclick=function(ev)  
			{
				var e=window.event || ev;
				var index=this.index;
				This.item=This.l[index].getElementsByTagName('li');

				This.l[index].style.display= This.l[index].style.display=='block' ? 'none' :'block';
				for(var j=0;j<This.lengths;j++)
				{
					if(j!=index)
					{
						This.l[j].style.display='none';
					}
				}
				This.addClick(This.item);
				e.stopPropagation ? e.stopPropagation() : (e.cancelBubble=true); //阻止冒泡
			}
		}
	 },
	 addClick:function(o)//点击回调函数
	 {

		if(o.length>0)
		{
			var This=this;
			for(var i=0;i<o.length;i++)
			{
				o[i].onmouseover=function()
				{
					This.addClass(this,This.opt.TTFcous);
				}
				o[i].onmouseout=function()
				{
					This.removeClass(this,This.opt.TTFcous);
				}
				o[i].onclick=function()
				{
					var index=this.parentNode.index;//获得列表
					This.t[index].innerHTML=This.ipt[index].value=this.innerHTML.replace(/^\s+/,'').replace(/\s+&/,'');
					This.l[index].style.display='none';
				}
			}
		}
	 },
	 getByClass:function(s,p,t)//使用class获取元素
	 {
		var reg=new RegExp('\\b'+s+'\\b');
		var aResult=[];
		var aElement=(p||document).getElementsByTagName(t || '*');

		for(var i=0;i<aElement.length;i++)
		{
			if(reg.test(aElement[i].className))
			{
				aResult.push(aElement[i])
			}
		}
		return aResult;
	 },

	 setOpts:function(opt) //以下参数可以不设置  //设置参数
	 { 
		this.opt={
			 TTContainer:'diy_select',//控件的class
			 TTDiy_select_input:'diy_select_input',//用于提交表单的class
			 TTDiy_select_txt:'diy_select_txt',//diy_select用于显示当前选中内容的容器class
			 TTDiy_select_btn:'diy_select_btn',//diy_select的打开按钮
			 TTDiv_select_list:'diy_select_list',//要显示的下拉框内容列表class
			 TTFcous:'focus'//得到焦点时的class
		}
		for(var a in opt)  //赋值 ,请保持正确,没有准确判断的
		{
			this.opt[a]=opt[a] ? opt[a]:this.opt[a];
		}
	 }
}


var TTDiy_select=new diy_select({  //参数可选
	TTContainer:'diy_select',//控件的class
	TTDiy_select_input:'diy_select_input',//用于提交表单的class
	TTDiy_select_txt:'diy_select_txt',//diy_select用于显示当前选中内容的容器class
	TTDiy_select_btn:'diy_select_btn',//diy_select的打开按钮
	TTDiv_select_list:'diy_select_list',//要显示的下拉框内容列表class
	TTFcous:'focus'//得到焦点时的class
});//如同时使用多个时请保持各class一致.
</script>
</div>
</body>
</html>
