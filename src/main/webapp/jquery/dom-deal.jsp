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
  <title>dom操作处理</title>
  <script src="jquery-2.0.3.js"></script>
</head>
<body>
<script type="text/javascript">

  $(function(){
    // parent 直接父节点


    $("#div1").remove(); // data 和事件都会删除

    $("#div2").data("data","div2")
    $("#div2").click(function(){
        alert($(this).data('data'));
    });
    var $div2=$("#div2").detach();// 不会删除，在添加到文档中事件和 data 都在

    $(".container1").append($div2);

    $("#div3").click(function(){
      alert('div3');
    });

    $("#span3").click(function(){
      alert('span3');
      return false;
    });

    var $div3=$("#div3").clone(true,true);  //clone 复制元素和事件

    $(".container2").empty();// 清空内容

    $(".container2").text("hello");

    $(".container2").append($div3);

    $(".container3").html("<div><span style='color: red'>123</span></div>");

    $(".container3").prepend('<span>prepend</span>');

    $(".container3").after('<div class="container5">div5</div>');

    $(".container5").before('<div class="container4">div4</div>');


    $("#wrap span").wrapAll('<div class="wrap"><p></p></div>');
    $("#wrap span").unwrap(); //删除父元素节点

    $("#wrap span").wrap("<div><p></p></div>");// 被包含

    $("#wrap span").wrapInner("<span>wrapInner</span>"); // 内包含  wrapAll

  })


</script>

<div id="wrap">

    <span>1</span>
    <span>2</span>
    <span>3</span>


</div>

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

  </div>
</div>

<div class="container2">
  <div class="box" id="div3" style="width: 100px;height: 100px;background-color: red;">
    <span id="span3">span1</span>
  </div>

  <div  style="width: 100px;height: 100px;">
    <span>222</span>
  </div>

</div>

<div class="container3">
  <div class="box" style="width: 100px;height: 100px;">
    <%--<span id="span3">span3</span>--%>
  </div>
  <div  style="width: 100px;height: 100px;">

  </div>

</div>


</body>
</html>
