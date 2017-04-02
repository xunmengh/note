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
  <title>css 样式操作</title>
  <script src="jquery-2.0.3.js"></script>
</head>
<body>
<script type="text/javascript">

  $(function(){
        /*
        * 设置样式  element.style.color=
        *
        * 获得样式  window.getComputedStyle()
        *
        *
        * width  innerWidth    outerWidth
        *
        *
        * dispaly  none
        * show(创建元素获得元素的默认display)  hide(保存上一次的display 值)  toggle
        *
        * */

    $(document.body).css("background-color",'blue');
    $("div").css({"width":"100px","height":"100px","background-color":"red"});
    $("#div1").css({"padding":"0 30px","border":'2px solid yellow',margin:"5px 5px"});
    $("#div2").css({"margin":"10px 30px"});



    $("#div2").width("+=100");
    console.info($("#div1").width());  //100
    console.info($("#div1").innerWidth()); //100 + padding 30 + 30
    console.info($("#div1").outerWidth()); // 100 + padding +border
    console.info($("#div1").outerWidth(true)); //100 + padding +border + margin

    console.info($(window).height());// 可视窗口的高度
    console.info($(document).height());// 文档的高度

    $("#div3").toggle();

    setTimeout(function(){
      $("#div3").toggle();
    },2000);

  })


</script>

<div id="div1">
asss
</div>
<div id="div2">
bbbb
</div>
<div id="div3" style="height: 1200px;">
  ccc
</div>

</body>
</html>
