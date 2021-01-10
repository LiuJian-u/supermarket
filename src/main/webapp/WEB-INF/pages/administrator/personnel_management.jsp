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
    <title>admin_personnel_info_management</title>
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/administrator/home"><span
                            class="glyphicon glyphicon-home"></span> 首页</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a class="subMenuItem" href="#"><span
                                class="glyphicon glyphicon-pawn"></span>员工信息管理</a></li>
                        <li><a class="subMenuItem" href="#"><span
                                class="glyphicon glyphicon-queen"></span> 供应商信息管理</a></li>
                        <li><a class="subMenuItem" href="#"><span
                                class="glyphicon glyphicon-king"></span> 会员信息管理</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="container-fluid">
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a id="add-staff-nav-item" href="#" class="nav-left"><span class="glyphicon glyphicon-plus"></span>
                    新增员工</a></li>
                <li><a id="select-staff-nav-item" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-search"></span> 员工查询</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <%--            新增员工--%>
            <div id="add-staff-panel" class="panel-of-nav-left">
                <form>
                    <div id="imageDiv" class="form-group">
                        <button class="btn btn-default" id="selectImg" type="button">选择图片</button>
                        <input style="display: none;" type="file" id="imageInput-add-staff">
                    </div>
                    <label class="input-group">
                        <span class="input-group-addon" id="account">员工账号</span>
                        <input id="s_account" type="text" class="form-control" placeholder="请输入账号"
                               aria-describedby="account">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="name">员工姓名</span>
                        <input id="s_name" type="text" class="form-control" placeholder="请输入姓名"
                               aria-describedby="name">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="selectPost">职务</span>
                        <select id="s_post" class="form-control" aria-describedby="selectPost">
                            <option value="销售员">销售员</option>
                            <option value="仓库管理员">仓库管理员</option>
                            <option value="采购员">采购员</option>
                        </select>
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="selectSex">性别</span>
                        <select id="s_sex" class="form-control" aria-describedby="selectSex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </label>
                    <button id="addStaff" type="button" class="btn btn-default"><span
                            class="glyphicon glyphicon-plus"></span> 确认添加</button>
                </form>
            </div>
            <%--            员工信息查询--%>
            <div id="select-staff-panel" class="panel-of-nav-left">
                <div class="row">
                    <div class="row obj-attributes">
                        <form action="#"
                              method="post">
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="basic-addon1-1">员工账号</span>
                                    <input name="s_account" type="text" class="form-control" placeholder=""
                                           aria-describedby="basic-addon1-1">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="basic-addon1-2">姓名</span>
                                    <input name="s_name" type="text" class="form-control" placeholder=""
                                           aria-describedby="basic-addon1-2">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="basic-addon1-3">职务</span>
                                    <select name="s_post" class="form-control" aria-describedby="basic-addon1-3">
                                        <option value="--">--</option>
                                        <option value="销售员">销售员</option>
                                        <option value="仓库管理员">仓库管理员</option>
                                        <option value="采购员">采购员</option>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-4">
                                <button type="button" id="queryStaffs" class="btn query-btn">查询</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr class="panel-hr"/>
                <div class="row table-back">
                    <table id="staffsMassageTable" class="table table-striped table-responsive">
                        <tr>
                            <th>#</th>
                            <th>员工代码</th>
                            <th>员工姓名</th>
                            <th>联系电话</th>
                            <th>职务</th>
                            <th>#</th>
                            <th>#</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a id="add-supplier-nav-item" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-plus"></span> 新增供应商</a></li>
                <li><a id="select-supplier-nav-item" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-search"></span> 供应商查询</a></li>
            </ul>
        </div>
        <div class="col-md-10">

            <div id="add-supplier-panel" class="panel-of-nav-left">
                <form>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-name-span">供应商姓名</span>
                        <input id="sup-name" type="text" class="form-control" placeholder="请输入姓名"
                               aria-describedby="sup-name-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-shop-name-span">供应商铺名称</span>
                        <input id="sup-shop-name" type="text" class="form-control" placeholder="请输入商铺名称"
                               aria-describedby="sup-shop-name">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-address-span">供应商地址</span>
                        <input id="sup-address" type="text" class="form-control" placeholder="请输入姓名"
                               aria-describedby="sup-address-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-phone-span">供应商电话</span>
                        <input id="sup-phone" type="text" class="form-control tel-input" placeholder="请输入姓名"
                               aria-describedby="sup-phone-span">
                    </label>

                    <label class="input-group">
                        <span class="input-group-addon" id="sup-category-lv1-span">供货类别-lv1</span>
                        <select id="sup-category-lv1" class="form-control" aria-describedby="sup-category-lv1-span">
                            <option>--</option>
                        </select>

                        <span class="input-group-addon" id="sup-category-lv2-span">供货类别-lv2</span>
                        <select id="sup-category-lv2" class="form-control" aria-describedby="sup-category-lv2-span">
                            <option>--</option>
                        </select>

                    </label>
                    <button id="addSupplier" type="button" class="btn btn-default"><span
                            class="glyphicon glyphicon-plus"></span> 确认添加供应商</button>
                </form>
            </div>
            <div id="query-supplier-panel" class="panel-of-nav-left">
                <div class="row">
                    <div class="row obj-attributes">
                        <form>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="sup-code-query-span">供应商代码</span>
                                    <input id="sup-code-query" type="text" class="form-control" placeholder="请输入供应商代码"
                                           aria-describedby="sup-code-query-span">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="sup-name-query-span">供应商姓名</span>
                                    <input id="sup-name-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="sup-name-query-span">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="sup-phone-query-span">联系电话</span>
                                    <input id="sup-phone-query" type="tel" class="form-control tel-input" placeholder=""
                                           aria-describedby="sup-phone-query-span">
                                </label>
                            </div>
                            <div class="col-md-12">
                                <label class="input-group">
                                    <span class="input-group-addon" id="sup-category-lv1-query-span">供货类别-lv1</span>
                                    <select id="sup-category-lv1-query" class="form-control"
                                            aria-describedby="sup-category-lv1-query-span">
                                        <option>--</option>
                                    </select>

                                    <span class="input-group-addon" id="sup-category-lv2-query-span">供货类别-lv2</span>
                                    <select id="sup-category-lv2-query" class="form-control"
                                            aria-describedby="sup-category-lv2-query-span">
                                        <option>--</option>
                                    </select>
                                </label>
                            </div>
                            <div class="col-md-8">
                                <label class="input-group">
                                    <span class="input-group-addon" id="sup-address-query-span">地址</span>
                                    <input id="sup-address-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="sup-address-query-span">
                                </label>
                            </div>
                            <div class="col-md-4 col-md-offset-8">
                                <button id="query-sup-btn" type="button" class="btn">查询</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr class="panel-hr"/>
                <div class="row table-back">
                    <table id="suppliersMsgTable" class="table table-striped table-responsive">
                        <tr>
                            <th>#</th>
                            <th>供应商代码</th>
                            <th>供应商姓名</th>
                            <th>联系电话</th>
                            <th>供应商品类型</th>
                            <th>#</th>
                            <th>#</th>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <%--    todo：会员信息管理--%>
    <div class="ItemBlock">
        <div class="col-md-2 left-nav-block">
            <ul class="nav nav-pills nav-stacked">
                <li><a id="add-cus-nav-item" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-plus"></span> 新增会员</a></li>
                <li><a id="query-cus-nav-item" href="#" class="nav-left"><span
                        class="glyphicon glyphicon-search"></span> 会员查询</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div id="add-cus-panel" class="panel-of-nav-left">
                <%--                todo:新增会员--%>
                <form>
                    <label class="input-group">
                        <span class="input-group-addon" id="cus-name-span">会员姓名</span>
                        <input id="cus-name" type="text" class="form-control" placeholder="请输入姓名"
                               aria-describedby="cus-name-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="cus-phone-span">会员电话</span>
                        <input id="cus-phone" type="tel" class="form-control tel-input" placeholder="请输入姓名"
                               aria-describedby="cus-phone-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="cus-point-span">会员积分</span>
                        <input id="cus-point" type="text" class="form-control" placeholder="请输入姓名"
                               aria-describedby="cus-point-span">
                    </label>
                    <button id="add-cus-btn" type="button" class="btn btn-default"><a href="#"><span
                            class="glyphicon glyphicon-plus"></span> 新增会员</a></button>
                </form>

            </div>
            <div id="query-cus-panel" class="panel-of-nav-left">
                <div class="row">
                    <div class="row obj-attributes">
                        <form>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="cus-name-query-span">会员姓名</span>
                                    <input id="cus-name-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="cus-name-query-span">
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="input-group">
                                    <span class="input-group-addon" id="cus-phone-query-span">会员电话</span>
                                    <input id="cus-phone-query" type="text" class="form-control" placeholder=""
                                           aria-describedby="cus-phone-query-span">
                                </label>
                            </div>

                            <div class="col-md-4 col-md-offset-8">
                                <button id="query-cus-btn" type="button" class="btn query-btn">查询</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr class="panel-hr"/>
                <div class="row table-back">
                    <table id="cus-msg-table" class="table table-striped table-responsive">
                        <tr>
                            <th>#</th>
                            <th>会员代码</th>
                            <th>会员积分</th>
                            <th>#</th>
                            <th>#</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Modal 模态框-->


<div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel-1">详细信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row obj-attributes">
                        <img id="staff_img" src="" alt="图片无法显示"/>
                        <input style="display: none;" class="image-input" type="file" id="imageInput-edit-staff">
                    </div>
                    <div class="row obj-attributes">
                        <label class="input-group">
                            <span class="input-group-addon" id="basic-addon14-2">代码</span>
                            <input id="staff_code" type="text" class="form-control" placeholder=""
                                   aria-describedby="basic-addon14-2">
                        </label>
                        <label class="input-group">
                            <span class="input-group-addon" id="basic-addon14-3">账号</span>
                            <input id="staff_account" type="text" class="form-control" placeholder=""
                                   aria-describedby="basic-addon14-3">
                        </label>

                        <label class="input-group">
                            <span class="input-group-addon" id="basic-addon14-5">姓名</span>
                            <input id="staff_name" type="text" class="form-control" placeholder=""
                                   aria-describedby="basic-addon14-5">
                        </label>

                        <label class="input-group">
                            <span class="input-group-addon" id="basic-addon14-6">性别</span>
                            <select id="staff_sex" class="form-control" aria-describedby="basic-addon14-6">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </label>

                        <label class="input-group">
                            <span class="input-group-addon" id="basic-addon14-7">职务</span>
                            <select id="staff_post" class="form-control" aria-describedby="basic-addon14-7">
                                <option value=null>--</option>
                                <option value="销售员">销售员</option>
                                <option value="仓库管理员">仓库管理员</option>
                                <option value="采购员">采购员</option>
                            </select>
                        </label>

                        <label class="input-group">
                            <span class="input-group-addon" id="basic-addon14-8">电话</span>
                            <input id="staff_phone" type="text" class="form-control tel-input" placeholder=""
                                   aria-describedby="basic-addon14-8">
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="resetPw" type="button" class="btn btn-primary">重置密码</button>
                <button id="editModal-1" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-pencil"></span> 编辑
                </button>
                <button id="saveModal-1" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-save"></span> 保存
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="supDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel-2">供应商详细信息</h4>
            </div>
            <div class="modal-body">
                <div class="row obj-attributes">
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-detail-code-span">供应商代码</span>
                        <input id="sup-detail-code" type="text" class="form-control" placeholder=""
                               aria-describedby="sup-detail-code-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-detail-name-span">供应商姓名</span>
                        <input id="sup-detail-name" type="text" class="form-control" placeholder=""
                               aria-describedby="sup-detail-name-span">
                    </label>

                    <label class="input-group">
                        <span class="input-group-addon" id="sup-detail-shop-name-span">店铺名称</span>
                        <input id="sup-detail-shop-name" type="text" class="form-control" placeholder=""
                               aria-describedby="sup-detail-shop-name-span">
                    </label>

                    <label class="input-group">
                        <span class="input-group-addon" id="sup-detail-phone-span">联系电话</span>
                        <input id="sup-detail-phone" type="text" class="form-control tel-input" placeholder=""
                               aria-describedby="sup-detail-phone-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-detail-category-span">供应商品类别</span>
                        <input id="sup-detail-category" type="text" class="form-control" placeholder=""
                               aria-describedby="sup-detail-category-span">
                    </label>
                    <label class="input-group">
                        <span class="input-group-addon" id="sup-detail-address-span">供应商地址</span>
                        <input id="sup-detail-address" type="text" class="form-control" placeholder=""
                               aria-describedby="sup-detail-address-span">
                    </label>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="edit-sup-data" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-pencil"></span> 编辑
                </button>
                <button id="save-sup-data" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-save"></span> 保存
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="cusDetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel-3">会员详细信息</h4>
            </div>
            <div class="modal-body">
                <label class="input-group">
                    <span class="input-group-addon" id="cus-detail-code-span">会员代码</span>
                    <input id="cus-detail-code" type="text" class="form-control" placeholder=""
                           aria-describedby="cus-detail-code-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="cus-detail-name-span">会员姓名</span>
                    <input id="cus-detail-name" type="text" class="form-control" placeholder=""
                           aria-describedby="cus-detail-name-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="cus-detail-phone-span">会员电话</span>
                    <input id="cus-detail-phone" type="text" class="form-control" placeholder=""
                           aria-describedby="cus-detail-phone-span">
                </label>
                <label class="input-group">
                    <span class="input-group-addon" id="cus-detail-point-span">会员积分</span>
                    <input id="cus-detail-point" type="text" class="form-control" placeholder=""
                           aria-describedby="cus-detail-point-span">
                </label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="edit-cus-detail" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-pencil"></span> 编辑
                </button>
                <button id="save-cus-detail" type="button" class="btn btn-primary"><span
                        class="glyphicon glyphicon-save"></span> 保存
                </button>
            </div>
        </div>
    </div>
</div>

<footer class="container-fluid"></footer>
<%--<span id="hidden-span" style="display: none"><%=(String) request.getAttribute("mark")%></span>--%>
<span id="perInfoManageURL" style="display: none">
    ${pageContext.request.contextPath}/administrator/per_info_manage
</span>


<script src="../../../static/jquery/jquery.min.js"></script>
<script src="../../../static/js/bootstrap.min.js"></script>
<script src="../../../static/js/administratorJs.js"></script>
<script src="../../../static/js/personnel_management.js"></script>
</body>
</html>
