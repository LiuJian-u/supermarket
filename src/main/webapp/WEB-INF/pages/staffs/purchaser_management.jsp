<%--
  Created by IntelliJ IDEA.
  User: 摇头玩
  Date: 2020/4/8
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>admin_wares_management</title>
    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../../static/css/administratorStyle.css"/>
    <script src="../../../static/js/administratorJs.js"></script>
</head>
<body>
<header class="container-fluid">
    <div class="row">
        <img src="../../../static/images/页眉2.jpg" class="img-responsive" alt="图片无法显示" width="100%"/>
    </div>
    <div class="row">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/administrator/home">首页</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a class="subMenuItem" href="#">基本信息管理</a></li>
                        <li><a class="subMenuItem" href="#">详细信息管理</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

<div class="container-fluid">
    <%--    todo：基本信息管理--%>
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="nav-left">基本信息添加</a></li>
                <li><a href="#" class="nav-left">基本信息查询</a></li>
            </ul>
        </div>
        <div class="col-md-10 panel-of-nav-left"></div>
        <div class="col-md-10 panel-of-nav-left"></div>
    </div>
    <%--    todo：详细信息管理--%>
    <div class="ItemBlock">

        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="nav-left">商品详细信息</a></li>
            </ul>
        </div>
        <div class="col-md-10 panel-of-nav-left"></div>

    </div>
</div>

<footer class="container-fluid"></footer>


<script src="../../../static/jquery/jquery.min.js"></script>
<script src="../../../static/js/bootstrap.min.js" type="application/javascript"></script>
</body>
</html>
