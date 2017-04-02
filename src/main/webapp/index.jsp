<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>layim</title>
    <link rel="stylesheet" href="${contextPath}/layui/css/layui.css"  />
    <script src="${contextPath}/layui/layui.js"></script>
</head>
<body>

    <div>
        中文字符
    </div>

<script type="text/javascript">
    layui.use('layim', function(layim){
        //基础配置
        layim.config({
            //初始化接口
            init: {
                url: 'data/getList.json'
                , data: {}
            }
            //查看群员接口
            , members: {
                url: 'data/getMembers.json'
                , data: {}
            }
        });

        var socket = new WebSocket('ws://localhost:8945/note/myHandler.do');


        //连接成功时触发
        socket.onopen = function(){
            socket.send('XXX连接成功');
        };

        //监听收到的消息
        socket.onmessage = function(res){
            //res为接受到的值，如 {"emit": "messageName", "data": {}}
            //emit即为发出的事件名，用于区分不同的消息

//            layim.getMessage(res.data)
        };

        layim.on('sendMessage', function(res){
            var mine = res.mine;
            //发送一个消息
            socket.send(res);
        });


    });
</script>
</body>
</html>