<%--
  Created by IntelliJ IDEA.
  User: 摇头玩
  Date: 2020/4/2
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>administrator</title>
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
                            data-target="#navbar-collapse-0" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">功能选择 <span
                            class="glyphicon glyphicon-menu-right"></span></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-collapse-0">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/administrator/wares_info_manage/main">商品信息管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/administrator/sale_info_manage/main">销售信息管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/administrator/pur_info_manage/main">进货信息管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/administrator/inv_info_manage/main">库存信息管理</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/administrator/per_info_manage/main">人员信息管理</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">系统管理 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">修改密码</a></li>
                                <li><a href="#">退出登录</a></li>
                                <li><a href="#">数据库备份</a></li>
                            </ul>
                        </li>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
</header>

<div class="container-fluid">

</div>

<footer class="container-fluid"></footer>

<script src="../../../static/jquery/jquery.min.js"></script>
<script src="../../../static/js/bootstrap.min.js" type="application/javascript"></script>
</body>
</html>
