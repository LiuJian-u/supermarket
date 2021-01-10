// let funMark = document.getElementById("hidden-span");
// for (let i = 0; i < left_navs.length; i++) {
//     // console.log(funMark.innerText);
//     // console.log(left_navs[i].innerText);
//     // console.log(funMark.innerText.trim() === left_navs[i].innerText.trim());
//     // console.log("------------------------");
//     if (funMark.innerText.trim() === left_navs[i].innerText.trim()) {
//         // alert(Math.floor(i / 2));
//         subMenuItems[Math.floor(i / 2)].click();
//         left_navs[i].parentElement.classList.add("active");
//         change_nav_panel(i);
//     }
// }
//员工管理模块
//添加员工导航条单击事件
let perInfoManageURL = $("#perInfoManageURL").text();

// $(".tel-input").on('blur', function () {
//     alert("移出了！");
// });

//添加员工导航条单击事件
$("#add-staff-nav-item").on('click', function () {
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    $(this).parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    $("#add-staff-panel").css('display', 'block');

});

//查询员工导航条单击事件
$("#select-staff-nav-item").on('click', function () {
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    $(this).parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    $("#select-staff-panel").css('display', 'block');
    $.ajax({
        url: perInfoManageURL + "/findAllStaffs",
        dataType: 'json',
        type: 'post',
        success: function (staffs) {
            fill_staff_table(staffs)
        },
        error: function () {
        }
    });
});

setDetailedEvent();
setRemoveBtnEvent();

//查询员工事件
$("#queryStaffs").on('click', function () {
    let json = {
        "s_account": $("input[name='s_account']").val(),
        "s_name": $("input[name='s_name']").val(),
        "s_post": $("select[name='s_post']").val()
    };
    $.ajax({
        url: perInfoManageURL + "/findStaffsByCondition",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(json),
        dataType: 'json',
        type: "post",
        success: function (staffs) {
            fill_staff_table(staffs)
        },
        error: function (s) {
            alert(s);
            alert("ERROR!!!");
        }
    });


});

//查询员工信息后填充表格
function fill_staff_table(staffs) {
    let table = $("#staffsMassageTable");
    let newTr;
    let newTd;
    let newLink;
    $(".staffMsgRow").remove();
    for (let i = 0; i < staffs.length; i++) {
        newTr = $("<tr class='staffMsgRow'></tr>");
        table.append(newTr);
        let staff = staffs[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in staff) {
            if (-1 !== ["s_code", "s_name", "s_phone", "s_post"].indexOf(key)) {
                newTd = $("<td></td>").text(staff[key]);
                newTr.append(newTd);
            }
        }
        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn rowDetailed" href="#" data-toggle="modal" data-target="#myModal-1"></a>').text("详情");
        newTd.append(newLink);
        newTr.append(newTd);

        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn rowDelete" href="#" data-toggle="modal"></a>').text("删除");

        newTd.append(newLink);
        newTr.append(newTd);
    }

    // setDetails();
    setDetailedEvent();
    setRemoveBtnEvent();
}

//设置“详情”按钮点击事件
function setDetailedEvent() {
    $(".rowDetailed").on('click', function () {
        let json = {"s_code": this.parentElement.parentElement.childNodes[1].innerText.trim()};
        $.ajax({
            url: perInfoManageURL + "/findStaffsByCondition",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify(json),
            dataType: 'json',
            type: 'post',
            success: function (staffDetailsList) {
                setStaffDetail(staffDetailsList);
                setModalDisabled();
            },
            error: function (msg) {
                alert(msg);
            }
        })

    });
}

//设置删除按钮点击事件
function setRemoveBtnEvent() {
    // alert("调用了设置删除事件！");
    $(".rowDelete").on('click', function () {
        if (confirm('确认删除？')) {
            $.ajax({
                url: perInfoManageURL + "/removeStaff",
                data: {"s_code": this.parentElement.parentElement.childNodes[1].innerText.trim()},
                type: 'post',
                success: function (resMsg) {
                    alert(resMsg);
                    $("#queryStaffs").click();//更新表格
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }
    });
}


//图片处理
function imageManage() {
    let input = $("#imageInput-add-staff")[0];
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
        input.value = ""; // 先将oInput值清空，否则选择图片与上次相同时change事件不会触发
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

//添加员工事件
$("#addStaff").on('click', function () {
    let json = {
        "s_account": $("input[id='s_account']").val(),
        "s_name": $("input[id='s_name']").val(),
        "s_sex": $("select[id='s_sex']").val(),
        "s_post": $("select[id='s_post']").val(),
        "s_imgURL": $("#uploadImg")[0].src
    };
    $.ajax({
        url: perInfoManageURL + "/addStaff",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(json),
        type: 'post',
        success: function (rspMsg) {
            alert(rspMsg);
        },
        error: function (msg) {
            alert(msg);
        }
    });
});

//重置员工密码按钮
$("#resetPw").on('click', function () {
    $.ajax({
        url: perInfoManageURL + "/resetStaffPassword",
        data: {"s_code": $("#staff_code").val()},
        type: 'post',
        success: function (repMsg) {
            alert(repMsg)
        },
        error: function (msg) {
            alert(msg);
        }
    })
});

//模态框的“编辑”按钮响应
$("#editModal-1").on('click', function () {
    let img = document.getElementById("staff_img");
    let imgBase64;
    let inputImg = $("#imageInput-edit-staff")[0];
    if (typeof (FileReader) === 'undefined') {
        alert("浏览器不支持FileReader！");
        inputImg.setAttribute('disabled', 'disabled');
    } else {
        inputImg.addEventListener('change', readImg, false);
    }

    function readImg() {
        if (!inputImg.value.match(/.jpg|.png|.gif|.jpeg|.bmp/i)) {
            return alert("图片格式不正确！");
        }
        let reader = new FileReader();
        reader.readAsDataURL(this.files[0]); //转成base64
        reader.fileName = this.files[0].name;
        //实现上传的图片预览
        reader.onload = function () {
            imgBase64 = this.result;
            img.setAttribute("src", imgBase64);
            img.onload = function () {
                ReSizePic(this);
                // let nowHeight = ReSizePic(this); //设置图片大小
                // this.parentNode.style.display = 'block';
                // let op = this.parentNode;
                // if(nowHeight) {
                //     op.style.paddingTop = (op.offsetHeight - nowHeight) / 2 + 'px';
                // }
            }
        }
    }

    img.onclick = function () {
        inputImg.value = "";
        inputImg.click();
    };
    setModalAble();
});

//模态框保存按钮事件
let saveStaffBtn = $("#saveModal-1");
saveStaffBtn.on('click', function () {
    let imgURL = $("#staff_img")[0].src;
    if (imgURL.length < 100) {
        imgURL = imgURL.substr(imgURL.lastIndexOf('/Images'), imgURL.length);
    }
    let json = {
        "s_code": $("#staff_code").val(),
        "s_account": $("#staff_account").val(),
        "s_name": $("#staff_name").val(),
        "s_sex": $("#staff_sex").val(),
        "s_phone": $("#staff_phone").val(),
        "s_post": $("#staff_post").val(),
        "s_imgURL": imgURL
    };
    $.ajax({
        url: perInfoManageURL + "/saveEditStaff",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(json),
        type: 'post',
        resultType: 'json',
        success: function (staffDetailsList) {
            setStaffDetail(staffDetailsList);
            alert("保存成功");
            setModalDisabled();
        }
    });
});

//设置模态框的内容
function setStaffDetail(staffList) {
    for (let i = 0; i < staffList.length; i++) {
        let staffDetailed = staffList[i];
        let staff_img = $("#staff_img");
        staff_img.attr("src", staffDetailed["s_imgURL"]);
        $("#staff_code").val(staffDetailed["s_code"]);
        $("#staff_account").val(staffDetailed["s_account"]);
        $("#staff_password").val(staffDetailed["s_password"]);
        $("#staff_name").val(staffDetailed["s_name"]);

        // $("#staff_sex").val(staffDetailed["s_sex"]);
        $("#staff_phone").val(staffDetailed["s_phone"]);

        let staff_sex = document.getElementById("staff_sex");
        $.each(staff_sex.options, function (i, n) {
            if (n.value.trim() === staffDetailed["s_sex"].trim()) {
                n.selected = true;
            }
        });
        let staff_post = document.getElementById("staff_post");
        $.each(staff_post.options, function (i, n) {
            if (n.value.trim() === staffDetailed["s_post"].trim()) {
                n.selected = true;
            }
        });

        staff_img.on('load', function () {
            // alert("调用了调整图片大小的方法！");
            ReSizePic(this);
        });
    }
}

//点击“详情”按钮时触发，设置模态框的属性不可修改,设置保存按钮不可用
function setModalDisabled() {
    $("#staff_img").attr("disabled", true);
    $("#staff_code").attr("readonly", true);
    $("#staff_account").attr("readonly", true);
    $("#staff_name").attr("readonly", true);
    $("#staff_sex").attr("disabled", true);
    $("#staff_phone").attr("readonly", true);
    $("#staff_post").attr("disabled", true);
    saveStaffBtn.attr("disabled", true);
}

//设置模态框可编辑,同时使保存按钮可用
function setModalAble() {
    $("#staff_img").attr("disabled", false);
    // $("#staff_code").attr("disabled", false);
    $("#staff_account").attr("readonly", false);
    $("#staff_name").attr("readonly", false);
    $("#staff_sex").attr("disabled", false);
    $("#staff_phone").attr("readonly", false);
    $("#staff_post").attr("disabled", false);
    saveStaffBtn.attr("disabled", false);
}


//供应商管理模块

// 设置供应商品类别一级下拉列表
function setCategoryLv1(selectObj) {
    $.ajax({
        url: perInfoManageURL + "/findCategory?level=1",
        type: 'post',
        resultType: 'json',
        success: function (cts) {
            // let sup_ct = $("#sup-category-lv1");
            // let sup_ct_query = $("#sup-category-lv1-query");
            selectObj.empty();
            selectObj.append($('<option>--</option>'));
            for (let i = 0; i < cts.length; i++) {
                let ct = cts[i];
                let newOption = $('<option>', {
                    text: ct,
                    value: ct
                });
                selectObj.append(newOption);
                // sup_ct.append(newOption);
                // sup_ct_query.append(newOption);
            }
        },
        error: function () {
            alert("error!")
        }
    });
}

//商品类别级联下拉框设置
function supCtConn(lv1, lv2) {
    lv1.on('change', function () {
        $.ajax({
            url: perInfoManageURL + "/findSubCategoryByName",
            type: 'post',
            resultType: 'json',
            data: {'name': $(this).val()},
            success: function (cts) {
                let sup_ct = lv2;
                sup_ct.empty();
                sup_ct.append($('<option>--</option>'));
                for (let i = 0; i < cts.length; i++) {
                    let ct = cts[i];
                    let newOption = $('<option>', {
                        text: ct,
                        value: ct
                    });
                    sup_ct.append(newOption);
                }
            },
            error: function () {
                alert("error!");
            }
        })
    });
}

//添加供应商导航条单击事件
$("#add-supplier-nav-item").on('click', function () {
    //设置导航条选中，设置对应页面显示
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    $(this).parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    $("#add-supplier-panel").css('display', 'block');
    // 设置供应商品类别一级下拉列表
    let scLv1 = $("#sup-category-lv1");
    setCategoryLv1(scLv1);
    //商品类别下拉框联动，一级下拉框改变时改变二级下拉框内容
    supCtConn(scLv1, $("#sup-category-lv2"));
});

//新增供应商按钮事件
$("#addSupplier").on('click', function () {
    let json = {
        'sup_name': $("#sup-name").val(),
        'sup_shop_name': $("#sup-shop-name").val(),
        'sup_phone': $("#sup-phone").val(),
        'sup_category': $("#sup-category-lv2").val(),
        'sup_address': $("#sup-address").val()
    };
    $.ajax({
        url: perInfoManageURL + "/addSupplier",
        contentType: "application/json;charset=UTF-8",
        type: 'post',
        data: JSON.stringify(json),
        success: function (resMsg) {
            alert(resMsg);
        },
        error: function () {
            alert("error!");
        }
    })
});

//查询供应商导航条单击事件
$("#select-supplier-nav-item").on('click', function () {
    //设置导航条选中，设置对应页面显示
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    $(this).parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    $("#query-supplier-panel").css('display', 'block');
    let scLv1q = $("#sup-category-lv1-query");
    setCategoryLv1(scLv1q);
    supCtConn(scLv1q, $("#sup-category-lv2-query"));
    $.ajax({
        url: perInfoManageURL + "/findAllSuppliers",
        dataType: 'json',
        type: 'post',
        success: function (suppliers) {
            fillSupplierTable(suppliers);
        },
        error: function () {
        }
    });
});

//填充供应商表
function fillSupplierTable(suppliers) {
    let table = $("#suppliersMsgTable");
    let newTr;
    let newTd;
    let newLink;
    $(".supplierMsgRow").remove();
    for (let i = 0; i < suppliers.length; i++) {
        newTr = $("<tr class='supplierMsgRow'></tr>");
        table.append(newTr);
        let supplier = suppliers[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in supplier) {
            if (-1 !== ["sup_code", "sup_name", "sup_phone", "sup_category"].indexOf(key)) {
                newTd = $("<td></td>").text(supplier[key]);
                newTr.append(newTd);
            }
        }
        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn supRowDetail" href="#" data-toggle="modal" data-target="#supDetails"></a>').text("详情");
        newTd.append(newLink);
        newTr.append(newTd);

        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn supRowDelete" href="#" data-toggle="modal"></a>').text("删除");

        newTd.append(newLink);
        newTr.append(newTd);
    }
    setSupDetailedEvent();
    setSupRemoveBtnEvent();
}

//设置供应商管理 详情按钮点击事件
function setSupDetailedEvent() {
    $(".supRowDetail").on('click', function () {
        $.ajax({
            url: perInfoManageURL + "/findSupplierByCode",
            dataType: 'json',
            data: {"sup_code": this.parentElement.parentElement.childNodes[1].innerText.trim()},
            type: 'post',
            success: function (supplier) {
                setSupDetailData(supplier);
                setSupDetailModalDisabled();
            },
            error: function () {
            }
        });

    });
}

//设置供应商管理删除按钮点击事件
function setSupRemoveBtnEvent() {
    // alert("调用了设置删除事件！");
    $(".supRowDelete").on('click', function () {
        if (confirm('确认删除？')) {
            $.ajax({
                url: perInfoManageURL + "/removeSupplier",
                data: {"sup_code": this.parentElement.parentElement.childNodes[1].innerText.trim()},
                type: 'post',
                success: function (resMsg) {
                    alert(resMsg);
                    $("#query-sup-btn").click();//更新表格
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }
    });
}

//查询供应商按钮点击事件
$("#query-sup-btn").on('click', function () {
    let json = {
        'sup_code': $("#sup-code-query").val(),
        'sup_name': $("#sup-name-query").val(),
        'sup_phone': $("#sup-phone-query").val(),
        'sup_category': $("#sup-category-lv2-query").val(),
        'sup_address': $("#sup-address-query").val()
    };
    $.ajax({
        url: perInfoManageURL + "/findSuppliersByCondition",
        contentType: 'application/json;UTF-8',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify(json),
        success: function (Suppliers) {
            fillSupplierTable(Suppliers)
        },
        error: function () {
            alert("Error!");
        }

    })
});

//供应商品类别名称输入框
let supCtInput = $("#sup-detail-category");

//详情页面的供应商品种类输入框失去焦点事件
supCtInput.on('blur', function () {
    $.ajax({
        url: perInfoManageURL + "/findInputCtNameByCode",
        type: 'post',
        data: {'ct_code': $(this).val()},
        success: function (resMsg) {
            if (resMsg === 'none') {
                // alert("种类不存在");
                supCtInput.attr('title', "该商品种类不存在！");
                supCtInput.css('border-color', 'red');
                supCtInput.css('border-width', '3px');
            } else {
                supCtInput.attr('title', resMsg);
            }
        },
        error: function () {
            alert("error!");
        }
    });
});

//详情页面的供应商品种类输入框按键事件
supCtInput.keydown(function () {
    $(this).attr('title', "商品种类");
    $(this).css('border-color', '#CCC');
    $(this).css('border-width', '1px');
});

//设置供应商信息模态框数据
function setSupDetailData(sup) {
    $("#sup-detail-code").val(sup['sup_code']);
    $("#sup-detail-name").val(sup['sup_name']);
    $("#sup-detail-shop-name").val(sup['sup_shop_name']);
    $("#sup-detail-phone").val(sup['sup_phone']);
    supCtInput.val(sup['sup_category']);
    $("#sup-detail-address").val(sup['sup_address']);
}

//供应商详情模态框保存按钮
let saveSupBtn = $("#save-sup-data");

//设置供应商详情模态框不可编辑
function setSupDetailModalDisabled() {
    $("#sup-detail-code").attr('readonly', true);
    $("#sup-detail-name").attr('readonly', true);
    $("#sup-detail-shop-name").attr('readonly', true);
    $("#sup-detail-phone").attr('readonly', true);
    supCtInput.attr('readonly', true);
    $("#sup-detail-address").attr('readonly', true);
    saveSupBtn.attr('disabled', true);
}

//设置供应商详情模态框可编辑
function setSupDataModalAble() {
    $("#sup-detail-name").attr('readonly', false);
    $("#sup-detail-shop-name").attr('readonly', false);
    $("#sup-detail-phone").attr('readonly', false);
    supCtInput.attr('readonly', false);
    $("#sup-detail-address").attr('readonly', false);
    saveSupBtn.attr('disabled', false);
}

//供应商详情模态框“编辑”按钮
$("#edit-sup-data").on('click', function () {
    setSupDataModalAble();
});

//供应商详情模态框保存按钮事件
saveSupBtn.on('click', function () {
    let json = {
        'sup_code': $("#sup-detail-code").val(),
        'sup_name': $("#sup-detail-name").val(),
        'sup_shop_name': $("#sup-detail-shop-name").val(),
        'sup_phone': $("#sup-detail-phone").val(),
        'sup_category': supCtInput.val(),
        'sup_address': $("#sup-detail-address").val(),
    };
    $.ajax({
        url: perInfoManageURL + "/saveEditSupplier",
        contentType: "application/json;UTF-8",
        type: 'post',
        data: JSON.stringify(json),
        success: function (resMsg) {
            alert(resMsg);
        },
        error: function () {
            alert("error!");
        }
    })
});


//会员管理
//填充会员表格内容函数
function fillCustomerTable(customers){
    let table = $("#cus-msg-table");
    let newTr;
    let newTd;
    let newLink;
    $(".customerMsgRow").remove();
    for (let i = 0; i < customers.length; i++) {
        newTr = $("<tr class='customerMsgRow'></tr>");
        table.append(newTr);
        let supplier = customers[i];
        newTd = $("<td></td>").text(i + 1);
        newTr.append(newTd);
        for (let key in supplier) {
            if (-1 !== ["c_code", "c_point"].indexOf(key)) {
                newTd = $("<td></td>").text(supplier[key]);
                newTr.append(newTd);
            }
        }
        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn cusRowDetail" href="#" data-toggle="modal" data-target="#cusDetails"></a>').text("详情");
        newTd.append(newLink);
        newTr.append(newTd);

        newTd = $("<td></td>");
        newLink = $('<a class="msg_btn cusRowDelete" href="#" data-toggle="modal"></a>').text("删除");

        newTd.append(newLink);
        newTr.append(newTd);
    }
    setCusDetailedEvent();
    setCusRemoveBtnEvent();
}
//设置会员表详情按钮事件
function setCusDetailedEvent(){
    $(".cusRowDetail").on('click', function () {
        $.ajax({
            url: perInfoManageURL + "/findCustomerByCode",
            dataType: 'json',
            data: {"c_code": this.parentElement.parentElement.childNodes[1].innerText.trim()},
            type: 'post',
            success: function (customer) {
                setCusDetailData(customer);
                setCusDetailModalDisabled();
            },
            error: function () {
            }
        });
    });
}
//设置会员表删除按钮事件
function setCusRemoveBtnEvent(){
    $(".cusRowDelete").on('click', function () {
        if (confirm('确认删除？')) {
            $.ajax({
                url: perInfoManageURL + "/removeCustomerByCode",
                data: {"c_code": this.parentElement.parentElement.childNodes[1].innerText.trim()},
                type: 'post',
                success: function (resMsg) {
                    alert(resMsg);
                    $("#query-cus-btn").click();//更新表格
                },
                error: function (msg) {
                    alert(msg);
                }
            })
        }
    });
}
//设置会员详细信息模态框数据
function setCusDetailData(cus){
    $("#cus-detail-code").val(cus['c_code']);
    $("#cus-detail-name").val(cus['c_name']);
    $("#cus-detail-phone").val(cus['c_phone']);
    $("#cus-detail-point").val(cus['c_point']);
}
//会员详情模态框保存按钮
let saveCusBtn = $("#save-cus-detail");
//设置会员详情模态框不可编辑
function setCusDetailModalDisabled() {
    $("#cus-detail-code").attr('readonly', true);
    $("#cus-detail-name").attr('readonly', true);
    $("#cus-detail-phone").attr('readonly', true);
    $("#cus-detail-point").attr('readonly', true);
    saveCusBtn.attr('disabled', true);
}
//设置会员详情模态框可编辑
function setSupDetailModalAble() {
    $("#cus-detail-name").attr('readonly', false);
    $("#cus-detail-phone").attr('readonly', false);
    $("#cus-detail-point").attr('readonly', false);
    saveCusBtn.attr('disabled', false);
}
//会员详情模态框“编辑”按钮
$("#edit-cus-detail").on('click', function () {
    setSupDetailModalAble();
});

//会员详情模态框保存按钮事件
saveCusBtn.on('click', function () {
    let json = {
        'c_code': $("#cus-detail-code").val(),
        'c_name': $("#cus-detail-name").val(),
        'c_phone': $("#cus-detail-phone").val(),
        'c_point': $("#cus-detail-point").val(),
    };
    $.ajax({
        url: perInfoManageURL + "/saveEditCustomer",
        contentType: "application/json;UTF-8",
        type: 'post',
        data: JSON.stringify(json),
        success: function (resMsg) {
            alert(resMsg);
            $("#query-cus-btn").click();//更新表格
        },
        error: function () {
            alert("error!");
        }
    })
});
//添加会员导航条点击事件
$("#add-cus-nav-item").on('click', function () {
    //设置导航条选中，设置对应页面显示
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    $(this).parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    $("#add-cus-panel").css('display', 'block');
});
//查询会员导航条点击事件
$("#query-cus-nav-item").on('click', function () {
    //设置导航条选中，设置对应页面显示
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    $(this).parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    $("#query-cus-panel").css('display', 'block');
    $.ajax({
        url: perInfoManageURL + "/findAllCustomers",
        dataType: 'json',
        type: 'post',
        success: function (customers) {
            fillCustomerTable(customers);
        },
        error: function () {
        }
    });
});
//添加会员按钮功能
$("#add-cus-btn").on('click', function () {
    let json={
        'c_name': $("#cus-name").val(),
        'c_phone': $("#cus-phone").val(),
        'c_point': $("#cus-point").val(),
    };
    $.ajax({
        url:perInfoManageURL + "/addCustomer",
        contentType: "application/json;UTF-8",
        type: 'post',
        data: JSON.stringify(json),
        success: function (resMsg) {
            alert(resMsg);
        },
        error: function () {
            alert("error!");
        }
    })
});
//条件查询会员按钮
$("#query-cus-btn").on('click', function () {
    let json={
        'c_name': $("#cus-name-query").val(),
        'c_phone': $("#cus-phone-query").val(),
    };
    $.ajax({
        url: perInfoManageURL + "/findCustomersByCondition",
        contentType: "application/json;UTF-8",
        type: 'post',
        dataType: 'json',
        data: JSON.stringify(json),
        success: function (customers) {
            fillCustomerTable(customers);
        },
        error: function () {
            alert("error!");
        }
    })
});


