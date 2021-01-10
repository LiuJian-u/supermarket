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
    <%--    <link rel="stylesheet" href="../../../static/css/bootstrap.min.css"/>--%>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../static/css/administratorStyle.css"/>

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
                        <li><a class="subMenuItem" href="#">商品包装管理</a></li>
                        <li><a class="subMenuItem" href="#">商品类别管理</a></li>
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
                <li><a id="add-wbi-nav" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-plus"></span> 基本信息添加</a>
                </li>
                <li><a id="query-wbi-nav" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-search"></span> 基本信息查询</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <%--            todo:新增商品基本信息--%>
            <div id="add-wbi-panel" class="panel-of-nav-left">
                <form>
                    <div id="imageDiv" class="form-group">
                        <button class="btn btn-default" id="selectImg" type="button">选择图片</button>
                        <input style="display: none;" type="file" id="imageInput-add-wares">
                    </div>
                    <label class="input-group">
                        <span class="input-group-addon" id="wbi-name-span">商品名称</span>
                        <input id="wbi-name" type="text" class="form-control" placeholder="请输入商品名称"
                               aria-describedby="wbi-name-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="wbi-ct-code-span">商品类别代码</span>
                        <input id="wbi-ct-code" type="text" class="form-control" readonly="readonly"
                               placeholder="请输入商品名称"
                               aria-describedby="wbi-ct-code-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="wbi-pk-code-span">商品包装代码</span>
                        <input id="wbi-pk-code" type="text" class="form-control" readonly="readonly"
                               placeholder="请输入商品名称"
                               aria-describedby="wbi-pk-code-span">
                    </label>
                    <button id="add-wbi-btn" type="button" class="btn btn-default">确认添加</button>
                </form>
            </div>
            <%--            todo:查询商品基本信息--%>
            <div id="query-wbi-panel" class="panel-of-nav-left">基本信息查询</div>
        </div>
    </div>
    <%--    todo：详细信息管理--%>
    <div class="ItemBlock">

        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a id="query-w-nav" href="#" class="nav-left"><span class="glyphicon glyphicon-search"></span>
                    商品详细信息查询</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div id="query-w-panel" class="panel-of-nav-left">商品详细信息查询</div>
        </div>

    </div>
    <%--    todo：商品包装管理--%>
    <div class="ItemBlock">

        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a id="add-pk-nav" href="#" class="nav-left"><span class="glyphicon glyphicon-plus"></span>
                    添加商品包装</a></li>
                <li><a id="query-pk-nav" href="#" class="nav-left"><span class="glyphicon glyphicon-search"></span>
                    查询商品包装</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div id="add-pk-panel" class="panel-of-nav-left">
                <label class="input-group">
                    <span class="input-group-addon" id="pk-unit-span">包装单位</span>
                    <input id="pk-unit" type="text" class="form-control" title="商品包装类型" placeholder="请输入包装单位"
                           aria-describedby="pk-unit-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="pk-level-span">包装等级</span>
                    <select id="pk-level" class="form-control" title="包装等级" aria-describedby="pk-level-span">
                        <option value="--">--</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="pk-num-span">在上级包装中的数量</span>
                    <input id="pk-num" type="text" class="form-control" title="在上一级包装中包含的数量" placeholder="请输入数量"
                           aria-describedby="pk-num-span">
                </label>

                <label class="input-group">
                    <span class="input-group-addon" id="pk-uUnit-span">上级包装单位</span>
                    <select id="pk-uUnit" class="form-control" title="选择上级包装的单位" aria-describedby="pk-uUnit-span">
                        <option value="--">--</option>
                    </select>
                </label>
                <button id="add-pk-btn" type="button" class="btn btn-default">确认添加</button>
            </div>
            <div id="query-pk-panel" class="panel-of-nav-left">
                <div class="row">
                    <div class="row obj-attributes">
                        <form>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="pk-unit-query-span">包装单位</span>
                                    <input id="pk-unit-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="pk-unit-query-span">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="pk-level-query-span">包装等级</span>
                                    <input id="pk-level-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="pk-level-query-span">
                                </label>
                            </div>

                            <div class="col-md-4 col-md-offset-8">
                                <button id="query-pk-btn" type="button" class="btn query-btn">查询</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr class="panel-hr"/>
                <div class="row table-back">
                    <table id="pk-msg-table" class="table table-striped table-responsive">
                        <tr>
                            <th>#</th>
                            <th>包装代码</th>
                            <th>包装单位</th>
                            <th>包装等级</th>
                            <th>数量</th>
                            <th>#</th>
                            <th>#</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--    todo：商品类别管理--%>
    <div class="ItemBlock">

        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a id="add-ct-nav" href="#" class="nav-left"><span class="glyphicon glyphicon-plus"></span>
                    添加商品类别</a></li>
                <li><a id="query-ct-nav" href="#" class="nav-left"><span class="glyphicon glyphicon-search"></span>
                    查询商品类别</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div id="add-ct-panel" class="panel-of-nav-left">
                <%--                todo:添加商品类别--%>
                <label class="input-group">
                    <span class="input-group-addon" id="ct-name-span">类别名称</span>
                    <input id="ct-name" type="text" class="form-control" title="类别名称" placeholder="请输入类别名称"
                           aria-describedby="ct-name-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="ct-level-span">类别等级</span>
                    <select id="ct-level" class="form-control" title="类别等级" aria-describedby="ct-level-span">
                        <option value="0">--</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="uct-code-span">上级类别</span>
                    <select id="uct-code" class="form-control" title="选择上级类别" aria-describedby="uct-code-span">
                        <option value="--">--</option>
                    </select>
                </label>
                <button id="add-ct-btn" type="button" class="btn btn-default">确认添加</button>
            </div>
            <div id="query-ct-panel" class="panel-of-nav-left">
                <%--                todo:查询商品类别--%>
                <div class="row">
                    <div class="row obj-attributes">
                        <form>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="ct-name-query-span">类别名称</span>
                                    <input id="ct-name-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="ct-name-query-span">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="ct-level-query-span">类别等级</span>
                                    <select id="ct-level-query" class="form-control" title="类别等级"
                                            aria-describedby="ct-level-query-span">
                                        <option value="0">--</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-4 col-md-offset-8">
                                <button id="query-ct-btn" type="button" class="btn query-btn">查询</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr/>
                <div class="row table-back">
                    <table id="ct-msg-table" class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>#</th>
                            <th>类别代码</th>
                            <th>类别名称</th>
                            <th>类别等级</th>
                            <th>#</th>
                            <th>#</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="pk-detail" tabindex="-1" role="dialog" aria-labelledby="pk-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="pk-modal">包装详细信息</h4>
            </div>
            <div class="modal-body">
                <label class="input-group">
                    <span class="input-group-addon" id="pk-detail-code-span">包装代码</span>
                    <input id="pk-detail-code" type="text" class="form-control" title="包装代码" placeholder=""
                           aria-describedby="pk-detail-code-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="pk-detail-unit-span">包装单位</span>
                    <input id="pk-detail-unit" type="text" class="form-control" title="包装单位" placeholder=""
                           aria-describedby="pk-detail-unit-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="pk-detail-level-span">包装等级</span>
                    <input id="pk-detail-level" class="form-control" title="包装等级"
                           aria-describedby="pk-detail-level-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="pk-detail-num-span">数量</span>
                    <input id="pk-detail-num" type="text" class="form-control" title="在上级包装中所占的数量" placeholder=""
                           aria-describedby="pk-detail-num-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="pk-detail-upk-span">上级包装代码</span>
                    <input id="pk-detail-upk" class="form-control" title="上级包装代码"
                           aria-describedby="pk-detail-upk-span">
                </label>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="edit-pk-detail" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-pencil"></span> 编辑
                </button>
                <button id="save-pk-detail" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-save"></span> 保存
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ct-detail" tabindex="-1" role="dialog" aria-labelledby="ct-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="ct-modal">商品类别详细信息</h4>
            </div>
            <div class="modal-body">
                <label class="input-group">
                    <span class="input-group-addon" id="ct-detail-code-span">类别代码</span>
                    <input id="ct-detail-code" type="text" class="form-control" title="类别代码" placeholder=""
                           aria-describedby="ct-detail-code-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="ct-detail-name-span">类别名称</span>
                    <input id="ct-detail-name" type="text" class="form-control" title="类别名称" placeholder=""
                           aria-describedby="ct-detail-name-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="ct-detail-level-span">类别等级</span>
                    <input id="ct-detail-level" class="form-control" title="类别等级"
                           aria-describedby="ct-detail-level-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="uct-detail-code-span">上级类别代码</span>
                    <input id="uct-detail-code" class="form-control" title="上级类别代码"
                           aria-describedby="uct-detail-code-span">
                </label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="edit-ct-detail" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-pencil"></span>编辑</button>
                <button id="save-ct-detail" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-save"></span>保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="choose-ct" tabindex="-1" role="dialog" aria-labelledby="choose-ct-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="choose-ct-modal">选择商品类别</h4>
            </div>
            <div class="modal-body">
                <div>
                    <label class="input-group">
                        <span class="input-group-addon" id="choose-ct-name-span">类别名称</span>
                        <input id="choose-ct-name" type="text" class="form-control" title="类别代码" placeholder=""
                               aria-describedby="choose-ct-name-span">
                        <span class="input-group-addon" id="choose-ct-level-span">类别等级</span>
                        <input id="choose-ct-level" class="form-control" title="类别等级"
                               aria-describedby="choose-ct-level-span">
                    </label>
                </div>
                <hr/>
                <div class="row table-back">
                    <div style="height: 200px;overflow: auto;">
                        <table id="choose-ct-table"
                               class="table table-striped table-bordered table-hover table-condensed">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>类别代码</th>
                                <th>类别名称</th>
                                <th>类别等级</th>
                            </tr>
                            </thead>
                            <tbody id="choose-ct-table-body"></tbody>
                        </table>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="choose-pk" tabindex="-1" role="dialog" aria-labelledby="choose-pk-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="choose-pk-modal">选择商品类别</h4>
            </div>
            <div class="modal-body">
                <div>
                    <label class="input-group">
                        <span class="input-group-addon" id="choose-pk-unit-span">包装单位</span>
                        <input id="choose-pk-unit" type="text" class="form-control" title="包装单位" placeholder=""
                               aria-describedby="choose-pk-unit-span">
                        <span class="input-group-addon" id="choose-pk-level-span">包装等级</span>
                        <input id="choose-pk-level" class="form-control" title="包装等级"
                               aria-describedby="choose-pk-level-span">
                        <span class="input-group-addon" id="choose-pk-num-span">包装数量</span>
                        <input id="choose-pk-num" class="form-control" title="在上级包装中包含的数量"
                               aria-describedby="choose-pk-num-span">
                    </label>
                </div>
                <hr/>
                <div class="row table-back">
                    <table id="choose-pk-table" class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>包装代码</th>
                            <th>包装单位</th>
                            <th>包装等级</th>
                            <th>包装数量</th>
                        </tr>
                        </thead>
                        <tbody id="choose-pk-table-body"></tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<footer class="container-fluid"></footer>
<span id="wbiInfoManageURL" style="display: none">
    ${pageContext.request.contextPath}/administrator/wares_info_manage
</span>

<script src="../../../static/jquery/jquery.min.js"></script>
<script src="../../../static/js/bootstrap.min.js"></script>
<script src="../../../static/js/administratorJs.js"></script>
<script src="../../../static/js/wares_management.js"></script>
</body>
</html>
