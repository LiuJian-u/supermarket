let menuItems = document.getElementsByClassName("menuItem");
let complete_menuItems = document.getElementsByClassName("complete-menuItem");
let subMenuItems = document.getElementsByClassName("subMenuItem");
let itemBlocks = document.getElementsByClassName("ItemBlock");

$("input").css('caret-color','rgb(0, 0, 0)');

function clickMenu(i) {
    for (let j = 0; j < complete_menuItems.length; j++) {
        if (j === i) {
            complete_menuItems[j].style.display = "block";
        } else {
            complete_menuItems[j].style.display = "none";
        }
    }
}

function clickSubMenu(i) {
    for (let j = 0; j < subMenuItems.length; j++) {
        if (j === i) {
            itemBlocks[j].style.display = "block";
            subMenuItems[j].parentElement.classList.add("active");
        } else {
            itemBlocks[j].style.display = "none";
            subMenuItems[j].parentElement.classList.remove("active");
        }
    }
}

for (let i = 0; i < menuItems.length; i++) {
    menuItems[i].onclick = function () {
        clickMenu(i);
    }
}
for (let i = 0; i < subMenuItems.length; i++) {
    subMenuItems[i].onclick = function () {
        clickSubMenu(i);
    }
}


// 设置日期选择下拉列表
let now_year = new Date().getFullYear();
let year = document.getElementsByClassName("year");
let month = document.getElementsByClassName("month");
let day = document.getElementsByClassName("day");
for (let m = 0; m < year.length; m++) {
    if (year[m].style.display !== "block") {
        month[m].disabled = "disabled";
        day[m].disabled = "disabled";
        for (let i = 2014; i < now_year; i++) {
            let year_element = document.createElement("option");
            year_element.value = i + 1;
            year_element.innerHTML = i + 1;
            year[m].appendChild(year_element);
        }
        for (let i = 0; i < 12; i++) {
            let month_element = document.createElement("option");
            month_element.value = i + 1;
            month_element.innerHTML = i + 1;
            month[m].appendChild(month_element);
        }

        function change_year() {
            year[m].value = year[m].options[year[m].selectedIndex].value;
            if (year[m].value !== "--") {
                month[m].disabled = "";
            } else {
                month[m].disabled = "disabled";
                day[m].disabled = "disabled";
            }
        }

        let maxDay;

        function change_month() {
            while (day[m].childNodes.length > 0) {
                day[m].removeChild(day[m].childNodes[0]);
            }
            let day_element = document.createElement("option");
            day_element.innerHTML = "--";
            day[m].appendChild(day_element);

            month[m].value = month[m].options[month[m].selectedIndex].value;

            if (month[m].value % 2 === 1) {
                maxDay = 31;
            } else if (month[m].value !== "2") {
                maxDay = 30;
            } else {
                if (year[m].value % 4 === 0) {
                    maxDay = 28;
                    if (year[m].value % 100 === 0 && year[m].value % 400 !== 0) {
                        maxDay = 29;
                    }
                } else {
                    maxDay = 29;
                }
            }
            for (let i = 0; i < maxDay; i++) {
                let day_element = document.createElement("option");
                day_element.value = i + 1;
                day_element.innerHTML = i + 1;
                day[m].appendChild(day_element);
            }

            if (month[m].value !== "--") {
                day[m].disabled = "";
            } else {
                day[m].disabled = "disabled";
            }
        }

        function change_day() {
            day[m].value = day[m].options[day[m].selectedIndex].value;
        }

        year[m].onchange = change_year;
        month[m].onchange = change_month;
        day[m].onchange = change_day;
    }
}

function nav_panel_conn(nav, panel) {
    $(".nav-left").each(function () {
        $(this).parent().removeClass('active');
    });
    nav.parent().addClass('active');
    $(".panel-of-nav-left").css({'display': 'none'});
    panel.css('display', 'block');

}

let newTitle = '';
function setTip(tag) {
    let timeId;
    tag.on('mouseover', function (e) {
        newTitle = this.title;
        this.title = '';
        timeId = setTimeout(function () {
            $('body').append('<div id="myTitle" >' + newTitle + '</div>');
            $('#myTitle').css({
                'left': (e.pageX + 10 + 'px'),
                'top': (e.pageY - 60 + 'px')
            }).show();
        }, 500);
    }).on('mouseout', function () {
        clearTimeout(timeId);
        this.title = newTitle;
        $('#myTitle').remove();
    }).on('mousemove', function (e) {
        $('#myTitle').css({
            'left': (e.pageX + 20 + 'px'),
            'top': (e.pageY - 40 + 'px')
        }).show();
    });

}

$(".form-control").each(function () {
    setTip($(this));
});

function inputEmpty(tag, warnTipMsg, normalTipMsg){
    tag.on('blur', function () {
        if ($(this).val() === ""){
            $(this).attr('title', warnTipMsg);
            $(this).css('border-color', 'red');
            $(this).css('border-width', '3px');
        }
    });
    tag.keydown(function () {
        if ($(this).val() === "") {
            newTitle = normalTipMsg;
            $(this).css('border-color', '#CCC');
            $(this).css('border-width', '1px');
        }
    });
}

//非json数据查询请求
function queryDataWithoutJson(url, data, fun) {
    $.ajax({
        url: url,
        type: 'post',
        data: data,
        success: function (resMsg) {
            fun(resMsg);
        }
    });
}

function queryWithJsonRetNotParam(url, data, fun) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        data: data,
        success: function (resMsg) {
            fun(resMsg);
        }
    });
}

function queryWithJsonParamAndRet(url, data, fun) {
    $.ajax({
        url: url,
        contentType: "application/json;UTF-8",
        dataType: 'json',
        type: 'post',
        data: JSON.stringify(data),
        success: function (resMsg) {
            fun(resMsg);
        }
    });
}

function queryWithJsonParamNotRet(url, data, fun) {
    $.ajax({
        url: url,
        contentType: "application/json;UTF-8",
        type: 'post',
        data: JSON.stringify(data),
        success: function (resMsg) {
            fun(resMsg);
        }
    });
}

//左侧导航栏面板绑定
// let left_navs = document.getElementsByClassName("nav-left");
// let nav_panels = document.getElementsByClassName("panel-of-nav-left");
//
// function change_nav_panel(num) {
//     for (let i = 0; i < nav_panels.length; i++) {
//         if (i === num) {
//             nav_panels[i].style.display = "block";
//             left_navs[i].parentElement.classList.add("active");
//         } else {
//             nav_panels[i].style.display = "none";
//             left_navs[i].parentElement.classList.remove("active");
//         }
//     }
// }
//
// for (let i = 0; i < left_navs.length; i++) {
//     left_navs[i].onclick = function () {
//         change_nav_panel(i);
//     }
// }





