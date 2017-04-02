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
    <title>attr class </title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">

   $(function(){

       var div1=document.getElementById('div1');
       div1.setAttribute("title",'hello');//attr
       div1.setAttribute("attr",'attr');
       div1['title']='hello';//prop

       div1.setAttribute("title",'hello');//attr
       div1['prop']='prop';

       console.info($("#div1").attr('title'));

       /*方法添加class*/
       $("div").addClass(function(i,className){
           console.info(className);
           return "div"+i;
       })

//       $('input[type="checkbox"]').val([2]); //选中值为2的元素

       $('input[type="checkbox"][value="3"]').attr("checked",true); //选
//       $("div").toggleClass("className",true|false);true:add ,false remove
   })


    </script>

    <div id="div1" class="de"> hello</div>
    <div id="div2" class="de"> hello</div>
    <div id="div3" class="de"> hello</div>

    1:<input type="checkbox" value="1">
    2:<input type="checkbox" value="2">
   3: <input type="checkbox" value="3">
</body>
</html>
