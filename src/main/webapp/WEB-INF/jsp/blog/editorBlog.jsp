<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/2/20
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>博客编写页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${contextPath}/plugin/bootstrap/css/bootstrap.css"  />
    <script src="${contextPath}/plugin/jquery/jquery.min.js"></script>
    <script src="${contextPath}/plugin/bootstrap/js/bootstrap.js"></script>

    <link rel="stylesheet" href="${contextPath}/plugin/bootstrapmarkdown/css/bootstrap-markdown.min.css" />
    <script src="${contextPath}/plugin/bootstrapmarkdown/js/markdown.js"></script>
    <script src="${contextPath}/plugin/bootstrapmarkdown/js/to-markdown.js"></script>
    <script src="${contextPath}/plugin/bootstrapmarkdown/js/bootstrap-markdown.js"></script>
    <script src="${contextPath}/plugin/bootstrapmarkdown/js/bootstrap-markdown.zh.js"></script>
</head>
<body>

<div class="container" style="width:100%;">
    <div class="row" style="padding-top: 10px;">
        <div class="col-md-offset-1 col-md-3 ">
            <label>标题：</label><input id="title" name="title" />
        </div>
        <div class="col-md-offset-3 col-md-3">
            <button id="saveBtn" class="btn  btn-info" <%--style="position: fixed;left: 20px;bottom: 20px;"--%>>保存</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <textarea id="content" style="height: 500px;padding-left: 10px;"></textarea>
        </div>
        <div class="col-md-6">
            <div id="transHtml"></div>
        </div>
    </div>


</div>



<script type="text/javascript">
    $("#content").markdown({
        autofocus:false,
        savable:false,
        language:'zh',
        fullscreen:{enable :false},
        hiddenButtons:['bootstrap-markdown-cmdBold']
    });
   $("#content").on('input',function(event){

      var val= markdown.toHTML( $("#content").val() );
       $("#transHtml")[0].innerHTML=val;
   });

    $("#saveBtn").click(function(){
        var title=$("#title").val();
        var content=$("#content").val();
        $.ajax({
            method:'post',
            url:'${contextPath}/blog/addBlog.do',
            data:{'content':content,'title':title} ,
            dataType:'json',
            success:function(result){
                console.info(result);
            },error:function(){
                console.info('错误');
            }
        })
    })
</script>
</body>
</html>
