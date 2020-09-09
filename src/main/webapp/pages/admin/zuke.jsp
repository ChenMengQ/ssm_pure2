<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>租客信息</title>
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
		width : 70  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">房屋出租</a></li>
    <li><a href="#">租客信息</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab2">租客信息表</a></li>
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
      <table class="tablelist">
        <thead>
          <tr>
            
            <th>编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
            <th>租客姓名</th>
            <th>租房地址</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>身份证号</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            
            <td>1</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
            
            <td>2</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
            
            <td>3</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
            
            <td>4</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
            
            <td>5</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
           
            <td>6</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
            
            <td>7</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
            <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
          </tr>
          <tr>
            
            <td>8</td>
            <td>张三</td>
            <td>九峰新区6栋1单元602室</td>
            <td>13139090677</td>
            <td>2345678@qq.com</td>
            <td>420121199803092234</td>
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
      $("#usual1 ul").idTabs(); 
    </script> 
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script> 
</div>
</body>
</html>