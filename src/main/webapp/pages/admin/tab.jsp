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
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">公司任务</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">任务详情</a></li> 
    <li><a href="#tab2">人事通知</a></li> 
    <li><a href="#tab3">自定义</a></li> 
  	</ul>
    </div>     
    <ul class="seachform" style="margin-top:20px;">
    
    <li><label>查询方式</label>  
    <div class="vocation">
    <select class="select3">
    <option selected="selected"></option>
    <option></option>
    </select>
    </div>
    </li>
    
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
    
    </ul>
 
    
  	<div id="tab1" class="tabson">    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
        <th>标题</th>
        <th>发布者</th>
        <th>内容</th>
        <th>发布时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
    
        </tbody>
    </table>  
    
    <div class="pagin">
        <div class="message">共<i class="blue">8</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
          <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
          <li class="paginItem  current"><a href="javascript:;">1</a></li>
          <li class="paginItem"><a href="javascript:;">2</a></li>
          <li class="paginItem"><a href="javascript:;">3</a></li>
          <li class="paginItem"><a href="javascript:;">4</a></li>
          <li class="paginItem"><a href="javascript:;">5</a></li>
          <li class="paginItem more"><a href="javascript:;">...</a></li>
          <li class="paginItem"><a href="javascript:;">10</a></li>
          <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
      </div>  
    </div> 
    
    
  	<div id="tab2" class="tabson">    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
        <th>标题</th>
        <th>发布者</th>
        <th>内容</th>
        <th>发布时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
    
        </tbody>
    </table>  
    <div class="pagin">
        <div class="message">共<i class="blue">8</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
          <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
          <li class="paginItem  current"><a href="javascript:;">1</a></li>
          <li class="paginItem"><a href="javascript:;">2</a></li>
          <li class="paginItem"><a href="javascript:;">3</a></li>
          <li class="paginItem"><a href="javascript:;">4</a></li>
          <li class="paginItem"><a href="javascript:;">5</a></li>
          <li class="paginItem more"><a href="javascript:;">...</a></li>
          <li class="paginItem"><a href="javascript:;">10</a></li>
          <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
      </div>  
    </div> 
    
    <div id="tab3" class="tabson">    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="<%=basePath %>/static/images/px.gif" /></i></th>
        <th>标题</th>
        <th>发布者</th>
        <th>内容</th>
        <th>发布时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
       <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>江苏南</td>
        <td>admin</td>
        <td>京王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>2013-09-09 15:05</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
    
        </tbody>
    </table>  
    <div class="pagin">
        <div class="message">共<i class="blue">8</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
          <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
          <li class="paginItem  current"><a href="javascript:;">1</a></li>
          <li class="paginItem"><a href="javascript:;">2</a></li>
          <li class="paginItem"><a href="javascript:;">3</a></li>
          <li class="paginItem"><a href="javascript:;">4</a></li>
          <li class="paginItem"><a href="javascript:;">5</a></li>
          <li class="paginItem more"><a href="javascript:;">...</a></li>
          <li class="paginItem"><a href="javascript:;">10</a></li>
          <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
      </div>  
    </div> 
    
   
    
   
  
    
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
