<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/3/8
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
  <title>jquery 笔记</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${contextPath}/plugin/bootstrap/css/bootstrap.css"  />
  <%--<script src="${contextPath}/plugin/jquery/jquery.min.js"></script>--%>
    <script src="jquery-2.0.3.js"></script>
    <script src="${contextPath}/plugin/bootstrap/js/bootstrap.js"></script>
  <script>

    $(function(){
/*        var keys=$.map({abf:1,deg:2},function(elem,i){
            return i;
        });

        console.info(keys);*/

     /* console.info($('div'));
      console.info($('div').get());
      console.info($('div').eq(0));
      console.info($('div').eq(0).end());*/

   /*    // extend
        $.extend({aaa:function(){console.log(1)}});
        $.aaa();

        $.fn.extend({bbb:function(){console.log(2)}});
        $().bbb();

        var target={aaa:{bb:12,cc:13},f:22};
        var source={aaa:{dd:14},f:23,g:432};
        $.extend(target,source);// {aaa:{dd:14},f:23,g:432}
        $.extend(true,target,source); //{aaa:{bb:12,cc:13,dd:14},f:23,g:432}
        console.info(target);
        console.info(target.aaa.dd);
        source.aaa.dd=15;
        console.info(target.aaa.dd);*/

        /*
        *  type
        * */
        /* var class2type={};
        console.info(class2type.toString.call(123));

        jQuery.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(i, name) {
            class2type[ "[object " + name + "]" ] = name.toLowerCase();
        });

        console.log($.type(true));
        console.log($.type(123));
        console.log($.type('123'));
        console.log($.type(function(){}));
        console.log($.type([]));
        console.log($.type(new Date()));
        console.log($.type(/d+/));
        console.log($.type({})); */

/*        //json 转换
        var json={a:123,b:'sd'}
        var jsonStr=JSON.stringify(json);
        console.info(jsonStr);
        console.info($.parseJSON(jsonStr));
        console.info(JSON.parse(jsonStr));*/



       /* //  全局函数  globalEval
        function e(){
            var teval=eval;
            teval('var innerG="g";');// 能够全局变量访问到
            eval('var innerF="f";');// 访问不到
        }
        e();

        $.globalEval("var globVar=1;");
        console.info(globVar);
        console.info(innerG);*/

/*        // 驼峰
        var str="background-color"
        var t=str.replace(/-([\da-z])/gi,function(all,capture,index,orignal){
            return capture.toUpperCase();
        })
        console.info(t);
        console.info($.camelCase(str));//backgroundColor*/




/*        $('div').each(function(i,elemt){
            if(i>5){
                return false; // 后面的不会再遍历了
            }
        })

      $('div').map(function(i,item){
          return item.className?item:null
      }).each(function(i,item){
          console.info($(item).attr('class'));
      })*/

      var arry=[];
//      console.info(arry.slice.call({0:'12',1:'23',length:2}));

      $('pre').each(function(i,v){
        var transHtml=$(this).html().replace(/</g,'&lt;').replace(/>/g,'&gt;')
        $(this).html(transHtml);
      })



    })
  </script>
</head>
<body>
     <div class="container">
       <div class="row">
         <div class="col-md-12">

<pre>
   console.log($('div'))
  {0:div,1:div,length:2,selector:"div",context:document}

  $('div').get(-1);// 获得上面中key为1(i>0?i:i+length)的div
  $('div').get();// 将数据转换为数组   var arry=[]; arry.slice.call({0:'div',1:'div',length:2});//转数组

  $('div').eq(0);  // 返回新的jquery对象, 将原来的jquery对象放入栈底。
  //1. 创建新的jquery 对象 ：jQuery.merge($(),[元素]) 合并成新的jquery 对象
  //2. pushStack 原来对象入栈。 在新的jquery对象中添加属性 prevObject，指向原来的jquery对象
  $('div').eq(0).end()// 获得选择原来的jquery 对象 ，通过prevObject 属性获得

    pushStack ： 入栈
    end :出栈

  $('div').first();// $('div').eq(0)
  $('div').last();//  $('div').eq(-1)

  $('div').slice(1,2);// 截取的元素放在栈顶，原来的jquery放在栈底
  // core_slice.apply( this, arguments ) ;截取元素

   //数据通过function 过滤处理，放在栈顶，原来的发在栈底
  $('div').map(function(i,item){
          return item.className?item:null
  })

    $.map({abf:1,deg:2},function(elem,i){
         return i;
    });//['abf','deg']

    $('div').each(function(i,element){
            if(i>5){
                return false; // 后面的元素不会再遍历了
            }
     })

    $.each({t:1,2:3},function(key,value){

    })
    <%-- [].concat([1],[2]) [1,2]  js的使用--%>
</pre>

 <pre>
   extend([true],target,[source1,source2,...]) //在target 上扩展
     $.extend({aaa:function(){alert(1)}}) // 在jQuery 函数上扩展，调用方法  $.aaa()
     $.fn.extend({bbb:function(){alert(2)}}) // 在jquery原型上扩展  调用方法 $().bbb();

    var target={aaa:{bb:12,cc:13},f:22};
    var source={aaa:{dd:14},f:23,g:432};
    $.extend(target,source); //浅复制 {aaa:{dd:14},f:23,g:432}
      source.aaa.dd=15; //修改原来的引用，target 中的值也会改变
      target.aaa.dd  //15

    $.extend(true,target,source); //深度复制 {aaa:{bb:12,cc:13,dd:14},f:23,g:432}
     source.aaa.dd=15;  //
     target.aaa.dd  //14
</pre>

<pre>
      /* 实现原理
       var class2type={};
       console.info(class2type.toString.call(123));

       jQuery.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(i, name) {
            class2type[ "[object " + name + "]" ] = name.toLowerCase();
        });*/

        console.log($.type(true));
        console.log($.type(123));
        console.log($.type('123'));
        console.log($.type(function(){}));
        console.log($.type([]));
        console.log($.type(new Date()));
        console.log($.type(/d+/));
        console.log($.type({}));
        $.isFunction();
        $.isArray()
        $.isWindow()
        $.isNumeric()
        $.isEmptyObject()
</pre>

<pre>
    // json 转换
    var json={a:123,b:'sd'}
    var jsonStr=JSON.stringify(json);
    console.info(jsonStr);
    console.info($.parseJSON(jsonStr));
    console.info(JSON.parse(jsonStr));

    //  全局函数  globalEval
    function e(){
        var teval=eval;
        teval('var innerG="g";');// 能够全局变量访问到
        eval('var innerF="f";');// 访问不到
    }
    e();
    $.globalEval("var globVar=1;");
    console.info(globVar);
    console.info(innerG);

     // 驼峰
    var str="background-color"
    var t=str.replace(/-([\da-z])/gi,function(all,capture,index,orignal){
        return capture.toUpperCase();
    })
    console.info(t);
    console.info($.camelCase(str));//backgroundColor

    //数组过滤，
    console.info($.grep([34,12,3,56],function(val,i){
              return val>10
      },false));

    // 改变作用域
    function show(){
      alert(this.id)
    }
    $.proxy(show,{id:'12'})()
</pre>

<pre>
     /*   function.call(context,arguments)
        * 将方法放在一个数组中，遍历数组 触发元素
        * once   fire 只执行一次
        * memory  在 fire 之后 ，在添加会自动触发元素。
        * unique   相同的函数只会添加一个
        * stopOnFalse 前面的函数返回false，后面的函数不会再执行
     */
    var callback= $.Callbacks("once memory unique stopOnFalse");
    callback.add(aaa);

    // Deferred
    //  resolve : done    once memory
    //  reject : fail     once memory
    //  notify : progress

    var dfd=$.Deferred();
    dfd.always(ccc);// 成功和失败都会执行
    dfd.done(aaa);
    dfd.fail(bbb);
    dfd.resolve();// 执行功能后，失败就不会执行了
    dfd.reject();// 不会执行

    //当所有的延迟对象 resolve  或者 有一个 reject 触发下面的方法
    $.when(dfd1,dfd1).done(function(){
            alert("all success");
        }).fail(function (){
            alert("has a failure");
        });

    // 监控 DOMContentLoaded  load 事件 触发resoleWith 调用done


</pre>

<pre>
    // 数据缓存
    //Data 对象中有一个 cache={0:{},1:{}}
    //dom元素中添加属性对应 cache 中的key
     $("#div1").data('ad',2);
     $("#div1").data("test");
     $("#div1").data();// 获得所有元素
     $("#div1").removeData(); //删除数据

     //function 队列
     function  aaa( next,hooks){
           alert(1);
           next(); // 自动执行下一个函数
     }
     $.queue(document,'q1',aaa);
     $.dequeue(document,'q1');
</pre>

<pre>
    //属性设置
   var div1=document.getElementById('div1');
   div1.setAttribute("title",'hello');//attr
   div1.setAttribute("attr",'attr');
   div1['title']='hello';//prop

   $("#div").attr('title':'123');
   $("#id").val('1'); // 设置值
</pre>
<pre>
    //事件设置
    $("#div2").on("click.aaa",function(a){
               alert(1);
            return false;// 阻止冒泡，阻止默认事件
    });

    //事件委托
    $("#div2").on("click.bbb","span:first",function(c){
           alert(3);
     });

     $("#div3").on("click",function(e){
           alert(e.clientY);//相对于浏览器的窗口的高度
           alert(e.pageY);// 包含滚动条的高度
     });

</pre>
<pre>
    // 选择器
    $("div",".container1").filter('.box').css({"border":'1px solid red'});
    $("div",".container1").not('.box').css({"border":'3px solid yellow'});
    $("div",".container1").has("span").css("background-color",'blue');// 包含span的div元素

    $("div",".container1").filter(function(i,elem){
       return elem.className="box"
    }).html('function');

    $(".container2 div").find('span').css({"border":'1px solid red'}).addBack().css({"padding-top":"30px"});
    console.info($("#div3").index()); // 在兄弟节点中的索引
    //在最近的父类元素中查找，包含当前元素
    $("#div3").closest('.container2').css({"border":'1px solid red'});
    // 集合的  ∪ 操作
    $(".container1").add(".container2").css({'padding-left':'100px'});


    //dom操作
    $(".container2").empty();// 清空内容
    $(".container2").text("hello");
    $(".container2").append($div3);
    $(".container3").html("<div><span style='color: red'>123</span></div>");
    $(".container3").prepend('<span>prepend</span>');
    $(".container3").after('<div class="container5">div5</div>');
    $(".container5").before('<div class="container4">div4</div>');

    $("#wrap span").wrapAll('<div class="wrap"><p></p></div>');
    $("#wrap span").unwrap(); //删除父元素节点
    $("#wrap span").wrap("<div><p></p></div>");// 被包含
    $("#wrap span").wrapInner("<span>wrapInner</span>"); // 内包含  wrapAll


    //选择相关联的节点元素
    // parent 直接父节点
     $("#span1").parent().css({"border":"1px solid red"});
    // 所有的div父节点
    $("#span2").parents('div').css({"border":"1px solid yellow"});
    // util 不包含
    $("#span3").parentsUntil('body').css({"border":"1px solid blue"});
    $("#li2").siblings().css("background-color","red");
    $("#li2").prevAll()
    $("#li22").nextAll().css("background-color","red");
    $("#ul3").children().css("background-color","red");
</pre>
<pre>
    //css样式设置
    //设置样式  element.style.color=
    //获得样式  window.getComputedStyle()
     $(document.body).css("background-color",'blue');
    $("div").css({"width":"100px","height":"100px","background-color":"red"});

    $("#div2").width("+=100");
    console.info($("#div1").width());  //100
    console.info($("#div1").innerWidth()); //100 + padding 30 + 30
    console.info($("#div1").outerWidth()); // 100 + padding +border
    console.info($("#div1").outerWidth(true)); //100 + padding +border + margin

    console.info($(window).height());// 可视窗口的高度
    console.info($(document).height());// 文档的高度

    addClass
    removeClass
    hasClass
    toggleClass
</pre>
<pre>
    //表单元素的参数拼接
    var msg=$.param({a:'10',b:"20"});
    console.info(msg);
    var msg3=$('#form').serialize();
    console.info(msg3);

    //加载   a:first 在返回的字符串中选择
    $("#div1").load('index.jsp a:first',function(){
//       console.info(arguments);// 成功或者失败都调用
    });

    //jsonp跨域处理通过创建 script 标签
    //$.ajaxSettings  全局默认的配置
    //  ajax 事件触发

     var t=$.ajax({
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

    setTimeout(function(){
			t.abort();
		},500);
</pre>
<pre>
      //定位
      console.info($("#div1").offset());// 相对于屏幕的定位
      console.info($("#div2").offset());
      console.info($("#div2").position()); //相对于父元素的定位。
      console.info($("#div1").get(0).getBoundingClientRect());// 获得可视区域的位置

      // offsetparent
      $("#div3").click(function(){
          console.info(window.pageXOffset);
          console.info(window.pageYOffset);
          $(window).scrollTop(); //获得滚动距离
          $(window).scrollLeft(); //获得滚动距离
      })
</pre>
             </div>
         </div>
       </div>


</body>
</html>
