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
    <script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/jsapi.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/format+zh_CN,default,corechart.I.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/jquery.gvChart-1.0.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/static/js/jquery.ba-resize.min.js"></script>
    <script type="text/javascript">
    gvChartInit();
    jQuery(document).ready(function(){
    
    jQuery('#myTable5').gvChart({
            chartType: 'PieChart',
            gvSettings: {
                vAxis: {title: 'No of players'},
                hAxis: {title: 'Month'},
                width: 650,
                height: 250
                }
        });
                
    
    function mytime(){
      var today=new Date();
      var day=today.getDay();
      var date=today.toLocaleDateString();
      var time=today.toLocaleTimeString();  
      var arr_week=new Array("星期天","星期一","星期二","星期三","星期四","星期五","星期六");
      var week=arr_week[day];
      var now=date+" &nbsp; "+week+" &nbsp;"+time;
         return now; 
      }
     setInterval(function(){$("#time").html(mytime())},0)

        });
        </script>

</head>

<body>
<!--<div class="place"> <span>位置：</span>
          <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">工作台</a></li>
  </ul>
        </div>-->
<div class="welinfo"> <span></span><b>${sessionScope.name}您好，欢迎登录天下房屋托管系统</b><div class="y"><img src="<%=basePath %>/static/images/sun.png" alt="天气"><span id="time"></span></div> </div>
<div class="mainbox">
          <div class="mainleft">
    <div class="leftinfo">
              <div class="listtitle"><a href="#" class="more1">更多</a>数据统计</div>
              <div class="maintj">
        <table id='myTable5'>
                  <caption>
          出租房屋量统计
          </caption>
                  <thead>
            <tr>
                      <th></th>
                      <th>租房量</th>
                      <th>收房量</th>
                      <th>空置房</th>
                    </tr>
          </thead>
                  <tbody>
            <tr>
                      <td>20</td>
                      <td>16</td>
                      <td>4</td>
                    </tr>
                    
          </tbody>
                </table>
      </div>
            </div>
    <!--leftinfo end-->
    
    <div class="leftinfos">
              <div class="infoleft">
        <div class="listtitle"><a href="#" class="more1">更多</a>托管房屋</div>
        <ul class="newlist">
                  <li><a href="#">上海自贸区今日正式挂牌成立</a><b>10-09</b></li>
                  <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a><b>10-08</b></li>
                  <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a><b>10-09</b></li>
                  <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a><b>10-06</b></li>
                  <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a><b>10-05</b></li>
                  <li><a href="#">中央巡视组：重庆对一把手监督不到位</a><b>10-04</b></li>
                  <li><a href="#">囧!悍马没改好成华丽马车(图)</a><b>10-03</b></li>
                </ul>
      </div>
              <div class="inforight">
        <div class="listtitle"><a href="#" class="more1">更多</a>租出房屋</div>
         <ul class="newlist">
                  <li><a href="#">上海自贸区今日正式挂牌成立</a><b>10-09</b></li>
                  <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a><b>10-08</b></li>
                  <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a><b>10-09</b></li>
                  <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a><b>10-06</b></li>
                  <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a><b>10-05</b></li>
                  <li><a href="#">中央巡视组：重庆对一把手监督不到位</a><b>10-04</b></li>
                  <li><a href="#">囧!悍马没改好成华丽马车(图)</a><b>10-03</b></li>
                </ul>
      </div>
            </div>
  </div>
          <!--mainleft end-->
          
          <div class="mainright">
    <div class="dflist">
              <div class="listtitle"><a href="#" class="more1">更多</a>员工信息</div>
              <ul class="newlist">
        <li><a href="#">上海自贸区今日正式挂牌成立</a></li>
        <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a></li>
        <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a></li>
        <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a></li>
        <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a></li>
        <li><a href="#">中央巡视组：重庆对一把手监督不到位</a></li>
        <li><a href="#">囧!悍马没改好成华丽马车(图)</a></li>
        <li><a href="#">澳门黄金周加派稽查人员监察出租车违规行为</a></li>
        <li><a href="#">香港环境局长吁民众支持政府扩建堆填区</a></li>
      </ul>
            </div>
    <div class="dflist1">
              <div class="listtitle"><a href="#" class="more1">更多</a>待办事项</div>
              <ul class="newlist">
        <li><a href="#">上海自贸区今日正式挂牌成立</a></li>
        <li><a href="#">习近平将访东南亚两国 首次出席APEC峰会</a></li>
        <li><a href="#">最高法:谎称炸弹致航班备降者从重追刑责</a></li>
        <li><a href="#">华北大部遭遇雾霾天 北京全城陷重污染</a></li>
        <li><a href="#">"环保专家"董良杰涉嫌寻衅滋事被刑拘</a></li>
        <li><a href="#">中央巡视组：重庆对一把手监督不到位</a></li>
        <li><a href="#">中央巡视组：重庆对一把手监督不到位</a></li>
      </ul>
            </div>
  </div>
          <!--mainright end--> 
          
        </div>
</body>
		<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>
