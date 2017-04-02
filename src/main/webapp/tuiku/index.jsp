<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
  <title>推酷--it人的聚集平台</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${contextPath}/plugin/bootstrap/css/bootstrap.css"  />
  <script src="${contextPath}/plugin/jquery/jquery.min.js"></script>
  <script src="${contextPath}/plugin/bootstrap/js/bootstrap.js"></script>

  <style type="text/css">
      body{
          background-color: white;
          font-family: "Helvetica Neue",Helvetica,Tahoma,Arial,STXihei,"Microsoft YaHei","微软雅黑",sans-serif;
          background-color: #f4f6f8;
      }

      a{
          color:#333; /* 设置字体的颜色 */
      }
      .navbar-toggle .icon-bar {
          background-color: #888; /* 设置字体的颜色 */
      }
      .nav > li > a{
          font-size: 1.2em;
          font-weight: bold;

      }
      .nav > li > a:hover,
      .nav > li > a:focus {
          text-decoration: none;
          background-color: transparent;
          color:#16a085;
      }

      .nav > li > a:focus{
          color:#16a085;
      }

      a.navbar-brand:focus{
          color:#16a085;
      }


      /* 下来框设置角*/
    /*  .navbar .nav>li>.dropdown-menu:after {
          content: '';
          display: inline-block;
          border-left: 6px solid transparent;
          border-right: 6px solid transparent;
          border-bottom: 6px solid #d9d6a5;
         *//* #border-color: #000000;*//*
          position: absolute;
          top: -6px;
          left: 15px;
      }


      .navbar-nav > li > .dropdown-menu {
          margin-top: 3px;
      }*/
      #fix_nav{
          background-color: #ffffff;
          border: 1px solid rgba(0, 0, 0, 0.2);
          box-shadow:0 -1px 0 #e9e9e9 inset,0 1px 0 rgba(0,0,0,0.05)inset;
      }



      .list_article{
          padding-left: 5px;
          padding-right: 5px;
      }
      .list_article_item{
         padding:10px 5px 10px 5px;
         border-bottom: 0.8px dashed rgb(219, 219, 219);
      }

      .media-table{
          display: table;
          table-layout: fixed;
          word-wrap:break-word;
          width:100%;
      }



      .list_article_item a{
          text-decoration: none;
      }
      .list_article_item a:hover{
          color:#16a085;
      }

      .list_article_item:hover{
          background-color: #FAFAFA;
      }

      .list_article_item .title{
          font-size: 18px;
          font-weight: bold;
          padding: 6px 10px 8px 10px;
          white-space: nowrap;
          word-break: break-all;
          overflow: hidden;
          text-overflow: ellipsis;
      }

      .media-img{
          width: 76px;
      }

      .media-img > img{
          width:100%;
          height: 60px;
      }

      .media-text{
          display: table-cell;
          vertical-align: middle;
          word-wrap:break-word;
      }

      .tip{
          font-size: 13px;
          color: #999;
          padding-left: 10px;
      }


      .list-active{


          margin-top: 5px;
      }

      .list-active-item{
          padding: 5px 5px 5px 5px;
          border-bottom: 1px solid #e8e8e8;
      }

      .list-active-item .title{
          font-weight: bold;
          font-size: 1.2em;
      }

      .active-meta{
          color:#999;
          margin-top: 5px;
      }

      .mt10{
          margin-top: 10px;
      }

      /* 内容区 */
      .content-block{
          padding: 5px 5px 10px 5px;
          background-color: #ffffff;
      }

      /*标题块 */
      .content-block > .title-block{
          padding:3px 5px 0 10px;
          margin-bottom: 8px;
          font-size: 1.2em;
          line-height: 1.5em;
          border-bottom: 0.8px solid #0aa284;
      }

      /* 标题*/
      .title-block > .title{
          display:inline-block;
          padding:5px 5px;
          color: #0aa284;
          border-bottom: 1px solid #0aa284;
          text-decoration: none;
      }


      .side-block{
          padding: 5px 5px 10px 5px;
          background-color: #ffffff;
          margin-bottom: 10px;
      }

      .side-block >.side-title{
          padding:3px 5px 0 10px;
          margin-bottom: 8px;
          font-size: 1.2em;
          line-height: 1.5em;
          border-bottom: 0.8px solid #e8e8e8;
      }

      .side-title>div{
          padding: 5px 5px;
      }

      .side-block >.side-body{

            margin: 10px 0;
            padding: 0 5px;
      }

      .side-body >.side-text{
          font-size: 16px;
          color:#666666;
      }

      .side-body >.side-btn {
          margin: 5px auto;
          width: 80%;

      }
      /* 课程 */
      .course{
          display:block;
          padding:4px;
          border: 1px solid #f4f6f8;
          box-shadow: 0 1px 3px rgba(0,0,0,0.1);
      }

      .course> .course-text{
          white-space: nowrap;
          word-break: break-all;
          overflow: hidden;
          text-overflow: ellipsis;
      }

      .a-item{
          display: block;
          position: relative;
          text-align: center;
          width: 100%;
      }

      .img-title{
          display: block;
          position: absolute;
          bottom: 0;
          width: 100%;
          text-align: center;
          color: #fff;
          background: rgba(92,92,92,.8);
          filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#CB929292,endColorstr=#CB929292);
          overflow: hidden;
          white-space: nowrap;
          word-break: keep-all;
          text-overflow: ellipsis;
      }

      .myrow{
          margin-left: -3px;
          margin-right: -3px;
      }

      .myrow  .col-md-4,  .myrow  .col-xs-6 {
          padding-right: 3px;
          padding-left: 3px;
          margin-top: 3px;
      }

  </style>
</head>
<body>
    <div id="fix_nav" style="">
    <div class="container">  <!-- 宽度设置-->
      <nav class="navbar" style="margin-bottom: 10px;"<%--style="border-bottom-color:rgba(0, 0, 0, 0.2);"--%>> <!-- 最小高度，底边距-->
          <div class="container-fluid"> <!-- 左右内边距 -->
            <div class="navbar-header"> <!-- 左浮动-->
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                      data-target="#navbar-ex1-collapse" aria-expanded="false" >  <!-- navbar-toggle 按钮隐藏-->
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span><!-- block布局，设置宽度和高度 通过背景颜色显示 内容-->
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#" style="font-size: 1.5em;font-weight: 200; ">推酷</a>
            </div>

            <nav id="navbar-ex1-collapse" class="collapse navbar-collapse">
                                                         <!-- collapse display none
                                                               点击触发 collapse.in  out 事件
                                                          -->
              <ul class="nav navbar-nav"> <!-- nav float left, -->
                  <li><a href="#">文章</a></li>  <!-- .navbar-nav > li > a -->
                  <li><a  href="#">站点</a></li>
                  <li><a href="#">主题</a></li>
                  <li><a href="#">活动</a></li>
                  <li><a href="#">APP<sup>荐</sup></a></li>
                  <li class="dropdown">  <!-- 采用相对布局 -->
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">周刊<span class="caret"></span></a>
                      <ul class="dropdown-menu">  <!-- dropdown-menu 绝对布局，隐藏 top 100%；.open > .dropdown-menu 显示   -->
                          <li><a href="http://www.tuicool.com/mags">编程狂人</a></li>
                          <li><a href="http://www.tuicool.com/mags/design">设计匠艺</a></li>
                          <li><a href="http://www.tuicool.com/mags/startup">创业周刊</a></li>
                          <li><a href="http://www.tuicool.com/mags/tech">科技周刊</a></li>
                          <li><a href="http://www.tuicool.com/mags/guru">Guru Weekly</a></li>
                          <li><a href="http://www.tuicool.com/articles/weekly">一周拾遗</a></li>
                      </ul>
                  </li>
                  <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                          <li><a href="http://course.tuicool.com/">公开课</a></li>
                          <li><a href="http://www.tuicool.com/bbs/go/issues">意见反馈</a></li>
                      </ul>
                  </li>
              </ul>
              <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索">
                </div>
             </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">登录</a></li>
                </ul>
            </nav>

          </div>
      </nav>
    </div>
    </div>

    <div class="container" style="margin-top: 20px;" >
        <div class="row">
            <div class="col-md-8"  style="margin-bottom: 10px;/*margin-right: 20px;*/">
                <div class="content-block">
                    <div class="title-block" >
                        <a href="#" class="title">热门文章</a>
                    </div>

                    <div id="list_article" class="list_article">
                        <div class="list_article_item"><!-- 设置底边框，上下边距， -->
                            <div class="media media-table"><!-- 上外边距 15px-->
                                <div class="media-left media-img" > <!-- table-cell 布局 向上对齐 -->
                                        <img class="media-object" src="http://aimg1.tuicool.com/7NZrUfe.jpg!index" alt="...">
                                </div>
                                <div class="media-text"> <!-- table-cell 布局 向上对齐 -->
                                    <div class="title" >
                                        <a href="#" title="干货来了，19个完整app正在赶来，不看你会后悔的">干货来了，19个完整app正在赶来，不看你会后悔的</a>
                                    </div>
                                    <div class="tip">
                                        <span></span> <span>.</span>  <span>02-28 10:08</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list_article_item"><!-- 设置底边框，上下边距， -->
                            <div class="media" style="display: table;table-layout: fixed;word-wrap:break-word; width:100%;"><!-- 上外边距 15px-->
                                <div class="media-left media-img"> <!-- table-cell 布局 向上对齐 -->
                                    <img class="media-object"  src="http://aimg0.tuicool.com/v6nMn2N.jpg!index" >
                                </div>
                                <div class="media-text"> <!-- table-cell 布局 向上对齐 -->
                                    <div class="title" >
                                        <a href="#" title="他制造了童年回忆小霸王，做手机去年销量第一，却屡次在事业顶峰舍弃了江山">sddddddddfds 他制造了童年回忆小霸王，做手机去年销量第一，却屡次在事业顶峰舍弃了江山</a>
                                    </div>
                                    <div class="tip">
                                        <span>Helloweba</span> <span>.</span>  <span>02-28 10:08</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list_article_item"><!-- 设置底边框，上下边距， -->
                            <div class="media" style="display: table;table-layout: fixed;word-wrap:break-word; width:100%;"><!-- 上外边距 15px-->
                                <div class="media-left media-img"> <!-- table-cell 布局 向上对齐 -->
                                    <img class="media-object"  src="http://aimg0.tuicool.com/v6nMn2N.jpg!index" >
                                </div>
                                <div class="media-text"> <!-- table-cell 布局 向上对齐 -->
                                    <div class="title" >
                                        <a href="#" title="他制造了童年回忆小霸王，做手机去年销量第一，却屡次在事业顶峰舍弃了江山">sddddddddfds 他制造了童年回忆小霸王，做手机去年销量第一，却屡次在事业顶峰舍弃了江山</a>
                                    </div>
                                    <div class="tip">
                                        <span>Helloweba</span> <span>.</span>  <span>02-28 10:08</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><%--end list_article --%>
                    <div class="more" style="text-align: center;margin: 15px 0px;">
                        <a>查看更多</a>
                    </div>
                </div>

                <div style="margin-top:10px; background-color: #ffffff;">
                    <a href="http://click.aliyun.com/m/10869/" target="_blank">
                        <img src="http://static0.tuicool.com/images/upload/aliyun_long.jpg" width="100%"  height="79.7px;"></a>
                </div>

                <div class="content-block mt10">
                    <div class="title-block" >
                        <a href="#" class="title" >课程推荐</a>
                    </div>
                    <div class="row">
                       <div class="col-sm-6 col-md-4" >
                            <a href="/course/details/5873772a0cf2e8b2efa49c83" target="_blank" class="course">
                                <img class="img-polaroid" src="http://cimg0.tuicool.com/QfMne2.jpg!middle" width="100%">
                                <div class="course-text">中恩字符复 字符创地接费多少分水电费非法佛挡dsd杀佛而非</div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4" >
                            <a href="/course/details/5873772a0cf2e8b2efa49c83" target="_blank" class="course">
                                <img class="img-polaroid" src="http://cimg0.tuicool.com/QfMne2.jpg!middle" width="100%">
                                <div class="course-text">中恩字符复 字符创地接费多少分水电费非法佛挡dsd杀佛而非</div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4" >
                            <a href="/course/details/5873772a0cf2e8b2efa49c83" target="_blank" class="course">
                                <img class="img-polaroid" src="http://cimg0.tuicool.com/QfMne2.jpg!middle" width="100%">
                                <div class="course-text">中恩字符复 字符创地接费多少分水电费非法佛挡dsd杀佛而非</div>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4" >
                            <a href="/course/details/5873772a0cf2e8b2efa49c83" target="_blank" class="course">
                                <img class="img-polaroid" src="http://cimg0.tuicool.com/QfMne2.jpg!middle" width="100%">
                                <div class="course-text">中恩字符复 字符创地接费多少分水电费非法佛挡dsd杀佛而非</div>
                            </a>
                        </div>
                    </div>

                    <div class="more" style="text-align: center;margin: 15px 0px;">
                        <a>查看更多</a>
                    </div>
                </div> <%-- end  课程推荐--%>

                <!-- 近期活动-->
                <div class="content-block mt10">
                    <div class="title-block" style="border-bottom: 0.8px solid #0aa284;padding:3px 5px 0 10px;margin-bottom: 8px; font-size: 1.2em;line-height: 1.5em; ">
                        <a href="#" class="title">近期活动</a>
                    </div>

                    <div class="list-active">
                        <div class="list-active-item">
                            <div class="active-title">
                                <a href="#" class="title">构建落地新渠道，2017智慧家庭集成商对接沙龙</a>
                            </div>
                            <div class="active-meta">
                                <span>深圳 - 待定</span>
                                <span>02-28 09:00</span>
                            </div>
                        </div>

                        <div class="list-active-item">
                            <div class="active-title">
                                <a  href="#" class="title">【AI：重构未来】人工智能与智慧生活高端论坛——2017年千家智客全国巡回论坛</a>
                            </div>
                            <div class="active-meta">
                                <span>深圳 - 待定</span>
                                <span>02-28 09:00</span>
                            </div>
                        </div>
                    </div> <%-- end  list-active --%>

                    <div class="more" style="text-align: center;margin: 15px 0px;">
                        <a>查看更多</a>
                    </div>

                </div>



            </div>
            <div class="col-md-4 col-ls-12 clearfix" >

                <div  class="side-block">
                    <div class="side-title">
                        <div >IT人专属个性阅读社区</div>
                    </div>
                    <div class="side-body">
                        <div class="side-text">推酷以技术为驱动，以聚合挖掘为核心，打造个性推荐和订阅，给你一站式的阅读。
                            更汇聚优质公开课和线下活动，让信息知识获取更便捷。 万千网友汇聚于此，公诸同好，交流学习。</div>

                        <button class="btn btn-success btn-block side-btn">登录/注册</button>
                    </div>
                </div>
                <div  class="side-block">
                    <div class="side-title">
                        <div >客户端</div>
                    </div>
                    <div class="side-body">
                        <img src="http://static1.tuicool.com/images/upload/mobile.png" width="100%">
                    </div>
                </div>

                <div  class="side-block">
                    <div class="side-title">
                        <div >热门主题</div>
                    </div>

                    <div class="side-body clearfix">
                        <div class="row myrow" >
                            <div class="col-md-4 col-xs-6" >
                                <a href="/topics/10000024" target="_blank" class="a-item" >
                                    <img src="http://ttimg0.tuicool.com/10000024.png" alt="创业" width="100%">
                                    <small class="img-title">创业</small>
                                </a>
                            </div>
                            <div class="col-md-4 col-xs-6" >
                                <a href="/topics/10000024" target="_blank" class="a-item">
                                    <img src="http://ttimg0.tuicool.com/10000024.png" alt="创业" width="100%">
                                    <small class="img-title">创业</small>
                                </a>
                            </div>
                            <div class="col-md-4 col-xs-6" >
                                <a href="/topics/10000024" target="_blank" class="a-item">
                                    <img src="http://ttimg0.tuicool.com/10000024.png" alt="创业" width="100%">
                                    <small class="img-title">创业</small>
                                </a>
                            </div>
                            <div class="col-md-4 col-xs-6" >
                                <a href="/topics/10000024" target="_blank" class="a-item">
                                    <img src="http://ttimg0.tuicool.com/10000024.png" alt="创业" width="100%">
                                    <small class="img-title">创业</small>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

</body>
</html>
