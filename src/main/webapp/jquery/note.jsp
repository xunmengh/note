<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/3/7
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
  一 jquery 的定义
  判断数据类型

   each
   extend
   get

<div id="div1">div1</div>
  <div class="cls1">div2</div>
  <div class="cls1">div3</div>
 <script>


   ( function(window,undefined){
       var rootjQuery,dom=window.document;

       var id_selector=/^#([\w-]+)$/,
           tag_selector="div p span a button input".split(' '),
           class_selector=/^\.(\w+)$/,
               match,elem

       jQuery = function( selector, context ) {
             return new jQuery.fn.init(selector, context, rootjQuery);
        }

       jQuery.fn=jQuery.prototype={
             constructor: jQuery,
             init :function(selector, context,rootjQuery ){
                  if(!selector){
                    return this;
                  }
               match = id_selector.exec( selector );
               if(match&&match[1]){

                 elem = document.getElementById( match[1] );
                 if(elem){
                   this.length = 1;
                   this[0] = elem;
                 }
                 return this;
               }

               match=class_selector.exec(selector);
               if(match&&match[1]){
                 elem= document.getElementsByClassName(match[1]);
                 if(elem){
                     for(i=0;i<elem.length;i++){
                        this[i]=elem[i];
                     };
                   this.length=elem.length;
                 }
               }
               return this;
             }
        }





         jQuery.fn.init.prototype=jQuery.prototype;

         jQuery.extend= jQuery.fn.extend=function(){
              var target = arguments[0] || {};
              var source;
              var length=arguments.length;
              for(var i=1;i<length;i++){
                source=arguments[i];
                for(prop in source){
                  target[prop]=source[prop];
                }
              }
         }

     jQuery.each=function( obj, callback, args ) {
       var value,
               i = 0,
               length = obj.length,
               isArray =true

       if ( args ) {
         if ( isArray ) {
           for ( ; i < length; i++ ) {
             value = callback.apply( obj[ i ], args );

             if ( value === false ) {
               break;
             }
           }
         } else {
           for ( i in obj ) {
             value = callback.apply( obj[ i ], args );

             if ( value === false ) {
               break;
             }
           }
         }

         // A special, fast, case for the most common use of each
       } else {
         if ( isArray ) {
           for ( ; i < length; i++ ) {
             value = callback.call( obj[ i ], i, obj[ i ] );

             if ( value === false ) {
               break;
             }
           }
         } else {
           for ( i in obj ) {
             value = callback.call( obj[ i ], i, obj[ i ] );

             if ( value === false ) {
               break;
             }
           }
         }
       }

       return obj;
     }

        jQuery.fn.css=function(name,val){
          jQuery.each(this,function(i,v){
            v.style[name]=val;
          })
        }

     var rootjQuery=jQuery(dom);

     window.jQuery = window.$ = jQuery;


   }(window))

  console.info($(".cls1"));

   $(".cls1").css('backgroundColor','red');


 </script>
</body>
</html>
