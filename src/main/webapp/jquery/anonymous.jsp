<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/3/3
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>匿名函数</title>
</head>
<body>
<%--  #1335 jquery bug--%>
  <script type="text/javascript">
    /*
    *  传window 参数， 一 加快变量的查找，二 支持压缩
    *  undefined ： 防止外部变量被修改。
    *
    * */
    (function(window,undefined){

    }(window,undefined))

    typeof window.a =='undefined' ;

    window.a== undefined;

    var  s=" ddd ";
    alert(s.trim());

    function jquery(){
      return new jquery.prototype.init();
    }

    jquery.prototype.init=function(){}

    jquery.prototype.alert=function(){
        alert('sd');
    }

    // jquery init原型指向 jquery 的原型
    jquery.prototype.init.prototype=jquery.prototype;

    jquery().alert();
  </script>
</body>
</html>
