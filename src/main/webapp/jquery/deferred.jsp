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
    <title>deferred</title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">
        function aaa(){
            alert('aaa')
        }
        function bbb(){
            alert('bbb')
        }
        function ccc(){
            alert('always');
        }


        var dfd=$.Deferred();
        dfd.done(aaa);
        dfd.fail(bbb);
        dfd.resolve();
        dfd.reject();// 不会执行

        dfd.done(ccc);


     /*   var dfd=$.Deferred();
        setTimeout(function(){
            dfd.resolve();
        },1000);
*/

      /*  function  waaa(){
            var dft=$.Deferred();
            dft.done(aaa);
            return dft;
        }

        function  wbbb(){
            var dft=$.Deferred();
            dft.done(bbb);
            return dft;
        }

        var da=waaa();
                var db=wbbb();
        $.when(da,db).done(function(){
            alert("all success");
        }).fail(function (){
            alert("a failure");
        });

        da.resolve();
        db.resolve();*/
      /*  dfd.done(aaa);
        dfd.fail(bbb);
        dfd.always(ccc);//*/

//        dfd.then(aaa,bbb,ccc);


        /*
        *
        *    内部使用  callback
        *   resolve   done
        *   reject   fail
        *   notify   progress
        *
        *   deferred  ——》  promise()
        *   resolve
        *   reject
        *   notity
        *
        *   state : 获得状态
        *    always ： 不管方法成功或者是失败，都会执行。方法一直会执行
        *
        *    when  当多个延迟对象都成功，执行done，有一个失败，执行fail
        *
        * */

    </script>


</body>
</html>
