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
    <title>queue</title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">
       /*
       * queue 函数队列
       *   出对就执行
       * */

       function  aaa( next,hooks){
           alert(1);
           console.info(arguments)
           next(); // 自动执行下一个运动
       }

       function  bbb(){
           alert(2);
       }
        $(function(){
//            单参数为数组时，会覆盖前面的参数。
            $.queue(document,'q1',aaa);
            $(document).delay(3000,'q1');  // 延迟执行
            $.queue(document,'q1',bbb);

           /*$(document).promise('q1').done(function(){
                alert('队列都执行完了')});*/
//            console.info($.queue(document,'q1'));

            $.dequeue(document,'q1');
//            $.dequeue(document,'q1');
         /*   $.dequeue(document,'q1');
            $(document).delay(3000,'q1');  // 延迟执行
            $.dequeue(document,'q1');*/
          /*  $("#div1").click(function(){
                $(this).animate({width:300},2000);
                $(this).animate({height:300},2000);
                $(this).animate({right:300},2000);
            })*/
        })

    </script>

   <div id="div1" style="height:100px;width: 100px;background-color: red;"></div>
</body>
</html>
