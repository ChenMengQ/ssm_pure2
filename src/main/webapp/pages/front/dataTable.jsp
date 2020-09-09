<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>名人百科后台管理系统</title>
    <!-- 分页查看 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/js/dataTable/jquery.dataTables.min.css">
    <script type="text/javascript" src="<%=basePath%>/static/js/dataTable/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>/static/js/dataTable/jquery.dataTables.min.js"></script>
</head>
<body>
<center>
    <table cellspacing="0px" cellpadding="0px" border="1px" width="100%" class="tablelist" id="example">
        <thead>
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>头像</th>
            <th>职业</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${personList }" var="map" varStatus="num">
            <tr>
                <td>${num.count }</td>
                <td>${map.name }</td>
                <td>${map.sex }</td>
                <td>${map.head_url }</td>
                <td>${map.profession }</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</center>
<script type="text/javascript">
    $(document).ready(function(){
        $("#example").dataTable({
            "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
            "aLengthMenu" : [5, 10, 15], //更改显示记录数选项
            "sPaginationType" : "full_numbers", //详细分页组，可以支持直接跳转到某页
            "bAutoWidth" : true, //是否自适应宽度
            //"bJQueryUI" : true,
            "oLanguage": { //国际化配置
                "sProcessing" : "正在获取数据，请稍后...",
                "sLengthMenu" : "显示 _MENU_ 条",
                "sZeroRecords" : "没有您要搜索的内容",
                "sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
                "sInfoPostFix" : "",
                "sSearch" : "搜索",
                "sUrl" : "",
                "oPaginate": {
                    "sFirst" : "第一页",
                    "sPrevious" : "上一页",
                    "sNext" : "下一页",
                    "sLast" : "最后一页"
                }
            },
        });
    });
</script>
</body>
</html>
