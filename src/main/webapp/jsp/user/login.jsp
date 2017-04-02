<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
    <title>登录页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${contextPath}/plugin/bootstrap/css/bootstrap.css"  />
    <script src="${contextPath}/plugin/jquery/jquery.min.js"></script>
    <script src="${contextPath}/plugin/bootstrap/js/bootstrap.js"></script>

    <link rel="stylesheet" href="${contextPath}/plugin/bootstrapvalidator/css/bootstrapValidator.css"  />
    <script src="${contextPath}/plugin/bootstrapvalidator/js/bootstrapValidator.js"></script>
    <script src="${contextPath}/plugin/bootstrapvalidator/js/language/zh_CN.js"></script>

    <!--
    http://blog.csdn.net/gya747283747/article/details/51684538
        http://formvalidation.io/validators/
        1. 确定有哪几种 验证方式
        2. 提交 重设
        3. 用户名一部校验
    -->
</head>
<body>

      <form id="loginForm" action="${contextPath}/user/login.do" method="post" class="form-horizontal">
          <div class="form-group">
              <label  class="col-sm-2 control-label">用户名</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" name="username" id="username"  placeholder="用户名">
              </div>
          </div>
          <div class="form-group">
              <label class="col-sm-2 control-label">密码</label>
              <div class="col-sm-8">
                  <input type="password" class="form-control" name="password" id="password" placeholder="密码">
              </div>
          </div>
          <div class="form-group">

          </div>

          <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                  <button id="loginBtn" type="button" class="btn btn-default">确认</button>
                  <button id="resetBtn"  type="button" class="btn btn-info">重置</button>
              </div>
          </div>
      </form>


      <script type="text/javascript">
          $(function(){
              $("#loginBtn").click(function(){
                  var username=$("#username").val();
                  var password=$("#password").val();
                  if(username=="" || password==""){
                      alert('用户名和密码不能为空！');
                  }else{
                      $.ajax({
                          url:'${contextPath}/user/login.do',
                          method:'post',
                          data:{username:username,password:password},
                          dataType:'json',
                          success:function(result){
                              if(result.code>0){
                                  window.location.href="${contextPath}/user/index.do";
                              }else{
                                  alert(result.msg);
                              }
                          },error:function(result){
                              alert(result);
                          }
                      });
                  }
              })

          });
      </script>

</body>
</html>