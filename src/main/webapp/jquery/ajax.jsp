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
  <title>ajax</title>
  <script src="jquery-2.0.3.js"></script>
</head>
<body>
<script type="text/javascript">

  $(function(){

    var msg=$.param({a:'10',b:"20"});
    console.info(msg);

    var msg2=$.param([{name:'c',value:'23'},{name:'d',value:'30'}]);
    console.info(msg2);

    var msg3=$('#form').serialize();
    console.info(msg3);

//    console.info($('#form').get(0).elements);// 原生的遍历数组


    $(document).on("ajaxStart",function(){
      console.info('ajaxStart');// 触发一次
    });
    //加载   a:first 在返回的字符串中选择
    $("#div1").load('index.jsp a:first',function(){
//       console.info(arguments);// 成功或者失败都调用
    });

/*    $.get('index22.jsp',{'a':'a'},function(){
//        alert('success');// 只有返回成功的时候才调用
    },'html');*/

    /*
    *  jsonp  跨域处理， 通过创建<script>标签
    *
    *  $.ajaxSettings  全局默认的配置
    *
    *  ajaxSend  ajax 时间
    * */



    $.ajax({
        url:'data.json',
        method:"post",
        dataType:'json',
        data:{},
        headers:{'xm':'sd'},
        cache:false,
        /* timeout:2,*/
        /* context:$("#div1"),*/
        beforeSend:function(){
          console.info('beforeSend');
          return false;
        },
        success:function(){
          console.info("this: ");
          console.info(this);
          console.info(arguments);
        },
        error:function(){
          console.info(arguments);
        },
        statusCode:{
          200 :function(){alert("成功")},
          404 : function(){alert("not found")}
        }
    })
  })


</script>

  <form id="form">
    <input name="a" value="1" disabled>
    <input name="b" value="c" >
    <input type="checkbox" value="read" name="loves" checked>
    <input type="checkbox" value="writer" name="loves" checked>
    <input type="submit">
  </form>

   <div id="div1"></div>

</body>
</html>
