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
    <title>init</title>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">
       //
       /*
          {
            0:'li',
            1:'li',
            select:'',
            content:'',
            length:2,
          }
        * init('selector',context)  方法
        *   $(""), $(null), $(undefined), $(false)   this
        *
        *   String  "<li>" "<li>hello</li>"   match = [ null, selector, null ];
        *   "<li>hello; #id"
        *       #id
        *
        *    ul   .class    find
        *
        *    DOMElement  :
        *
        *    function  :
        *
        *
        *    []  | {}
        *
        *
        *    selector ： 选择存取的字符串
        *    length : this 对象的数组
        *    toArray : 转数组
        *    get  ：  转原生集合
        *    pushStack : 对象入栈
        * */


       $(function(){
         console.info($("<li>12</li>")) ;

         var arry=jQuery.parseHTML("<li>4</li><li>5</li><li>6</li><script> alert(4);<\/script>",document,false);//'select' ,context, true|false js脚本解析
         console.info(arry);
         $.each(arry,function(i){
           $("ul").append(arry[i]);
         });

         var json=jQuery.merge({length:0},arry);
         console.info(json);

         $('<li>',{html:'li',title:'title'}).appendTo($('ul'));

         ;
         var j=jQuery.makeArray(document.getElementsByTagName("li"),{length:0});
         console.info(j);

         $("li").toArray();  // 转数组

         console.info($("li").toArray()); // 转原生数组

         console.info([].slice.call({0:1,1:2,length:2}))/* {0:1,1:2,length:2}*/

         $("li").get(-1).innerHTML='red';   // 获得原生对象

         /*
         * get 返回原生的数组
         * pushStack  入栈
         * slice
         * end  出栈
         * first
         * last
         * eq  获得第几个元素
         * */
         $('#pushstack').pushStack($('#pushstack span'))
                 .css({'background':'blue'})
                 .end().css({color:'red'})

         $('span').slice(1,2).css({fontSize:'50px'}).end().css({'color':'yellow'});

         $('span').eq(0).css({"font-weight":'bolder'});

       })





    </script>

   <ul>
     <li>1</li>
     <li>2</li>
     <li>3</li>
   </ul>

<div id="pushstack">sdsdd
 <span>1</span>
  <span>2</span>
  <span>3</span>
</div>
</body>
</html>
