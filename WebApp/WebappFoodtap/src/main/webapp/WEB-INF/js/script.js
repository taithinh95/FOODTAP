/* NAVBAR SCRIPTS */
//jQuery to collapse the navbar on scroll
var idUser = $("#idTag").html();
var avatarChatter;
var fullname;
var phone;
var gender;
var address;
var password;
var repassword;
var currentChatterId;
//SOCKETIO receive message chat
var socket = io('http://localhost:9032');
socket.emit("join", $("#idUser").val());
socket.on("sendMessage", function(item) {
    if (item.sender == currentChatterId) {
        var chatBoxvalue = "";
        if (item.sender != idUser) {
            chatBoxvalue += getSenderBox(item);
        }
        else {
            chatBoxvalue += getReceiveBox(item);
        }
        $(".card-body.msg-card-body").append(chatBoxvalue);
        $(".msg_body").append(chatBoxvalue);
        $("#chatbox .img-cont img").attr("src", "http://localhost:9032/public/image/" + avatarChatter);
        $("#chatbox img").attr("src", "http://localhost:9032/public/image/" + avatarChatter);
        $(".img-cont-msg img").attr("src", "http://localhost:9032/public/image/" + avatarChatter);

        try {
            $('.msg-card-body').scrollTop($('.msg-card-body')[0].scrollHeight);
        } catch (e) {
        }
        $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
    } else {
        $(".sign-new-message" + item.sender).css("display", "block");
        if (currentChatterId != item.sender) {
            callAjax("/getOneImg/" + item.sender, "GET", null, function(data) {
                var html = '<div class="messenger" idValue="' + data._id + '">' +
                        '<img src="http://localhost:9032/public/image/' + data.avatar + '" class="messenger-avatar" alt=""/>' +
                        '<div style="width: 245px;">' +
                        '<div class="messenger-name">' + data.fullname + '</div>' +
                        '<p class="messenger-content">' + item.content + '</p>' +
                        '</div>' +
                        '<div class="date-long">' + formatDateLong(item.createdAt) + '</div>' +
                        '</div>';
                var number = parseInt($(".count-cart-message").html()) ? (parseInt($(".count-cart-message").html()) + 1) : 1;
                $(".wrap-message").html(html + $(".wrap-message").html());
                $(".count-cart-message").html(number);
            })
        }
    }


});
//socket request friend
socket.on("friendRequest", function(data) {
    var number;
    if ($(".numberFriendRequest").html() == "") {
        number = 1;
    } else {
        number = parseInt($(".numberFriendRequest").html()) + 1;
    }
    $(".numberFriendRequest").html(number);
    var html = '<div class="messenger h-100">';
    html += '<img src="http://localhost:9032/public/image/' + data.avatar + '" class="messenger-avatar" alt=""/>';
    html += '<div style="width: 350px;">'
    html += '<div class="messenger-name">' + data.fullname + '</div>';
    html += '</div>';
    html += '<div  style="display: flex;">';
    html += '<button class="btn accept-friend" idValue="' + data._id + '" style="margin-right: 10px;height: 35px;">Chấp nhận</button>'
    html += '<button class="btn cancel-friend" idValue ="' + data._id + '" style ="margin-right: 10px;height: 35px;"> Từ chối </button>'
    html += '</div>';
    html += '</div>';
    $(".listRequest").html($(".listRequest").html() + html)
})
//socket on order
socket.on("newOrderRestaurant", function(data) {
    var number;
    if ($(".numberFriendRequest").html() == "") {
        number = 1;
    } else {
        number = parseInt($(".numberFriendRequest").html()) + 1;
    }
    $(".numberNoti").html(number);
    var html =
            '<div class="notification ">' +
            '<img src="http://localhost:9032/public/image/' + data.user.avatar + '" class="messenger-avatar" alt=""/>' +
            '<div style="margin-right: 120px;">' +
            '<div >' + data.user.fullname + '</div>' +
            '<div>' + data.createdAt + '</div>' +
            '<a href="/restaurant/' + data.restaurant._id + '">' +
            '<div class="noti-content">Nhà hàng bạn vừa có đơn hàng mới!</div>' +
            '</a>' +
            '</div>' +
            '<img src="http://localhost:9032/public/image/' + data.restaurant.avatar + '" class="store-avatar" alt=""/>' +
            '</div>';
    $(".notification-content").html(html + $(".notification-content").html());
})
//socket on like 
socket.on("likeNewfeed", function(data) {
    var number;
    if ($(".numberNoti").html() == "") {
        number = 1;
    } else {
        number = parseInt($(".numberNoti").html()) + 1;
    }
    $(".numberNoti").html(number);
    var html = '<div class="notification ">' +
            '<img src="http://localhost:9032/public/image/' + data.avatar + '" class="messenger-avatar" alt=""/>' +
            '<div style="margin-right:160px;">' +
            '<a href="/user-profile/' + data.fromUser + '">' +
            '<div >' + data.fullname + '</div>' +
            '</a>' +
            '<div>' + formatDateLong(data.date) + '</div>' +
            '<div class="noti-content">mới like hình bạn!</div>' +
            '</div>' +
            '<a  href="' + data.link + '">' +
            '<img src="http://localhost:9032/public/image/' + data.toNewfeed.images[0] + '" class="store-avatar" alt=""/>' +
            '</a>' +
            '</div>';

    $(".notification-content").html(html + $(".notification-content").html());


})
function updateinfo() {
    fullname = $("#fullname-register").val();
    phone = $("#phone-register").val();
    gender = $("input[name='gender']:checked").val();
    address = $("#address-register").val();
    password = $("#password-register").val();
    repassword = $("#repassword-register").val();
}

function removeCartItem(event) {
    var buttonClicked = event.target
    buttonClicked.parentElement.parentElement.remove()
    updateCartTotal()
}

function updateCartTotal() {
    var cartItemContainer = document.getElementsByClassName('cart-items')[0]
    var cartRows = cartItemContainer.getElementsByClassName('cart-row')
    var total = 0
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i]
        var priceElement = cartRow.getElementsByClassName('cart-price')[0]
        var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
        var price = priceElement.innerText.toString().replace(",", "");
        price = parseFloat(price.replace('VNĐ', ''));
        price = format2(price, "").replace(".000", "");
        price = price.replace(",", "")
        var quantity = quantityElement.value
        total = total + (price * quantity)

    }
    var priceship = $(".cart-ship-price").html().toString().replace(",", "");
    var cartdiscount = $(".cart-discount").html().toString().replace(",", "");
    var carttotalall = parseFloat(total) + parseFloat(priceship) - parseFloat(cartdiscount);
    totalformat = Math.round(total * 1000);
    var totalformatdisplay = format2(total, '').replace(".000", "");
    carttotalall = format2(carttotalall, '').replace(".000", "");
    document.getElementsByClassName('cart-total-price')[0].innerText = totalformatdisplay;
    $('.cart-total-price-data').val(total);
    document.getElementsByClassName('cart-total-all')[0].innerText = carttotalall;
}
function formatpricecart() {
    var cartItemContainer = document.getElementsByClassName('cart-items')[0]
    var cartRows = cartItemContainer.getElementsByClassName('cart-row')
    var total = 0
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i]
        var priceElement = cartRow.getElementsByClassName('cart-price')[0]
        var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]


        var price = parseFloat(priceElement.innerText.replace('VNĐ', ''));
        price = format2(price, "").replace(".000", "");
        document.getElementsByClassName('cart-page-price')[i].innerText = price + "VNĐ";
    }
}
function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
}

function addItemToCart(title, price, imageSrc) {
    var cartRow = document.createElement('div')
    cartRow.classList.add('cart-row')
    var cartItems = document.getElementsByClassName('cart-items')[0]
    var cartItemNames = cartItems.getElementsByClassName('cart-item-title')
    for (var i = 0; i < cartItemNames.length; i++) {
        if (cartItemNames[i].innerText == title) {
            alert('This item is already added to the cart')
            return
        }
    }


    cartRow.innerHTML = cartRowContents
    cartItems.append(cartRow)
    cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', removeCartItem);
    cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', quantityChanged);
}

function quantityChanged(event) {
    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }
    updateCartTotal()
}

function format2(n, currency) {
    return currency + n.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}
//    cart index
function update() {
    var q = ($(".input-qty").val());
    var tien = $(".price-foodnumber").html().toString();
    var tien_saleoff = $(".saleoff-foodnumber").html().toString();
    tien = tien.replace(",", "");
    if ($(".saleoff-food").css("display") != "none") {
        tien_saleoff = tien_saleoff.replace(",", "");
        var total_sale = q * tien_saleoff;
        var h = format2(total_sale, '').replace(".000", "");
        $(".total-foodnumber").html(h);
    }
    else if ($(".saleoff-food").css("display") == "none") {
        var total1 = q * tien;
        var t = format2(total1, '').replace(".000", "");
        $(".total-foodnumber").html(t);
    }
    ;
}

function quantityChanged1(event) {
    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }
    update()
}
$(".date-long").each(function(x) {
    $(this).html(formatDateLong($(this).html()))

});
$(".date-short").each(function(x) {
    $(this).html(formatDateShort($(this).html()))

});
$(document).ready(function() {
    /*display time*/
    $('input[name=time]').on('change', function(e) {

        if ($('input[name=time]:checked').val() == 2) {
            $(".date-cart").css("display", "block");
        } else {
            $(".date-cart").css("display", "none");
        }
    });

    /*display time*/
    /*display momo*/
    $('input[name=payment]').on('change', function(e) {

        if ($('input[name=payment]:checked').val() == 2) {
            $(".info-pay").css("display", "block");
        } else {
            $(".info-pay").css("display", "none");
        }
    });
    /*display momo*/
    $('#sothich').modal('show');
    $('.store-sothich').click(function() {

        if ($(this).css("border") == "1px solid rgb(33, 37, 41)") {
            $(this).removeClass('store-sothich-fix');
        }
        else {
            $(this).addClass('store-sothich-fix');
        }

    });
    /* validate register*/

    $("#fullname-register").on("keyup", function() {
        updateinfo();
        if (!/^([^\s])[a-zA-Z0-9_\s]{1,19}$/.test(change_alias(fullname))) {

            $("#fullname-register").addClass("error-user");
            $("#fullname-register").removeClass("success-user");
            $("#fullname-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-user-mess").css("display", "block");
            $("#fullname-register").focus();
            return false;
        }
        else {
            $("#fullname-register").removeClass("error-user");
            $("#fullname-register").addClass("success-user");
            $("#fullname-register").css("box-shadow", "none");
            $("#fullname-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-user-mess").css("display", "none");
        }
    });
    $("#phone-register").on("keyup", function() {
        updateinfo();
        if (!(/^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/).test(phone)) {
            $("#phone-register").addClass("error-user");
            $("#phone-register").removeClass("success-user");
            $("#phone-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-phone").css("display", "block");
            $("#phone-register").focus();
            return false;
        }
        else {
            $("#phone-register").removeClass("error-user");
            $("#phone-register").addClass("success-user");
            $("#phone-register").css("box-shadow", "none");
            $("#phone-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-phone").css("display", "none");
        }
    });
    $("#password-register").on("keyup", function() {
        updateinfo();
        if (!(/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/).test(password)) {
            $("#password-register").addClass("error-user");
            $("#password-register").removeClass("success-user");
            $("#password-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-password").css("display", "block");
            $("#password-register").focus();
            return false;
        }
        else {
            $("#password-register").removeClass("error-user");
            $("#password-register").addClass("success-user");
            $("#password-register").css("box-shadow", "none");
            $("#password-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-password").css("display", "none");
        }
    });
    $("#repassword-register").on("keyup", function() {
        updateinfo();
        if (repassword != password && repassword != "") {
            $("#repassword-register").removeClass("success-user");
            $("#repassword-register").addClass("error-user");
            $("#repassword-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-repassword").css("display", "block");
            return false;
        }
        else {
            $("#repassword-register").removeClass("error-user");
            $("#repassword-register").addClass("success-user");
            $("#repassword-register").css("box-shadow", "none");
            $("#repassword-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-repassword").css("display", "none");
        }
    });
    $("#address-register").on("change", function() {
        updateinfo();
        if (/^\s{0,}$/.test(change_alias(address))) {
            $("#address-register").addClass("error-user");
            $("#address-register").removeClass("success-user");
            $("#address-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-address").css("display", "block");
            $("#address-register").focus();
            return false;
        }
        else {
            $("#address-register").removeClass("error-user");
            $("#address-register").addClass("success-user");
            $("#address-register").css("box-shadow", "none");
            $("#address-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-address").css("display", "none");
        }
    });
    $("#btn-register").on("click", function() {
        updateinfo();
        if (!/^([^\s])[a-zA-Z0-9_\s]{1,19}$/.test(change_alias(fullname))) {

            $("#fullname-register").addClass("error-user");
            $("#fullname-register").removeClass("success-user");
            $("#fullname-register").focus(function() {
                $(this).css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            });
            $(".error-user-mess").css("display", "block");
            $("#fullname-register").focus();
            return false;
        }
        else {
            $("#fullname-register").removeClass("error-user");
            $("#fullname-register").addClass("success-user");
            $("#fullname-register").css("box-shadow", "none");
            $("#fullname-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-user-mess").css("display", "none");
        }

        if (!(/^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$/).test(phone)) {
            $("#phone-register").addClass("error-user");
            $("#phone-register").removeClass("success-user");
            $("#phone-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-phone").css("display", "block");
            $("#phone-register").focus();
            return false;
        }
        else {
            $("#phone-register").removeClass("error-user");
            $("#phone-register").addClass("success-user");
            $("#phone-register").css("box-shadow", "none");
            $("#phone-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-phone").css("display", "none");
        }
        if (!(/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/).test(password)) {
            $("#password-register").addClass("error-user");
            $("#password-register").removeClass("success-user");
            $("#password-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-password").css("display", "block");
            $("#password-register").focus();
            return false;
        }
        else {
            $("#password-register").removeClass("error-user");
            $("#password-register").addClass("success-user");
            $("#password-register").css("box-shadow", "none");
            $("#password-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-password").css("display", "none");
        }
        if (repassword != password && repassword != "") {
            $("#repassword-register").addClass("error-user");
            $("#repassword-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-repassword").css("display", "block");
            return false;
        }
        else {
            $("#repassword-register").addClass("success-user");
            $("#repassword-register").css("box-shadow", "none");
            $("#repassword-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-repassword").css("display", "none");
        }
        if (/^\s{0,}$/.test(change_alias(address))) {
            $("#address-register").addClass("error-user");
            $("#address-register").removeClass("success-user");
            $("#address-register").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-address").css("display", "block");
            $("#address-register").focus();
            return false;
        }
        else {
            $("#address-register").removeClass("error-user");
            $("#address-register").addClass("success-user");
            $("#address-register").css("box-shadow", "none");
            $("#address-register").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-address").css("display", "none");
        }
    });

});
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
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
        $(".img-logo").css("opacity", "0.2");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
        $(".img-logo").css("opacity", "1");
    }
});
/* BACK TO TOP BUTTON */
// create the back to top button
//Get the button:
mybutton = document.getElementById("myBtn");
// // When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {
    scrollFunction();
};
//Ajax call function

function callAjax(url, type, data, cb) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        success: cb
    })
}
function formatDateLong(rawDate) {
    var date = new Date(rawDate);
    return date.getHours() + ":" + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ", " + date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
}
function formatDateShort(rawDate) {
    var date = new Date(rawDate);
    return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
}
function getReceiveBox(message) {
    var senderBox = '<div class="msg-time-send">' + formatDateLong(message.createdAt) + '</div>';
    senderBox += '<div class="d-flex justify-content-end mb-4">';
    senderBox += '<div class="msg-cotainer-send">';
    senderBox += message.content;
    senderBox += '<br/>';
    senderBox += '</div>';
    senderBox += '</div>';
    return senderBox;
}

function getSenderBox(message) {
    var date = new Date(message.createdAt);
    var receiveBox = '<div class="msg-time">' + formatDateLong(message.createdAt) + '</div>';
    receiveBox += '<div class="d-flex justify-content-start mb-4">';
    receiveBox += '<div class="img-cont-msg">';
    receiveBox += '<img src="http://localhost:9032/public/image/avatar/' + message.avatar + '" class="rounded-circle user-img-msg" />';
    receiveBox += '</div>';
    receiveBox += '<div class="msg-cotainer">';
    receiveBox += message.content;
    receiveBox += '<br/>';
    receiveBox += '</div>';
    receiveBox += '</div>';
    return receiveBox;
}

function showmess() {
//Click to show conservation
    $(document).on("click", ".contacts-body .contacts li", function() {
        var id = $(this).attr("idValue");
        var chatBoxvalue = "";
        currentChatterId = id;
        $(".send-btn").attr("idValue", id)
        callAjax("/message/" + id, "GET", null, function(data) {
            data.messages.forEach(function(item) {
                if (item.sender == id) {
                    chatBoxvalue += getSenderBox(item);
                }
                else {
                    chatBoxvalue += getReceiveBox(item);
                }
            });
            avatarChatter = data.user.avatar;
            $("#chatbox .user-info span").html(data.user.fullname);
            $("#chatbox .img-cont img").attr("src", "http://localhost:9032/public/image/" + data.user.avatar);
            $(".card-body.msg-card-body").html(chatBoxvalue);
            $("#chatbox img").attr("src", "http://localhost:9032/public/image/" + data.user.avatar);
            $('.msg-card-body').scrollTop($('.msg-card-body')[0].scrollHeight);
        });

    })
}
$(document).ready(function() {
    /*fomart price number*/

    var count = $(".price-foodnumber");
    for (i = 0; i < count.length; i++) {
        console.log(count.get(i).innerHTML);
        $(".price-foodnumber")[i].innerHTML = formatNumber(count.get(i).innerHTML);
    }

    /*chat scroll to bottom*/
    $('.msg-card-body').stop().animate({scrollTop: 99999999});
    var messitem = document.getElementsByClassName("li-item-chat")[0];
    $(messitem).trigger("click", showmess());
    //Send message
    $(".send-btn").click(function() {
        if ($(".type-msg").val()) {
            var message = {
                receiver: $(this).attr("idValue"),
                content: $(".type-msg").val(),
                messageType: "text"
            }
            $("#chatbox .msg-card-body").append(getReceiveBox({content: $(".type-msg").val(), createdAt: Date.now()}))
            callAjax("/message/", "POST", message);
            $('.type-msg').val('');
            $("#chatbox .img-cont img").attr("src", "http://localhost:9032/public/image/" + avatarChatter);
            $('.msg-card-body').scrollTop($('.msg-card-body')[0].scrollHeight);
        }
    })
})

function scrollFunction() {
    if (document.body.scrollTop > 700 || document.documentElement.scrollTop > 700) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}
// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

$(document).ready(function() {
    $(window).scroll(function(event) {
        var pos_body = $('html,body').scrollTop();
        var h = $(window).width();
        if (pos_body > 20 && h > 768) {
            $('#one').addClass("order-fix");
            $('#three').addClass("list-friend-fix");
            $('#four').addClass("mission-fix");
        } else {
            $('#three').removeClass("list-friend-fix");
            $('#one').removeClass("order-fix");
            $('#four').removeClass("mission-fix");
        }
    });
});
// SWIPER
var swiper = new Swiper('.swiper-container', {
    spaceBetween: 30,
    centeredSlides: true,
    // autoplay: {
    //     delay: 2500,
    //     disableOnInteraction: false,
    // },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
});
//CART
$(document).ready(function() {

    formatpricecart();
    updateCartTotal();
    var removeCartItemButtons = document.getElementsByClassName('btn-remove');
    for (var i = 0; i < removeCartItemButtons.length; i++) {
        var button = removeCartItemButtons[i]
        button.addEventListener('click', removeCartItem)
    }
    var quantityInputs = document.getElementsByClassName('cart-quantity-input')
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i]
        input.addEventListener('change', quantityChanged);
    }

    var addToCartButtons = document.getElementsByClassName('shop-item-button')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', function(event) {
            var button = event.target
            var shopItem = button.parentElement.parentElement
            var title = shopItem.getElementsByClassName('title-food')[0].innerText
            var price = shopItem.getElementsByClassName('cart-food')[0].innerText
            var imageSrc = shopItem.getElementsByClassName('img-status')[0].src
            addItemToCart(title, price, imageSrc)
            updateCartTotal()
        });
    }
});
//count cart
$(".input-qty").on('change', quantityChanged1);
//messenger
$(document).ready(function() {
    var messs = document.getElementsByClassName('dropdown-messenger')[0];
    var string_mess = messs.getElementsByClassName('messenger-content');
    for (var i = 0; i < string_mess.length; i++) {
        if (string_mess[i].innerText.length > 36) {
            string_mess[i].innerHTML = string_mess[i].innerText.substr(0, 36) + " ...";
        }
    }
});
//load post

$(window).scroll(function() {
    if ($(this).scrollTop() + $(this).height() - 110 > $(".scrollpost").height()) {
        $(window).stop();
        $("#loading").css("display", "block");
    }
    else {
        $("#loading").css("display", "none");
    }

});
function loadResults() {

}
//Popup chat
$(document).ready(function() {

    var arr = []; // List of users 

    $(document).on('click', '.msg_head', function() {
        var chatbox = $(this).parents().attr("rel");
        $('[rel="' + chatbox + '"] .msg_wrap').slideToggle('slow');
        return false;
    });
    $(document).on('click', '.close', function() {
        currentChatterId = "";
        var chatbox = $(this).parents().parents().attr("rel");
        $('[rel="' + chatbox + '"]').hide();
        arr.splice($.inArray(chatbox, arr), 1);
        displayChatBox();
        return false;
    });
    $(document).on('click', '#sidebar-user-box', function() {
        var userID = $(this).attr("idValue");
        var username = $(this).children().text();
        var avatar = $(this).find("img").attr("src");
        currentChatterId = userID;
        $(".msg_box").css("display", "block")
        $(".msg_head").html(username + '<div class="close">x</div>');
        avatarChatter = avatar.replace("http://localhost:9032/public/image/", "");
        $("#sendBoxButton").attr("idValue", userID);
        callAjax("/message/" + userID, "GET", null, function(data) {
            var chatBoxvalue = "";
            data.messages.forEach(function(item) {
                if (item.sender == userID) {
                    chatBoxvalue += getSenderBox(item);
                }
                else {
                    chatBoxvalue += getReceiveBox(item);
                }
            });
            $(".msg_body").html(chatBoxvalue);
            $(".sign-new-message" + userID).css("display", "none");
            $(".img-cont-msg img").attr("src", "http://localhost:9032/public/image/" + data.user.avatar);
            $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
        });
    });
    $(document).on('keypress', 'textarea[name=msg-input]', function(e) {
        if (e.keyCode === 13 && !e.shiftKey) {
            var msg = $(this).val();
            $(this).val('');
            if (msg.trim().length != 0) {
                var html = getReceiveBox({content: msg, createdAt: Date.now()});
                $(".msg_body").append(html);
                $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
                var message = {
                    receiver: $("#sendBoxButton").attr("idValue"),
                    content: msg,
                    messageType: "text"
                }
                callAjax("/message/", "POST", message, function(data) {

                });
                $('.type-msg').val('');


            }
        }
    });
    function displayChatBox() {
        i = 270; // start position
        j = 350; //next position

        $.each(arr, function(index, value) {
            if (index < 3) {
                $('[rel="' + value + '"]').css("right", i);
                $('[rel="' + value + '"]').show();
                i = i + j;
            } else {
                $('[rel="' + value + '"]').hide();
            }
        });
    }

});
$(document).ready(function() {
    $('.box').find('div.user-box:gt(3)').hide();
//Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        var target = $(e.target);
        if (target.parent().hasClass('disabled')) {
            return false;
        }
    });
    $(".next-step").click(function() {
        var active = $('.nav-tabs li  a.active');
        active.parent().next().find('.nav-link').removeClass('disabled');
        var text = $(".input-namestore").val();
        if (/^\s{0,}$/.test(change_alias(text))) {
            $(".input-namestore").addClass("error-user");
            $(".input-namestore").removeClass("success-user");
            $(".input-namestore").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-namestore").css("display", "block");
            $(".input-namestore").focus();
            return false;
        }
        else {
            $("#update-saleoff").addClass("error-user");
            $("#update-saleoff").removeClass("success-user");
            $(".input-namestore").css("box-shadow", "none");
            $(".input-namestore").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-namestore").css("display", "none");
            nextTab(active);
        }

    });
    $(".prev-step").click(function() {
        var active = $('.nav-tabs li a.active');
        prevTab(active);
    });
    $("#chossefile").click(function(e) {
        e.preventDefault();
        $(this).closest(".gallery").find(".img-store-register").trigger('click');

    });
    $(".choosefile").click(function(e) {
        e.preventDefault();
        $(this).closest(".gallery").find(".img-store-register").trigger('click');

    });
    $("#chossefile-giayphep").click(function(e) {
        e.preventDefault();
        $(".img-giayphep").trigger('click');
    })
    //datepicker
    $(function() {
        $("#datepicker-history").datepicker();
    });
    $(".datepicker-history1").click(function() {
        $("#datepicker-history").datepicker('show');
    })
});
function nextTab(elem) {
    $(elem).parent().next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).parent().prev().find('a[data-toggle="tab"]').click();
}



$(document).ready(function() {
    $('#dtBasicExample').DataTable();
    $('.dataTables_length').addClass('bs-select');
});
$(document).ready(function() {
    $('#dtmenu').DataTable();
    $('.dataTables_length').addClass('bs-select');
});
$(document).ready(function() {
//Online Momo Payment
    $(".btn-order.checkout").click(function() {
        var quantityArray = $(".cart-quantity-input");
        var productArray = $("input[name='product']");
        var payment = $("input[name='payment']:checked").val();
        var products = [];
        for (var i = 0; i < quantityArray.length; i++) {
            products[i] = {
                product: productArray[i].value,
                quantity: Number.parseFloat(quantityArray[i].value)
            }
        }
        var data = {
            address: $("input[name='address']").val(),
            note: $("textarea[name='note']").val(),
            payment: payment,
            amount: Number.parseFloat($(".cart-total-all").html()),
            user: $("input[name='user']").val(),
            products: products,
            fee: Number.parseFloat($(".cart-ship-price").html()),
            discount: Number.parseFloat($(".cart-discount").html()),
            coupon: $("input[name='coupon']").val()
        }
        $.ajax({
            url: "/order/",
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: 'json',
            data: JSON.stringify(data),
            success: function(data) {
                window.location.href = data;
            }
        })
    })

    //binding data to open newfeed
    $(".fa-utensils").click(function() {
        var image = $(this).closest(".status").find(".background");
        var content = $(this).closest(".status").find(".font1");
        var idProduct = $(this).attr("idValue");
        callAjax("/getProduct/" + idProduct, "GET", null, function(data) {
            $(".price-food").css("text-decoration-line", "none");
            $(".saleoff-food").css("display", "none");
            $("#orderModal .img-status").attr("src", image.attr("src"));
            $("#orderModal .title-food").html(data.name);
            $("#orderModal .content-food").html(content.html());
            data.price = (format2(data.price, '')).replace(".000", "");
            $("#orderModal .price-foodnumber").html(data.price);
            if (data.saleoff != null) {
                data.saleoff = (format2(data.saleoff, '')).replace(".000", "");
                $("#orderModal .saleoff-foodnumber").html(data.saleoff);
                $(".price-food").css("text-decoration-line", "line-through");
                $(".saleoff-food").css("display", "block");
                $("#orderModal .total-foodnumber").html(data.saleoff);
            } else {
                $("#orderModal .total-foodnumber").html(data.price);
            }

            $("#orderModal .shop-item-button").attr("idValue", idProduct);
        })

    })
    //binding data to open explorestore-hot
    $(".click-img").click(function() {
        var image = $(this).closest(".col-md-4").find(".order-img");
        var idProduct = $(this).attr("idValue");
        callAjax("/getProduct/" + idProduct, "GET", null, function(data) {
            $(".price-food").css("text-decoration-line", "none");
            $(".saleoff-food").css("display", "none");
            $("#orderModal .img-status").attr("src", image.attr("src"));
            $("#orderModal .title-food").html(data.name);
            data.price = (format2(data.price, '')).replace(".000", "");
            $("#orderModal .price-foodnumber").html(data.price);
            if (data.saleoff != null) {
                data.saleoff = (format2(data.saleoff, '')).replace(".000", "");
                $("#orderModal .saleoff-foodnumber").html(data.saleoff);
                $(".price-food").css("text-decoration-line", "line-through");
                $(".saleoff-food").css("display", "block");
                $("#orderModal .total-foodnumber").html(data.saleoff);
            } else {
                $("#orderModal .total-foodnumber").html(data.price);
            }

            $("#orderModal .shop-item-button").attr("idValue", idProduct);
        })

    })



    //get product to biding to update product modal box
    $(document).on("click", ".updateProduct", function() {
        var idProduct = $(this).attr("idValue");
        $("#updateMenu input[name='categories']").val("");
        var arraystore = [];
        callAjax("/getProduct/" + idProduct, "GET", null, function(data) {
            $("#updateMenu input[name='name']").val(data.name);
            $("#updateMenu input[name='price']").val(data.price);
            $("#updateMenu input[name='saleoff']").val(data.saleoff);
            for (var i = 0; i < data.category.length; i++) {
                arraystore.push(data.category[i].name);
                var namestore = data.category[i].name + ", ";
                $("#updateMenu input[name='categories']").val($("#updateMenu input[name='categories']").val() + namestore);
            }
            $("#updateMenu input[name='id']").val(idProduct);
            $("#updateMenu .image-frame-upload").css("background", "url(http://localhost:9032/public/image/" + data.image + ")");
            $("#updateMenu .image-frame-upload").css("background-size", "cover");
            $("#updateMenu .image-frame-upload").css("background-repeat", "no-repeat");
            namestore = null;
        })

    })
    //Send request friend
    $(".send-request-friend").click(function() {
        var idUser = $(this).attr("idValue");
        if ($(this).find("i").hasClass("fa-user-plus")) {
            callAjax("/requestFriend/" + idUser, "POST", null, function() {

            })
        } else {
            callAjax("/cancelFriend/" + idUser, "POST", null, function() {

            })
        }


    })

    $(document).on("click", ".accept-friend", function() {
        $(this).closest(".messenger").css("display", "none");
        var idUser = $(this).attr("idValue");
        var number;
        if (parseInt($(".numberFriendRequest").html()) == 1) {
            number = "";
        } else {
            number = parseInt($(".numberFriendRequest").html()) - 1;
        }
        $(".numberFriendRequest").html(number);
        callAjax("/acceptFriend/" + idUser, "POST", null, function() {

        })
    })
    $(document).on("click", ".cancel-friend", function() {
        $(this).closest(".messenger").css("display", "none");
        var idUser = $(this).attr("idValue");
        var number;
        if (parseInt($(".numberFriendRequest").html()) == 1) {
            number = "";
        } else {
            number = parseInt($(".numberFriendRequest").html()) - 1;
        }
        $(".numberFriendRequest").html(number);
        callAjax("/cancelFriend/" + idUser, "POST", null, function() {

        })
    })

    //Get product to modalbox to update
    $(".shop-item-button").click(function() {
        var quantity = $("#orderModal .input-qty").val();
        var idProduct = $(this).attr("idValue");
        $("#tempIdProduct").val(idProduct);
        $("#tempQuantityProduct").val(quantity);
        callAjax("/addToCart", "POST", {
            product: idProduct,
            quantity: quantity
        }, function(data) {
            $("#orderModal").modal("hide");
            if (data == "-1") {
                $("#alertModal").modal("show");
            } else {
                $("#myCart span").html(data);
            }
            $("#myCart").css("display", "block");
        })
    })
    $(".send-large-button").click(function() {
        var userID = $(this).attr("idValue");
        var username = $(this).attr("nameValue");
        var avatar = $(this).attr("avatarValue");
        currentChatterId = userID;
        $(".msg_box").css("display", "block")
        $(".msg_head").html(username + '<div class="close">x</div>');
        avatarChatter = avatar.replace("http://localhost:9032/public/image/", "");
        $("#sendBoxButton").attr("idValue", userID);
        callAjax("/message/" + userID, "GET", null, function(data) {
            var chatBoxvalue = "";
            data.messages.forEach(function(item) {
                if (item.sender == userID) {
                    chatBoxvalue += getSenderBox(item);
                }
                else {
                    chatBoxvalue += getReceiveBox(item);
                }
            });
            $(".msg_body").html(chatBoxvalue);
            $(".sign-new-message" + userID).css("display", "none");
            $(".img-cont-msg img").attr("src", "http://localhost:9032/public/image/" + data.user.avatar);
            $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
        });

    })
    //remove cart
    $(".removeCart").click(function() {
        var idProduct = $(this).attr("idValue");
        callAjax("/removeFromCart/" + idProduct, "POST", {
        }, function(data) {
            if (data == "0") {
                $("#myCart").css("display", "none");
            } else {
                $("#myCart span").html(data);
            }
            window.location.href = "/cart"
        })
    })
    //switch cart
    $(".switch-cart").click(function() {
        var quantity = $("#tempQuantityProduct").val();
        var idProduct = $("#tempIdProduct").val();
        var type = $(this).attr("idValue");
        callAjax("/switchCart", "POST", {
            product: idProduct,
            quantity: quantity,
            type: type
        }, function(data) {
            $("#orderModal").modal("hide");
            $("#myCart span").html("1");
            $("#myCart").css("display", "block");
        })


    })
    //Post comment to a newfeed
    $(document).on("click", ".single-comment", function() {
        var content = $(this).closest(".collapse").find(".input-comments").val();
        var newfeed = $(this).closest(".collapse").attr("idValue");
        var collapse = $(this);
        callAjax("/user/comment", "POST", {
            newfeed: newfeed,
            content: content
        }, function(data) {
            var html =
                    '<li class="comment nav-item" >' +
                    '<a class="pull-left" href="#">' +
                    '<img class="avatar " src="http://localhost:9032/public/image/' + data.user.avatar + '" alt="avatar " />' +
                    '</a>' +
                    '<div class="comment-body ">' +
                    '<div class="comment-heading ">' +
                    '<h4 class="user ">' + '<a href="/user-profile/' + data.user._id + '">' + data.user.fullname + '</a>' + '</h4>' +
                    '</div>' +
                    '<p>' + data.content + '<br/>' +
//                    '<a href="#">' + 'Thích ' + '</a>' +
                    '<a href="#" data-toggle="collapse" data-target="#reply' + data._id + '" >Trả lời</a>' +
                    '<div id="reply' + data._id + '" class="collapse" idValue=' + data._id + '>' +
                    '<div class="input-group" style="margin-left: -60px;">' +
                    '<a class="pull-left " href="# ">' +
                    '<img class="avatar" src="http://localhost:9032/public/image/' + data.user.avatar + '" alt="avatar " />' +
                    '</a>' +
                    '<input class="form-control input-comments" placeholder="Phản hồi bình luận" type="text" />' +
                    '<button class="input-group-addon reply-comment">' +
                    '<i class="fa fa-edit">' + '</i>' +
                    '</button>' +
                    '</div>' +
                    '</div>' +
                    '</p>' +
                    '</div>';
            collapse.closest(".collapse").find(".parrent-comments").append(html);
            var number = parseInt(collapse.closest(".status").find(".count-comment").html()) + 1;
            $(".input-comments").val("");
            collapse.closest(".status").find(".count-comment").html(number);
        });
    });
    //reply comment 
    $(document).on("click", ".reply-comment", function() {
        var content = $(this).closest(".collapse").find(".input-comments").val();
        var reply = $(this).closest(".collapse").attr("idValue");
        var newfeed = $(this).closest(".newfeed").attr("idValue");
        var collapse = $(this);
        callAjax("/user/comment", "POST", {
            newfeed: newfeed,
            content: content,
            reply: reply
        }, function(data) {

            var html = '<li class="comment ">' +
                    '<a class="pull-left " href="# ">' +
                    '<img class="avatar " src="http://localhost:9032/public/image/' + data.user.avatar + '" alt="avatar " />' +
                    '</a>' +
                    '<div class="comment-body ">' +
                    '<div class="comment-heading ">' +
                    '<h4 class="user "><a href="/user-profile/' + data.user._id + '">' + data.user.fullname + '</a></h4>' +
                
                    '</div>' +
                    '<p>' + data.content +
                    '<br/>' +
//                    '<a href="#">Thích</a>' +
                    '<div id="reply2" class="collapse">' +
                    '<div class="input-group" style="margin-left: -60px;">' +
                    '<a class="pull-left " href="# ">' +
                    '<img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar " />' +
                    '</a>' +
                    '<input class="form-control input-comments" placeholder="Add a comment" type="text" />' +
                    '<button class="input-group-addon reply-comment">' +
                    '<i class="fa fa-edit">' + '</i>' +
                    '</button>' +
                    '</div>' +
                    '</div>' +
                    '</p>' +
                    '</div>'
            if (collapse.closest(".nav-item").find(".subcomment").html()) {
                html = html + "</li>";
                collapse.closest(".nav-item").find(".subcomment").append(html);
            } else {
                html = '<ul class="comments-list navbar-nav subcomment">' + html + "</ul>"
                collapse.closest(".nav-item").append(html);
            }
            $(".input-comments").val("");
        });
    })
    //Like newfeew
    $(".like-newpost").click(function() {
        var newfeed = $(this).closest(".status").find(".newfeed").attr("idValue");
        var likeNewpost = $(this);
        callAjax("/like/" + newfeed, "POST", null, function(data) {
            var number = parseInt(likeNewpost.closest(".status").find(".like-count").html());
            if (data == "like") {
                likeNewpost.closest(".status").find(".like-count").html(number + 1);
            } else {
                likeNewpost.closest(".status").find(".like-count").html(number - 1);
            }
        })
    })
    //Show list like of a newfeed
    $(".list-like").click(function() {
        var newfeed = $(this).closest(".status").find(".newfeed").attr("idValue");
        callAjax("/newfeed/getListLike/" + newfeed, "GET", null, function(data) {
            var html = "";
            var count = data.length;
            data.forEach(function(item) {

                var content =
                        '<div class="row row-like">' +
                        '<div class="col-md-2">' +
                        '<img src="http://localhost:9032/public/image/' + item.avatar + '" class="rounded-circle img-like" />' +
                        '</div>' +
                        '<div class="col-md-4">' +
                        '<span>' + item.fullname + '</span>' +
                        '</div>' +
                        '<div class="ml-auto p-2 bd-highlight">' +
                        '<button class="btn"><i class="far fa-id-card"></i> <a href="/user-profile/' + item._id + '">Trang cá nhân</a></button>' +
                        '</div>' +
                        '</div>';
                html += content;
            });
            $(".count-like-tap").html(count);
            $("#steplike").html(html);
        })
    })

//Rating order
    $(".btn-send-rating").click(function() {
        var type;
        if ($(this).attr("id") == "rating-order-shipper") {
            type = "shipper";
        } else {
            type = "restaurant";
        }
        var parentForm = $(this).closest("form").closest("form");
        var star = $(this).closest("form").find("input[name='star']:checked").val();
        var content = $(this).closest("form").find("textarea").val();
        var targetId = $(this).attr("targetId");
        var orderId = $(this).attr("orderId");
        if (star) {

            var data = {
                star: star,
                type: type,
                targetId: targetId,
                content: content,
                orderId: orderId
            }
            $.ajax({
                url: "/order/rate",
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                dataType: 'json',
                data: JSON.stringify(data),
                success: function(data) {
                    parentForm.css("display", "none");
                    alert("Thanks for rating");

                }
            })
        }
    })
    //re-cart
    $(".re-cart").click(function(data) {

    })
    //binding data to post food newfeed
    $(".postFoodNewFeed").click(function() {
        var image = $(this).parent().parent().parent().find("img");
        var id = $(this).attr("idValue");
        $("#postModal-food img").attr("src", image.attr("src"));
        $("#postModal-food form").attr("action", "/newfeed/postFoodNewFeed/" + id);
    })
    //Like restaurant
    $("#btn-like").click(function() {
        var data = {
            idValue: $(this).attr("idValue"),
            target: "restaurant"
        }
        $.ajax({
            url: "/user/follow",
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: 'json',
            data: JSON.stringify(data),
            success: function(data) {

            }
        })
    })
    //Follow User
    $("#btn-follow").click(function() {
        var data = {
            idValue: $(this).attr("idValue"),
            target: "user"
        }
        $.ajax({
            url: "/user/follow",
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: 'json',
            data: JSON.stringify(data),
            success: function(data) {

            }
        })
    })
    //call ajax upload image
    $("input[type=file]").change(function() {
        var imageFrame = $(this).parent().siblings(0).children(0);
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                imageFrame.css('background-image', 'url("' + e.target.result + '")')
            }
            reader.readAsDataURL(this.files[0]);
        }
    })


    //auto switch tab bar with # in url
    if (location.hash) {
        $('a[href="' + location.hash + '"]').tab('show');
    }



})
function check_discount(data) {
    if (data.min) {
        if (!data.percent) {
            if (data.min <= $(".cart-total-price").html().replace(",", "")) {
                $(".cart-discount").html(format2(data.discount, '').replace(".000", ""));
                $("input[name='coupon']").val(data._id);
            } else {
                $("#alertModalCart").modal("show");
                $("#alertModalCart .modal-title").html("Thông báo");
                $("#alertModalCart .content").html("Đơn hàng không đủ điều kiện...");
                $("input[name='coupon']").val(null);
                $(".cart-discount").html(0);
            }
        } else {
            if (data.min <= $(".cart-total-price").html().replace(",", "")) {
                var discount = $(".cart-total-price").html().replace(",", "") * data.percent / 100;
                if (discount < data.max) {
                    $(".cart-discount").html(format2(discount, '').replace(".000", ""));
                    $("input[name='coupon']").val(data._id);
                } else {
                    $(".cart-discount").html(format2(data.max, '').replace(".000", ""));
                    $("input[name='coupon']").val(data._id);
                }
            } else {
                $("#alertModalCart").modal("show");
                $("#alertModalCart .modal-title").html("Thông báo");
                $("#alertModalCart .content").html("Đơn hàng không đủ điều kiện...");
                $("input[name='coupon']").val(null);
                $(".cart-discount").html(0);
            }
        }
    }
}
//Check Coupon 
$(".use-coupon").click(function() {
    var data = {
        code: $("input[name='discount']").val(),
        amount: Number.parseFloat($(".cart-total-all").html()),
        restaurant: $("#restaurantId").val()
    }
    $.ajax({
        url: "/coupon/check",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: 'json',
        data: JSON.stringify(data),
        success: function(data) {
            if (data == "not found coupon") {
                $("#alertModalCart").modal("show");
                $("#alertModalCart .modal-title").html("MÃ GIẢM GIÁ");
                $("#alertModalCart .content").html("Mã giảm giá không tồn tại.");
                $("input[name='coupon']").val(null);
                $(".cart-discount").html(0);
                updateCartTotal()
            } else if (data == "not found coupon restaurant") {
                $("#alertModalCart").modal("show");
                $("#alertModalCart .modal-title").html("MÃ GIẢM GIÁ");
                $("#alertModalCart .content").html("Nhà hàng này không áp dụng mã giảm giá bạn nhập.");
                $("input[name='coupon']").val(null);
                $(".cart-discount").html(0);
                updateCartTotal()
            } else if (data == "not found coupon user") {
                $("#alertModalCart").modal("show");
                $("#alertModalCart .modal-title").html("MÃ GIẢM GIÁ");
                $("#alertModalCart .content").html("Ví của bạn không có mã giảm giá này.");
                $("input[name='coupon']").val(null);
                $(".cart-discount").html(0);
                updateCartTotal()
            } else {
                check_discount(data);
                updateCartTotal()
                $(".cart-quantity-input").change(function() {
                    check_discount(data);
                    updateCartTotal();
                })
            }
        }
    });
});

//Search
$(document).ready(function() {
//display like
    $(".like-newpost").on("click", function() {
        if ($(this).hasClass("fa-heart"))
        {
            $(this).removeClass("fa-heart");
            $(this).removeClass("fa");
            $(this).addClass("fab");
            $(this).addClass("fa-gratipay");
        }
        else {

            $(this).removeClass("fa-gratipay");
            $(this).removeClass("fab");
            $(this).addClass("fa");
            $(this).addClass("fa-heart");
        }
    });
//    var debounce = function(func, wait){
//        var timeout;
//
//        return function executedFunction(...args) {
//            var later = function(){
//                timeout = null;
//                func(...args);
//            };
//            clearTimeout(timeout);
//            timeout = setTimeout(later, wait);
//        };
//    };
    $("#dropdownMenuButton").on("keyup", function() {
        var keyword = $(this).val();
        $("#search-all").attr("href", "/search-page/" + keyword);
        $("#search-form").attr("action", "/search-page/" + keyword)
        if (keyword != "") {
            callAjax("/search/" + keyword, "GET", null, function(data) {
                var htmlUser = "";
                data.users.forEach(function(item) {
                    htmlUser += '<a class="dropdown-item" href="/user-profile/' + item._id + '">' +
                            '<img src="http://localhost:9032/public/image/' + item.avatar + '" class="rounded-circle search-avatar" alt=""/>' +
                            item.fullname +
                            '</a>'
                })
                $(".result-search-user").html(htmlUser);

                var htmlRestaurant = "";
                data.restaurants.forEach(function(item) {
                    htmlRestaurant += '<a class="dropdown-item" href="/restaurant/' + item._id + '">' +
                            '<img src="http://localhost:9032/public/image/' + item.avatar + '" class="rounded-circle search-avatar" alt=""/>' +
                            item.name +
                            '</a>'
                })
                $(".result-search-restaurant").html(htmlRestaurant);
                $("#List").css("display", "block");
                var htmlProducts = "";
                data.products.forEach(function(item) {
                    htmlProducts += '<a class="dropdown-item watch-product" idValue=' + item._id + '">' +
                            '<img src="http://localhost:9032/public/image/' + item.image + '" class="rounded-circle search-avatar" alt=""/>' +
                            item.name +
                            '</a>'
                })
                $(".result-search-product").html(htmlProducts);
            })
        } else {
            $("#List").css("display", "none");
        }
    });

    $(".search").on("keyup", function() {
        var keyword = $(this).val();
        callAjax("/searchByFullName/" + keyword, "GET", null, function(data) {
            var html = "";
            data.forEach(function(item) {
                html += '<li class="rounded li-item-chat" idValue="' + item._id + '">' +
                        '<div class="d-flex bd-highlight">' +
                        '<div class="img-cont">' +
                        '<img src="http://localhost:9032/public/image/' + item.avatar + '" class="rounded-circle user-img" />' +
                        '</div>' +
                        '<div class="user-info">' +
                        '<span>' + item.fullname + '</span>' +
                        '</div>' +
                        '</div>' +
                        '</li>';
            })
            $(".contacts").html(html);
        })

    });

    // Get the input field
    var input = document.getElementById("type_msg");
// Execute a function when the user releases a key on the keyboard
    input.addEventListener("keyup", function(event) {
        // Number 13 is the "Enter" key on the keyboard
        if (event.keyCode === 13 && !event.shiftKey) {
            // Cancel the default action, if needed
            event.preventDefault();
            // Trigger the button element with a click
            document.getElementById("send_btn").click();
        }
    });
});
$(".btn_copy").on("click", function() {
    var copyText = $(this).closest(".coupon-chil").find("#coupon").html();
    var textArea = document.createElement("textarea");
    textArea.value = copyText;
    document.body.appendChild(textArea);
    textArea.select();
    document.execCommand("Copy");
    textArea.remove();
    alert("Bạn đã coppy mã " + copyText)
});
$(document).ready(function() {
    document.getElementById("btn-follow").addEventListener("click", ChangButtonFollow);
});
function ChangButtonFollow() {
    var x = document.getElementById("btn-follow");
    if (x.innerHTML === '<i class="fas fa-user-circle"></i>Theo dõi') {
        x.innerHTML = "Đang theo dõi";
    } else {
        x.innerHTML = '<i class="fas fa-user-circle"></i>Theo dõi';
    }
}
$(document).ready(function() {
    document.getElementById("btn-friends").addEventListener("click", ChangButtonFriends);
});
function ChangButtonFriends() {
    var x = document.getElementById("btn-friends");
    if (x.innerHTML === '<i class="fas fa-user-plus"></i>Kết bạn') {
        x.innerHTML = '<i class="fas fa-users-slash"></i> Hủy yêu cầu';
    } else {
        x.innerHTML = '<i class="fas fa-user-plus"></i>Kết bạn';
    }
}

function ChangButtonLike() {
    var x = document.getElementById("btn-like");
    if (x.innerHTML === '<i class="far fa-thumbs-up"></i>Thích') {
        x.innerHTML = '<i class="far fa-thumbs-up"></i>Đã thích';
    } else {
        x.innerHTML = '<i class="far fa-thumbs-up"></i>Thích';
    }
}

$(document).ready(function() {
    document.getElementById("btn-like").addEventListener("click", ChangButtonLike);
});
$(document).ready(function() {

    $("#btn-updateinfostore").on("click", function() {
        var openAt = $("#openAt :selected").val();
        var closeAt = $("#closeAt :selected").val();
        var textupdateinfo = $("#textupdateinfo").val();
        if (!/^\s{0,}$/.test(change_alias(textupdateinfo))) {
            $("#textupdateinfo").removeClass("error-user");
            $("#textupdateinfo").addClass("success-user");
            $("#textupdateinfo").css("box-shadow", "none");
            $("#textupdateinfo").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-textupdateinfo").css("display", "none");
        }
        else {

            $("#textupdateinfo").addClass("error-user");
            $("#textupdateinfo").removeClass("success-user");
            $("#textupdateinfo").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-textupdateinfo").css("display", "block");
            $("#textupdateinfo").focus();
            return false;
        }
        if (openAt != "") {
            $("#openAt").css("box-shadow", "none");
            $("#openAt").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-openAt").css("display", "none");
        }
        else {

            $("#openAt").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-openAt").css("display", "block");
            $("#openAt").focus();
            return false;
        }
        if (closeAt != "") {
            $("#closeAt").css("box-shadow", "none");
            $("#closeAt").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-closeAt").css("display", "none");
        }
        else {

            $("#closeAt").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-closeAt").css("display", "block");
            $("#closeAt").focus();
            return false;
        }
        if (parseInt(closeAt) <= parseInt(openAt)) {
            $("#closeAt").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-closeAt").css("display", "block");
            $("#closeAt").focus();
            return false;
        }
        else
        {
            return true;
        }

    });

    $("input[name='multipartFile']").change(function() {
        if ($("input[name='multipartFile']").val() != "") {
            $(".img-hidden").css("display", "none");
        }
    });
    if ($(".image-frame-upload").css("background") != null) {
        $(".img-hidden").css("display", "none");
    }
});
$(document).ready(function() {
    if ($(".image-frame-upload").css("background") != null) {
        $(".img-hidden").css("display", "none");
    }
    var totalsstatus = parseFloat($(".totals-status").html().toString().replace(",", ""));
    var discountstatus = parseFloat($(".discount-status").html().toString().replace(",", ""));
    var feestatus = parseFloat($(".fee-status").html().toString().replace(",", ""));
    $(".total-status").html(format2(totalsstatus - feestatus + discountstatus, "").replace(".000", ""));
})
function printDiv() {
    var divContents = document.getElementById("GFG").innerHTML;
    var a = window.open('', '', 'height=500px, width=600px');
    a.document.write('<html><head>');
    a.document.write('<link rel="stylesheet" type="text/css" href="/public/css/styte.css" />');
    a.document.write('</head><body>');
    a.document.write(divContents);
    a.document.write('</body></html>');
    a.document.close();
    a.print();
    a.close();
    return  true;
}
$(document).ready(function() {
    if ($(".error-register").html() == "SĐT đã tồn tại") {
        $("#alertModalCart").modal("show");
        $("#alertModalCart .modal-title").html("Thông báo");
        $("#alertModalCart .content").html($(".error-register").html());

        $(".register-tab").trigger("click");

    }
    if ($(".error-pass").html() == "Sai SĐT hoặc mật khẩu") {
        $("#alertModalCart").modal("show");
        $("#alertModalCart .modal-title").html("Thông báo");
        $("#alertModalCart .content").html($(".error-pass").html());


    }

});
var arraystore = [];
var arrayIDstore = [];
$(".dropdown-item-DM").click(function() {
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
$(".img-all-user").click(function() {
    callAjax("/newfeed/getMyNewfeeds", "GET", null, function(data) {

        var html = "";
        data.forEach(function(item) {

            if (item.images[0] != null && item.product == null) {

                var content =
                        '<img src="http://localhost:9032/public/image/' + item.images[0] + '" class="img-user col-sm-3" />';
                html += content;
            }

        });
        $(".img-modal-all").html(html);
    })
});
$(".friends-all-user").click(function() {
    callAjax("/getMyFriends", "GET", null, function(data) {
        var friend = "";
        data.friends.forEach(function(item) {
            if (item.status == "accepted") {
                var content =
                        '<div class="d-flex align-items-md-center justify-content-between" style="margin-bottom:10px;">' +
                        '<div class="coupon-container d-flex align-items-md-center">' +
                        '<img src="http://localhost:9032/public/image/' + item.user.avatar + '" class="img-coupon" />' +
                        '<a href="/user-profile/' + item.user._id + '"><p>' + item.user.fullname + '</p></a>' +
                        '</div>' +
                        '<button  class="btn btn-success float-right ">Hủy kết bạn</button>'
                        + '</div>';
                friend += content;
            }
            ;
        });
        $(".friends-modal-all").html(friend);
    });
});
$(".img-all-user-id").click(function() {
    var imgalluser = $(this).attr("idValue");
    callAjax("/getOneImg/" + imgalluser, "GET", null, function(data) {
        var html = "";
        data.newfeeds.forEach(function(item) {
            if (item.images[0] != null && item.product == null) {
                var content =
                        '<img src="http://localhost:9032/public/image/' + item.images[0] + '" class="img-user col-sm-3" />';
                html += content;

            }
        });
        $(".img-modal-all-user").html(html);
    })

});
$(".friend-userpage").click(function() {
    var friendUser = $(this).attr("idValue");
    callAjax("/getOneImg/" + friendUser, "GET", null, function(data) {
        var friend = "";
        data.friends.forEach(function(item) {
            if (item.status == "accepted") {
                var content =
                        '<div class="d-flex align-items-md-center justify-content-between" style="margin-bottom:10px;">' +
                        '<div class="coupon-container d-flex align-items-md-center">' +
                        '<img src="http://localhost:9032/public/image/' + item.user.avatar + '" class="img-coupon" />' +
                        '<a href="/user-profile/' + item.user._id + '"><p>' + item.user.fullname + '</p></a>' +
                        '</div>' +
                        '<button  class="btn btn-success float-right ">Hủy kết bạn</button>'
                        + '</div>';
                friend += content;
            }
            ;
        });
        $(".friends-modal-all-user").html(friend);
    });
});


//Buttom slideToggle
$(".btn-up").click(function() {
    var m = $('.user-box').toArray();
    for (i = 0; i < m.length; i++) {
        if (m.length > 4) {
            $('.user-box:last').hide();
            $('.user-box:first').show();
        }
    }

});

//Buttom slideToggle
$(".btn-down").click(function() {
    var m = $('.user-box').toArray();
    for (i = 0; i < m.length; i++) {
        if (m.length > 4) {
            $('.user-box:first').hide();
            $('.user-box:last').show();
        }
    }


});
var idReport = "";
var typeReport = "";

$(".btn-report").click(function() {
    idReport = $(this).attr("isValue");
    typeReport = $(this).attr("typed");
});

$(".send-report").click(function() {
    if ($(".content-report").val()) {
        var data = {
            typed: typeReport,
            id: idReport,
            content: $(".content-report").val()
        }
        $.ajax({
            url: "/report",
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: 'json',
            data: JSON.stringify(data),
            success: function(data) {

                alert("Foodtap đã tiếp nhận báo cáo của bạn.");

            }
        })
        $(".content-report").val("");
        $('#repostModal').modal('toggle');

    }

})
$(document).on("click", ".btn-hiddennewfeed", function() {
    var idNewfeed = $(this).attr("idValue");
    callAjax("/newfeed/blockNewfeed/" + idNewfeed, "POST", null, function(data) {
        alert("Bài viết đã được xóa");
        window.location.href = "/myprofile-user";
    })
})
$(".numberNoti").click(function() {
    $(".numberNoti").html("");

});
$(".btn-updateNewfeed").click(function() {
    var idNewfeedup = $(this).attr("idUpNewfeed");
    callAjax("/detail-newfeedAjax/" + idNewfeedup, "GET", null, function(data) {
        data = JSON.parse(data);
        if (data.product != null) {

            $("#updatenewfeedModal .idUpdatenewfeed").val(data._id);
            $("#updatenewfeedModal .content-newfeedupdate").val(data.content);
            $("#updatenewfeedModal .upload-img-status").css("display", "none");

        }
        else {

            $("#updatenewfeedModal .idUpdatenewfeed").val(data._id);
            $("#updatenewfeedModal .content-newfeedupdate").val(data.content);
            $("#updatenewfeedModal .image-frame-upload").css("background", "url('http://localhost:9032/public/image/" + data.images + "')");
            $("#updatenewfeedModal .image-frame-upload").css("background-size", "cover");
            $("#updatenewfeedModal .image-frame-upload").css("background-repeat", "no-repeat");
        }
    })
});


$(".input-comments").on("keypress", function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
         var d =  $(this).closest(".input-group").find(".reply-comment");
        d.click();
    }

});
$(".reply-comment").click(function() {
    var h = $(this).closest(".input-group").find(".input-comments");
    if (/^\s{0,}$/.test(change_alias(h.val())))
    {
        $("#alertModalCart").modal("show");
        $("#alertModalCart .modal-title").html("Thông báo");
        $("#alertModalCart .content").html("Bạn đang spam bình luận!!");
        return false;
    }
});
$(".input-comments").on("keypress", function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
      var c =  $(this).closest(".input-group").find(".single-comment");
        c.click();
    }

});
$(".single-comment").click(function() {
    var h = $(this).closest(".input-group").find(".input-comments");
    if (/^\s{0,}$/.test(change_alias(h.val())))
    {
        $("#alertModalCart").modal("show");
        $("#alertModalCart .modal-title").html("Thông báo");
        $("#alertModalCart .content").html("Bạn đang spam bình luận!!");
        return false;
    }
});
$("#btn-create-food").click(function() {
    var name = $("#name-food").val();
    var h = $(this).closest("#mdMenu").find("#price-food");
    var s = $(this).closest("#mdMenu").find("#price-saleoff");
    if (/^\s{0,}$/.test(change_alias(name))) {
        $("#name-food").addClass("error-user");
        $("#name-food").removeClass("success-user");
        $("#name-food").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-name-food").css("display", "block");
        $("#name-food").focus();
        return false;
    }
    else {
        $("#name-food").removeClass("error-user");
        $("#name-food").addClass("success-user");
        $("#name-food").css("box-shadow", "none");
        $("#name-food").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-name-food").css("display", "none");
    }
    if (h.val() <= 0 || h.val() > 1000000) {
        $("#price-food").addClass("error-user");
        $("#price-food").removeClass("success-user");
        $("#price-food").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-create-price").css("display", "block");
        $("#price-food").focus();
        return false;
    }
    else {
        $("#price-food").removeClass("error-user");
        $("#price-food").addClass("success-user");
        $("#price-food").css("box-shadow", "none");
        $("#price-food").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-create-price").css("display", "none");
    }
    if (s.val() > h.val()) {
        $("#price-saleoff").addClass("error-user");
        $("#price-saleoff").removeClass("success-user");
        $("#price-saleoff").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-saleoff-price").css("display", "block");
        $("#price-saleoff").focus();
        return false;
    }
    else {
        $("#price-saleoff").removeClass("error-user");
        $("#price-saleoff").addClass("success-user");
        $("#price-saleoff").css("box-shadow", "none");
        $("#price-saleoff").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-saleoff-price").css("display", "none");
    }
});
$("#btn-update-food").click(function() {
    var name = $("#name-update-food").val();
    var h = $(this).closest("#updateMenu").find("#price-update-food");
    var s = $(this).closest("#updateMenu").find("#update-saleoff");
    if (/^\s{0,}$/.test(change_alias(name))) {
        $("#name-update-food").addClass("error-user");
        $("#name-update-food").removeClass("success-user");
        $("#name-update-food").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-name-food-update").css("display", "block");
        $("#name-update-food").focus();
        return false;
    }
    else {
        $("#name-update-food").removeClass("error-user");
        $("#name-update-food").addClass("success-user");
        $("#name-update-food").css("box-shadow", "none");
        $("#name-update-food").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-name-food-update").css("display", "none");
    }
    if (h.val() <= 0 || h.val() > 1000000) {
        $("#price-update-food").addClass("error-user");
        $("#price-update-food").removeClass("success-user");
        $("#price-update-food").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-update-price").css("display", "block");
        $("#price-update-price").focus();
        return false;
    }
    else {
        $("#price-update-food").removeClass("error-user");
        $("#price-update-food").addClass("success-user");
        $("#pprice-update-food").css("box-shadow", "none");
        $("#price-update-food").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-update-price").css("display", "none");
    }
    if (s.val() > h.val()) {
        $("#update-saleoff").addClass("error-user");
        $("#update-saleoff").removeClass("success-user");
        $("#update-saleoff").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-saleoff-update").css("display", "block");
        $("#update-saleoff").focus();
        return false;
    }
    else {
        $("#update-saleoff").removeClass("error-user");
        $("#update-saleoff").addClass("success-user");
        $("#update-saleoff").css("box-shadow", "none");
        $("#update-saleoff").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-saleoff-update").css("display", "none");
    }
});
$("#areapost").on("keypress", function(event) {
    if (event.keyCode === 13 && !event.shiftKey) {
        event.preventDefault();
        $("#btn-post").click();
    }

});
$("#btn-post").on("click", function() {
    var area = $("#areapost").val();
    if (/^\s{0,}$/.test(change_alias(area)) && $(".img-store-register").val("")) {
        $("#alertModalCart").modal("show");
        $("#alertModalCart .modal-title").html("Thông báo");
        $("#alertModalCart .content").html("Bạn đang spam bài đăng!!");
        return false;
    }
});
$(".send-report").on("click", function() {
    var text = $(".content-report").val();
    if (/^\s{0,}$/.test(change_alias(text))) {
        $(".content-report").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
        $(".error-reports").css("display", "block");
        $(".content-report").focus();
        return false;
    }
    else {
        $(".content-report").css("box-shadow", "none");
        $(".content-report").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
        $(".error-reports").css("display", "none");
    }
})
$("#repostModal .close").click(function() {
    $(".content-report").val("");
    $(".error-reports").css("display", "none");
    $(".content-report").css("box-shadow", "none");
})

$(".follower").click(function() {
    callAjax("/getMyFriends", "GET", null, function(data) {
        var friend = "";
        data.followers.forEach(function(item) {
            if (item.active == true) {
                var content =
                        '<div class="d-flex align-items-md-center justify-content-between" style="margin-bottom:10px;">' +
                        '<div class="coupon-container d-flex align-items-md-center">' +
                        '<img src="http://localhost:9032/public/image/' + item.avatar + '" class="img-coupon" />' +
                        '<a href="/user-profile/' + item._id + '"><p>' + item.fullname + '</p></a>' +
                        '</div>'
                        + '</div>';
                friend += content;
            }
            ;
        });
        $(".follower-modal-all").html(friend);
    });
});
 $("#btn-change").click(function() {
        var text = $("#user-name").val();
        if (/^\s{0,}$/.test(change_alias(text))) {
            $("#user-name").addClass("error-user");
            $("#user-name").removeClass("success-user");
            $("#user-name").css("box-shadow", "rgb(220, 53, 69) 0px 0px 10px 0.2rem");
            $(".error-username").css("display", "block");
            $("#user-name").focus();
            return false;
        }
        else {
            $("#user-name").removeClass("error-user");
            $("#user-name").addClass("success-user");
            $("#user-name").css("box-shadow", "none");
            $("#user-name").css("box-shadow", "#28a745 0px 0px 10px 0.2rem");
            $(".error-username").css("display", "none");
            nextTab(active);
        }

    });

