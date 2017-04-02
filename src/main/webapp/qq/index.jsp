<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
  <title>qq空间</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${contextPath}/plugin/bootstrap/css/bootstrap.css"  />
  <script src="${contextPath}/plugin/jquery/jquery.min.js"></script>
  <script src="${contextPath}/plugin/bootstrap/js/bootstrap.js"></script>

  <style type="text/css">

      .logo{
          float: left;
          width: 90px;
          height: 41px;
          background-image: url(qq.png);
          background-position: -63px 0;
          line-height: 123px;
          overflow: hidden;
          display: flex;
      }

      .icon-friend{
          width: 16px;
          height: 16px;
        /*  position: absolute;*/
        /*  left: 10px;
          top: 12px;*/
          background-image: url(qq.png);
          background-position: -536px -26px;
      }

         .fix-nav{
             background-color:#000000 ;
             position: fixed;
             z-index: 1;
             width: 100%;
             height: 41px;
             top:0px;
             line-height: 40px;
           /*  text-align: center;*/

         }

      .nav-left{
        /*  display: inline-block;*/
         /* vertical-align: middle;*/
      }
         li{
             color: #FFF !important;
         }
  </style>
</head>
<body>

   <div id="nav" class="fix-nav">
        <div class="container nav-left">
            <a href="#">
                <span class="glyphicon glyphicon-star " style="font-size: 20px;"></span>QQ空间
            </a>
            <ul class="nav navbar-nav">
                <li>
                    <a>
                    <span class="glyphicon glyphicon-user"></span>
                    <span>个人中心</span>
                    </a>
                </li>
                <li>
                    <a>
                    <span class="glyphicon glyphicon-home"></span>
                    <span>我的主页</span>
                    </a>
                </li>
                <li>
                    <a>
                    <i class="icon-friend"></i>
                    <span>好友</span>
                    </a>
                </li>
                <li>
                    <a>
                    <span class="glyphicon glyphicon-th-large"></span>
                    <span>游戏</span>
                    </a>
                </li>
                <li>
                    <a>
                    <span class="glyphicon glyphicon-star"></span>
                    <span>装扮</span>
                    </a>
                </li>
            </ul>
        </div>
   </div>

   <div class="container" style="margin-top: 41px;">
       <div style="height: 200px;">1</div>
       <div style="height: 600px;">11</div>
       <div style="height: 600px;">111</div>
       <div style="height: 600px;">1111</div>
   </div>
</body>
</html>
