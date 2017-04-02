<%@ page import="java.util.UUID" %>
<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2016/10/28
  Time: 10:50

  展示报告的页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>${reportTitle}</title>
  <script type="text/javascript" src="/plug-in/report/jquery.min.js"></script>
  <script type="text/javascript" src="/plug-in/glweb/internal/bss/js/app/bss.core.js"></script>
  <script type="text/javascript" src="/plug-in/bss/js/plugins/jquery.bss.echarts.helper.js"></script>
  <jsp:include page="/plug-in/bss/js/plugins/echarts/theme/echar_theme.jsp"></jsp:include>
  <script type="text/javascript">
  //隐藏工具栏图标
   if(BSS_DEFAULT_ECHARTS_SETTING && BSS_DEFAULT_ECHARTS_SETTING.LINE_AND_BAR
    &&  BSS_DEFAULT_ECHARTS_SETTING.LINE_AND_BAR.toolbox)
   {BSS_DEFAULT_ECHARTS_SETTING.LINE_AND_BAR.toolbox.show=false;}
  </script>
  <script type="text/javascript" src="/plug-in/report/repertory/${reportId}.js?v=<%=UUID.randomUUID().toString()%>"></script>
  <link rel="stylesheet" href="/plug-in/report/report.css">
  <link rel="stylesheet" href="/plug-in/bss/css/notheme/common/table.css">
    <style>
        .ui-widget-content{
            border:none !important;
        }
    </style>
  <script type="text/javascript">
      window.reportEditorable=false;
  </script>
  <script src="/plug-in/report/ReportTool.js" ></script>

</head>
<body>




<script type="text/javascript">
    $(function(){
        if(typeof(report)=="undefined"){
            alert('报告不存在或者加载失败！');
            return;
        }else{
            if(report.pages.length==0){
                $('<div class="pg-continer">报告内容为空</div>').appendTo(document.body);
            }
            ReportTool.init(report);
        }

    })

</script>
</body>
</html>
