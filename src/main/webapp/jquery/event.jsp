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
    <title>event</title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">

   $(function(){

/*       $("#div1").on('click',{name:'sd'},function(e){
           alert(e.data.name);
       });

//       事件委托
       $('#input1').focus(function(){
           $(this).css('backgroundColor','red');
       })*/

//      $("#input1").trigger('focus'); // 触发事件，触发默认行为
//       $("#input1").triggerHandler('focus');// 触发事件，不会触发默认行为

        $("#div2").on("click.aaa",function(a){
               alert(1);
            return false;// 阻止冒泡，阻止默认事件
        });

       $("#div2").on("click",function(b){
           alert(2);
       });

       $("#div2").on("click.bbb","span:first",function(c){
           alert(3);
       });

       $("#div2").on("mouseenter",function(d){
           alert(4);
       });

       $("#div3").on("click",function(e){
           alert(e.clientY);//相对于浏览器的窗口的高度
           alert(e.pageY);// 包含滚动条的高度
       });

       $(document).keydown(function(e){
           alert(e.which);//键盘code
       })
       /*
       *
       *  事件缓存 ， 冒泡
       *
       *  event.which keycode
       *
       *  clientY   pageY
       *
       *  focus，blur 不支持冒泡
       *
       *  this.addEventLis  冒泡或者捕获阶段
       *
       *
       *
       *  {
       *    events:{
       *        click:[{
       *            guid:3,
       *            handler:function(c);
       *            namespace : bbb
       *            needsContext:true
                    origType:click
                    selector:"span:first"
                    type:"click"
       *        }] delegateCount:1}
       *
       *

        *  }
       *
       * */
   })


    </script>

   <div id="div1" style="width: 100px;height: 100px;">
         div: <input id="input1"></div>
   </div>

    <div id="div2" style="width: 100px;height: 100px;background-color: red;">
        div:<span>112</span>
        <span>223</span>
    </div>

   <div id="div3" style="height: 1000px;background-color: blue;">


   </div>
</body>
</html>
