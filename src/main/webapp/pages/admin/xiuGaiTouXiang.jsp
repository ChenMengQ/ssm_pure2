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
<script src="<%=basePath%>//static/js/jquery-1.9.1.min.js"></script>
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
		left: 100px;
	}
	#liuLanS{
		width: 100px;
		height: 100px;
		box-shadow: 0 0 3px 1px black;
		margin-right: 30px;
		margin-left:20px;
		margin-bottom:20px;
		border-radius: 10px;
	}
	#liuLanL{
		width: 250px; 
		height: 250px;
		box-shadow: 0 0 3px 1px black;
		margin-bottom:20px;
		border-radius: 10px;
	}
</style>
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath %>/index1Servlet">首页</a></li>
    <li >修改头像</li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li style="padding:0 25px;font-weight:700;font-size:14px">修改头像</li>
      </ul>
    </div>
    <div id="tab1" class="tabson">
    	<div>
	      	<img id="liuLanS" class="img_preview" src="<%=basePath%>//static/images/929d500855ce830ea405d61d4be7ce5b.jpg"></img>
	      	<img id="liuLanL" class="img_preview" src="<%=basePath%>//static/images/929d500855ce830ea405d61d4be7ce5b.jpg"></img>
   		</div>
      	<form action="<%=basePath %>/user/uploadHeadIcon.do" method="post" enctype="multipart/form-data">
      		<input type="file" name="touXiang" class="form-control" id="zx_img" style="display: none;">
    		<input type="button" id="test" value="浏览..." class="anNiu"/>
    		<input type="submit" id="sub" value="提交" class="anNiu"/>
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
<script>
$(function(){
		$("#SMSUtil").click(function(){//隐藏file控件
			$("#zx_img").click()
		})
		$("form").submit(function(){//如果没有图片就不提交
			if($("#zx_img").val()==""){
			showTanChuang("请上传图片后再提交！");
			return false;
			}
		})
		$("#zx_img").change(function(){
			 if(this.files[0].size>2048*1024){
				$(this).val("")
				showTanChuang("请上传小于2M的图片！");
				return;
			} 
			var fileStr=$(this).val();
			if(fileStr.indexOf("\.")!=-1){
				fileStr=fileStr.slice(fileStr.lastIndexOf("\.")+1).toLowerCase();
			}
			if(!/^(jpg)|(png)$/.test(fileStr)){
				$(this).val("")
				showTanChuang("请上传jpg或png格式的图片！");
				return;
			}
		});
		$("#zx_img").change(function (e) {
            //获取目标文件
            var file = e.target.files || e.dataTransfer.files;
            //如果目标文件存在
            if (file) {
                //定义一个文件阅读器
                var reader = new FileReader();
                //文件装载后将其显示在图片预览里
                reader.onload = function () {
                    $(".img_preview").attr("src", this.result);
                }
                //装载文件
                reader.readAsDataURL(file[0]);
            }
        });
	$("#queDing").click(function(){
		$("#XGMMTanChuang").hide();
		$(".tanChuangBG").hide();
	});
	
	if("${requestScope.successTX}"!=""){
		showTanChuang("${requestScope.successTX}");
	}
})
function showTanChuang(str){
	$(".tanChuang .tanBody").text(str);
	$("#XGMMTanChuang").show();
	$(".tanChuangBG").show();
}
$(".tanChuang").draggable({ 
	handle:'.tanHead' ,
	cursor:'default'
}); 
</script>
</html>
