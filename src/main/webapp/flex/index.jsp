<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
  <title>flex</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style type="text/css">

      ul{
          border: 1px solid red;
          background-color: #e8e8e8;
          list-style: none;
      }
      ul.flex{
          display: flex;
          flex-direction:row ; /* 主轴方向  row-reverse  column*/
          flex-wrap:nowrap  ;/* wrap nowrap 不能换行 */
          justify-content:space-around ;/* center space-between  space-around*/
      }

      li{
          width: 200px;
          height:200px;
          background-color: blue;
          margin: 8px;
      }
  </style>
</head>
<body>

    <ul class="flex">
        <li>1</li>
        <li>2</li>
        <li>3</li>
    </ul>

    <ul class="flex">
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
        <li>6</li>
        <li>7</li>
        <li>8</li>
    </ul>


    <ul >
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
    </ul>


</body>
</html>
