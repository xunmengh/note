<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/3/3
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>data</title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">


       /*
       *  数据缓存  data
       *
       *   防止对象泄露
       * */

      /* Data.prototype={
           key
           get
           set
           access
           remove
           hasData
           discard
       }

       jQuery.fn.data{
           data
           removeData
       }*/
      /* jQuery.data{
           hasData
           data
           removeData
           _data
           _removeData
       }*/

            $(function(){
                var data={12:"12",'sd':'sd'}
            $("#div1").data('test',data);
                data[12]='sdf';
            $("#div1").data('ad',2);
            console.info( $("#div1").data("test"));
            console.info( $("#div1").data());// 获得所有元素
//            $("#div1").removeData();
            console.info( $("#div1").data());
        })

    </script>

   <div id="div1"></div>
</body>
</html>
