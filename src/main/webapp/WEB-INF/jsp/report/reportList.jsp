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
  <title>报告列表</title>
  <jsp:include page="/plug-in/bss/pages/inc_ext_resources.jsp"></jsp:include>
  <jsp:include page="/plug-in/bss/pages/inc_resources.jsp"></jsp:include>
</head>
<body>

  <div id="reportList"></div>

<script type="text/javascript">
  $(function () {

    var qdata = {
      reportId: "",
      reportTitle: "",
      pageNo: 1,
      pageSize: 10,
      count: -1,
      ord: ''
    };

   /* function reportRender(){

    }*/

    $("#reportList").gridview({
      url: '/bss/report/page/viewReport.sdo',
      params: qdata,
      className: 'aui-table-bmbd',
      autoLoad: false,
      checkbox: true,
      idColumn: "ID",
      hideColumns: null,
      acrossPageSelect: false,
      render: null,
      isClickFisrtTr: false
    });


    $("#reportList").gridview('query', qdata);         //分页列表展示


  });

</script>
</body>
</html>
