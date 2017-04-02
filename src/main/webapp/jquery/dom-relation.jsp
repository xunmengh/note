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
  <title>dom关系选择</title>
  <script src="jquery-2.0.3.js"></script>
</head>
<body>
<script type="text/javascript">

  $(function(){
    // parent 直接父节点
     $("#span1").parent().css({"border":"1px solid red"});
    // 所有的div父节点
    $("#span2").parents('div').css({"border":"1px solid yellow"});
    // util 不包含
    $("#span3").parentsUntil('body').css({"border":"1px solid blue"});
    $("#li2").siblings().css("background-color","red");
    $("#li2").prevAll()
    $("#li22").nextAll().css("background-color","red");
    $("#ul3").children().css("background-color","red");

  })


</script>

<div class="container1">
  <div id="div1" class="box" style="width: 100px;height: 100px;">
       <span id="span1">span1</span>
  </div>

  <div id="div2" style="width: 100px;">
    <ul  id="ul1">
      <li>1</li>
      <li id="li2">2</li>
      <li>3</li>
      <li>4</li>
    </ul>

    <ul  id="ul2">
      <li>1</li>
      <li id="li22">2</li>
      <li>3</li>
      <li>4</li>
    </ul>

    <ul  id="ul3">
      <li>1</li>
      <li >2</li>
      <li>3</li>
      <li>4</li>
    </ul>
  </div>
</div>

<div class="container2">
  <div class="box" style="width: 100px;height: 100px;">
    <span id="span2">span1</span>
  </div>

  <div  style="width: 100px;height: 100px;">
    <span>222</span>
  </div>

  <div  style="width: 100px;height: 100px;" id="div3">
    <span>333</span>
  </div>
</div>

<div class="container3">
  <div class="box" style="width: 100px;height: 100px;">
    <span id="span3">span3</span>
  </div>
  <div  style="width: 100px;height: 100px;">

  </div>

</div>
</body>
</html>
