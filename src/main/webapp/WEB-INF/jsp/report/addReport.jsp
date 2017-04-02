<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2016/11/2
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<% String contentPath=request.getContextPath()+"/"; %>
<html>
<head>
  <base href="<%=contentPath%>" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>增加报告</title>
  <script src="report/jquery.min.js"></script>
  <script type="text/javascript">
    $(function(){


        $("#btn-ok").click(function(){
          var reportTitle=$.trim($("#reportTitle").val());
          if(""== reportTitle){
             alert("报告名称不能为空");
             return false;
          }
          if(reportTitle.length>250){
              alert("报告名称最多250个字符");
              return false;
          }
          $.ajax({
            type:'POST',
            url:'/bss/report/json/addReport.sdo',
            dataType:'json',
            data:{"reportTitle":reportTitle},
            success:function(result){
                alert(result.msg);
               if(parseInt(result.code)>0){
                   d.on('close', function (e) {
                       var fun = d.fun;
                       fun.callback({
                           retVal: 2,
                           success: true,
                           message: null
                       });
                   });
                   d.close();
               }
            },error:function(){
               alert("网络异常！");
            }
          })
        });

        $('#btn-cancel').click(function(){
            d.close();
        })
    })
  </script>
</head>
<body>
<div style="padding: 12px">
    <div style="text-align:left; font-size:14px; color:#666; margin-top: 30px">报告名称： <input id="reportTitle" style="width:220px" maxlength="250"/></div>
    <div style="padding-top: 10px; text-align: center;position: fixed; bottom: 10px; left: 50%;margin-left:-59px">
        <button id="btn-ok" style="margin-right: 12px">确定</button>
        <button id="btn-cancel">取消</button>
    </div>
</div>

</body>
</html>
