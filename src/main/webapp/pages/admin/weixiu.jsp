<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>租房维修</title>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/editor/kindeditor.js"></script>
<script src="<%=basePath %>/static/js/jquery.datepair.min.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
    });
  </script>
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
    <li><a href="#">租房维修</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li><a href="#tab1" class="selected">租房维修</a></li>
      </ul>
    </div>
    <div id="tab1" class="tabson">
      <form action="doform.html" method="get">
           <ul class="forminfo">

         <li>
          <label>小区名称<b>*</b></label>
          <input name="" type="text" class="dfinput" placeholder="请填写小区名称"  style="width:345px;"/>
        </li>
         <li>
          <label>租客姓名<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:100px;"/>
        </li>
        <li>
          <label>租客电话<b>*</b></label>
          <input name="" type="text" class="dfinput" value=""  style="width:100px;"/>
        </li>
        <li>
          <label>维修时间<b>*</b></label>
        
          <input name="" type="text"  style="text-align:center;width:120px;" class="dfinput" value="" id="c-xl">&nbsp;&nbsp;到&nbsp;&nbsp;
          <input name="" type="text"  style="text-align:center;width:120px;"  class="dfinput" value=""  id="c-x2"/>

        
        </li>
        <script type="text/javascript" src="<%=basePath %>/static/js/laydate.dev.js"></script>
        <script type="text/javascript">
        laydate({
            elem: '#c-xl'
        });
        laydate({
            elem: '#c-x2'
        });
    </script>

        <li>
          <label>维修描述<b>*</b></label>
          <textarea id="content7" name="content" style="width:700px;height:250px;visibility:hidden;"></textarea>
        </li>
        <li>
          <label>&nbsp;</label>
          <input name="" type="submit" class="btn" value="添加"/>
        </li>
      </ul>
      </form>
      
    </div>
  </div>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script> 
</div>
</body>


</html>
