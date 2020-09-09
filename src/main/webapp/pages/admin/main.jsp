<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta charset="utf-8" />
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/admin-all.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/base.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/css/jquery-ui-1.8.22.custom.css" />
    <link rel="stylesheet" href="<%=basePath %>/static/js/sweetalert/sweetalert.css">
    <%--<script type="text/javascript" src="<%=basePath %>/static/js/jquery-1.7.2.js"></script>--%>
<script src="<%=basePath%>/static/js/jquery-1.8.2.min.js"></script>
    <script src="<%=basePath %>/static/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/index.js"></script>
<script type="text/javascript" src="<%=basePath %>/static/js/accordion.js"></script>
</head>
<body>
<div class="warp"> 
  <!--头部开始-->
  <div class="top_c">
    <div class="top-menu">
      <ul class="top-menu-nav">
        <li><a target="Conframe" href="<%=basePath %>/pages/admin/index1.jsp">首页</a></li>
        <li><a href="<%=basePath %>/pages/admin/tab.jsp" target="Conframe">公司任务</a></li>
        <%--<li><a href="<%=basePath %>/pages/admin/yuangong.jsp" target="Conframe">员工管理</a></li>--%>
        <%--<li><a href="<%=basePath %>/pages/admin/gongzi_list.jsp" target="Conframe">账目管理</a></li>--%>
          <li><a href="javascript:void(0)" id="attendance">考勤打卡</a></li>
        <li><a href="<%=basePath %>/pages/admin/admin_manage.jsp" target="Conframe">角色设置</a></li>
        <li><a href="<%=basePath %>/pages/admin/xiuGaiTouXiang.jsp" target="Conframe">头像设置</a></li>
      </ul>
    </div>



      <div class="top-nav">
          <img style="width: 40px;height: 40px" src="<%=basePath %>/static/uploads/${sessionScope.touXiangPath}">
          上午好，欢迎您，${sessionScope.name}！&nbsp;&nbsp;<a href="<%=basePath %>/pages/admin/xiuGaiMiMa.jsp" target="Conframe">修改密码</a> | <a href="<%=basePath %>//user//logout.do">安全退出</a>
      </div>

  </div>
  <!--头部结束--> 
  <!--左边菜单开始-->
  <div class="left_c left tg">
    <h1>系统操作菜单</h1>
<script type="text/javascript">
$(function(){
   $(".nav").accordion({
        //accordion: true,
        speed: 500,
	    closedSign: '[+]',
		openedSign: '[-]'
	});

   //考勤打卡
    $("#attendance").click(function(){
        $.ajax({
            url:"<%=basePath %>/hr/addDaKa.do",
            type:"POST",
            dataType:"JSON",
            success:function(rs){
                var flag = rs.flag;
                var msg = (rs.msg==undefined)?'':rs.msg;
                if(flag){//打卡成功
                    swal({
                        title:"温馨提示",
                        text:"打卡成功,"+msg
                    })
                }else{//打卡失败
                    swal({
                        title:"温馨提示",
                        text:"打卡失败,"+msg
                    })
                }
            },
            error:function(rs){
                swal({
                    title:"警告提示",
                    text:"打卡失败"
                })
            }
        });

    });
}); 
</script>

<style>
ul{list-style:none}
.demo{ padding:10px; background:#f7f7f7;overflow:hidden;}
.nav { padding: 40px 28px 25px 0; font-family: "Microsoft yahei", Arial, Helvetica, sans-serif;} 
ul.nav {padding: 0; margin: 0; font-size: 13px; line-height: 0.5em; list-style: none;} 
ul.nav li {border:1px solid #ccc;margin:3px 0;border-radius:5px;} 
ul.nav li a {line-height: 10px; font-size: 14px; padding: 10px 5px; color: #0088cc; display: block; text-decoration: none; }
ul.nav li a:hover {background-color:#675C7C;    color:white;}
ul.nav ul { margin: 0; padding: 0;display: none;border-top:1px solid #ccc;} 
ul.nav ul li { margin: 0; padding: 0; clear: both;background:url(icon-forward.png) left center no-repeat;border:none;} 
ul.nav ul li a { padding-left: 20px; font-size: 12px; font-weight: normal;}
ul.nav ul li a:hover {background-color:#D3C99C; color:#675C7C;} 
ul.nav ul ul li a {color:silver; padding-left: 40px;} 
ul.nav ul ul li a:hover { background-color:#D3CEB8; color:#675C7C;} 
ul.nav span{float:right;}
</style>

    <div class="demo">
      <ul class="nav">
        <li><a href="#" target="_blank">房屋托管</a>
          <ul>
            <li  class="active"><a target="Conframe" href="<%=basePath %>/tuoGuan/toAddHousePage.do">添加房源</a> </li>
             <li><a target="Conframe" href="<%=basePath %>/tuoGuan/toFangYuanListPage.do">房源列表</a></li>
            <li><a target="Conframe" href="<%=basePath %>/tuoGuan/toFangDongListPage.do">房东信息</a></li>
          </ul>
        </li>
        <li><a href="#">房屋出租</a>
          <ul>
            <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/fangyuan.jsp">出租房源</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/zufanglie.jsp">住房列表</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/tz_list.jsp">退租计划</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/zuke.jsp">租客信息</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/weixiu.jsp">房屋维修</a></li>
          </ul>
        </li>
        <li><a href="#">财务管理</a>
          <ul>
            <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/sf_list.jsp">收房帐</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/zf_list.jsp">租房帐</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/bg_list.jsp">办工支出</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/gongzi_list.jsp">工资发放</a></li>
          </ul>
        </li>
        <li><a href="#">人事管理</a></a>
          <ul>
             <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/hr/getStaffInfo.do">员工管理</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/kaoqin_list.jsp">考勤管理</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=basePath %>/pages/admin/zhaopin_list.jsp">人员招聘</a></li>
          </ul>
        </li>
      </ul>
    </div>
      <div id="datepicker"></div>
  </div>
  
  <!--左边菜单结束--> 
  <!--右边框架开始-->
  <div class="right_c">
    <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>
  </div>
  <div class="Conframe  tg">
    <iframe name="Conframe" src="<%=basePath %>/pages/admin/index1.jsp" id="Conframe"></iframe>
  </div>
  <!--右边框架结束--> 
  
  <!--底部开始-->
  <div class="bottom_c">Copyright &copy;2016-2016 武汉天下科技有限公司 版权所有</div>
  <!--底部结束--> 
</div>
<script type="text/javascript" src="<%=basePath %>/static/js/jquery.nicescroll.js"></script>
<script type="text/javascript">
$(".tg").niceScroll({  
	cursorcolor:"#fff",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"0px",  
	cursorborder:"0",  
	cursorborderradius:"0px"  
}); 

</script>
</body>
</html>
