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
  <title>dom 选择</title>
  <script src="jquery-2.0.3.js"></script>
</head>
<body>
<script type="text/javascript">

  $(function(){
    //对div
    $("div",".container1").filter('.box').css({"border":'1px solid red'});
    $("div",".container1").not('.box').css({"border":'3px solid yellow'});
    $("div",".container1").has("span").css("background-color",'blue');// 包含span的div元素

    $("div",".container1").filter(function(i,elem){
       return elem.className="box"
    }).html('function');



    $(".container2 div").find('span').css({"border":'1px solid red'}).addBack().css({"padding-top":"30px"});

    console.info($("#div3").index()); // 在兄弟节点中的索引

    //在最近的父类元素中查找，包含当前元素
    $("#div3").closest('.container2').css({"border":'1px solid red'});

    // 集合的  ∪ 操作
    $(".container1").add(".container2").css({'padding-left':'100px'});

  })


</script>

<div class="container1">
  <div id="div1" class="box" style="width: 100px;height: 100px;">

  </div>

  <div id="div2" style="width: 100px;height: 100px;">
    <span>223</span>
  </div>
</div>

<div class="container2">
  <div class="box" style="width: 100px;height: 100px;">
       2box
  </div>

  <div  style="width: 100px;height: 100px;">
    <span>222</span>
  </div>

  <div  style="width: 100px;height: 100px;" id="div3">
    <span>333</span>
  </div>

  <div  style="width: 100px;height: 100px;">
    <span>444</span>
  </div>
</div>
</body>
</html>
