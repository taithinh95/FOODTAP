function callAjax(url, type, data, cb) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        success: cb
    })
}
$(".btn-updateCategory").click(function() {
    var idProduct = $(this).attr("idValue");
    callAjax("/foodCategory/" + idProduct, "GET", null, function(data) {

        $("#updateCategorymodal .name-category").val(data.name);
        $("#updateCategorymodal .image-frame-upload").css("background-image", "url(http://localhost:9032/public/image/" + data.image + ")");
        $("#updateCategorymodal .foodCategoryId").val(data._id);
        $("#updateCategorymodal .btn-updateCategoryModel").attr("idValue", idProduct);
    })
})

$(document).ready(function() {
    $('#addModal').modal({
        keyboard: true,
        backdrop: "static",
        show: false,
    });

    var count = $("input[name='inputupdatedAt']");
    for (i = 0; i < count.length; i++) {
        var h = new Date(count[i].value);

        $(".updatedAt")[i].innerHTML = h.getDate() + "/" + (h.getMonth() + 1) + "/" + h.getFullYear();
    }

    $(document).on("click", ".btn.btn-success#unBlockShipper", function() {
        var idShipper = $(this).attr("idValue");
        callAjax("/shipper/blockShipper/" + idShipper, "POST", null, function(data) {
            window.location.href = "/shipper";
        })
    })
    $(document).on("click", ".btn.btn-danger#blockShipper", function() {
        var idShipper = $(this).attr("idValue");
        callAjax("/shipper/blockShipper/" + idShipper, "POST", null, function(data) {
            window.location.href = "/shipper";
        })
    })


    $(document).on("click", ".btn.btn-success#unBlockRestaurant", function() {
        var idRestaurant = $(this).attr("idValue");
        callAjax("/restaurant/blockRestaurant/" + idRestaurant, "POST", null, function(data) {
            window.location.href = "/restaurant";
        })
    })
    $(document).on("click", ".btn.btn-danger#blockRestaurant", function() {
        var idRestaurant = $(this).attr("idValue");
        callAjax("/restaurant/blockRestaurant/" + idRestaurant, "POST", null, function(data) {
            window.location.href = "/restaurant";
        })
    })
    $(document).on("click", "#blockVertifyRestaurant", function() {
        var idRestaurant = $(this).attr("idValue");
        callAjax("/restaurant/changeVerifyRestaurant/" + idRestaurant, "POST", null, function(data) {
            window.location.href = "/restaurant";
        })
    })
    
$(document).on("click", "#unblockVertifyRestaurant", function() {
        var idRestaurant = $(this).attr("idValue");
        callAjax("/restaurant/changeVerifyRestaurant/" + idRestaurant, "POST", null, function(data) {
            window.location.href = "/restaurant";
        })
    })
    $(document).on("click", ".btn.btn-success#unBlockUser", function() {
        var idUser = $(this).attr("idValue");
        callAjax("/user/changeActiveUser/" + idUser, "POST", null, function(data) {
            window.location.href = "/user";
        })
    })
    $(document).on("click", ".btn.btn-danger#blockUser", function() {
        var idUser = $(this).attr("idValue");
        callAjax("/user/changeActiveUser/" + idUser, "POST", null, function(data) {
            window.location.href = "/user";
        })
    })

    $(document).on("click", ".btn.btn-success#showNewfeed", function() {
        var idNewfeed = $(this).attr("idValue");
        callAjax("/newfeed/blockNewfeed/" + idNewfeed, "POST", null, function(data) {
            window.location.href = "/newfeed";
        })
    })
    $(document).on("click", ".btn.btn-danger#hiddenNewfeed", function() {
        var idNewfeed = $(this).attr("idValue");
        callAjax("/newfeed/blockNewfeed/" + idNewfeed, "POST", null, function(data) {
            window.location.href = "/newfeed";
        })
    })

    $(document).on("click", ".btn.btn-primary#detailReport", function() {
        var idReport = $(this).attr("idValue");
        callAjax("/report/" + idReport, "GET", null, function(data) {
            $("#reportId").val(data.result._id);
            $("#senderId").val(data.result.sender);
            $("#senderName").val(data.result.sender.name);
            if (data.result.typed == "user") {
                $("#reporter").val(data.result.user._id);
                $("#reporterName").val(data.result.user.name)
            }
            else if (data.result.typed === "newfeed")
            {
                $("#reporter").val(data.result.newfeed._id);
                $("#reporterName").val(data.result.newfeed.content);
            }
            else {
                $("#reporter").val(data.result.restaurant._id);
                $("#reporterName").val(data.result.restaurant.name);
            }
            $("#reporterTyped").val(data.result.typed);
            $("#contentReport").val(data.result.content);

        });
    });

    $(document).on("click", ".btn.btn-success.form-control.btn-updateCoupon", function() {
        var idCoupon = $(this).val();
        callAjax("/coupon/" + idCoupon, "GET", null, function(data) {
            $("#code").val(data.code);
            $("#name").val(data.name);
            $("#exp").val(data.exp);
            $("#description").val(data.description);
            $("#discount").val(data.discount);
            $("#max").val(data.max);
            $("#updateCoupon .image-frame-upload").css("background-image", "url(http://localhost:9032/public/image/" + data.image + ")");
            $("#min").val(data.min);
            $("#percent").val(data.percent);
            for (var i = 0; i < data.restaurants.length; i++) {
                arraystore.push(data.restaurants[i].name);
                var namestore = data.restaurants[i].name + ", ";
                $("#restaurants").val($("#restaurants").val() + namestore);
            }
        });
    });
    if ($("input[name='multipartFile']").val() != "") {
        $(".img-hidden").css("display", "none");
    }
    ;

});
$(document).on("click", ".page-item", function() {
    var count = $("input[name='inputupdatedAt']");
    for (i = 0; i < count.length; i++) {
        var h = new Date(count[i].value);

        $(".updatedAt")[i].innerHTML = h.getDate() + "/" + (h.getMonth() + 1) + "/" + h.getFullYear();
    }
});
$("#dropdownMenuButton").on("keypress", function() {
    var value = $(this).val().toLowerCase();
    $("#List a").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
});
$('#List').bind('click', function(e) {
    e.stopPropagation();
})
var arraystore = [];
var arrayIDstore = [];
$(".dropdown-item").click(function() {
    var a = $(this).closest("#updateCoupon").find(".id-store-coupon");
    if (arraystore.length != 0) {
        for (var i = 0; i < arraystore.length; i++) {
            if (arraystore[i] == $(this).find(".name-store").text()) {
                alert("Cửa hàng này đã được chọn");
                return false;
            }
        }


        arraystore.push($(this).find(".name-store").text().toString());
        arrayIDstore.push($(this).find(".id-store").text().toString());
        a.val(a.val() + $(this).find(".id-store").text() + ", ");
        $(".store-coupon").val($(".store-coupon").val() + $(this).find(".name-store").text() + ", ");

    }
    else {
        arrayIDstore.push($(this).find(".id-store").text().toString());
        a.val(a.val() + $(this).find(".id-store").text() + ", ");
        arraystore.push($(this).find(".name-store").text().toString());
        $(".store-coupon").val($(".store-coupon").val() + $(this).find(".name-store").text() + ", ");
    }
    if ($(".image-frame-upload").css("background") != null) {
        $(".img-hidden").css("display", "none");
    }
});
$(".store-coupon").keydown(function(e) {
    var deletevalue = $(this).value;
    if (e.key != "Backspace") {
        alert("Bạn chỉ có thể xóa");
        return false;
    }
    else
    {
        $(this).val("");
        arraystore = [];
        arrayIDstore = [];
    }

});
$("#chossefile").click(function(e) {
    e.preventDefault();
    $(this).closest(".gallery").find(".img-store-register").trigger('click');

});

$(".choosefile").click(function(e) {
    e.preventDefault();
    $(this).closest(".gallery").find(".img-store-register").trigger('click');

});

$("input[type=file]").change(function() {
    var imageFrame = $(this).parent().siblings(0).children(0);
    if (this.files && this.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {

            imageFrame.css('background-image', 'url("' + e.target.result + '")')
        }
        reader.readAsDataURL(this.files[0]);
    }
    if ($("input[name='multipartFile']").val() != "") {
        $(".img-hidden").css("display", "none");
    }
})
function change_alias(alias) {
    var str = alias;
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    return str;
}
$(".btn-createDM").click(function() {

    var DM = $(this).closest("#createCategorymodal").find(".name-category");
    if (/^\s{0,}$/.test(change_alias(DM.val()))) {
        alert("Tên danh mục không để trống");
        return false;
    }
});

$(".btn-updateCategoryModel").click(function() {
    var upDM = $(this).closest("#updateCategorymodal").find(".name-category");
    if (/^\s{0,}$/.test(change_alias(upDM.val()))) {
        alert("Tên danh mục không để trống");
        return false;
    }
});
function updateinfo() {
    fullname = $(".name-shipper").val();
    phone = $(".sdt-shipper").val();
    password = $(".pass-shipper").val();
    CMND = $(".CMND-shipper").val();
    repassword = $(".repass-shipper").val();
    img = $(".img-shipper").val();
}
$(".btn-createShipper").click(function() {
    updateinfo();
    if (!/^([^\s])[a-zA-Z0-9_\s]{1,19}$/.test(change_alias(fullname))) {

        $(".name-shipper").addClass("error-user");
        $(".name-shipper").removeClass("success-user");
        $(".name-shipper").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-user-mess").css("display", "block");
        $(".name-shipper").focus();
        return false;
    }
    else {
        $(".name-shipper").removeClass("error-user");
        $(".name-shipper").addClass("success-user");
        $(".name-shipper").css("box-shadow", "none");
        $(".name-shipper").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-user-mess").css("display", "none");
    }

    if (!(/^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/).test(phone)) {
        $(".sdt-shipper").addClass("error-user");
        $(".sdt-shipper").removeClass("success-user");
        $(".sdt-shipper").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-phone").css("display", "block");
        $(".sdt-shipper").focus();
        return false;
    }
    else {
        $(".sdt-shipper").removeClass("error-user");
        $(".sdt-shipper").addClass("success-user");
        $(".sdt-shipper").css("box-shadow", "none");
        $(".sdt-shipper").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-phone").css("display", "none");
    }
    if (!(/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/).test(password)) {
        $(".pass-shipper").addClass("error-user");
        $(".pass-shipper").removeClass("success-user");
        $(".pass-shipper").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-password").css("display", "block");
        $(".pass-shipper").focus();
        return false;
    }
    else {
        $(".pass-shipper").removeClass("error-user");
        $(".pass-shipper").addClass("success-user");
        $(".pass-shipper").css("box-shadow", "none");
        $(".pass-shipper").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-password").css("display", "none");
    }
    if (repassword != password && repassword != "") {
        $(".repass-shipper").addClass("error-user");
        $(".repass-shipper").removeClass("success-user");
        $(".repass-shipper").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-repassword").css("display", "block");
        return false;
    }
    else {
        $(".repass-shipper").removeClass("error-user");
        $(".repass-shipper").addClass("success-user");
        $(".repass-shipper").css("box-shadow", "none");
        $(".repass-shipper").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-repassword").css("display", "none");
    }
    if (repassword != password && repassword != "") {
        $(".repass-shipper").addClass("error-user");
        $(".repass-shipper").removeClass("success-user");
        $(".repass-shipper").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-repassword").css("display", "block");
        return false;
    }
    else {
        $(".repass-shipper").removeClass("error-user");
        $(".repass-shipper").addClass("success-user");
        $(".repass-shipper").css("box-shadow", "none");
        $(".repass-shipper").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-repassword").css("display", "none");
    }
    if (!/\d{9}$/.test(CMND) || !/\d{12}$/.text(CMND)) {
        $(".CMND-shipper").addClass("error-user");
        $(".CMND-shipper").removeClass("success-user");
        $(".CMND-shipper").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-CMND").css("display", "block");
        return false;
    }
    else {
        $(".CMND-shipper").removeClass("error-user");
        $(".CMND-shipper").addClass("success-user");
        $(".CMND-shipper").css("box-shadow", "none");
        $(".CMND-shipper").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $("error-CMND").css("display", "none");
    }
    if (img == "") {
        $(".error-img").css("display", "block");
        return false;
    }
    else {
        $(".error-img").css("display", "none");
    }
});


$("#btn-coupon").click(function() {

    var name = $("#coupon-name").val();
    var code = $("#coupon").val();
    var text = $("#areacoupon").val();

    if (/^\s{0,}$/.test(change_alias(name))) {
        $("#coupon-name").addClass("error-user");
        $("#coupon-name").removeClass("success-user");
        $("#coupon-name").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-coupon-name").css("display", "block");
        $("#coupon-name").focus();
        return false;
    }
    else {
        $("#coupon-name").removeClass("error-user");
        $("#coupon-name").addClass("success-user");
        $("#coupon-name").css("box-shadow", "none");
        $("#coupon-name").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-coupon-name").css("display", "none");
    }
    if (/^\s{0,}$/.test(change_alias(code))) {
        $("#coupon").addClass("error-user");
        $("#coupon").removeClass("success-user");
        $("#coupon").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-coupon").css("display", "block");
        $("#coupon").focus();
        return false;
    }
    else {
        $("#coupon").removeClass("error-user");
        $("#coupon").addClass("success-user");
        $("#coupon").css("box-shadow", "none");
        $("#coupon").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-coupon").css("display", "none");
    }
    var exp = new Date($(".date-exp").val());
    var now = new Date();
    if (exp.getTime() < now.getTime() || $(".date-exp").val() == "") {

        $(".date-exp").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-date").css("display", "block");
        return false;
    }
    else {

        $(".date-exp").css("box-shadow", "none");
        $(".date-exp").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-date").css("display", "none");
    }


    
        if (($(".pricediscount").val() ==0 && $(".percent-createcoupon").val()==0) ||($(".pricediscount").val() !=0 && $(".percent-createcoupon").val()!=0)) {
        alert("Bạn cần nhập một trong hai: giảm giá theo phần trăm hoặc giảm giá theo giá tiền!!")
        return false;
    }
     if (($(".pricediscount").val() !=0 && $(".max-price").val()!=0)) {
        alert("Giảm giá tối đa chỉ áp dụng cho giảm theo phần trăm!!")
        return false;
    }
    if (/^\s{0,}$/.test(change_alias(text))) {
        $("#areacoupon").addClass("error-user");
        $("#areacoupon").removeClass("success-user");
        $("#areacoupon").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-coupon-text").css("display", "block");
        $("#areacoupon").focus();
        return false;
    }
    else {
        $("#areacoupon").removeClass("error-user");
        $("#areacoupon").addClass("success-user");
        $("#areacoupon").css("box-shadow", "none");
        $("#areacoupon").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-coupon-text").css("display", "none");
    }
    if ($(".img-createcoupon").val() == "") {
        $(".error-imgcreatecoupon").css("display", "block");
        return false;
    }
    else {
        $(".error-imgcreatecoupon").css("display", "none");
    }

});
$(".percent-createcoupon").click(function() {
    if ($(".form-hidden").hasClass("form-maxcoupon")) {
        $(".form-hidden").removeClass("form-maxcoupon");
    }
    else {
        $(".form-hidden").addClass("form-maxcoupon");
    }

});

$(document).on("click",".btn-upcoupon",function() {

    var exps = new Date($("#updateCoupon .date-exps").val());
    var nows = new Date();
    if (exps.getTime() < nows.getTime() || $(".date-exps").val() == "") {
        alert("Ngày hết hạn phải sau thời điểm hiện tại")
        return false;
    }
    


    
        if (($("#updateCoupon .pricediscount").val() ==0 && $("#updateCoupon .percent-createcoupon").val()==0) ||($("#updateCoupon .pricediscount").val() !=0 && $("#updateCoupon .percent-createcoupon").val()!=0)) {
        alert("Bạn cần nhập một trong hai: giảm giá theo phần trăm hoặc giảm giá theo giá tiền!!")
        return false;
    }
     if (($("#updateCoupon .pricediscount").val() !=0 && $("#updateCoupon .max-price").val()!=0)) {
        alert("Giảm giá tối đa chỉ áp dụng cho giảm theo phần trăm!!")
        return false;
    }
    
    if ($("#updateCoupon .img-createcoupon").val() == "") {
        $("#updateCoupon .error-imgcreatecoupon").css("display", "block");
        return false;
    }
    else {
        $("#updateCoupon .error-imgcreatecoupon").css("display", "none");
    }

});
function printDiv() {
    var divContents = document.getElementById("GFG").innerHTML;
    var a = window.open('', '', 'height=500px, width=600px');
    a.document.write('<html><head>');
    a.document.write('<link rel="stylesheet" type="text/css" href="/public/css/sb-admin-2.css" />');
    a.document.write('</head><body>');
    a.document.write(divContents);
    a.document.write('</body></html>');
    a.document.close();
    a.print();
    a.close();
    return  true;
}