<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String contentPath=request.getContextPath(); %>
<!-- 文件格式的正确非常的重要 -->
<!DOCTYPE html>
<html>
<head>
    <base href="<%=contentPath%>" />
    <title>layim</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"   media="all"/>
    <script src="layui/layui.js" charset="utf-8"></script>
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
                url: 'login/getList.do'
                , data: {}
            }
            //查看群员接口
            , members: {
                url: 'data/getMembers.json'
                , data: {}
            }
            ,uploadImage: {
                url: '' //（返回的数据格式见下文）
                ,type: '' //默认post
            }
            ,uploadFile: {
                url: '' //（返回的数据格式见下文）
                ,type: '' //默认post
            }

            //扩展工具栏
            ,tool: [{
                alias: 'code'
                ,title: '代码'
                ,icon: '&#xe64e;'
            }]

            //,brief: true //是否简约模式（若开启则不显示主面板）

            //,title: 'WebIM' //自定义主面板最小化时的标题
            //,right: '100px' //主面板相对浏览器右侧距离
            //,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
            ,initSkin: '3.jpg' //1-5 设置初始背景
            //,skin: ['aaa.jpg'] //新增皮肤
            //,isfriend: false //是否开启好友
            //,isgroup: false //是否开启群组
            //,min: true //是否始终最小化主面板，默认false
            //,notice: true //是否开启桌面消息提醒，默认false
            //,voice: false //声音提醒，默认开启，声音文件为：default.wav


        });

      /*  layui.use('layim', function(layim){
            //先来个客服模式压压精
            layim.config({
                brief: true //是否简约模式（如果true则不显示主面板）
            }).chat({
                name: '客服姐姐'
                ,type: 'kefu'
                ,avatar: 'http://tp1.sinaimg.cn/5619439268/180/40030060651/1'
                ,id: -2
            });
        });*/

        var socket = new WebSocket('ws://localhost:8945/note/myHandler.do');


        //连接成功时触发
        socket.onopen = function(){
//            socket.send('XXX连接成功');
            console.info('XXX连接成功');
        };

        //监听收到的消息
        socket.onmessage = function(res){
            try{

              var msg = JSON.parse(res.data);
                console.info(res.data);
//               layim.getMessage(res); //res.data即你发送消息传递的数据（阅读：监听发送的消息）
//                {"username":"余夕","avatar":"http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg","id":470261932,"mine":false,"content":"是滴是滴的的发送到f","type":"friend","timestamp":1483669854472,"fromid":12345}
//                {"avatar":"http://tp4.sinaimg.cn/1345566427/180/5730976522/0","id":12345,"sign":"代码在囧途，也要写到底","username":"闲心","type":"friend","name":"闲心","mine":false,"timestamp":1483670005431,"fromid":12345}
//                layim.getMessage({"username":"闲心","avatar":"http://tp4.sinaimg.cn/1345566427/180/5730976522/0","id":12345,"mine":false,"content":"sadadsad","type":"friend","timestamp":1483669597472,"fromid":"12345"})

                layim.getMessage(msg);
            }catch(e){
            }

            console.info(res);
        };

        layim.on('sendMessage', function(res){
            var mine = res.mine;
//            "mine":{"username":"余夕","avatar":"http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg","id":470261932,"mine":true,"content":"的顶顶顶顶顶顶顶顶顶顶"},"to":{"avatar":"http://tp3.sinaimg.cn/1223762662/180/5741707953/0","id":234567,"sign":"我爱贤心","username":"林心如","name":"林心如","type":"friend"}}

            console.info(JSON.stringify(res));

            var obj = {
                username: mine.username
                ,avatar: mine.avatar
                ,content: mine.content
                ,id: mine.id+""
                ,type: res.to.type
                ,fromid:mine.id+""
                ,timestamp:new Date().getTime()
                ,touid:res.to.id  //接收人的id
            }


           /* {

            }
            {
                username: "纸飞机" //消息来源用户名
                        ,avatar: "http://tp1.sinaimg.cn/1571889140/180/40030060651/1" //消息来源用户头像
                    ,id: "100000" //聊天窗口来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
                    ,type: "friend" //聊天窗口来源类型，从发送消息传递的to里面获取
                    ,content: "嗨，你好！本消息系离线消息。" //消息内容

                    ,mine: false //是否我发送的消息，如果为true，则会显示在右方
                    ,fromid: 100001 //消息来源者的id，可用于自动解决浏览器多窗口时的一些问题
                    ,timestamp: 1467475443306 //服务端动态时间戳
            }
*/
            //发送一个消息
            socket.send(JSON.stringify(obj));
        });


    });
</script>
</body>
</html>