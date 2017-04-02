/**
 * Created by xm on 2016/10/28.
 * 报告
 */
(function(window,$){

    function ReportToolObj(editorable){
        //是否为编辑页面
        this.editorable=editorable;
    };

    ReportToolObj.prototype={
        createPage:function(id,isEditor,pgTitle){
            var $newPage=$('<div></div>');
            var pgid="";

            if(isEditor){
                pgid=id;
                $newPage.attr('id',pgid);
            }else{
                pgid="pg-"+id;
                $newPage.attr('id',pgid);
            }
            var pgTitleId="";

            $newPage.addClass('pg-continer');
            if(this.isEditorPage()){
                $("#pgTitleId",$newPage)
                $newPage.addClass('context-menu-one');
             //   $newPage.resizable({handles:'s'});
            }
            return $newPage
        },
        isEditorPage:function(){
            return this.editorable;
        },
        createPageElement:function(elementDescript,$page){
            var pid=$page.attr("id");
            var html="";
            if( elementDescript.type=="echar"){
                html='<div class="ui-widget-content context-menu-one" type="echar" loadUrl="'+elementDescript.loadUrl+'"><div type="echar" style="position: relative;overflow: hidden;" loadUrl="'+elementDescript.loadUrl+'"></div></div>';
            }else if( elementDescript.type=="ueditor"){
                html='<div class="ui-widget-content context-menu-one" type="ueditor"><div type="ueditor"  style="position: relative;overflow: hidden;word-wrap: break-word;"></div></div>';//background:#fdebdb
            }
            var $newDiv=$(html);
            if(this.isEditorPage()){
                $newDiv.draggable({ containment: "#"+pid, scroll: false}).css("position", "absolute");
                $newDiv.resizable({containment: "#"+pid});
            }

            $page.append($newDiv[0]);

            //编辑的时候包含id
            if(elementDescript.id){
                $newDiv.attr("id",elementDescript.id);
            }else{
                var elementIndex=$page.data('elementIndex')||0;
                $newDiv.attr("id",pid+"-"+(++elementIndex));
                $page.data('elementIndex',elementIndex);
            }


            if(elementDescript.type=="echar"){
                $newDiv.find(">div:first-child").load(elementDescript.loadUrl) ;
                if(this.isEditorPage()){
                    $newDiv.find(">div:first-child").dblclick(function(e){
                        var width=$(this).parent().width();
                        var height=$(this).parent().height();
                        var loadurl=$(this).attr('loadUrl');
                        loadurl=loadurl.replace(/width=\d+(\.\d+)?/,"width="+width);
                        loadurl=loadurl.replace(/height=\d+(\.\d+)?/,"height="+height);
                        $(this).attr('loadUrl',loadurl);
                        $(this).parent().attr('loadUrl',loadurl);
                        $(this).empty();
                        $(this).load(loadurl);
                    });
                }

            }
            return $newDiv.find(">div:first-child");
        },

        addPage:function($newPage,$select,position){
            if(position=="before"){
                $newPage.insertBefore($select);
            }else {
                $newPage.insertAfter($select);
            }
        },

        editorText:function($continer,content){
            $continer[0].innerHTML=content;
        },

        setBackground:function($continer,background){
            for(var item in background){
                $continer.css(item,background[item]);
            }
        },

        clearBackground:function($continer){
            $continer.css("background-color","");
            $continer.css("background-position","");
            $continer.css("background-repeat","");
            $continer.css("background-image","");
        },

        getBackground:function($continer){
            var background={};
            background["background-color"]=$continer.css("background-color");
            background["background-position"]=$continer.css("background-position");
            background["background-repeat"]=$continer.css("background-repeat");
            background["background-image"]=$continer.css("background-image");
            return background;
        },

        addPageTitle:function($page,pgTitle){
            var pgTitleDivId=$page.attr("id")+"-titleDiv";
            var pgTitleContentId=$page.attr("id")+"-titleContent";
            var $title=$('<div class="title" id="'+pgTitleDivId+'"> ' +
            '<div class="fl title-left" id="'+pgTitleContentId+'" >'+(pgTitle||"请输入标题")+'</div>'+
            '<div class="fr"><img src="/plug-in/glweb/internal/bss/images/log3.png" style="width: 114px; height: 30px"></div>'+
            '<div class="clear"></div>'+
            '</div>');
            if(this.isEditorPage()){
                $("#"+pgTitleContentId,$title).attr('contenteditable',"true");
                $("#"+pgTitleContentId,$title).on('focus',function(){
                         if($(this).text()=='请输入标题'){
                             $(this).text("");
                             var editordiv=$(this)[0];
                             //选中
                             window.setTimeout(function(){
                                 if (window.getSelection && document.createRange) {
                                     range = document.createRange();
                                     range.selectNodeContents(editordiv);
                                     range.collapse(true);
                                     sel = window.getSelection();
                                     sel.removeAllRanges();
                                     sel.addRange(range);
                                 } else if (document.body.createTextRange) {
                                     range = document.body.createTextRange();
                                     range.moveToElementText(editordiv);
                                     range.collapse(true);
                                     range.select();
                                 }
                             },1);
                         }
                });
                $("#"+pgTitleContentId,$title).on('blur',function(){
                    if($(this).text()==''){
                        $(this).text("请输入标题");
                    }
                })
            }
            $page.prepend($title[0]);
        },
        removePageTitle:function($page){
            var pgTitleDivId=$page.attr("id")+"-titleDiv";
            $("#"+pgTitleDivId,$page).remove();
        },

        init:function(report){
            var pages=report.pages;
            for (var i=0;i<pages.length;i++){
                var page=pages[i];
                var $revPage= this.createPage(page.pageId,true);
                $revPage.attr("style",page.style);
                $(document.body).append($revPage[0]);
                $revPage.data('elementIndex',page.elementIndex);
                if(page.title){
                    this.addPageTitle($revPage,page.title.content);
                }
                var elements=page.elements;
                for(var j=0;j<elements.length;j++){
                    var element=elements[j];
                    var $ele=this.createPageElement(element,$revPage);
                    $ele.parent().attr("style",element.style);
                    if(element.type=="ueditor"){
                        this.editorText($ele,element.innerHTML);
                        if(element.bgStyle){
                            this.setBackground($ele,element.bgStyle);
                        }
                    }
                }

            }
        },
        getPages:function($pages){
            var pages=[];
            $pages.each(function(){
                var page={};
                page.pageId=$(this).attr("id");
                page.elementIndex=$(this).data("elementIndex");
                page.style=$(this).attr("style");
                page.title=null;
                page.elements=[];
                //获得直接子元素
                $("#"+page.pageId+" > div[id^='pg-']").each(function (){
                    if($(this).hasClass("title")){
                        page.title={};
                        page.title.content=$("#"+page.pageId+"-titleContent",$(this)).text();
                    }else{
                        var element={};
                        element.id=$(this).attr("id");
                        element.style=$(this).attr("style");
                        element.type=$(this).attr("type");
                        if("echar"==element.type){
                            element.loadUrl=$(this).attr("loadUrl");
                        }else if("ueditor"==element.type){
                            var $textContiner=$(this).find('>div:first-child');
                            element.innerHTML=$textContiner[0].innerHTML;
                            var background=window.ReportTool.getBackground($textContiner);
                            if(background){
                                element.bgStyle=background;
                            }

                        }
                        page.elements.push(element);
                    }
                });
                pages.push(page);
            });

            return pages;
        }

    };


    var ReportTool=new ReportToolObj(window.reportEditorable||false);

    window.ReportTool=ReportTool;


}(window,jQuery))