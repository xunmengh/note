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
  <title>相对定位</title>
  <script src="jquery-2.0.3.js"></script>
    <style>
        body{
            margin: 0 0;
        }
    </style>
</head>
<body>

<script type="text/javascript">

  $(function(){
       console.info($("#div1").offset());// 相对于屏幕的定位
      console.info($("#div2").offset());
      console.info($("#div2").position()); //相对于父元素的定位。
      console.info($("#div1").get(0).getBoundingClientRect());// 获得可视区域的位置

      // offsetparent
      $("#div3").click(function(){
          console.info(window.pageXOffset);
          console.info(window.pageYOffset);
          $(window).scrollTop(); //获得滚动距离
          $(window).scrollLeft(); //获得滚动距离
      })

      $("#div1").offset(function(i,opt){
          console.info(opt);
          return opt;
      })

  })
</script>

<div id="div3" style="width:1500px;height: 1500px;border: 1px solid red;">

</div>
<div id="div1" style="width: 200px;height: 200px; margin:50px 50px; padding:24px 45px; background-color: red;position: relative;">
    <div id="div2" style="width: 100px;height: 100px; margin:50px 50px; padding:30px 30px;background-color: yellow">

    </div>
</div>

</body>
</html>
