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
    <title>admin_sale_management</title>
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
                    <a class="navbar-brand" href="#">首页</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a class="subMenuItem" href="#">销售单管理</a></li>
                        <li><a class="subMenuItem" href="#">销售统计管理</a></li>
                        <li><a class="subMenuItem" href="#">销售退货统计管理</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="container-fluid">
    <%--    todo：销售单信息管理--%>
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="nav-left">销售单查询</a></li>
                <li><a href="#" class="nav-left">销售记录查询</a></li>
                <li><a href="#" class="nav-left">销售退货记录查询</a></li>
            </ul>
        </div>
<%--        todo：销售单查询--%>
        <div class="col-md-10 panel-of-nav-left">
            <div class="row">
                <div class="row obj-attributes">
                    <form action="" method="post">
                        <div class="col-md-12">
                            <select id="select-condition-y-1" class="year">
                                <option>--</option>
                            </select>
                            <label for="select-condition-y-1">年</label>

                            <select id="select-condition-m-1" class="month">
                                <option>--</option>
                            </select>
                            <label for="select-condition-m-1">月</label>

                            <select id="select-condition-d-1" class="day">
                                <option>--</option>
                            </select>
                            <label for="select-condition-d-1">日</label>
                        </div>
                        <div class="col-md-4">
                            <label class="input-group">
                                <span class="input-group-addon" id="basic-addon1-1">销售员账号</span>
                                <input name="s_name" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1-1">
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label class="input-group">
                                <span class="input-group-addon" id="basic-addon1-2">会员id</span>
                                <input name="s_name" type="text" class="form-control" placeholder="" aria-describedby="basic-addon1-2">
                            </label>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn query-btn">查询</button>
                        </div>
                    </form>
                </div>
            </div>
            <hr class="panel-hr"/>
            <div class="row table-back">
                <table class="table table-striped table-responsive">
                    <tr>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                    </tr>
                </table>
            </div>
        </div>
<%--        todo：销售记录查询--%>
        <div class="col-md-10 panel-of-nav-left">
            <div class="row">
                <div class="row obj-attributes">
                    <form action="" method="post">
                        <div class="col-md-12">
                            <select id="select-condition-y-2" class="year">
                                <option>--</option>
                            </select>
                            <label for="select-condition-y-2">年</label>

                            <select id="select-condition-m-2" class="month">
                                <option>--</option>
                            </select>
                            <label for="select-condition-m-2">月</label>

                            <select id="select-condition-d-2" class="day">
                                <option>--</option>
                            </select>
                            <label for="select-condition-d-2">日</label>
                        </div>
                        <div class="col-md-4">
                            <label class="input-group">
                                <span class="input-group-addon" id="basic-addon2-1">销售员账号</span>
                                <input name="s_name" type="text" class="form-control" placeholder="" aria-describedby="basic-addon2-1">
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label class="input-group">
                                <span class="input-group-addon" id="basic-addon2-2">会员id</span>
                                <input name="s_name" type="text" class="form-control" placeholder="" aria-describedby="basic-addon2-2">
                            </label>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn query-btn">查询</button>
                        </div>
                    </form>
                </div>
            </div>
            <hr class="panel-hr"/>
            <div class="row table-back">
                <table class="table table-striped table-responsive">
                    <tr>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                    </tr>
                </table>
            </div>
        </div>
<%--        todo：销售退货记录查询--%>
        <div class="col-md-10 panel-of-nav-left">
            <div class="row">
                <div class="row obj-attributes">
                    <form action="" method="post">
                        <div class="col-md-12">
                            <select id="select-condition-y-3" class="year">
                                <option>--</option>
                            </select>
                            <label for="select-condition-y-3">年</label>

                            <select id="select-condition-m-3" class="month">
                                <option>--</option>
                            </select>
                            <label for="select-condition-m-3">月</label>

                            <select id="select-condition-d-3" class="day">
                                <option>--</option>
                            </select>
                            <label for="select-condition-d-3">日</label>
                        </div>
                        <div class="col-md-4">
                            <label class="input-group">
                                <span class="input-group-addon" id="basic-addon3-1">销售员账号</span>
                                <input name="s_name" type="text" class="form-control" placeholder="" aria-describedby="basic-addon3-1">
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label class="input-group">
                                <span class="input-group-addon" id="basic-addon3-2">会员id</span>
                                <input name="s_name" type="text" class="form-control" placeholder="" aria-describedby="basic-addon3-2">
                            </label>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn query-btn">查询</button>
                        </div>
                    </form>
                </div>
            </div>
            <hr class="panel-hr"/>
            <div class="row table-back">
                <table class="table table-striped table-responsive">
                    <tr>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                        <th>#</th>
                    </tr>
                </table>
            </div>
        </div>

    </div>
    <%--    todo：销售统计--%>
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="nav-left">销售统计</a></li>
            </ul>
        </div>
    </div>
<%--        todo：销售退货统计--%>
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="nav-left">销售退货统计</a></li>
            </ul>
        </div>
    </div>
</div>
<footer class="container-fluid"></footer>


<script src="../../../static/jquery/jquery.min.js"></script>
<script src="../../../static/js/bootstrap.min.js" type="application/javascript"></script>
</body>
</html>
