<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/3/3
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>原型</title>
</head>
<body>
    <script type="text/javascript">

      function A(){
          var s="3";
      }

      // 修改了构造函数的指向
      A.prototype={
         constructor:A,
         name :10
      }

      var  a=new A();
      alert(a.constructor);

      /*
      * init  方法
      *   $()
      *   "<li>" "<li>hello</li>"   match = [ null, selector, null ];
      *   ""
      * */

    </script>
</body>
</html>
