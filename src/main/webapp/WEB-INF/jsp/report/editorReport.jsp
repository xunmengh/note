<%@ page import="java.util.UUID" %>
<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2016/10/28
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>${reportTitle}</title>

  <script type="text/javascript" src="/plug-in/report/jquery.min.js"></script>
  <script type="text/javascript" src="/plug-in/glweb/internal/bss/js/app/bss.core.js"></script>
  <script type="text/javascript" src="/plug-in/bss/js/plugins/jquery.bss.echarts.helper.js"></script>
  <link rel="stylesheet" href="/plug-in/report/jqueryui/jquery-ui.min.css">
  <link rel="stylesheet" href="/plug-in/report/jquerycontextMenu/jquery.contextMenu.min.css">
  <script type="text/javascript" src="/plug-in/report/jqueryui/jquery-ui.min.js"></script>
  <script type="text/javascript" src="/plug-in/report/jquerycontextMenu/jquery.contextMenu.min.js"></script>
  <script type="text/javascript" src="/plug-in/report/repertory/${reportId}.js?v=<%=UUID.randomUUID().toString()%>"></script>
  <link rel="stylesheet" href="/plug-in/report/report.css">
  <link rel="stylesheet" href="/plug-in/bss/css/notheme/common/table.css">
  <jsp:include page="/plug-in/bss/js/plugins/echarts/theme/echar_theme.jsp"></jsp:include>

  <script type="text/javascript">
    window.reportEditorable=true;
  </script>
  <script type="text/javascript" src="/plug-in/report/ReportTool.js"  ></script>

</head>
<body id="editorContainer">


<button id="save" class="mBtn" style="display: none;">保存</button>
<div id="echarDialog" title="图表配置" style="display: none;">
  <iframe id="echarIframe"  width="700" height="440" style="border:none;"></iframe>
</div>

<div id="ueditorDialog" title="文本编辑" style="display: none;">
  <iframe id="ueditorIframe"  width="800" height="450" style="border:none;"></iframe>
</div>

<script type="text/javascript">
  $(function(){
    if(typeof(report)=="undefined"){
      alert('报告不存在或者加载失败！');
      return;
    }


    if(report.pages.length==0){
        var newPage= ReportTool.createPage(report.pageIndex++);
        $(document.body).append(newPage[0]);
    }else{
      ReportTool.init(report);
    }

    //保存 快捷键
    $(document).keydown(function(e){
      // ctrl + s
      if( e.ctrlKey  == true && e.keyCode == 83 ){
        console.log('ctrl+s');
        setTimeout(function() {
          saveReport();
        }, 0);
        return false; // 截取返回false就不会保存网页了
      }
    });

    var pgContinerInnerWidth=4+1000+4;//border-left+width+border-right;
    var pgContinerLeftMargin=($("#editorContainer").width()-pgContinerInnerWidth)/2;
    var bodyMarginLeft=8;//
    $("#save").css("left",(bodyMarginLeft+pgContinerLeftMargin+pgContinerInnerWidth+5)+"px");
    $("#save").show();

    $("#editorContainer #save").click(saveReport);

    function saveReport(){
      report.pages=ReportTool.getPages($("#editorContainer > div.pg-continer"));//获得页面元素
      $.ajax({
        type:'POST',
        url:'/bss/report/json/saveReport.sdo',
        dataType:'json',
        data:{"report":JSON.stringify(report),"reportId":${reportId},"reportTitle":"${reportTitle}"},
        success:function(result){
          alert(result.msg);
        },
        error:function(){
          alert("网络异常!");
        }
      });
    }

    function setUeditorIframeInitContent(initContent){
      $("#ueditorIframe")[0].contentWindow.setInitContent(initContent);
    }

    function getUeitorIframeContent(){
      return $("#ueditorIframe")[0].contentWindow.getContent();
    }

    function setUeditorIframeContent(content){
      $("#ueditorIframe")[0].contentWindow.setContent(content);
    }

    function clearUeditorIframeContent(){
      $("#ueditorIframe")[0].contentWindow.clearContent();
    }

    function setUeditorIframeInitBackground(background){
      $("#ueditorIframe")[0].contentWindow.setInitBackground(background);
    }


    function getUeditorIframeBackground(){
      return  $("#ueditorIframe")[0].contentWindow.getBackground();
    }

    function setUeditorIframeBackground(background){
      return  $("#ueditorIframe")[0].contentWindow.setBackground(background);
    }

    /**
     * $page : 新增的页面             编辑是传空
     * $contentDiv：需要编辑的元素,    新增时传空。
     */
    function ueditorDialog($page,$contentDiv,pageid){
      var  isIframloaded=true;
      $("#ueditorDialog").dialog({
        autoOpen:true,
        width:850,
        height: "auto",
        resizable: false,
        position: { my: "center", at: "center", of: "#"+pageid },
        create:function( event, ui){
          isIframloaded=false;
          $('#ueditorIframe').on('load',function(){
            if($contentDiv){
              setUeditorIframeInitContent($contentDiv[0].innerHTML);
              setUeditorIframeInitBackground(ReportTool.getBackground($contentDiv));

              try{
                setUeditorIframeContent($contentDiv[0].innerHTML);
                setUeditorIframeBackground(ReportTool.getBackground($contentDiv));
              }catch(e){}
            }/*else {
              clearUeditorIframeContent();
              setUeditorIframeBackground(null);
            }*/

          });
          $('#ueditorIframe').attr('src','/plug-in/report/ueditor/dialog_text.jsp');

        },
        open:function(event, ui){
          if(isIframloaded){
            if($contentDiv){
              setUeditorIframeContent($contentDiv[0].innerHTML);
              setUeditorIframeBackground(ReportTool.getBackground($contentDiv));
            }else {
              clearUeditorIframeContent();
              setUeditorIframeBackground(null);
            }
          }
        },

        buttons: { "确认": function() {
           var  $tempDiv=$contentDiv||ReportTool.createPageElement({type:'ueditor'},$page);
           ReportTool.editorText($tempDiv,getUeitorIframeContent());

          var background=getUeditorIframeBackground();
          ReportTool.clearBackground($tempDiv);
          ReportTool.setBackground($tempDiv,background);
          $(this).dialog("close");
        }}
      });
    }



    function urlToObj(url){
      if(url){
        var obj={};
        var index=url.indexOf("?");
        var param=url.substring(index+1,url.length);
        var params=param.split("&");
        for(var i=0;i< params.length;i++){
          var pair=params[i].split("=");
          obj[pair[0]]=pair[1]||'';
        }
      
        return obj;
      }else{
        return null;
      }
    }

    function getLoadUrl(searchDatas){
      var loadUrl='?';
      for(var i in searchDatas){
        loadUrl=loadUrl+''+i+'='+searchDatas[i]+'&';
      }
      loadUrl='/bss/reportForms/form/page/renderChart.sdo'+loadUrl.substr(0,loadUrl.length-1);
      return loadUrl;
    }


    function echarDialog($page,$continerDiv,pageid){
      var isIframloaded=true;
      $( "#echarDialog").dialog({
        height: "auto",
        width:750,
        resizable: false,
        position: { my: "center", at: "center", of: "#"+pageid },
        create:function( event, ui){
          isIframloaded=false;
          $('#echarIframe').attr('src','/bss/reportForms/form/page/getChartUrl.sdo');
          $('#echarIframe').on('load',function(){
            if($continerDiv){
              $("#echarIframe")[0].contentWindow.setDefaultValue(urlToObj($continerDiv.attr("loadUrl")));
            }else{
              $("#echarIframe")[0].contentWindow.setDefaultValue(null);
            }
          })
        },
        open:function(event, ui){
          if(isIframloaded){
            if($continerDiv){
              $("#echarIframe")[0].contentWindow.setDefaultValue(urlToObj($continerDiv.attr("loadUrl")));
            }else{
              $("#echarIframe")[0].contentWindow.setDefaultValue(null);
            }
          }
        },
        buttons: { "确认": function() {
          var searchDatas=$("#echarIframe")[0].contentWindow.getReturnSearchDatas();
          if(searchDatas){
            var loadUrl=getLoadUrl(searchDatas);
            if($page){
              var elementDescript={type:"echar"};
              elementDescript["loadUrl"]=loadUrl;
              ReportTool.createPageElement(elementDescript,$page);
            }else{
              $continerDiv.attr("loadUrl",loadUrl);
              $continerDiv.parent().attr("loadUrl",loadUrl);
              $continerDiv.load(loadUrl);
            }
            $(this).dialog("close");
          }

        }}
      });
    }

    function  isPage( id){
      var pgreg=/^pg-\d+$/;
      return pgreg.test(id);
    }


    $.contextMenu({
      selector: '.context-menu-one',
      callback: function(key, options) {
        var $page = $(this);
        if("addText"==key){
          ueditorDialog($page,null,$page.attr("id"));
        }else if("editText"==key){
          var $contentDiv=$(this).find('>div:first-child');
          ueditorDialog(null,$contentDiv,$(this).parent().attr("id"));
        }

        else if("addEchar"==key){
          echarDialog($page,null,$page.attr("id"));
        }else if("editEchar"==key){
          echarDialog(null,$(this).find(">div:first-child"),$(this).parent().attr("id"));
        }

        else if("delete"==key){
          $(this).remove();
        }else if("newPageAfter"==key){
          var $newPage=ReportTool.createPage(report.pageIndex++)
          ReportTool.addPage($newPage,$(this));
        }else if("newPageBefore"==key){
          var $newPage=ReportTool.createPage(report.pageIndex++)
          ReportTool.addPage($newPage,$(this),"before");
        }

        else if("pgTitle"==key){
          var id=$(this).attr("id");
          var length=$("#"+id+"-titleContent",$(this)).length;
          if(length){
            ReportTool.removePageTitle($(this));
          }else{
            ReportTool.addPageTitle($(this),null);
          }
        }
      },
      items: {
        "addText": {name: "添加文本", icon: "add",disabled:function(){
          var id=$(this).attr("id");
          var isPg= isPage(id);
          return !isPg;
        }},
        "editText":{name:"编辑文本",icon:'edit',
          disabled:function(){
            var type=$(this).attr("type");
            if(type=='ueditor'){
              return false;
            }else {
              return true
            }
          }
        },
        "sep1": "---------",
        "addEchar": {name: "添加图表", icon: "add",disabled:function(){
          var id=$(this).attr("id");
          var isPg= isPage(id);
          return !isPg;
        }},
        "editEchar": {name: "编辑图表", icon: "edit",
          disabled:function(){
            var type=$(this).attr("type");
            if(type=='echar'){
              return false;
            }else {
              return true
            }
          }},
        "sep2": "---------",

        "delete": {name: "删除", icon: "delete"},

        "sep3": "---------",
        "newPageAfter": {
          name: "向下新增页", icon: "add",
          disabled:function(){
            var id=$(this).attr("id");
            var isPg= isPage(id);
            return !isPg;
          }
        },
        "newPageBefore": {
          name: "向上新增页", icon: "add",
          disabled:function(){
            var id=$(this).attr("id");
            var isPg= isPage(id);
            return !isPg;
          }
        },
        "pgTitle":{
          name: "页面标题", icon: "",
          disabled:function(){
            var id=$(this).attr("id");
            var isPg= isPage(id);
            return !isPg;
          }
        }
      }});
  })
</script>
</body>
</html>
