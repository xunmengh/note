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
    <title>extend</title>
    <script>
       /*  var  $=122; */
    </script>
    <script src="jquery-2.0.3.js"></script>
</head>
<body>
    <script type="text/javascript">
      /*  function A(){

        }

        A.aaa=function(){
            alert('属性 a');
        }

        A.prototype.bbb=function(){
            alert('原型 b');
        }

        A.aaa();
        new A().bbb();*/

      /* $(function(){
           *//*
           *  只有一个参数的时候，
           * *//*
           $.extend({
               aaa:function(){
                   alert("1aaa")
               }
           });

           $.fn.extend({
               bbb:function(){
                   alert('bb1');
               }
           })

           $.aaa();
           $().bbb();

           var a={}// 对象拷贝到 a 中
           $.extend(a,{age:20},{name:'xs'});
           console.info(a);

           var b={} // 浅拷贝
           var c={person:{name:'x'},t:'2'}
           $.extend(b,c);

           var  d={t:'1'}; // 深拷贝 复制元素
           $.extend(true,d,c);

           b.person.name='ft';
           alert(c.person.name);

           alert(d.person.name);
           alert(d.t);

       })*/

        /*
        * jquery.extend
        *   expando :生成唯一数
        *   noConflic :防止冲突
        *   isReady :  domcontentLoad
        *   holdReady  : 推迟 加载
        *
        *   type
        *   isFunction
        *   isArray
        *   iswindow
        *
        *   isPlainObject
        *   isEmptyObject  是否为空的对象
        *
        *   parseHTML (标签，document，true|false 是否支持脚本) ：创建 html 标签， <li></li>  <li></li><li></li>
        *
        *   parseJSON  转换为json 字符串
        *
        *   parseXML
        *
        *    noop  ： 空的函数
        *    globalEval ： eval  eval 在方法中不能定义全局变量
        *
        *    camelCase : 转驼峰
        *
        *    nodeName  elem  elemName   boolean
         *
         *   each
         *
         *   trim
         *
         *   makeArray  转数组
         *
         *   inArray (elem,arry,index) 索引
         *
         *   merge (1,2) 合并数组   在参数1上合并 参数2
         *
         *   grep  arry,functiong,inv  !!inv   过滤数组元素
         *
         *   proxy  改变作用域
         *
         *   access   css  attr  方法的合并  I
         *
         *   now  Date.now
         *
         *   swap  样式切换
        * */

       /* var  j$=$.noConflict();


        j$(function(){
            alert($);
        })*/

   /*   $.holdReady(true);
      $(function(){
          alert('2');
      })

       setTimeout(function(){
           alert(1);
           $.holdReady(false);
       },2)*/

  /*    alert($.isFunction(function(){}));

      alert($.isNumeric("sdsd"));
*/
      /*  null  undefine */
/*      alert($.type('s'))
      alert($.type({}))
      alert($.type([]))
      alert($.type(123))
      alert($.type(function(){}))
      alert($.type(null))
      alert($.type(new Date()))*/

        console.info($.parseHTML("<div>123</div><div>345</div>"));


      /*
      * globalEval
      *
      * */

 /*       function e(){
            var teval=eval;
            teval('var innerG="g";');// 能够全局变量访问到
            eval('var innerF="f";');
        }
        e();
        alert(innerG);
      try{
          alert(innerF);
      }catch(e) {
         console.info('变量不存在')
      }

      $.globalEval("var gloalE=123;");
      alert(gloalE);
*/

     /*
     * camelCase 转驼峰
     * */

     /* alert($.camelCase("-font-size"));*/

/*

        $.each([34,56,23],function(index,val){
             alert(index);
            alert(val);
            return false;//不在继续下面的遍历
        });
*/

        /*
        * makeArray  转数组
        * */
   /*   console.info($.makeArray(123));
      console.info($.makeArray(['d','c'],{length:0}));*/


        /*
        * inArray  elem
        *
        * */

     /*   console.info($.inArray('d',['s','d','h','g'],0));*/

        /*
        * merge (1,2) 合并数组   在参数1上合并 参数2
        * */
/*
        console.info($.merge([1,2,3],[3,4]));
      console.info($.merge([1,2,3],{0:'f',1:'g'}));*/

        /*
        *  grep  过滤数组元素
        * */
/*
      console.info($.grep([34,12,3,56],function(val,i){
              return val>10
      },false));*/



      /*
      * map 对数组中的元素进行处理
      * */

    /*  console.info($.map([12,45,12],function(n,i){
          return n+1;
      })  );*/

      /*
      * proxy  改变作用域
      * */
   /*   function show(){
    alert(this.id)
    }
    $.proxy(show,{id:'12'})();*/


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
