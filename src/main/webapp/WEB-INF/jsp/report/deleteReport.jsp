<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2016/11/2
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>删除报告</title>
  <jsp:include page="/plug-in/bss/pages/inc_ext_resources.jsp"></jsp:include>
  <script src="/plug-in/report/jquery.min.js"></script>
  <script type="text/javascript">
    $(function(){
        var d = top.LBUI.getActiveDialog();
        if (d) {
            d.setWidth(400);
            d.setHeight(170);
            d.setTitle("删除报告");
            d.center();
        }

        $("#btn-cancel").click(function(){
            d.close();
        });

       $("#btn-ok").click(function(){
           $.ajax({
               type:'POST',
               url:'/bss/report/json/deleteReport.sdo',
               dataType:'json',
               data:{"reportId":"${param.reportId}"},
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
    })
  </script>
</head>
<body>
      <div style="padding: 12px">
          <div style="text-align:center; font-size:14px; color:#666; margin-top: 30px">
              您确定要删除报告【${param.reportTitle}】吗?
          </div>
          <div style="padding-top: 10px; text-align: center;position: fixed; bottom: 10px; left: 50%;margin-left:-59px">
              <button id="btn-ok" style="margin-right: 12px">确定</button>
              <button id="btn-cancel">取消</button>
          </div>
      </div>

</body>
</html>
