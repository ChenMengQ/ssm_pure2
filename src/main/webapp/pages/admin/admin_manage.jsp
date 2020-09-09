<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色设计</title>
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">角色设计</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab1" class="selected">角色设计</a></li>
        <li><a class="selected" target="Conframe" href="admin_edit.jsp">添加</a></li>
      </ul>
    </div>
    <table class="tablelist" style="margin-top:20px;">
        <thead>
          <tr>
            
            <th>员工编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
            <th>员工姓名</th>
            <th>职位</th>
            <th>登录名</th>
            <th>密码</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          
            <td>1</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
         <tr>
          
            <td>2</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
        <tr>
          
            <td>3</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
          
            <td>4</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
         <tr>
          
            <td>5</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
         <tr>
          
            <td>6</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
          
            <td>7</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
          
            <td>8</td>
            <td>张三</td>
            <td>财务</td>
            <td>zhangsna/td>
            <td>123</td>
            <td><a href="#" class="tablelink">修改</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
        </tbody>
      </table>
  </div>
</div>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script> 
</body>
</html>
