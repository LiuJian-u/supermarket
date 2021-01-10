<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title></title>
    <%--    <link rel="stylesheet" href="">--%>

<%--    <link rel="stylesheet" href="../../static/css/bootstrap.min.css"/>--%>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/css/indexStyle.css"/>
    <script src="../../static/js/indexJs.js"></script>


</head>
<body>
<%--<jsp:include page="faile.jsp" flush="true" />--%>
<%--页眉--%>
<header class="container-fluid">
    <div class="row pp">
        <img src="../../static/images/页眉.jpg" class="img-responsive" alt="图片无法显示" width="100%"/>
    </div>

    <div class="row">
        <span class="art-font">欢迎使用珍好超市进销存管理系统！</span>
    </div>
</header>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<%--主题内容--%>
<div class="container">
    <div class="row" style="height: 30%;">
        <!-- Single button -->
        <form class="form-horizontal" method="post" id="login_form">
            <div class="form-group">
                <label for="inputAccount" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span> </label>
                <div class="col-sm-8">
                    <input name="login_account" type="text" class="form-control" id="inputAccount"
                           placeholder="请输入您的账号">
                </div>
                <label class="col-sm-2 warring_label">账号不能为空！</label>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span></label>
                <div class="col-sm-8">
                    <input name="login_password" type="password" class="form-control" id="inputPassword"
                           placeholder="请输入密码">
                </div>
                <label class="col-sm-2 warring_label">密码不能为空！</label>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <button type="button" class="btn btn-default" id="staffLoginBtn"><span class="glyphicon glyphicon-log-in"></span> 员工登录</button>
                    <button type="button" class="btn btn-default" id="adminLoginBtn"><span class="glyphicon glyphicon-log-in"></span> 管理员登录</button>
                </div>

            </div>


        </form>
    </div>

</div>

<%--页脚--%>
<footer class="container-fluid">

</footer>

<%--<h2>Hello World!</h2>--%>
<%--<form id="f1" action="administrator/checkLogin" method="post">--%>
<%--    账号：<input type="text" name="admin_account">--%>
<%--    密码：<input type="text" name="admin_password">--%>
<%--    <input type="submit" value="登录">--%>
<%--</form>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>

<%--<form id="insertStaff" action="staff/insertStaff" method="post">--%>
<%--    <label>账号：<input type="text" name="s_account"/></label><br>--%>
<%--    <label>密码：<input type="text" name="s_password"/></label><br>--%>
<%--    <label>姓名：<input type="text" name="s_name"/></label><br>--%>
<%--    <label>职务：<input type="text" name="s_post"/></label><br>--%>
<%--    <label>电话：<input type="text" name="s_phone"/></label><br>--%>
<%--    <input type="submit" value="确认添加">--%>
<%--</form>--%>

<script src="../../static/jquery/jquery.min.js"></script>
<script src="../../static/js/bootstrap.min.js" type="application/javascript"></script>


</body>
</html>
