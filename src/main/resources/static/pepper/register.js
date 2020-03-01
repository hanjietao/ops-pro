
$(function() {
    validateRule();
    $('.imgcode').click(function() {
        var url = ctx + "captcha/captchaImage?type=" + captchaType + "&s=" + Math.random();
        $(".imgcode").attr("src", url);
    });
});

$.validator.setDefaults({
    submitHandler: function() {
        register();
    }
});

function register() {
    debugger
	$.modal.loading($("#btnSubmit").data("loading"));
	var loginName = $.common.trim($("input[name='loginName']").val());
    var password = $.MD5($.common.trim($("input[name='password']").val()));
    var validateCode = $("input[name='validateCode']").val();
    var phonenumber = $("input[name='phonenumber']").val();
    var smsCode = $("input[name='smsCode']").val();
    var repassword = $.MD5($.common.trim($("input[name='repassword']").val()));
    $.ajax({
        type: "post",
        url: ctx + "register",
        data: {
            "loginName": loginName,
            "password": password,
            "repassword": repassword,
            "smsCode" : smsCode,
            "phonenumber": phonenumber,
            "sys-client-user": "clientUserRegister"
        },
        success: function(r) {
            debugger
            if (r.code == 0) {
                $.modal.alertSuccess(r.msg)
                $("#loginName").val("");
                $("#password").val("");
                $("#repassword").val("");
            } else {
            	$.modal.closeLoading();
            	$('.imgcode').click();
            	$(".code").val("");
            	$.modal.msg(r.msg);
            }
            $.modal.closeLoading();
        }
    });
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#registerForm").validate({
        rules: {
            loginName: {
                required: true
            },
            password: {
                required: true
            },
            repassword: {
                required: true
            }
        },
        messages: {
            loginName: {
                required: icon + "请输入注册用户名",
            },
            password: {
                required: icon + "请输入您的密码",
            },
            repassword: {
                required: icon + "请输入确认密码",
            }
        }
    })
}

