<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
    <title>注册页面</title>
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
    <style type="text/css">

    </style>
</head>
<body>
      <%--<div class="container" >
          <div class="row">
              <div class="col-lg-offset-5 col-lg-2">
                  <span style="padding: 20px 10px;">用户注册</span>
              </div>
          </div>
      </div>--%>
      <form id="registerForm" action="${contextPath}/user/register.do" class="form-horizontal">
          <div class="form-group">
              <label  class="col-lg-2 control-label">用户名</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" name="username"  placeholder="用户名" data-bv-threshold="6">
              </div>
          </div>
          <%--<div class="form-group">
              <label  class="col-sm-2 control-label">生日</label>
              <div class="col-sm-8">
                  <input  class="form-control" name="birthday"  placeholder="生日">
              </div>
          </div>
          <div class="form-group">
              <label  class="col-sm-2 control-label">性别</label>
              <div class="col-sm-8">
                  <label class="radio-inline">
                      <input type="radio" name="sex" id="inlineRadio1" value="女"> 女
                  </label>
                  <label class="radio-inline">
                      <input type="radio" name="sex" id="inlineRadio2" value="男"> 男
                  </label>
              </div>
          </div>
          <div class="form-group">
              <label  class="col-sm-2 control-label">手机号码</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" name="phone"  placeholder="手机号码">
              </div>
          </div>--%>

          <div class="form-group">
              <label  class="col-sm-2 control-label">邮箱</label>
              <div class="col-sm-8">
                  <input type="email" class="form-control" name="email" placeholder="Email">
              </div>
          </div>
          <div class="form-group">
              <label class="col-sm-2 control-label">密码</label>
              <div class="col-sm-8">
                  <input type="password" class="form-control" name="password" placeholder="密码">
              </div>
          </div>
          <div class="form-group">
              <label class="col-sm-2 control-label">确认密码</label>
              <div class="col-sm-8">
                  <input type="password" class="form-control" name="confirmPassword" placeholder="确认密码">
              </div>
          </div>
          <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                  <button id="registerBtn" type="submit" class="btn btn-default">注册</button>
                  <button id="resetBtn"  type="button" class="btn btn-info">重置</button>
              </div>
          </div>
      </form>

      <!--
            少一个type 引发的问题
      -->

      <script type="text/javascript">
          $(function(){
              $('#registerForm').bootstrapValidator({
                          message: 'This value is not valid',
                          feedbackIcons: {
                              valid: 'glyphicon glyphicon-ok',
                              invalid: 'glyphicon glyphicon-remove',
                              validating: 'glyphicon glyphicon-refresh'
                          },
                           fields: {
                              username: {
                                  message: 'The username is not valid',
                                  validators: {
                                      notEmpty:{
                                          message:'用户名不能为空！'
                                      },
                                      regexp: {
                                          regexp: /^[a-zA-Z0-9]{6,30}$/,
                                          message: '用户名由6~30字符组成！'
                                      },
                                      remote: {
                                       type: 'POST',
                                       url: '${contextPath}/user/exist.do',
                                       delay:500,
                                       message: 'User name already exists'
                                      }
                                  }
                              },
                              email:{
                                  validators:{
                                      notEmpty:{
                                          message:'邮箱不能为空！'
                                      }
                                  }
                              },
                              password:{
                                  validators: {
                                      notEmpty:{
                                          message:'密码不能为空！'
                                      },
                                      regexp: {
                                          regexp: /^[a-zA-Z0-9_\.]{6,30}$/,
                                          message: '密码由6~30个字符！'
                                      },
                                      identical: {
                                          field: 'confirmPassword',
                                          message: 'The password and its confirm are not the same'
                                      }
                                  }
                              },
                              confirmPassword:{
                                  validators:{
                                      identical: {
                                          field: 'password',
                                          message: '密码不相同！'
                                      }
                                  }
                              }

                          }

                      }

              ).on("success.form.bv",function(e){
                          e.preventDefault();
                          var $form = $(e.target);
                          var bv= $form.data('bootstrapValidator');
                          $.post($form.attr('action'), $form.serialize(), function(result) {
                              if(result.code>0){
                                    window.location.href='${contextPath}/jsp/user/login.jsp';
                              }else{
                                  alert(result.msg);
                                  bv.disableSubmitButtons(false);
                              }
                              //


                          },'json');
                      });

             /* $("body").keydown(function() {
                  if (event.keyCode == "13") {//keyCode=13是回车键
                      $('#registerBtn').click();
                  }
              });*/

            /*  $('#registerBtn').click(function() {
                  $('#registerForm').bootstrapValidator('validate');
              });*/

              $('#resetBtn').click(function() {
                 $('#registerForm').data('bootstrapValidator').resetForm(true);
              });
          });
      </script>

</body>
</html>