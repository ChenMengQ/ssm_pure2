<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=basePath%>/static/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" href="<%=basePath %>/static/js/sweetalert/sweetalert.css">
<script src="<%=basePath %>/static/js/sweetalert/sweetalert.min.js"></script>
<script src="<%=basePath%>/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/easyui/jquery.easyui.min.js"></script>
<style>
	.anNiu{
		width: 80px;
		height: 30px;
		background: #B0BBD1;
		margin-right: 30px;
		border-radius: 15px;
		cursor: pointer;
		font-weight: 700;
		position: relative;
		left: 125px;
	}
</style>
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath %>/index1Servlet">首页</a></li>
    <li >修改密码</li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li style="padding:0 25px;font-weight:700;font-size:14px">修改密码</li>
      </ul>
    </div>
    <div id="tab1" class="tabson">
      <form action="javascript:void(0)" method="post" id="fm1">
            <ul class="forminfo">
		        <li>
		          <label>请输入原密码:<b>*</b></label>
		          <input name="ymm" type="password"  class="dfinput" placeholder="请输入原密码" style="width:300px;"/>
		          <span style="color: red;text-indent: 2em;"></span>
		        </li>
		        <li>
		          <label>请输入新密码:<b>*</b></label>
		          <input id="xmm1" type="password" class="dfinput"  placeholder="请输入6-12位的密码，可使用数字、字母、下划线" style="width:300px;"/>
		          <span style="color: red;text-indent: 2em;"></span>
		        </li>
		        <li>
		            <label>请确认新密码:<b>*</b></label>
		            <input name="xmm" type="password" class="dfinput"  placeholder="请输入6-12位的密码，可使用数字、字母、下划线"  style="width:300px;"/>
		      	    <span style="color: red;text-indent: 2em;"></span>
		        </li>
      	    </ul>
      <input type="submit"  value="确认修改" class="anNiu"/>
      <input type="reset"  value="重新输入" class="anNiu"/>
      </form>
    </div>
  </div>
</div>
<div class="tanChuangBG" style="position: fixed;top:0;left:0;width: 100%;height: 100%;background: rgba(0,0,0,.2);z-index: 999;display:none;"></div>
<div id="XGMMTanChuang" class="tanChuang" style="top:20%;left:25%;">
		<div class="tanHead">
			<i>提示</i>
			<a class="tanColse" href="javascript:void(0)">
				×
			</a>
		</div>
		<div class="tanBody">
		</div>
		<div class="tanButtonArea">
			<center>
			<button class="tanButton" id="queDing">确定</button>
			</center>
		</div>
	</div>
</body>


<%	
	if(request.getAttribute("message")!=null){
   	out.print("<script>alert('"+request.getAttribute("message")+"')</script>");
} %>


<script>
$(function(){
	var flag1=false;
	var flag2=false;
	var flag3=false;
	$("input[type=submit]").click(function(){
		var xmm1=$("#xmm1").val();
		var xmm2=$("input[name=xmm]").val();
		var ymm=$("input[name=ymm]").val();
		$("input[type=password]").each(function(i,dom){
		 	var flag=testVal(dom);
			switch($(this).parent().index()){
			case 0:
			flag1=flag;
				break;
			case 1:
			flag2=flag;
				break;
			case 2:
			flag3=flag;
				break;
		} 
		});
		if(xmm1==xmm2){
			if(flag1&&flag2&&flag3){
			$.ajax({
				url:"<%=basePath %>/user/xgpwd.do",
				type:"post",
				dataType:"json",
				data:{
				    newpwd1:xmm1,
					newpwd2:xmm2,
                    jiupwd:ymm
				},
				success:function(a){
					if (a){
                        swal({
                            title:"温馨提示",
                            text:"修改成功",
							type:"success"
                        },function(){
                                window.parent.location.href="<%=basePath %>/user/logout.do";
							}
                        );

					}else {
						//window.
						swal({
							title:"温馨提示",
							text:"密码修改失败，请重试"
						});
					}
				}
			})
			return false;				
			}else{
			$("input[type=password]").val("");
			showTanChuang("密码格式错误，请重新输入！")
			return false;
			}
		}else{
			$("input[type=password]").val("");
			showTanChuang("输入的新密码第一次和第二次不一致！")
			return false;
		}
	})
	
	$("input[type=password]").blur(function(){
		var flag=testVal(this);
		switch($(this).parent().index()){
			case 0:
			flag1=flag;
				break;
			case 1:
			flag2=flag;
				break;
			case 2:
			flag3=flag;
				break;
		}
	})

	function showTanChuang(str){
		$(".tanChuang .tanBody").text(str);
		$("#XGMMTanChuang").show();
		$(".tanChuangBG").show();
	}
	$("#queDing").click(function(){
		$("#XGMMTanChuang").hide();
		$(".tanChuangBG").hide();
	})
	
	function testVal(dom1){
		var regex=/^\w{6,12}$/;
		if(regex.test($(dom1).val())){
			$(dom1).parent().children("span").text("");
			return true;
		}else{
		$(dom1).parent().children("span").text("密码格式不正确请重新输入");
			return false;
		}
	}
})
$(".tanChuang").draggable({ 
	handle:'.tanHead' ,
	cursor:'default'
}); 
</script>
</html>
