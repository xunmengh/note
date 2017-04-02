<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/10/27
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>文本编辑</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <script type="text/javascript" charset="utf-8" src="/plug-in/report/ueditor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="/plug-in/report/ueditor/ueditor.all.min.js"> </script>
  <script type="text/javascript" charset="utf-8" src="/plug-in/report/ueditor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript" charset="utf-8" src="/plug-in/report/ueditor/addIndicatorDialog.js"></script>
<body>
<div>
  <script id="editor" type="text/plain" style="width:750px;height:300px;"></script>
</div>
<script type="text/javascript">

  // 解决第一次不能够加载页面内容的问题
   var initContent="";
   var initBackground={};

  //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
  var ue = UE.getEditor('editor',{

    toolbars: [
      [ 'source',
        'undo', //撤销
        'redo', //重做
        'bold', //加粗
        'italic', //斜体
        'underline', //下划线
        'strikethrough', //删除线
        'subscript', //下标
        'fontborder', //字符边框
        'superscript', //上标

        'indent', //首行缩进
        'blockquote', //引用
        'pasteplain', //纯文本粘贴模式
        'selectall', //全选
      //  'print', //打印
       // 'preview', //预览
        'horizontal', //分隔线
        'removeformat', //清除格式

        'unlink', //取消链接
       /* 'insertrow', //前插入行
        'insertcol', //前插入列
        'mergeright', //右合并单元格
        'mergedown', //下合并单元格
        'deleterow', //删除行
        'deletecol', //删除列
        'splittorows', //拆分成行
        'splittocols', //拆分成列
        'splittocells', //完全拆分单元格
        'deletecaption', //删除表格标题
        'inserttitle', //插入标题
        'mergecells', //合并多个单元格
        'deletetable', //删除表格*/
        'cleardoc', //清空文档
       // 'insertparagraphbeforetable', //"表格前插入行"

        'fontfamily', //字体
        'fontsize', //字号
        'paragraph', //段落格式
          'simpleupload', //单图上传
          'insertimage', //多图上传
          /*'edittable', //表格属性
        'edittd', //单元格属性*/
        'link', //超链接
        'spechars', //特殊字符
        'searchreplace', //查询替换


       /* 'help', //帮助*/
        'justifyleft', //居左对齐
        'justifyright', //居右对齐
        'justifycenter', //居中对齐
        'justifyjustify', //两端对齐
        'forecolor', //字体颜色
        'backcolor', //背景色
        'insertorderedlist', //有序列表
        'insertunorderedlist', //无序列表
        'fullscreen', //全屏
        'directionalityltr', //从左向右输入
        'directionalityrtl', //从右向左输入
        'rowspacingtop', //段前距
        'rowspacingbottom', //段后距

        /*'imagenone', //默认
        'imageleft', //左浮动
        'imageright', //右浮动
        'attachment', //附件
        'imagecenter', //居中*/

        'lineheight', //行间距
        'edittip ', //编辑提示
        'customstyle', //自定义标题
        'autotypeset', //自动排版

        'touppercase', //字母大写
        'tolowercase', //字母小写
        'background', //背景

      //  'inserttable', //插入表格

        ]
    ],
       autoHeightEnabled: true,
       autoFloatEnabled: true

  });
  ue.ready(function(){
      setContent(initContent);
      setBackground(initBackground);
  })


    function setInitContent(content){
        initContent=content;
    }

    function setInitBackground(background){
        initBackground=background;
    }

  function getEditorState(){
      return UE.getEditor('editor').isReady;
  }

  function getBackground(){
    return UE.getEditor('editor').queryCommandValue('background');
  }

  function setBackground(background){
    UE.getEditor('editor').execCommand('background',background);
  }
  function getContent() {
    return UE.getEditor('editor').getContent();
  }
  function setContent(content) {
    UE.getEditor('editor').setContent(content);
  }

  function clearContent(){
    UE.getEditor('editor').execCommand('cleardoc');
  }

</script>
</body>
</html>
