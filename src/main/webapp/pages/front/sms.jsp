<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>短信发送</title>
    <link rel="stylesheet" href="<%=basePath %>/static/js/sweetalert/sweetalert.css">
    <script type="text/javascript" src="<%=basePath%>/static/js/dataTable/jquery.js"></script>
    <script src="<%=basePath %>/static/js/sweetalert/sweetalert.min.js"></script>
</head>
<body>
<center>
    <table width="600px" height="100px" border="1px">
        <tr>
            <td><input type="text" name="phone" placeholder="请输入手机号"></td>
            <td><input id="btn" type="button" value="发送"></td>
        </tr>
        <tr>
            <td>验证码</td>
            <td><input type="text" name="smsCode"></td>
        </tr>
    </table>
</center>
<script type="text/javascript">
    var countdown=60;
    function settime(obj) {
        //短信倒计时
        if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.value="发送";
            countdown = 60;
            return;
        } else {
            obj.setAttribute("disabled", true);
            obj.value="重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function() {
                settime(obj) }
            ,1000)

    }
</script>
<script type="text/javascript">
    $(function(){
        $("#btn").click(function(){
            //短信倒计时
            settime($(this).get(0));
            //短信发送请求后台
            $.ajax({
                url:"<%=basePath %>/sms/sendSms.do",
                type:"POST",
                dataType:"JSON",
                data:{
                    "phone":$("input[name=phone]").val()
                },
                success:function(rs){
                    if(rs){
                        swal({
                            title:"温馨提示",
                            text:"短信发送成功注意接收"
                        });
                    }else{
                        swal({
                            title:"温馨提示",
                            text:"短信发送失败"
                        });
                    }
                },
                error:function(rs){
                    swal({
                        title:"温馨提示",
                        text:"短信发送失败"
                    });
                }
            });
        });
    });
</script>
</body>
</html>