<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员编辑</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">角色设计</a></li>
    <li><a href="#">管理员编辑</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab1" class="selected">管理员编辑</a></li>
      </ul>
    </div>
    <div id="tab1" class="tabson">
      <form action="#" method="get">
           <ul class="forminfo">
         <li>
          <label>员工编号<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:150px;"/>
         </li>
         <li>
          <label>员工姓名<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:150px;"/>
        </li>
        <li>
          <label>员工职位<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:150px;"/>
        </li>
        <li>
          <label>登&nbsp;陆&nbsp;名<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:150px;"/>
        </li>
        <li>
          <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:150px;"/>
        </li>
        <li>
          <label>&nbsp;</label>
          <input name="" type="submit" class="btn" value="确定"/>
        </li>
      </ul>
      </form>
      
    </div>
  </div>
</div>
</body>
</html>
