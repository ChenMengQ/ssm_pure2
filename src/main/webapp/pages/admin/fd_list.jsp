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
                  return 'tuoGuan/toFangDongListPage.do?pageNum=' + page+"&flag=${requestScope.flag}&keyword=${requestScope.keyword}";
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
    <li><a href="#">房东信息</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab2">房东信息列表</a></li>
      </ul>
    </div>
    <div id="tab2" class="tabson">
      <form action="<%=basePath %>/tuoGuan/toFangDongListPage.do" method="post">
        <ul class="seachform">
          <li>
            <label>查询方式</label>
            <div class="vocation">
              <select name="flag" class="select3">
                <option value="1" ${requestScope.flag=='1'?'selected':''}>房屋电话</option>
                <option value="2" ${requestScope.flag=='2'?'selected':''}>房东姓名</option>
                <option value="3" ${requestScope.flag=='3'?'selected':''}>房屋地址</option>
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
          <th>序号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
          <th>房东姓名</th>
          <th>房屋地址</th>
          <th>电话</th>
          <th>身份证号</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.pageInfo.list}" var="fdMap" varStatus="num">
          <tr>
            <td>${num.count}</td>
            <td>${fdMap.NAME}</td>
            <td>${fdMap.xiaoQuMing}${fdMap.dong}栋${fdMap.danYuan}单元${fdMap.fangHao}室</td>
            <td>${fdMap.tel}</td>
            <td>${fdMap.idcard}</td>
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
