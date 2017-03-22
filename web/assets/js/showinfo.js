/**
 * Description :
 * Created by code4j on 2016/4/5 0005
 *  11:11
 */
$(function(){
    $("#btn-switch").click(function(){
        if($("#context").hasClass("half-show")){
            $("#context").removeClass("half-show");
            $(this).children().html("显示部分信息");
        }else{
            $("#context").addClass("half-show");
            $(this).children().html("显示全部信息");
        }
    });
});