/**
 * Description :
 * Created by code4j on 2016/4/9 0009
 *  11:05
 */
var json = [];
var addrId = "";
$(function(){
    $("#address").citySelect({
        nodata: "none",
        required: false
    });
    $("#m_address").citySelect({
        nodata: "none",
        required: false
    });

    $("#addAddress").on("click",function(){
        if($("#addition-box").hasClass("hidden")){
            $("#addition-box").removeClass("hidden");
            $("#addition-box").addClass("show");
        }else{
            $("#addition-box").removeClass("show");
            $("#addition-box").addClass("hidden");
        }
    });
    $(".edit").on("click",function(){
        var addr = {"addrId":$(this).attr("data")};
        $.ajax({
            method:"POST",
            data : JSON.stringify(addr),
            dataType: "json",
            contentType: "application/json",
            url:"/shopping/address/addrId",
            success: function (data) {
                $("#getter").val(data.address.username);
                $("#getter-addr").val(data.address.address);
                $("#postcode").val(data.address.postcode);
                $("#phone").val(data.address.phone);
                $("#id").val(data.address.addrId);
            }
        });
        $("#modifyModal").modal("show");
    });

    $(".addr-box").on("click",function(){
        if(!$(this).hasClass("current_addr")){
            $(this).siblings(".current_addr").children(".row")
                .children(":last").remove("");
            $(this).siblings(".current_addr").addClass("my_addr");
            $(this).siblings(".current_addr").removeClass("current_addr");
            $(this).removeClass("my_addr");
            $(this).addClass("current_addr");
            $(this).children(".row").append("<div class='col-md-3'>" +
            "<em class='addr-mo'></em>" +
            "</div>");
            addrId = $(this).attr("data");
        }
    });

    $("#btn-count").on("click", function () {
        var tr = $(".tr");
        if(addrId==""){
            alert("请选择你的配送地址");
        }else if(json==[]){
            alert("订单信息不正确，请重新从购物车下单！")
        }else{
            for(var i=0;i<tr.length;i++){
                var id = $(tr.get(i)).attr("data");
                json.push(id);
            }
            $.ajax({
                method:"POST",
                data : JSON.stringify(json),
                dataType: "json",
                contentType: "application/json",
                url:"/shopping/order/adds?addrId="+addrId,
                success: function (data) {
                    window.location.href = "/shopping/order/complete";
                }
            });
        }
    });
});