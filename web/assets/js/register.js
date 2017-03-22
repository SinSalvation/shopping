/**
 * Description :
 * Created by code4j on 2016/4/9 0009
 *  21:01
 */
$(function(){
    $("#phone").on("blur", function () {
        checkPhone($(this).val());
    });
    $("#passwd").on("blur", function () {
        if($(this).val().length<6){
            $("#pwd-notice").html("密码长度必须在6~16位");
        }else{
            if($("#repasswd").val().length>0
                && $(this).val()!=$("#repasswd").val()){
                $("#pwd-notice").html("两次密码输入不一致");
            }else{
                $("#pwd-notice").html("");
            }
        }

    });
    $("#repasswd").on("blur", function () {
        if($(this).val()!=$("#passwd").val()){
            $("#repwd-notice").html("两次密码输入不一致");
        }else{
            if($("#passwd").val().length>0
                && $(this).val()!=$("#passwd").val()){
                $("#repwd-notice").html("两次密码输入不一致");
            }else{
                $("#repwd-notice").html("");
            }
        }
    });
    $("#passwd,#repasswd").bind("change",function () {
        $("#pwd-notice").html("");
        $("#repwd-notice").html("");
    });

    $("#reg-btn").on("click", function () {
        var reg = /^1[34589]\d{9}$/;
        if(!reg.test($("#phone").val())){
            $("#phone-panel").removeClass("has-success");
            $("#phone-panel").addClass("has-error");
            $("#phone-notice").html("<span class='red-bg'>手机号格式有误</span>");
        }else if($("#username").val()==""){
            $("#username-panel").removeClass("has-success");
            $("#username-panel").addClass("has-error");
            $("#name-notice").html("<span class='red-bg'>请填写用户名</span>");
        }else if($("#passwd").val() == ""){
            $("#passwd").removeClass("has-success");
            $("#passwd").addClass("has-error");
            $("#pwd-notice").html("<span class='red-bg'>请填写密码</span>");
        }else if($("#repasswd").val() == ""){
            $("#repwd-notice").removeClass("has-success");
            $("#repwd-notice").addClass("has-error");
            $("#repwd-notice").html("<span class='red-bg'>请填写密码</span>");
        }else if(!$("#repasswd").val() == $("#passwd").val()){
            $("#passwd").removeClass("has-success");
            $("#passwd").addClass("has-error");
            $("#repwd-notice").removeClass("has-success");
            $("#repwd-notice").addClass("has-error");
            $("#pwd-notice").html("<span class='red-bg'>两次密码输入不一致</span>");
            $("#repwd-notice").html("<span class='red-bg'>两次密码输入不一致</span>");
        }else{
            var json = {"phone":$("#phone").val(),"username":$("#username").val(),"password":$("#passwd").val()}
            $.ajax({
                method:"POST",
                data : JSON.stringify(json),
                dataType: "json",
                contentType: "application/json",
                url:"/shopping/user/register",
                success:function(data){
                    if(data.code!=200){
                        $("#repwd-notice").removeClass("has-success");
                        $("#repwd-notice").addClass("has-error");
                        $("#repwd-notice").html("<span class='red-bg'>"+data.message+"</span>");
                    }else{
                        $("#login-err").html("<span class='green-bg'>"+data.message+"</span>");
                        window.location.href = "/shopping/user/login";
                    }
                }
            });
        }
    });
});
function checkPhone(phone){
    var json = {"phone":phone};
    var reg = /^1[34589]\d{9}$/;
    if(!reg.test($("#phone").val())){
        $("#phone-panel").removeClass("has-success");
        $("#phone-panel").addClass("has-error");
        $("#phone-notice").html("<span class='red-bg'>手机号格式有误</span>");
    }else{
        $.ajax({
            method:"POST",
            data : JSON.stringify(json),
            dataType: "json",
            contentType: "application/json",
            url:"/shopping/user/phone",
            success:function(data){
                if(data.code!=200){
                    $("#phone-panel").removeClass("has-success");
                    $("#phone-panel").addClass("has-error");
                    $("#phone-notice").html("<span class='red-bg'>"+data.message+"</span>");
                }else{
                    $("#phone-panel").removeClass("has-error");
                    $("#phone-panel").addClass("has-success");
                    $("#phone-notice").html("<span class='green-bg'>"+data.message+"</span>");
                }
            },
            error: function (data) {
                result = data;
            }
        });
    }

}