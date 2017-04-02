<%--
  Created by IntelliJ IDEA.
  User: xm
  Date: 2017/2/20
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>博客目录管理页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${contextPath}/plugin/bootstrap/css/bootstrap.css"  />
    <script src="${contextPath}/plugin/jquery/jquery.min.js"></script>
    <script src="${contextPath}/plugin/bootstrap/js/bootstrap.js"></script>

    <link rel="stylesheet" href="${contextPath}/plugin/bootstraptable/bootstrap-table.css"  />
    <script src="${contextPath}/plugin/bootstraptable/bootstrap-table.js"></script>
    <script src="${contextPath}/plugin/bootstraptable/bootstrap-table-zh-CN.js"></script>

    <link rel="stylesheet" href="${contextPath}/plugin/bootstrap3editable/css/bootstrap-editable.css" />
    <script src="${contextPath}/plugin/bootstrap3editable/js/bootstrap-editable.js"></script>
    <script src="${contextPath}/plugin/bootstraptable/extensions/editable/bootstrap-table-editable.js"></script>

    <%--  http://www.cnblogs.com/landeanfen/p/5005367.html --%>
</head>
<body>


<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_departmentname">
                    </div>
                    <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_statu">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<a href="#"  data-type="text" data-title="用户名">用户名</a>
<a href="${contextPath}/blog/editorBlog.do"  target="_blank" data-type="text" data-title="用户名">用户名</a>
    <span id="editorA">文本编辑</span>
    <div id="toolbar" class="btn-group">
    <button id="btn_add" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <button id="btn_edit" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
    </button>
    <button id="btn_delete" type="button" class="btn btn-default" >
        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
    </button>
</div>
<table id="table2"></table>

<!-- 新增 Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加目录</h4>
            </div>
            <div class="modal-body">
                目录名称：<input name="name" id="name">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_add_submit">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 删除 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">删除目录</h4>
            </div>
            <div class="modal-body">
                您确定删除<span id="blogCatalogName"></span>吗
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_delete_submit">确定</button>
            </div>
        </div>
    </div>
</div>




<script type="text/javascript">
    $(function () {
        $('#editorA').editable();
    });

   $(function(){
       $("#btn_add_submit").click(function(){
           var name= $('#name').val();
           $.ajax({
               url:'${contextPath}/blog/addCatalog.do',
               data:{name:name,'user.username':'123456'},
               method:'post',
               dataType:'json',
               async:false,
               success:function(result){
                   console.info(result);
//                   $('#table2').bootstrapTable('removeByUniqueId',id);
               },error:function(err){
                   console.info(err);
               }
           });
           $('#addModal').modal('hide');
       })

       $("#btn_delete_submit").click(function(){
           var ids= $('#blogCatalogName').text().split(",");
           $.ajax({
               url:'${contextPath}/blog/delCatalog.do',
               data:{ids:ids,uid:'123456'},
               method:'post',
               dataType:'json',
               async:false,
               success:function(result){
                  console.info(result);
                   for(var i=0;i<ids.length;i++){
                       $('#table2').bootstrapTable('removeByUniqueId',ids[i]);
                   }

               },error:function(err){
                   console.info(err);
               }
           });
           $('#myModal').modal('hide');
       });


       $("#btn_delete").click(function(){
           var datas= $('#table2').bootstrapTable('getSelections');
           var ids=[];
           for(var i=0;i<datas.length;i++){
              ids[i]=datas[i].id;
           }
           if(ids.length>0){
               $('#blogCatalogName').text(ids.join(","));
               $('#myModal').modal('show');
               console.info(ids);
           }


       });

       $("#btn_add").click(function(){
           $('#addModal').modal('show');
       });

       function queryParams(params){
           var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
               uid:'123456',
               limit: params.limit,   //页面大小
               offset: params.offset //页码
           };
           return temp;
       }

       $('#table2').bootstrapTable({
           url: '${contextPath}/blog/index.do',
           /*height:550,*/
           method:'post',
           contentType : "application/x-www-form-urlencoded",// post 提交数据的时候使用
           striped:true,
           sortName:'score',
           pagination: true,
           queryParams:queryParams,
           sidePagination:'server',
           pageNumber: 1,                       //初始化加载第一页，默认第一页
           pageSize: 10,                       //每页的记录行数（*）
           pageList: [10, 25, 50],        //可供选择的每页的行数（*）
           search: true,           //   启用搜索框
           searchOnEnterKey:true,  // 按回车键的时候启动搜索
           strictSearch: false,   // 模糊搜素
           showColumns : true,
           showRefresh: true,
           showToggle: true,
           showPaginationSwitch:true,
           uniqueId:'id',
           searchAlign: 'right', //搜索框的位置
           buttonsAlign: 'right',// 按钮的位置
           toolbar:'#toolbar',
           toolbarAlign:'left',

           columns: [{
               checkbox: true
           },{
               field: 'id',
               title: 'id'
           }, {
               field: 'name',
               title: '名称',
              /* formatter: function (value, row, index) {
                   return "<a href=\"#\" name=\"UserName\" data-type=\"text\" data-pk=\""+row.Id+"\" data-title=\"用户名\">" + value + "</a>";
               },*/
               editable: {
                   type: 'text',
                   title: '目录名称',
                   validate: function (v) {
                       if (!v) return '用户名不能为空';

                   }
               }
           }, {
               field: 'count',
               title: '文章数量'
           }, {
               field: 'score',
               title: '索引'
           }],
           onEditableSave: function (field, row, oldValue, $el) {
               $.ajax({
                   type: "post",
                   url: "${contextPath}/blog/editCatalog.do",
                   data: row,
                   dataType: 'JSON',
                   success: function (result) {
                       if (result.code>0) {
                           alert('提交数据成功');
                       }else{
                           alert(result.msg);
                       }
                   },
                   error: function () {
                       alert('编辑失败');
                   }

               });
           }
       });
   })

</script>
</body>
</html>
