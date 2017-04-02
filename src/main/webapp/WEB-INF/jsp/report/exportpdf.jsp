<%@ page contentType="text/html; charset=utf-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>报表中心</title>
    <jsp:include page="/plug-in/bss/pages/inc_ext_resources.jsp"></jsp:include>
    <jsp:include page="/plug-in/bss/pages/inc_resources.jsp"></jsp:include>
    <jsp:include page="/plug-in/bss/js/plugins/echarts/theme/echar_theme.jsp"></jsp:include>
    <script type="text/javascript" src="/plug-in/bss/js/plugins/jquery.bss.echarts.helper.js"></script>
    <script type="text/javascript" src="/plug-in/bss/js/plugins/jquery.bss.wmypicker.js"></script>
    <style type="text/css">
        .thClass {
            text-align: center;
        }
        .tdClass {
            /*width: 30%;*/
        }
        .inputClass {
            width: 100px;
        }
    </style>
</head>
<body style="background:#fff">
<%--<form id="form1" name='form1' method='post' action='/bss/report/json/exportPDF.sdo'><input type="hidden" name="reptId" id ="reptId" value="40"/></form>--%>
<script>



    $(function() {
        var reptId = '${reptId}';
        var reptTilte = '${reptTitle}';



        var lbui = LBUI || parent.LBUI || top.LBUI;
        <%--var width = '${param.dialogWidth}', height = '${param.dialogHeight}';--%>
        <%--var callbackParam = {--%>
            <%--retVal: 2,--%>
            <%--success: false,--%>
            <%--message: null--%>
        <%--};--%>

        <%--if (lbui) {--%>
            <%--var dlg = lbui.getActiveDialog();--%>
            <%--dlg && dlg.setTitle('下载');--%>
            <%--if ( dlg && (width != '' || height != '')) {--%>
                <%--width != '' && dlg.setWidth(width);--%>
                <%--height != '' && dlg.setHeight(height);--%>
                <%--dlg.center();--%>
                <%--dlg.maximize();--%>
                <%--dlg.restore();--%>
                <%--dlg.on('close', function(){--%>
<%--//                var fun = dlg.fun;--%>
<%--//                if ( fun.callback )--%>
<%--//                    fun.callback(callbackParam);--%>
<%--//                else if ( fun.refresh && callbackParam.success ) {--%>
<%--//                    fun.refresh();--%>
<%--//                }--%>
                    <%--alert("7893");--%>
                    <%--//alert($("#reptId").val());--%>
                    <%--//$("#form1").submit();--%>
                <%--});--%>
            <%--}--%>
        <%--}--%>



        var dlg = lbui.getActiveDialog();
        var url = window.location.href;
        var arrUrl = url.split("OperateProcessor?")[0];
        dlg.on('close', function(){
            top.location.href = arrUrl+"bss/report/json/exportPDF.sdo?reptId="+reptId + "&reptTitle="+encodeURIComponent(reptTilte);
        });

        dlg.close();




    });



</script>
</body>
</html>