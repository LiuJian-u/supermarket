let wbiInfoManageURL = $("#wbiInfoManageURL").text();

//商品基本信息管理
//添加商品基本信息导航栏按钮事件
$("#add-wbi-nav").on('click', function () {
    nav_panel_conn($(this), $("#add-wbi-panel"));

});

//图片处理
function imageManage() {
    let input = $("#imageInput-add-wares")[0];
    let select = $("#selectImg");
    let result;
    let imgMsg;

    if (typeof (FileReader) === 'undefined') {
        alert("浏览器不支持FileReader！");
        input.setAttribute('disabled', 'disabled');
    } else {
        input.addEventListener('change', readImg, false);
    }

    //读取上传图片的信息
    function readImg() {
        if (!input.value.match(/.jpg|.png|.gif|.jpeg|.bmp/i)) {
            return alert("图片格式不正确！");
        }
        let reader = new FileReader();
        reader.readAsDataURL(this.files[0]); //转成base64
        reader.fileName = this.files[0].name;
        //实现上传的图片预览
        reader.onload = function () {
            imgMsg = this.result;
            //     {
            //     name: this.fileName, //获取文件名
            //     base64: this.result //reader.readAsDataURL方法执行完后，base64数据储存在reader.result里
            // };
            result = '<div class="result"><img id="uploadImg" class="subPic" src="' + this.result + '" alt="' + this.fileName + '"/></div>';
            let div = document.createElement('div');
            div.innerHTML = result;
            div['className'] = 'image-show row';
            $("#imageDiv").append(div);　　 //插入dom树
            let img = document.getElementById('uploadImg');
            img.onload = function () {
                let nowHeight = ReSizePic(this); //设置图片大小
                this.parentNode.style.display = 'block';
                let op = this.parentNode;
                if (nowHeight) {
                    op.style.paddingTop = (op.offsetHeight - nowHeight) / 2 + 'px';
                }
            }
        }
    }

    //选择图片按钮单击事件
    select.on('click', function () {
        // input.value = ""; // 先将oInput值清空，否则选择图片与上次相同时change事件不会触发
        //清空已选图片
        $('.image-show').remove();
        input.click();
    });
}

//调整图片大小
function ReSizePic(ThisPic) {
    if (ThisPic.width !== 200) {
        let RePicWidth = 200; //这里修改为您想显示的宽度值

        let TrueWidth = ThisPic.width; //图片实际宽度
        let TrueHeight = ThisPic.height; //图片实际高度

        if (TrueWidth > TrueHeight) {
            //宽大于高
            let reWidth = RePicWidth;
            ThisPic.width = reWidth;
            //垂直居中
            return TrueHeight * (reWidth / TrueWidth); //将图片修改后的高度返回，供垂直居中用
        } else {
            //宽小于高
            ThisPic.height = RePicWidth;
        }
    }
}

imageManage();


//选择商品类型
$("#wbi-ct-code").on('focus', function () {
    queryCtToChoose();
    $("#choose-ct").modal('toggle');
});
$("#choose-ct").on('hide.bs.modal', function () {
    $("#choose-ct-table-body").empty();
});
let chooseCtName = $("#choose-ct-name");
let chooseCtLevel = $("#choose-ct-level");
chooseCtName.on('change', function () {
    queryCtToChoose();
});
chooseCtLevel.on('change', function () {
    queryCtToChoose();
});


//选择包装类型
$("#wbi-pk-code").on('focus', function () {
    queryPkToChoose();
    $("#choose-pk").modal('toggle');
});
$("#choose-pk").on('hide.bs.modal', function () {
    $("#choose-pk-table-body").empty();
});
let choosePkUnit = $("#choose-pk-unit");
let choosePkLevel = $("#choose-pk-level");
let choosePkNum = $("#choose-pk-num");
choosePkUnit.on('change', function () {
    queryCtToChoose();
});
choosePkLevel.on('change', function () {
    queryCtToChoose();
});
choosePkNum.on('change', function () {
    queryCtToChoose();
});

$("#add-wbi-btn").on('click', function () {
    let formData = new FormData();
    formData.append('img', document.getElementById("imageInput-add-wares").files[0]);
    formData.append('wbi_code', '');
    formData.append('wbi_name', $("#wbi-name").val());
    formData.append('wbi_imgURL', "");
    formData.append('wbi_pk_code', $("#wbi-pk-code").val());
    formData.append('wbi_ct_code', $("#wbi-ct-code").val());

    $.ajax({
        url: wbiInfoManageURL + "/addWBI",
        type: 'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function (res) {
            alert(res.msg);
        },
        error: function () {
            alert("上传失败");
        }
    })
});


//查询商品基本信息导航栏按钮事件
$("#query-wbi-nav").on('click', function () {
    nav_panel_conn($(this), $("#query-wbi-panel"));
});

//商品详细信息管理
//查询商品详细信息导航栏按钮事件
$("#query-w-nav").on('click', function () {
    nav_panel_conn($(this), $("#query-w-panel"));
});

//商品包装管理
//添加包装信息导航栏按钮事件
$("#add-pk-nav").on('click', function () {
    nav_panel_conn($(this), $("#add-pk-panel"));

});

//商品包装单位输入框事件
inputEmpty($("#pk-unit"), "单位不能为空", "商品包装类型");
inputEmpty($("#pk-num"), "输入数量不能为空", "在上一级包装中的数量");

//包装等级改变响应
$("#pk-level").on('change', function () {
    let data = {'level': $(this).val()};
    let uUnit = $("#pk-uUnit");
    uUnit.empty();
    uUnit.append($('<option>--</option>'));

    function setUtils(utils) {
        for (let i = 0; i < utils.length; i++) {
            let newOption = $('<option>', {
                text: utils[i],
                value: utils[i]
            });
            uUnit.append(newOption);
        }
    }

    queryDataWithoutJson(wbiInfoManageURL + "/findPkUtilsByLevel", data, setUtils);
});

//确认添加按钮
$("#add-pk-btn").on('click', function () {
    let json = {
        'pk_unit': $("#pk-unit").val(),
        'pk_level': $("#pk-level").val(),
        'pk_num': $("#pk-num").val(),
        'upk_code': $("#pk-uUnit").val()
    };

    function do_addPk(resMsg) {
        alert(resMsg);
    }

    queryWithJsonParamNotRet(wbiInfoManageURL + "/addPacking", json, do_addPk);
});
let savePkBtn = $("#save-pk-detail");

//设置包装模态框不可用
function setPkModalDisabled() {
    $("#pk-detail-code").attr("readonly", true);
    $("#pk-detail-unit").attr("readonly", true);
    $("#pk-detail-level").attr("disabled", true);
    $("#pk-detail-num").attr("readonly", true);
    $("#pk-detail-upk").attr("disabled", true);
    savePkBtn.attr("disabled", true);
}

//设置包装模态框可用
function setPkModalAble() {
    $("#pk-detail-unit").attr("readonly", false);
    $("#pk-detail-num").attr("readonly", false);
    savePkBtn.attr("disabled", false);
}

//编辑包装信息按钮
$("#edit-pk-detail").on('click', setPkModalAble);
//保存包装信息
savePkBtn.on('click', function () {
    let data = {
        'pk_code': $("#pk-detail-code").val(),
        'pk_unit': $("#pk-detail-unit").val(),
        'pk_level': $("#pk-detail-level").val(),
        'pk_num': $("#pk-detail-num").val(),
        'upk_code': $("#pk-detail-upk").val()
    };

    function showSaveRes(resMsg) {
        alert(resMsg);
    }

    queryWithJsonParamNotRet(wbiInfoManageURL + "/saveEditPk", data, showSaveRes);
});

//查询包装信息导航栏按钮事件
$("#query-pk-nav").on('click', function () {
    nav_panel_conn($(this), $("#query-pk-panel"));
    let data = "";

    function do_queryAllPk(pks) {
        fillPkTable(pks);
    }

    queryDataWithoutJson(wbiInfoManageURL + "/findAllPks", data, do_queryAllPk);
});

//查询按钮
$("#query-pk-btn").on('click', function () {
    let data = {
        'pk_unit': $("#pk-unit-query").val(),
        'pk_level': $("#pk-level-query").val()
    };

    function doQueryClick(pks) {
        fillPkTable(pks);
    }

    queryWithJsonParamAndRet(wbiInfoManageURL + "/findPksByCondition", data, doQueryClick);
});

//设置包装表详情按钮事件
function setPkDetailedEvent() {
    $(".pkRowDetail").on('click', function () {
        let data = {"pk_code": this.parentElement.parentElement.childNodes[1].innerText.trim()};

        function doSetPkDetail(pks) {
            $("#pk-detail-code").val(pks['pk_code']);
            $("#pk-detail-unit").val(pks['pk_unit']);
            $("#pk-detail-level").val(pks['pk_level']);
            $("#pk-detail-num").val(pks['pk_num']);
            $("#pk-detail-upk").val(pks['upk_code']);
            setPkModalDisabled();
        }

        queryDataWithoutJson(wbiInfoManageURL + "/findPkByCode", data, doSetPkDetail);
    });
}

//设置商品包装表删除按钮事件
function setPkRemoveBtnEvent() {
    $(".pkRowDelete").on('click', function () {
        let data = {"pk_code": this.parentElement.parentElement.childNodes[1].innerText.trim()};

        function doDeleteRow(resMsg) {
            alert(resMsg);
            $("#query-pk-btn").click();
        }

        if (confirm("确认删除?") !== false) {
            queryDataWithoutJson(wbiInfoManageURL + "/removePkByCode", data, doDeleteRow);
        }
    });
}


//商品类别管理
//添加种类信息导航栏按钮事件
$("#add-ct-nav").on('click', function () {
    nav_panel_conn($(this), $("#add-ct-panel"));
});
//种类等级改变引起上一级种类改变
$("#ct-level").on('change', function () {
    let data = {'ct_level': $(this).val()};
    let uctSelect = $("#uct-code");
    uctSelect.empty();
    uctSelect.append($('<option>--</option>'));

    function setUctSelect(cts) {
        for (let i = 0; i < cts.length; i++) {
            let newOption = $('<option>', {
                text: cts[i],
                value: cts[i]
            });
            uctSelect.append(newOption);
        }
    }

    queryDataWithoutJson(wbiInfoManageURL + "/findCtNamesByLevel", data, setUctSelect);
});
//添加商品种类按钮
$("#add-ct-btn").on('click', function () {
    let data = {
        'ct_name': $("#ct-name").val(),
        'ct_level': $("#ct-level").val(),
        'uct_code': $("#uct-code").val()
    };

    function doAddCt(res) {
        alert(res);
    }

    queryWithJsonParamNotRet(wbiInfoManageURL + "/addCt", data, doAddCt);
});

//查询商品种类信息导航栏按钮事件
$("#query-ct-nav").on('click', function () {
    nav_panel_conn($(this), $("#query-ct-panel"));

    function setCtTable(cts) {
        fillCtTable(cts)
    }

    queryWithJsonRetNotParam(wbiInfoManageURL + "/findAllCts", "", setCtTable);
});
//查询商品类别
$("#query-ct-btn").on('click', function () {
    let data = {
        'ct_name': $("#ct-name-query").val(),
        'ct_level': $("#ct-level-query").val()
    };

    function doQuery(res) {
        fillCtTable(res);
    }

    queryWithJsonParamAndRet(wbiInfoManageURL + "/findCtsByCondition", data, doQuery)
});

let saveCtBtn = $("#save-ct-detail");

//商品类别详情按钮
function setCtDetailedEvent() {
    $(".ctRowDetail").on('click', function () {
        let data = {"ct_code": this.parentElement.parentElement.childNodes[1].innerText.trim()};

        function doSet(cts) {
            $("#ct-detail-code").val(cts['ct_code']);
            $("#ct-detail-name").val(cts['ct_name']);
            $("#ct-detail-level").val(cts['ct_level']);
            $("#uct-detail-code").val(cts['uct_code']);
            setCtModalDisabled();
        }

        queryDataWithoutJson(wbiInfoManageURL + "/findCtByCode", data, doSet);
    });
}

//编辑商品类别
$("#edit-ct-detail").on('click', function () {
    setCtModalAble();
});
//保存商品类别
saveCtBtn.on('click', function () {
    let data = {
        'ct_code': $("#ct-detail-code").val(),
        'ct_name': $("#ct-detail-name").val(),
        'ct_level': $("#ct-detail-level").val(),
        'uct_code': $("#uct-detail-code").val()
    };

    function doSave(res) {
        alert(res);
    }

    queryWithJsonParamNotRet(wbiInfoManageURL + "/saveEditCt", data, doSave);
    $("#query-ct-btn").click();
});

//设置商品类别模态框不可用
function setCtModalDisabled() {
    $("#ct-detail-code").attr('readonly', true);
    $("#ct-detail-name").attr('readonly', true);
    $("#ct-detail-level").attr('readonly', true);
    $("#uct-detail-code").attr('readonly', true);
    saveCtBtn.attr('disabled', true);
}

//设置商品类别模态框可用
function setCtModalAble() {
    $("#ct-detail-name").attr('readonly', false);
    saveCtBtn.attr('disabled', false);
}

//删除商品类别
function setCtRemoveBtnEvent() {
    $(".ctRowDelete").on('click', function () {
        let data = {"ct_code": this.parentElement.parentElement.childNodes[1].innerText.trim()};

        function doRemove(res) {
            alert(res);
        }

        if (confirm("确认删除？") !== false) {
            queryDataWithoutJson(wbiInfoManageURL + "/removeCtByCode", data, doRemove);
        }
        $("#query-ct-btn").click();
    });
}

//设置选中的商品类型代码
function setCtChoose() {
    $("#choose-ct-table-body tr").on('click', function () {
        // noinspection JSValidateTypes
        $("#wbi-ct-code").val($(this).children().eq(1).text());
    });
}

//设置选中的包装代码
function setPkChoose() {
    $("#choose-pk-table-body tr").on('click', function () {
        // noinspection JSValidateTypes
        $("#wbi-pk-code").val($(this).children().eq(1).text());
    });
}

//填充包装信息表格
function fillPkTable(pks) {
    let table = $("#pk-msg-table");
    let newTr;
    let newTd;
    let newLink;
    $(".pkMsgRow").remove();
    for (let i = 0; i < pks.length; i++) {
        newTr = $("<tr class='pkMsgRow'></tr>");
        table.append(newTr);
        let pk = pks[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in pk) {
            if (-1 !== ["pk_code", "pk_unit", "pk_level", "pk_num"].indexOf(key)) {
                newTd = $("<td></td>").text(pk[key]);
                newTr.append(newTd);
            }
        }
        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn pkRowDetail" href="#" data-toggle="modal" data-target="#pk-detail">' +
            '<span class="glyphicon glyphicon-align-justify"></span> 详情</a>');
        newTd.append(newLink);
        newTr.append(newTd);

        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn pkRowDelete" href="#"><span class="glyphicon glyphicon-trash"></span>删除</a>');

        newTd.append(newLink);
        newTr.append(newTd);
    }
    setPkDetailedEvent();
    setPkRemoveBtnEvent();
}

//填充商品类别表格
function fillCtTable(cts) {
    let table = $("#ct-msg-table");
    let newTr;
    let newTd;
    let newLink;
    $(".ctMsgRow").remove();
    for (let i = 0; i < cts.length; i++) {
        newTr = $("<tr class='ctMsgRow'></tr>");
        table.append(newTr);
        let ct = cts[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in ct) {
            if (-1 !== ["ct_code", "ct_name", "ct_level"].indexOf(key)) {
                newTd = $("<td></td>").text(ct[key]);
                newTr.append(newTd);
            }
        }
        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn ctRowDetail" href="#" data-toggle="modal" data-target="#ct-detail">' +
            '<span class="glyphicon glyphicon-align-justify"></span> 详情</a>');
        newTd.append(newLink);
        newTr.append(newTd);

        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn ctRowDelete" href="#"><span class="glyphicon glyphicon-trash"></span> 删除</a>');

        newTd.append(newLink);
        newTr.append(newTd);
    }
    setCtDetailedEvent();
    setCtRemoveBtnEvent();
}

function fillChooseCtTable(cts) {
    let tbody = $("#choose-ct-table-body");
    let newTr;
    let newTd;
    $(".cctMsgRow").remove();
    for (let i = 0; i < cts.length; i++) {
        newTr = $("<tr class='cctMsgRow'></tr>");
        tbody.append(newTr);
        let ct = cts[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in ct) {
            if (-1 !== ["ct_code", "ct_name", "ct_level"].indexOf(key)) {
                newTd = $("<td></td>").text(ct[key]);
                newTr.append(newTd);
            }
        }
    }
    setCtChoose();
}

function fillChoosePkTable(pks) {
    let tbody = $("#choose-pk-table-body");
    let newTr;
    let newTd;
    $(".cctMsgRow").remove();
    for (let i = 0; i < pks.length; i++) {
        newTr = $("<tr class='cctMsgRow'></tr>");
        tbody.append(newTr);
        let pk = pks[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in pk) {
            if (-1 !== ["pk_code", "pk_unit", "pk_level", "pk_num"].indexOf(key)) {
                newTd = $("<td></td>").text(pk[key]);
                newTr.append(newTd);
            }
        }
    }
    setPkChoose();
}

function queryCtToChoose() {
    let data = {
        'ct_name': chooseCtName.val(),
        'ct_level': chooseCtLevel.val()
    };
    queryWithJsonParamAndRet(wbiInfoManageURL + "/findCtsByCondition", data, fillChooseCtTable)
}

function queryPkToChoose() {
    let data = {
        'pk_unit': choosePkUnit.val(),
        'pk_level': choosePkLevel.val(),
        'pk_num': choosePkNum.val()
    };
    queryWithJsonParamAndRet(wbiInfoManageURL + "/findPksByCondition", data, fillChoosePkTable);
}

