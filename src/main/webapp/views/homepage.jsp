<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/11
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path ;
%>
<!DOCTYPE html>
<html lang="en" xmlns:v-bind="http://www.w3.org/1999/xhtml" xmlns:v-on="http://www.w3.org/1999/xhtml">
<head>
    <title>信息发布系统</title>
    <link rel="stylesheet" type="text/css" href="//unpkg.com/iview/dist/styles/iview.css">
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <style>
        .ivu-layout-content{
            height:900px
        }
    </style>
</head>
<body>
<div id="app">
    <layout>
        <i-header>
            <i-menu mode="horizontal" theme="dark" >
                <row>
                    <i-col span="10">
                        <div class="layout-logo"><a href="javascript:void(0);" onclick="turnPage('home')">信 息 发 布 系 统</a></div>
                    </i-col>
                    <i-col offset="12" span="2">
                        <div class="layout-nav">
                            <menu-item>
                                <a href="/logout"><i-button type="dashed"><icon type="md-log-out"></icon> 退出账号</i-button></a>
                            </menu-item>
                        </div>
                    </i-col>
                </row>
            </i-menu>
        </i-header>
        <layout>
            <sider hide-trigger style="background: #fff">
                <i-menu active-name="1-2" theme="light" width="auto" :open-names="['1']" @on-select="turnPage">
                    <div id="user" >
                        <row>
                            <i-col span="10">
                                <img id="user-img" src="../img/cat.jpg" alt="太帅 无法加载">
                            </i-col>
                            <i-col span="14"><p>${username}</p></i-col>
                        </row>
                    </div>
                    <menu-item name="home">
                        <Icon type="md-home" ></Icon>
                        主页面
                    </menu-item>
                    <menu-item name="sendBlog">
                        <Icon type="ios-create" ></Icon>
                       发博文
                    </menu-item>
                    <menu-item name="myBlog">
                        <Icon type="ios-bookmarks" ></Icon>
                        我的博文
                    </menu-item>
                    <menu-item name="myComment">
                        <Icon type="ios-document" ></Icon>
                        我的评论
                    </menu-item>
                    <menu-item name="focusPer">
                        <Icon type="ios-disc" ></Icon>
                        关注的人
                    </menu-item>
                    <menu-item name="focusMe">
                        <Icon type="ios-contacts" ></Icon>
                        关注我的人
                    </menu-item>
                    <menu-item name="message">
                        <Icon type="md-mail" ></Icon>
                        消息
                    </menu-item>
                    <%--管理员的权限--%>
                    <menu-item name="blacklist">
                        <Icon type="ios-clipboard" ></Icon>
                        黑名单
                    </menu-item>
                    <menu-item name="blackBlog">
                        <Icon type="ios-trash" ></Icon>
                       已删博文
                    </menu-item>
                </i-menu>
            </sider>
            <layout style="padding: 0 24px 24px">
                <p style="font-size: 20px; font-weight: bold; margin: 20px 10px;">您好，${username} !</p>
                <i-content>
                        <iframe :src="page" frameborder="no" width="100%" height="900px">

                    </iframe>
                </i-content>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>


        </layout>
    </layout>

</div>
<script src="../js/ajax.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/vue.min.js"></script>
<script src="../js/iview.min.js"></script>
<script type="text/javascript">
    var app = new Vue({
        el: "#app",
        data:{
            page:"<%=basePath%>/info_system/home",
            user:{
                userName:"",
            },

        }


    });
    $(document).ready(function(){

    });

    function turnPage(name){
        if(name=="home"){
            //主页面
            app.page="<%=basePath%>/info_system/home"
        }else if(name=="sendBlog"){
            //跳转到发博文页面
            app.page="<%=basePath%>/info_system/sendBlog"
        }else if(name=="focusPer") {
            //跳转到我的关注页面
            app.page="<%=basePath%>/info_system/focusPer"
        }else if(name=="focusMe") {
            //跳转到关注我的页面
            app.page="<%=basePath%>/info_system/focusMe"
        }else if(name=="blacklist") {
            //跳转到拉黑用户页面
            app.page="<%=basePath%>/info_system/banUser"
        }else if(name=="blackBlog") {
            //跳转到已删博文页面
            app.page="<%=basePath%>/info_system/deletedBlog"
        }else if(name=="message") {
            //跳转到消息页面
            app.page="<%=basePath%>/info_system/messageInfo"
        }
    }
</script>

</body>
</html>