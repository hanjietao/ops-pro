
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
	var loginName = $.common.trim($("input[name='loginName']").val());
    var password = $.MD5($.common.trim($("input[name='password']").val()));
    var validateCode = $("input[name='validateCode']").val();
    var phonenumber = $("input[name='phonenumber']").val();
    var smsCode = $("input[name='smsCode']").val();
    var repassword = $.MD5($.common.trim($("input[name='repassword']").val()));
    if(smsCode=='' || smsCode.length != 6){
        $.modal.alertWarning("请输入6位短信验证码！");
        return
    }

    $.modal.loading($("#btnSubmit").data("loading"));
    $.ajax({
        type: "post",
        url: ctx + "register",
        headers: {
            "login-type": "p-client"
        },
        data: {
            "loginName": loginName,
            "password": password,
            "repassword": repassword,
            "smsCode" : smsCode,
            "phonenumber": phonenumber
        },
        success: function(r) {
            if (r.code == 0) {
                $.modal.closeLoading();
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
            },
            phonenumber: {
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
                required: icon + "请输入确认密码1",
            },
            phonenumber: {
                required: icon + "请输入手机号",
            }
        }
    })
}

