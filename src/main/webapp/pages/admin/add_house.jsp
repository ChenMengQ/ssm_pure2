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
    <style type="text/css">
        .msg{
            color:red;
            font-size: 12px;
        }
    </style>
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
    <li><a href="#">房源托管</a></li>
    <li><a href="#">添加房源</a></li>
  </ul>
</div>
<div class="formbody">
  <div id="usual1" class="usual">
    <div class="itab">
      <ul>
        <li>
            <a href="#tab1" class="selected">添加房源</a>
            <span class="msg">${requestScope.resultMap.msg3}</span>
        </li>
      </ul>
    </div>
    <div id="tab1" class="tabson">
      <form action="<%=basePath %>/tuoGuan/addHouse2DB.do" method="POST">
           <ul class="forminfo">
         <li>
          <label>小区名称<b>*</b></label>
          <input name="xiaoQuMing" type="text" value="${requestScope.house.xiaoQuMing}" class="dfinput" placeholder="请填写小区名称" style="width:345px;"/>
             <span class="msg">${requestScope.errorMap.xiaoQuMing}</span>
         </li>
         <li>
          <label>房东姓名<b>*</b></label>
          <%--<input name="" type="text" class="dfinput" value=""  style="width:100px;"/>--%>
             <div class="cityleft">
                 <select class="select2" name="ownerId"  >
                     <c:forEach items="${requestScope.ownerList}" var="ownerMap">
                        <option style="width: 300px" ${ownerMap.id==house.ownerId?'selected':''} value="${ownerMap.id}">${ownerMap.NAME}-${ownerMap.tel}</option>
                     </c:forEach>
                 </select>
             </div>
             <span class="msg">${requestScope.resultMap.msg1}</span>
             <span class="msg">${requestScope.errorMap.ownerId}</span>
        </li>
        <li>
          <label>业务员姓名<b>*</b></label>
          <input type="text" class="dfinput" value="${sessionScope.name}" readonly style="width:100px;"/>
        </li>
       <li>
           <label style="width: 150px">位置(栋->单元->房号)<b>*</b></label>
           <%--栋--%>
           <input name="dong" value="${requestScope.house.dong}" type="text" class="dfinput" style="width:80px;"/>
           <%--单元--%>
           <input name="danYuan" value="${requestScope.house.danYuan}" type="text" class="dfinput" style="width:80px;"/>
           <%--房号--%>
           <input name="fangHao" type="text" value="${requestScope.house.fangHao}" class="dfinput" style="width:80px;"/>
       </li>
        <li>
          <label>房屋户型<b>*</b></label>
          <div class="usercity">

            <div class="cityleft">
              <select name="shi" class="select2">
                <option value="1">1室</option>
                <option value="2">2室</option>
                <option value="3">3室</option>
                <option value="4">4室</option>
              </select>
            </div>
            <div class="cityleft">
              <select name="ting" class="select2">
                <option value="0">0厅</option>
                <option value="1">1厅</option>
                <option value="2">2厅</option>
              </select>
            </div>
              <div class="cityleft">
                  <select name="chu" class="select2">
                      <option value="0">0厨</option>
                      <option value="1">1厨</option>
                      <option value="2">2厨</option>
                  </select>
              </div>
             <div class="cityleft">
              <select name="wei" class="select2">
                <option value="0">0卫</option>
                <option value="1">1卫</option>
                <option value="2">2卫</option>
              </select>
            </div>
             <div class="cityleft">
              共&nbsp;&nbsp;<input name="mianJi" value="${requestScope.house.mianJi}" type="text" class="dfinput" value=""  style="width:45px;"/>&nbsp;&nbsp;㎡
                 <span class="msg">${requestScope.errorMap.mianJi}</span>
             </div>
          </div>
        </li>
        <li>
          <label>托管时间<b>*</b></label>
        
          <input name="tuoGuanBegin" type="text" value="${requestScope.house.tuoGuanBegin}"  style="text-align:center;width:120px;" class="dfinput" value="" id="c-xl">&nbsp;&nbsp;到&nbsp;&nbsp;
          <input name="tuoGuanEnd" type="text" value="${requestScope.house.tuoGuanEnd}"  style="text-align:center;width:120px;"  class="dfinput" value=""  id="c-x2"/>
            <span class="msg">${requestScope.resultMap.msg2}</span>
            <span class="msg">${requestScope.errorMap.tuoGuanBegin}</span>
            <span class="msg">${requestScope.errorMap.tuoGuanEnd}</span>
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
          <label>托管金额<b>*</b></label>
          <input name="shouFangMoney" value="${requestScope.house.shouFangMoney}" type="text" class="dfinput" placeholder="请输入金额数"  style="width:345px;"/>&nbsp;&nbsp;元
            <span class="msg">${requestScope.errorMap.shouFangMoney}</span>
        </li>
       
        <li>
          <label>房源描述<b>*</b></label>
          <textarea id="content7" name="xiangQing" value="${requestScope.house.xiangQing}" style="width:700px;height:250px;visibility:hidden;"></textarea>
            <span class="msg">${requestScope.errorMap.xiangQing}</span>
        </li>
        <li>
          <label>&nbsp;</label>
          <input type="submit" class="btn" value="添加"/>
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
