window.onload = function () {


    let login_form = document.getElementById("login_form");
    let warring = document.getElementsByClassName("warring_label");
    let inputAccount = $("#inputAccount");
    let inputPassword = $("#inputPassword");

    inputAccount.on('blur', function () {
        if (inputAccount.val() === ""){
            inputAccount.css("border-color", "red");
            inputAccount.css("border-width", "3px");
            warring[0].style.display = "block";
        }
    });
    inputAccount.keydown(function () {
        inputAccount.css("border-color", "#CCC");
        inputAccount.css("border-width", "1px");
        warring[0].style.display = "none";
    });

    inputPassword.on('blur', function () {
        if (inputPassword.val() === ""){
            inputPassword.css("border-color", "red");
            inputPassword.css("border-width", "3px");
            warring[1].style.display = "block";
        }
    });
    inputPassword.keydown(function () {
        inputPassword.css("border-color", "#CCC");
        inputPassword.css("border-width", "1px");
        warring[1].style.display = "none";
    });



    $("#staffLoginBtn").on('click', function () {
        login_form.action = "staff/checkLogin";
        if (log_in() === false) {
            return false;
        } else {
        }
    });

    $("#adminLoginBtn").on('click', function () {

        let loginMsg = {
            admin_account: inputAccount.val(),
            admin_password: inputPassword.val()
        };

        login_form.action = "administrator/login";
        if (log_in() !== false) {
            $.ajax({
                url: "administrator/checkLogin",
                contentType: "application/json;charset=UTF8",
                data: JSON.stringify(loginMsg),
                type: 'post',
                success: function (retMsg) {
                    if (retMsg === 0){
                        alert("登录失败，用户名或密码错误");
                        return;
                    }
                    if (retMsg === 1){
                        alert("登录成功！");
                        login_form.submit();
                    }
                },
                error:function () {
                    alert("登录失败");
                }
            })
        }
    });

    //表单提交响应函数，输入为空时拦截表单的提交
    function log_in() {
        if (document.getElementById("inputAccount").value === "") {
            warring[0].style.display = "block";
        } else if (document.getElementById("inputAccount").value !== "") {
            warring[0].style.display = "none";
        }
        if (document.getElementById("inputPassword").value === "") {
            warring[1].style.display = "block";

        } else if (document.getElementById("inputPassword").value !== "") {
            warring[1].style.display = "none";
        }
        if (document.getElementById("inputAccount").value === "" ||
            document.getElementById("inputPassword").value === "") {
            return false;
        }
    }

};
