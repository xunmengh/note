<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/3/3
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>animate</title>
  <script src="jquery-2.0.3.js"></script>
</head>
<body>
<script type="text/javascript">

  $(function(){
        $("#animate").click(function(){
//            $("#div1").toggle(1000);

//            $("#div1").slideToggle(1000);

//            $("#div1").fadeToggle(1000);
            // linear , swing ,queue:false
            /*
            *  stop 停止当前运动
            *  stop(true) 停止所有的操作
            *  stop(true,true)
            *  finish() 到达终点状态
            * */
            $("#div1").animate({width:"toggle",height:'toggle',opacity:'toggle'},1000,'linear',
            function(){
                console.info('运动完毕');
            })
        })
  })
</script>

<button id="animate">点击</button>
<div id="div1" style="width: 100px;height: 100px;background-color: red"></div>
</body>
</html>
