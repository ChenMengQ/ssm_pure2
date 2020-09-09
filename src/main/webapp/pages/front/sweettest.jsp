<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>sweet alert</title>
    <link rel="stylesheet" href="<%=basePath %>/static/js/sweetalert/sweetalert.css">
    <script src="<%=basePath %>/static/js/sweetalert/sweetalert.min.js"></script>
</head>
<body>
    <script>
        swal({
            title: "欢迎使用SweetAlert",
            text: "Sweet Alert 是一个替代传统的 JavaScript Alert 的漂亮提示效果。",
            type:"success"
        });
    </script>
</body>
</html>
