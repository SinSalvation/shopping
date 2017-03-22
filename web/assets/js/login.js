/**
 * Description :
 * Created by code4j on 2016/4/9 0009
 *  16:37
 */
$(function(){
    $("#phone").on("focus", function () {
        $("#phone-panel").removeClass("has-error");
        $("#phone-panel").removeClass("has-success");
        $("#login-err").html("");
    });
    $("#passwd").on("focus", function () {
        $("#password-panel").removeClass("has-error");
        $("#password-panel").removeClass("has-success");
        $("#login-err").html("");
    });
    $("#btn-login").on("click", function () {
        var reg = /^1[34589]\d{9}$/;
        if(!reg.test($("#phone").val())){
            $("#phone-panel").removeClass("has-success");
            $("#phone-panel").addClass("has-error");
            $("#login-err").html("<span class='red-bg'>手机号格式错误</span>");
        }else if($("#passwd").val()==""){
            $("#password-panel").removeClass("has-success");
            $("#password-panel").addClass("has-error");
            $("#login-err").html("<span class='red-bg'>密码不能为空</span>");
        }else{
            var json = {"phone":$("#phone").val(),"password":$("#passwd").val()}
            $.ajax({
                method:"POST",
                data : JSON.stringify(json),
                dataType: "json",
                contentType: "application/json",
                url:"/shopping/user/login",
                success:function(data){
                    if(data.code!=200){
                        $("#phone-panel").removeClass("has-success");
                        $("#phone-panel").addClass("has-error");
                        $("#password-panel").removeClass("has-success");
                        $("#password-panel").addClass("has-error");
                        $("#login-err").html("<span class='red-bg'>"+data.message+"</span>");
                    }else{
                        $("#phone-panel").removeClass("has-error");
                        $("#phone-panel").addClass("has-success");
                        $("#login-err").html("<span class='green-bg'>"+data.message+"</span>");
                        window.location.href = "/shopping/user/index";
                    }
                }
            });
        }
    });
});