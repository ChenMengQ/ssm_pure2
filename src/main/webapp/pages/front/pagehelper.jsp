<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>人员百科-pagehelper版本</title>
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function() {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function(type, page, current) {
                    return 'person/toHomePage.do?pageNum=' + page+"&sex=${requestScope.sex}&name=${requestScope.name}";
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

<center>
    <form action="<%=basePath%>/person/toHomePage.do" method="post">
        姓名：<input type="text" name="name" value="${requestScope.name}">
        性别:
        <select name="sex">
            <option value="2" ${requestScope.sex=='2'?'selected':''}>全部</option>
            <option value="1" ${requestScope.sex=='1'?'selected':''}>男</option>
            <option value="0" ${requestScope.sex=='0'?'selected':''}>女</option>
        </select>
        <input type="submit" value="搜索">
    </form>
    <table border="1px" width="600px">
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>头像</th>
            <th>职业</th>
        </tr>
        <c:forEach items="${requestScope.pageInfo.list }" var="map" varStatus="num">
            <tr>
                <td>${num.count }</td>
                <td>${map.name }</td>
                <td>${map.sex=='1'?"男":"女" }</td>
                <td>${map.head_url }</td>
                <td>${map.profession }</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 把分页搞出来 -->
    <ul id="pagination"></ul>
</center>


</body>
</html>
