<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
<%--<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>--%>
  <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
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
  <!-- 引入bootstrap分页 -->
  <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
  <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
  <script>
      $(function() {
          $('#pagination').bootstrapPaginator({
              bootstrapMajorVersion: 3,
              currentPage: ${requestScope.pageInfo.pageNum },
              totalPages: ${requestScope.pageInfo.pages },
              pageUrl: function(type, page, current) {
                  return 'tuoGuan/toFangYuanListPage.do?pageNum=' + page+"&flag=${requestScope.flag}&keyword=${requestScope.keyword}";
              },
              itemTexts: function(type, page, current) {
                  switch(type) {
                      case "first":
                          return "首页";
                      case "prev":
                          return "上一页";
                      case "next":
                          return "下一页";
                      case "last":
                          return "末页";
                      case "page":
                          return page;
                  }
              }
          });
      });
  </script>
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">房源列表</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab2">房源列表</a></li>
      </ul>
    </div>
    <div id="tab2" class="tabson">
      <form action="<%=basePath %>/tuoGuan/toFangYuanListPage.do" method="post">
        <ul class="seachform">
          <li>
            <label>查询方式</label>
            <div class="vocation">
              <select name="flag" class="select3">
                <option value="1" ${requestScope.flag=='1'?'selected':''}>房屋编号</option>
                <option value="2" ${requestScope.flag=='2'?'selected':''}>房东姓名</option>
                <option value="3" ${requestScope.flag=='3'?'selected':''}>房屋名称</option>
              </select>
            </div>
          </li>
          <li>
            <input name="keyword" value="${requestScope.keyword}" type="text" class="scinput" />
          </li>
          <li>
            <label>&nbsp;</label>
            <input  type="submit" class="scbtn" value="查询"/>
          </li>
        </ul>
      </form>
      <table class="tablelist">
        <thead>
          <tr>
            <th>编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
            <th>房屋编号</th>
            <th>房屋名称</th>
            <th>房东姓名</th>
            <th>业务员姓名</th>
            <th>房屋户型</th>
            <th>面积</th>
            <th>托管时间</th>
            <th>托管金额</th>
            <th>房源描述</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${requestScope.pageInfo.list}" var="fyMap" varStatus="num">
              <tr>
                <td>${num.count}</td>
                <td>${fyMap.houseID}</td>
                <td>${fyMap.xiaoQuMing}${fyMap.dong}栋${fyMap.danYuan}单元${fyMap.fangHao}室</td>
                <td>${fyMap.ownerName}</td>
                <td>${fyMap.ygName}</td>
                <td>${fyMap.shi}室${fyMap.ting}厅${fyMap.chu}厨${fyMap.wei}卫</td>
                <td>${fyMap.mianJi}<span>㎡</span></td>
                <td>${fyMap.tuoGuanDay}<span>天</span></td>
                <td>${fyMap.shouFangMoney}</td>
                <td>${fyMap.xiangQing}</td>
                <td><a href="#" class="tablelink">编辑</a> <a href="#" class="tablelink"> 删除</a></td>
              </tr>
          </c:forEach>

        </tbody>
      </table>

      <!-- 把分页搞出来 -->
      <ul id="pagination"></ul>


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
