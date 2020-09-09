<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<title>登陆</title>
<meta http-equiv="content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/index.css">

<script type="text/javascript" src="<%=basePath %>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/index1.js"></script>

</head>
<body>
	<div class="content" >
       <div id="header">
	<div class="header_title">
		<span class="title_con">房屋托管系统</span>
	</div>
</div>
		<form id="#mainForm1" class="mainForm mainForm1" action="<%=basePath %>/user/login.do" method="post">
			<div class="con_title">
				<span class="con_title_sp">欢迎登录房屋托管系统</span>
			</div>
				<div class="normalInput">
					<input type="text" name="yuanGongId" class="phone" maxlength="12" placeholder="8-12位纯数字" style="">
				</div>
				<span class="error error1"></span>

				<div class="normalInput">
					<input type="text" name="password" class="password"  maxlength="16" autocomplete="off" placeholder="8-16位数字、字母或下划线">
					<input type="password" name="password1" class="password1" maxlength="16" autocomplete="off" placeholder="8-16位数字、字母或下划线">
					<a id="pwdBtn" href="##" class="pwdBtnShow" isshow="false">
						<i class="i_icon"></i>
					</a>
				</div>
				<span class="error error3"></span>
				<%--<a href="<%=basePath %>/pages/admin/main.jsp" class="fullBtnBlue">登陆</a>--%>
				<input type="submit" value="登陆" class="fullBtnBlue">
		</form>
	</div>

</body>
</html>