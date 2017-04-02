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
    <title>callback</title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">
       /* function aaa(){
           console.info(1);
        }
        function bbb(){
            console.info(2);
        }
        function ccc(){
            console.info(3);
            return false;
        }

        function ddd(){
            console.info(4);
            return false;
        }

        var callback= $.Callbacks("once memory unique stopOnFalse");
        callback.add(aaa);
        callback.add(bbb);
        callback.fire();
        callback.add(ccc);
        callback.add(aaa);
        callback.add(ddd);
        callback.fire();*/

       var log = function( value ) {
           console.info(value);
       };

       // Two sample functions to be added to a callbacks list
       var foo = function( value ) {
           log( "foo: " + value );
       };
       var bar = function( value ) {
           log( "bar: " + value );
       };

       // Create the callbacks object with the "memory" flag
       var callbacks = $.Callbacks( "memory" );

       // Add the foo logging function to the callback list
       callbacks.add( foo );

       // Fire the items on the list, passing an argument
       callbacks.fire( "hello" );
       // Outputs "foo: hello"

       // Lock the callbacks list
      // callbacks.lock();

       // Try firing the items again
       callbacks.fire( "world" );
       // As the list was locked, no items were called,
       // so "foo: world" isn't logged

      /* // Add the foo function to the callback list again
       callbacks.add( foo );

       // Try firing the items again
       callbacks.fire( "silentArgument" );
       // Outputs "foo: hello" because the argument value was stored in memory

       // Add the bar function to the callback list
       callbacks.add( bar );

       callbacks.fire( "youHadMeAtHello" );*/
       // Outputs "bar: hello" because the li

        /*
        * once   fire 只执行一次
        * memory  在 fire 之后 ，在添加会自动触发元素。
        * unique   相同的函数只会添加一个
        * stopOnFalse 函数返回false 后面的不会执行
        *
        *  fire('hello') 可以添加参数
        *
        * add
        * remove
        * has
        * empty
        * disable
        * disabled
        *
        * */

    </script>


</body>
</html>
