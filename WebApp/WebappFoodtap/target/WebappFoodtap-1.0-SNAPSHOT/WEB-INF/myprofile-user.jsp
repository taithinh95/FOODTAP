

<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>

<!-- The Modal spam comment -->
<div class="modal fade" id="alertModalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="width: 30%;">
        <div class="modal-content">
            <input id="tempIdProduct" hidden/>
            <input id="tempQuantityProduct" hidden/>
            <div class="modal-header" style="padding: 0 15px;">
                <h5 class="modal-title" id="exampleModalLongTitle">CHUYỂN CỬA HÀNG KHÁC</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align: center;">
                <div class="content">Các món trong mỗi đơn hàng chỉ có thể đến từ một cửa hàng, bạn có muốn lưu đơn hiện tại và chuyển cửa hàng?</div>
                <div style="margin-top: 25px;">
                    <button type="button" class="btn" data-dismiss="modal" style="color: white;background-color: #da484a;">Chấp nhận</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- The Modal update newfeed -->
<div class="modal fade" id="updatenewfeedModal">
    <div class="modal-dialog modal-dialog-centered" style="width: 450px;">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Cập nhật bài viết</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="/newfeed/updateNewfeed" enctype="multipart/form-data" method="POST">
                <!-- Modal body -->
                <div class="modal-body" style="height: 300px;">
                    <div>
                        <input type="hidden" class="idUpdatenewfeed" name="id" />
                        <h3>Nội dung</h3>
                        <textarea name="content" style="width: 100%" rows="5" class="content-newfeedupdate" name="content"></textarea>
                    </div>
                    <div class="upload-img-status" >
                        <div class="gallery text-center">
                            <a id="chossefile">

                                <div class="image-frame-upload" style="border: 1px solid blue;width: 20%;height: 85px;position: absolute; background-size: cover;background-repeat: no-repeat">
                                    <span class="img-hidden" style="position: absolute;color: #5b6dc8;font-size:100px;opacity: 0.7;left: 5px;bottom:-20px;">+</span>

                                </div>
                            </a>
                            <div class="desc "><input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger submit send-report"  >Gửi</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--Modal Friend-->
<div class="modal" id="see-follower" >
    <div class="modal-dialog" >
        <div class="modal-content" >
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Bạn bè</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body follower-modal-all" style="overflow: auto;max-height: 350px">
                <div class="coupon-container row">
                   
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<!--Modal Friend-->
<div class="modal" id="see-friends" >
    <div class="modal-dialog" >
        <div class="modal-content" >
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Bạn bè</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body friends-modal-all" style="overflow: auto;max-height: 350px">
                <div class="coupon-container d-flex align-items-md-center">
                    <img src="/public/image/avatar/momo.png" class="img-coupon" />
                    <p>Huy Trần</p>
                </div>
                <button  class="btn btn-success float-right ">Hủy kết bạn</button>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
</div>
<!--Modal Album-->
<div class="modal" id="see-img" >
    <div class="modal-dialog" >
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Ảnh</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="overflow-y: auto;max-height: 350px">
                <div class=" align-items-md-center justify-content-between">
                    <div class="coupon-container row img-modal-all">
                    </div>


                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!--Modal coupon-->
<div class="modal" id="couponModal-users" >
    <div class="modal-dialog" style="max-width:40%!important; height: 80%">
        <div class="modal-content" style="height: 100%;">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Ví Coupon</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="overflow: auto;">
                <c:forEach var="c" items="${coupons}">
                    <div class="d-flex align-items-md-center justify-content-between coupon-chil" style="margin-bottom: 10px;">
                        <div class="coupon-container d-flex">
                            <img src="http://localhost:9032/public/image/${c.image}" class="img-coupon" />
                            <p><span id="coupon">${c.code}</span><br/>${c.description}</p>
                        </div>
                        <button  class="btn btn-danger float-right btn_copy">Copy</button>
                    </div>
                </c:forEach>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!--Modal like and don nhap-->
<div class="modal fade" id="Modalheartdraft" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:40%!important;">

        <div class="modal-content">

            <div class="modal-body">
                <ul class="nav nav-tabs flex-nowrap text-center" role="tablist" >
                    <li role="presentation" class="nav-item" style="width:50%">
                        <a href="#stepheart" class="nav-link  active" data-toggle="tab" aria-controls="stepheart" role="tab" title="Yêu Thích"><i class="fas fa-heart"></i> Yêu thích</a>
                    </li>
                    <li role="presentation" class="nav-item" style="width:50%">
                        <a href="#stepdraft" class="nav-link" data-toggle="tab" aria-controls="stepdraft" role="tab" title="Đơn nháp"><i class="far fa-bookmark"></i> Đơn nháp: </a>
                    </li>
                </ul>
                <div class="tab-content py-2 "  style="height: 400px;overflow-y: auto;overflow-x: hidden;padding-right: 10px;">

                    <div class="tab-pane  active" role="tabpanel" id="stepheart" >
                        <div class="row">
                            <div class="col-sm-6" style="padding-right: 10px;border-right:1px solid rgba(100, 100, 100, .4);">
                                <div class="text-center"><h6>Mọi người</h6></div>
                                <c:forEach var="item" items="${user.following.users}">
                                    <div class="row row-like" style="margin-bottom: 10px;">
                                        <div class="col-md-2">
                                            <img src="http://localhost:9032/public/image/${item.avatar}" class=" img-like" />
                                        </div>
                                        <div class="col-md-10">
                                            <a href="/user-profile/${item._id}"><span>${item.fullname}</span></a>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-sm-6">
                                <div class="text-center"><h6>Cửa hàng</h6></div>
                                <c:forEach var="item" items="${user.following.restaurants}">
                                    <div class="row row-like" style="margin-bottom: 10px;">
                                        <div class="col-md-2">
                                            <img src="http://localhost:9032/public/image/${item.avatar}" class=" img-like" />
                                        </div>
                                        <div class="col-md-10">
                                            <a href="/restaurant/${item._id}"><span>${item.name}</span></a>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="stepdraft">
                        <c:forEach var="item" varStatus="status" items="${user.draft}">
                            <div class="row row-like" >
                                <div class="col-md-2">
                                    <img src="http://localhost:9032/public/image/${item[0].product.restaurant.avatar}" class="img-like" />
                                </div>
                                <div class="col-md-4 item-hover">
                                    <div>${item[0].product.restaurant.name}</div>
                                    <span>${item.size()} món</span> 
                                    <div class="tip ">
                                        <div class="row">
                                            <c:forEach var="subitem" items="${item}">
                                                <div class="col">
                                                    <span>${subitem.quantity}</span>x<span>${subitem.product.name}</span>
                                                </div>
                                                <div class="col">
                                                    <span>${subitem.product.price}</span>VNĐ
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="ml-auto p-2 bd-highlight">
                                    <a href="/recart/${status.index}"><button class="btn re-cart">Đặt lại</button></a>
                                </div>


                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Modal like and share-->

<div class="modal fade" id="Modallikeshare" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:40%!important;">
        <div class="modal-content">
            <div class="modal-body">
                <ul class="nav nav-tabs flex-nowrap text-center" role="tablist" >
                    <li role="presentation" class="nav-item" style="width:50%">
                        <a href="#steplike" class="nav-link active" data-toggle="tab" aria-controls="steplike" role="tab" title="Like"><i class="fas fa-heart"></i> Lượt thích: <span>500</span></a>
                    </li>
                    <li role="presentation" class="nav-item" style="width:50%">
                        <a href="#stepshare" class="nav-link" data-toggle="tab" aria-controls="stepshare" role="tab" title="Share"><i class="fas fa-share-alt"></i> Lượt chia sẻ: <span>600</span></a>
                    </li>
                </ul>
                <div class="tab-content py-2 "  style="height: 400px;overflow-y: auto;overflow-x: hidden;padding-right: 10px;">
                    <div class="tab-pane active" role="tabpanel" id="steplike">
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fab fa-facebook-messenger"></i> Nhắn tin</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" role="tabpanel" id="stepshare">
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fab fa-facebook-messenger"></i> Nhắn tin</button>
                            </div>
                        </div>
                        <div class="row row-like">
                            <div class="col-md-2">
                                <img src="/public/image/avatar/momo.png" class="rounded-circle img-like" />
                            </div>
                            <div class="col-md-4">
                                <span>Trường</span>
                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <button class="btn"><i class="fas fa-user-plus"></i> Thêm bạn bè</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- The Modal bản đồ -->

<div class="modal" id="mapModal-users" >
    <div class="modal-dialog" style="width: 450px;">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Bản đồ</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div id="map"></div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Chấp nhận</button>
            </div>
        </div>
    </div>
</div>
<!-- The Modal post -->
<div class="modal" id="postModal-users">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Đăng món</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div></div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" >Chấp nhận</button>
            </div>
        </div>
    </div>
</div>
<!-- The Modal order -->
<div class="modal" id="orderModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Món ăn bạn muốn chọn</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container contain">
                    <div class="row">
                        <div class=" info-product">
                            <img class="rounded img-status"  alt="" />
                            <div>
                                <h1 class="title-food"></h1>
                                <div class="rate text-center">
                                    <!--                                    <div class="stars">
                                                                            <form action="">
                                                                                <input class="star star-5" id="star-5" type="radio" name="star" />
                                                                                <label class="star star-5" for="star-5"></label>
                                                                                <input class="star star-4" id="star-4" type="radio" name="star" />
                                                                                <label class="star star-4" for="star-4"></label>
                                                                                <input class="star star-3" id="star-3" type="radio" name="star" />
                                                                                <label class="star star-3" for="star-3"></label>
                                                                                <input class="star star-2" id="star-2" type="radio" name="star" />
                                                                                <label class="star star-2" for="star-2"></label>
                                                                                <input class="star star-1" id="star-1" type="radio" name="star" />
                                                                                <label class="star star-1" for="star-1"></label>
                                                                            </form>
                                    
                                                                        </div>
                                                                        <div class="text-like">14k lượt thích</div>-->
                                </div>
                                <p class="content-food"></p>
                            </div>
                            <div class="rounded box-quantity mx-auto">
                                <p class="form-inline quantity">
                                    Số lượng :

                                    <input aria-label="quantity" class="input-qty" min="1" max="50" name="" type="number" value="1" />

                                </p>

                                <p class="price-food">Giá : <span class="price-foodnumber"></span> VNĐ</p>

                                <p class="saleoff-food" style="display:none">Giá khuyến mãi : <span class="saleoff-foodnumber"></span> VNĐ</p>

                                <p class="total-food">Thành tiền : <span class="total-foodnumber"></span> VNĐ</p>
                            </div>

                            <div class="rate-content">
                                <ul class="comments-list first navbar-nav">
                                    <li class="comment nav-item">
                                        <a class="pull-left" href="#">
                                            <img class="avatar" src="/public/image/avatar/c29a7d29348b1a3f502803ab9d8355cc.png" alt="avatar" />
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h4 class="user">Gavino Free</h4>
                                                <h5 class="time">5 minutes ago</h5>
                                                <div class="report dropright">
                                                    <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Ẩn bình luận</a>
                                                        <a class="dropdown-item" href="#">Báo cáo</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <p>Mem mem<br/>
                                                <a href="#">Thích</a>

                                            <div id="reply1" class="collapse">
                                                <div class="input-group" style="margin-left: -60px;">
                                                    <a class="pull-left" href="#">
                                                        <img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar" />
                                                    </a>
                                                    <input class="form-control input-comments" placeholder="Add a comment" type="text" />
                                                    <button class="input-group-addon">
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            </p>
                                        </div>
                                        <ul class="comments-list navbar-nav">
                                            <li class="comment">
                                                <a class="pull-left" href="#">
                                                    <img class="avatar" src="/public/image/avatar/Hot-Food-Logo-991x991.jpg" alt="avatar" />
                                                </a>
                                                <div class="comment-body">
                                                    <div class="comment-heading">
                                                        <h4 class="user">Ryan Haywood</h4>
                                                        <h5 class="time">3 minutes ago</h5>
                                                        <div class="report dropright">
                                                          
                                                        </div>
                                                    </div>
                                                    <p>Relax my friend
                                                        <br/>
                                                        <a href="#">Thích</a>

                                                    <div id="reply2" class="collapse">
                                                        <div class="input-group" style="margin-left: -60px;">
                                                            <a class="pull-left" href="#">
                                                                <img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar" />
                                                            </a>
                                                            <input class="form-control input-comments" placeholder="Add a comment" type="text" />
                                                            <button class="input-group-addon">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    </p>
                                                </div>
                                            </li>
                                            <li class="comment">
                                                <a class="pull-left" href="#">
                                                    <img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar" />
                                                </a>
                                                <div class="comment-body">
                                                    <div class="comment-heading">
                                                        <h4 class="user">Gavino Free</h4>
                                                        <h5 class="time">3 minutes ago</h5>
                                                        <div class="report dropright">
                                                           
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <p>Ok, cool. <br/>

                                                        <a href="#">Thích</a>

                                                    <div id="reply3" class="collapse">
                                                        <div class="input-group" style="margin-left: -60px;">
                                                            <a class="pull-left" href="#">
                                                                <img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar" />
                                                            </a>
                                                            <input class="form-control input-comments" placeholder="Add a comment" type="text" />
                                                            <button class="input-group-addon">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger shop-item-button">Thêm vào giỏ hàng</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal footer -->

<!-- Modal history -->
<div class="modal fade" id="history" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #da484a; color: white;">
                <h5 class="modal-title" id="exampleModalLabel">Lịch sử đơn hàng</h5>
                <button type="button" class="close"  data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="overflow-y: scroll;height: 500px">
                <div style="display: flex;">
                    <form class="form-inline" style="width: 60%;">
                        <i class="fas fa-search" aria-hidden="true"></i>
                        <input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Tìm kiếm tên cửa hàng"
                               aria-label="Search">
                    </form>
                    <div style="text-align: end; display: flex;">
                        <input id="datepicker-history" style="width: 245px;"/><button type="button" class="datepicker-history1"><i class="far fa-calendar-alt"></i></button>
                    </div>
                </div>
                <c:forEach  var="item" items="${user.orders}">
                    <div class="history-đonhang">
                        <span class="history-MDH">
                        </span>
                        <span class="receivedday">
                        </span>
                        <div class="history-contain">
                            <img src="http://localhost:9032/public/image/${item.products[0].product.restaurant.avatar}" class="history-avatar" alt=""/>
                            <div>
                                <span class="history-namestore">
                                    ${item.products[0].product.restaurant.name}
                                </span>
                                <div class="history-address">
                                    ${item.products[0].product.restaurant.address}
                                </div>
                                <div style="display: flex;">

                                    <div style="display: flex;">
                                        <div class="history-price">
                                            <span>
                                                ${item.amount}
                                            </span>VNĐ
                                        </div>
                                        <span class="history-item">(${(item.products).size()} món)<span>
                                                </div>
                                                </div>
                                                </div>

                                                </div>
                                                <div class="history-footer">
                                                    <span style="font-size: 17px;font-weight: bold;margin-left: 50px">
                                                        <c:choose>
                                                            <c:when test="${item.status=='completed'}">
                                                                Hoàn thành
                                                            </c:when>
                                                            <c:when test="${item.status=='canceled'}">
                                                                Đã hủy
                                                            </c:when>
                                                            <c:otherwise>
                                                                Đang tiến hành
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>

                                                    <div style="float: right;">
                                                        <c:choose>
                                                            <c:when test="${item.status=='completed' || item.status=='canceled'}">
                                                                <a href="/detail-order/${item._id}" class="btn btn-history">Chi tiết</a>
                                                                <a href="/reorder/${item._id}" class="btn btn-history">Đặt lại</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="/status-order/${item._id}" class="btn btn-history">Chi tiết</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                </div>
                                            </c:forEach>

                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <!--modal history-->

                                            <!--end modal-->
                                            <!--Content-->
                                            <div class="container myprofile-user" style="margin-top: 100px">
                                                <div class="row user-profile ">
                                                    <!-- Menu of food -->
                                                    <div class="col-10 col-sm-10 col-md-11">
                                                        <div class="row profile-header">
                                                            <div class="col-md-4 profile-avartar">
                                                                <div class="d-flex">
                                                                    <div class="profile-container-img ">
                                                                        <img src="http://localhost:9032/public/image/${user.avatar}" class="rounded-circle img-avartar" alt="" />
                                                                    </div>
                                                                    <div class="profile-name">
                                                                        <div class="text-name">${user.fullname}</div>
                                                                        <div class="text-like">${(user.followers).size()} lượt theo dõi</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2" >
                                                                <div>
                                                                    <a href="/mystore" class=" h-100"><img class="rounded img-order-header" src="/public/image/Background/87801571-cartoon-fast-food-unhealthy-burger-sandwich-hamburger-pizza-meal-restaurant-menu-snack-vector-illust.jpg"  alt="" />
                                                                        <div class="rounded photo-header" >
                                                                            <div d-flex justify-content-md-center align-items-md-center h-100>
                                                                                Quản lý<br/> cửa hàng
                                                                            </div>

                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 rounded  " style="padding-left: 0 !important">
                                                                <div class="profile-intro">
                                                                    <h4 class="text-center" style="color:#da484a;">Giới thiệu</h4>
                                                                    <div>-<span style="font-weight: bold;">Mô tả bản thân:</span> ${user.description}</div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-1 profile-container-buttons">
                                                                <button class="btn btn-primary form-control" data-toggle="modal" data-target="#couponModal-users"  ><i class="fas fa-percent"></i>Coupon</button>
                                                                <button class="btn btn-success form-control" data-toggle="modal" data-target="#Modalheartdraft" style="margin-top: 8px"><i class="fas fa-heart"></i>Yêu thích</button>
                                                                <button class="btn btn-danger form-control" data-toggle="modal" data-target="#history" style="margin-top: 8px"><i class="fas fa-history"></i>Lịch sử</button>
                                                            </div>
                                                            <div class="col-md-1 containers-sendmess" style="">
                                                                <a href="/user-info"><button class="btn btn-primary form-control "><i class="fas fa-user-edit"></i><br/>Thông tin</button></a>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 list">
                                                                <div class="profile-list-img rounded" >
                                                                    <div class="img-list">
                                                                        <h3><i class="fas fa-image"></i>Ảnh</h3>
                                                                        <div class="img-contain">
                                                                            <div class="row">
                                                                                <c:set var="count" value="0" scope="page" />
                                                                                <c:forEach var="c" items="${user.newfeeds}">
                                                                                    <c:if test="${c.product == null && c.images[0] != null && count<6}">
                                                                                        <c:set var="count" value="${count+1}" scope="page" />
                                                                                        <div class="img-contains col-md-4">
                                                                                            <image class="rounded" src ="http://localhost:9032/public/image/${c.images[0]}"  />  
                                                                                        </div>

                                                                                    </c:if>

                                                                                </c:forEach>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <a href="#" style="margin-right: 10px" class="d-flex justify-content-end img-all-user"  data-toggle="modal" data-target="#see-img">Xem tất cả</a>
                                                                </div>
                                                                <div class="profile-list-friend rounded" >
                                                                    <div class="friend-list">
                                                                        <h3><i class="fas fa-user-friends"></i>Bạn bè </h3>
                                                                        <div class="img-contain row " >
                                                                            <c:forEach begin="0" end="5" var="item" items="${user.friends}">
                                                                                <c:if test="${item.status =='accepted'}">
                                                                                    <div class="img-contains col-sm-4">
                                                                                        <image class="rounded" src ="http://localhost:9032/public/image/${item.user.avatar}" />
                                                                                        <a href="/user-profile/${item.user._id}">${item.user.fullname}</a>
                                                                                    </div>
                                                                                </c:if>
                                                                            </c:forEach>

                                                                        </div>

                                                                    </div>
                                                                    <a href="#" style="margin-right: 10px" class="d-flex justify-content-end friends-all-user" data-toggle="modal" data-target="#see-friends">Xem tất cả</a>
                                                                </div>
                                                                <div class="profile-list-friend rounded" >
                                                                    <div class="friend-list">
                                                                        <h3><i class="fas fa-user-circle" style="color: #da484a;"></i> Được theo dõi bởi:</h3>
                                                                        <div class="img-contain row ">
                                                                            <c:forEach  var="item" items="${user.followers}">
                                                                                <c:if test="${item.active = true}">
                                                                                    <div class="img-contains col-sm-4">
                                                                                        <image class="rounded" src ="http://localhost:9032/public/image/${item.avatar}" />
                                                                                        <a href="/user-profile/${item._id}">${item.fullname}</a>
                                                                                    </div>
                                                                                </c:if>

                                                                            </c:forEach>
                                                                        </div>


                                                                    </div>
                                                                    <a href="#" idValue="${user._id}" class="follower d-flex justify-content-end"  style="margin-right: 10px" data-toggle="modal" data-target="#see-follower">Xem tất cả</a>

                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="post-store rounded">
                                                                    <form class="row" action="/newfeed/postUserNewfeed" method="POST" enctype="multipart/form-data">
                                                                        <input type="text" name="place"  value="" hidden />
                                                                        <input type="text" name="user" hidden value="${user._id}" />
                                                                        <div class="col-md-8 post-content">
                                                                            <textarea id="areapost" class="rounded" name="content"  cols="30" rows="5" placeholder="Hãy đăng tin mới nhất về bạn đến mọi người"></textarea>
                                                                            <div class="d-flex" style="width: 30%">
                                                                                <!--<image class="rounded" src ="/public/image/images new feed/fruity-tingle-ice-cream-cones-121035-1.jpg" width="80%" height="85px" />-->
                                                                                <div class="upload-img-status" >
                                                                                    <div class="gallery text-center">
                                                                                        <a class="choosefile">

                                                                                            <div class="image-frame-upload" style="border: 1px solid blue;width: 20%;height: 85px;position: absolute; background-size: cover;background-repeat: no-repeat">
                                                                                                <span class="img-hidden" style="position: absolute;color: #5b6dc8;font-size:100px;opacity: 0.7;left: 8px;bottom:-20px;cursor: pointer">+</span>

                                                                                            </div>
                                                                                        </a>
                                                                                        <div class="desc "><input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="row">
                                                                                <!--                                                                                <div class="col-md-6">
                                                                                
                                                                                                                                                                    <label  style="font-size: 10px;width: 100%;margin-top: 2px" for="upload-photo"  class="btn btn-success"><i class="fas fa-image"></i> Ảnh/Video</label>
                                                                                
                                                                                                                                                                    <input type="file"  id="upload-photo"/>
                                                                                                                                                                </div>-->
                                                                                <div class="col-md-6">
                                                                                    <button class="btn btn-success" type="button" style="margin-bottom: -5px;" data-toggle="modal" data-target="#mapModal-users"><i class="fas fa-map-marker-alt"></i> Địa điểm</button>

                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <button type="button" class="btn btn-success" data-target="#postModal-users" data-toggle="modal" style="margin-top: 2px"><i class="fas fa-hamburger"></i> Đăng món</button>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">

                                                                            </div>
                                                                            <hr/>
                                                                            <div>
                                                                                <button id="btn-post" class="btn btn-primary">Đăng</button>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <c:forEach var="item" items="${user.newfeeds}">
                                                                    <c:if test="${item.active == true}">

                                                                        <c:choose>
                                                                            <c:when test="${item.product!=null}">
                                                                                <div class="rounded status">
                                                                                    <div class="alignment">
                                                                                        <div class="media">
                                                                                            <img src="http://localhost:9032/public/image/${user.avatar}" alt="avatar" width="50px" class="rounded-circle avatar" />
                                                                                            <div class="media-body">
                                                                                                <div class="name"> 
                                                                                                    <a href="#">${user.fullname}
                                                                                                        <span style="color:black">►</span> <a href="/restaurant/${item.restaurant._id}">${item.restaurant.name}</a>

                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="dropleft">
                                                                                                <a  data-toggle="dropdown"><i class="fa fa-ellipsis-h" aria-hidden="true" ></i></a>
                                                                                                <div class="dropdown-menu" >
                                                                                                    <a class="dropdown-item btn-updateNewfeed" idUpNewfeed="${item._id}"  data-toggle="modal" data-target="#updatenewfeedModal" href="#">Sửa</a>

                                                                                                    <a class="dropdown-item btn-hiddennewfeed" idValue="${item._id}">Xóa</a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="font1">
                                                                                            ${item.content}
                                                                                        </div>
                                                                                        <!--                                                                            <div>
                                                                                                                                                                        <a href="#">CoolCream#</a>
                                                                                                                                                                        <a href="#">sweet#</a>
                                                                                                                                                                        <a href="#">fruit#</a>
                                                                                                                                                                        <a href="#">s
                                                                                                                                                                            weetlane#</a>
                                                                                                                                                                    </div>-->
                                                                                    </div>
                                                                                    <div class="image1">
                                                                                        <img src="http://localhost:9032/public/image/${item.images[0]}" class="rounded background" alt="" />
                                                                                    </div>
                                                                                    <div style="margin-top: 2px;display: flex;">

                                                                                        <span style="display: flex;" data-toggle="modal" data-target="#Modallikeshare" class="list-like">
                                                                                            <div style="margin-right: 5px;margin-left: 15px;"><i  class="fa fa-heart rounded-circle"  aria-hidden="true" style="color: white; background-color: #da484a;padding: 5px;"></i></div>
                                                                                            <span class="like-count">${(item.likes).size()}</span></span>
                                                                                        <div style="width: 100%;text-align: end; padding-right: 15px;"><a data-toggle="collapse" href="#collapse${item._id}" role="button" aria-expanded="false" aria-controls="collapseExample"><span class="count-comment">${(item.comments).size()} bình luận</span></a>
                                                                                            <!--<a href="" data-toggle="modal" data-target="#Modallikeshare" style="color: black;"><span>200 chia sẻ</span></a>-->

                                                                                        </div>
                                                                                    </div>
                                                                                    <hr class="hr-newsfeed"/>
                                                                                    <div class="subicon1">
                                                                                        <a><i class="fas fa-utensils" data-toggle="modal" data-target="#orderModal" idValue="${item.product}"></i>
                                                                                        </a>
                                                                                        <c:set var="checkLike" value="${true}" />
                                                                                        <c:forEach var="like" items="${item.likes}">
                                                                                            <c:if test="${like==cookie['_id'].getValue()}">
                                                                                                <i class="fab fa-gratipay like-newpost"  aria-hidden="true"></i>
                                                                                                <c:set var="checkLike" value="${false}" />
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                        <c:if test="${checkLike!=false}">
                                                                                            <i class="fa fa-heart like-newpost"  aria-hidden="true"></i>
                                                                                        </c:if>
                                                                                        <a><i class="fa fa-comment" aria-hidden="true" data-toggle="collapse" data-target="#collapse${item._id}" aria-expanded="false" aria-controls="collapseExample"></i></a>
                                                                                    </div>
                                                                                    <div class="collapse newfeed" idValue="${item._id}" id="collapse${item._id}">
                                                                                        <div class="card card-body">
                                                                                            <div class="post-footer">
                                                                                                <div class="input-group">
                                                                                                    <input class="form-control input-comments" placeholder="Viết bình luận" type="text" />
                                                                                                    <button class="input-group-addon single-comment">
                                                                                                        <i class="fa fa-edit"></i>
                                                                                                    </button>
                                                                                                </div>
                                                                                                <ul class="comments-list navbar-nav parrent-comments">
                                                                                                    <c:forEach var="comment" items="${item.comments}">
                                                                                                        <c:if test="${comment.replyTo==null}">
                                                                                                            <li class="comment nav-item" >
                                                                                                                <a class="pull-left" href="#">
                                                                                                                    <img class="avatar " src="http://localhost:9032/public/image/${comment.user.avatar}" alt="avatar " />
                                                                                                                </a>
                                                                                                                <div class="comment-body ">
                                                                                                                    <div class="comment-heading ">
                                                                                                                        <h4 class="user "><a href="/user-profile/${comment.user._id}">${comment.user.fullname}</a></h4>
                                                          
                                                                                                                    </div>
                                                                                                                    <p>${comment.content}<br/>
                                                                                                                        <!--<a href="#">Thích</a>-->                                    
                                                                                                                        <a href="#" data-toggle="collapse" data-target="#reply${comment._id}" >Trả lời</a>
                                                                                                                    <div id="reply${comment._id}" idValue="${comment._id}" class="collapse">
                                                                                                                        <div class="input-group" style="margin-left: -60px;">
                                                                                                                            <a class="pull-left " href="# ">
                                                                                                                                <img class="avatar" src="http://localhost:9032/public/image/${cookie['avatar'].getValue()}" alt="avatar " />
                                                                                                                            </a>
                                                                                                                            <input class="form-control input-comments" placeholder="Phản hồi bình luận" type="text" />
                                                                                                                            <button class="input-group-addon reply-comment">
                                                                                                                                <i class="fa fa-edit"></i>
                                                                                                                            </button>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                                <c:if test="${(comment.reply).size()>0}">
                                                                                                                    <ul class="comments-list navbar-nav subcomment">
                                                                                                                        <c:forEach var="subcomment" items="${comment.reply}">
                                                                                                                            <li class="comment ">
                                                                                                                                <a class="pull-left " href="# ">
                                                                                                                                    <img class="avatar " src="http://localhost:9032/public/image/${subcomment.user.avatar}" alt="avatar " />
                                                                                                                                </a>
                                                                                                                                <div class="comment-body ">
                                                                                                                                    <div class="comment-heading ">
                                                                                                                                        <h4 class="user ">${subcomment.user.fullname}</h4>
                                                                                                                                       
                                                                                                                                    </div>
                                                                                                                                    <p>${subcomment.content}
                                                                                                                                        <br/>
                                                                                                                                        <!--<a href="#">Thích</a>-->
                                                                                                                                    <div id="reply2" class="collapse">
                                                                                                                                        <div class="input-group" style="margin-left: -60px;">
                                                                                                                                            <a class="pull-left " href="# ">
                                                                                                                                                <img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar " />
                                                                                                                                            </a>
                                                                                                                                            <input class="form-control input-comments" placeholder="Add a comment" type="text" />
                                                                                                                                            <button class="input-group-addon">
                                                                                                                                                <i class="fa fa-edit"></i>
                                                                                                                                            </button>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                                                                                    </p>
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                        </c:forEach>
                                                                                                                    </ul>

                                                                                                                </c:if>
                                                                                                            </li>
                                                                                                        </c:if>
                                                                                                    </c:forEach>
                                                                                                </ul>

                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>    
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <div class="rounded status">
                                                                                    <div class="alignment">
                                                                                        <div class="media">
                                                                                            <img src="http://localhost:9032/public/image/${user.avatar}" alt="avatar" width="50px" class="rounded-circle avatar" />
                                                                                            <div class="media-body">
                                                                                                <div class="name"> 
                                                                                                    <a href="#">${user.fullname}

                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="dropleft">
                                                                                                <a  data-toggle="dropdown"><i class="fa fa-ellipsis-h" aria-hidden="true" ></i></a>
                                                                                                <div class="dropdown-menu" >
                                                                                                    <a class="dropdown-item btn-updateNewfeed" idUpNewfeed="${item._id}"  data-toggle="modal" data-target="#updatenewfeedModal" href="#">Sửa</a>
                                                                                                    <a class="dropdown-item btn-hiddennewfeed" idValue="${item._id}">Xóa</a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="font1">
                                                                                            ${item.content}
                                                                                        </div>
                                                                                        <!--                                                                            <div>
                                                                                                                                                                        <a href="#">CoolCream#</a>
                                                                                                                                                                        <a href="#">sweet#</a>
                                                                                                                                                                        <a href="#">fruit#</a>
                                                                                                                                                                        <a href="#">s
                                                                                                                                                                            weetlane#</a>
                                                                                                                                                                    </div>-->
                                                                                    </div>
                                                                                    <div class="image1">
                                                                                        <img src="http://localhost:9032/public/image/${item.images[0]}" class="rounded background" alt="" />
                                                                                    </div>
                                                                                    <div style="margin-top: 2px;display: flex;">
                                                                                        <span style="display: flex;" data-toggle="modal" data-target="#Modallikeshare" class="list-like"><div style="margin-right: 5px;margin-left: 15px;"><i  class="fa fa-heart rounded-circle"  aria-hidden="true" style="color: white; background-color: #da484a;padding: 5px;"></i></div><span class="like-count">${(item.likes).size()}</span></span>
                                                                                        <div style="width: 100%;text-align: end; padding-right: 15px;"><a data-toggle="collapse" data-target="#collapse${item._id}" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample"><span style="color: black;"><span class="count-comment">${(item.comments).size()}</span> bình luận</span></a>
                                                                                            <!--                                                                                <a href="" data-toggle="modal" data-target="#Modallikeshare" style="color: black;"><span>200 chia sẻ</span></a>-->
                                                                                        </div>
                                                                                    </div>
                                                                                    <hr class="hr-newsfeed"/>
                                                                                    <div class="icon2">
                                                                                        <div class="subicon1">
                                                                                            <c:set var="checkLike2" value="${true}" />
                                                                                            <c:forEach var="like" items="${item.likes}">
                                                                                                <c:if test="${like==cookie['_id'].getValue()}">
                                                                                                    <i class="fab fa-gratipay like-newpost"  aria-hidden="true"></i>
                                                                                                    <c:set var="checkLike2" value="${false}" />
                                                                                                </c:if>
                                                                                            </c:forEach>
                                                                                            <c:if test="${checkLike2!=false}">
                                                                                                <i class="fa fa-heart like-newpost"  aria-hidden="true"></i>
                                                                                            </c:if>
                                                                                            <a><i class="fa fa-comment" aria-hidden="true" data-toggle="collapse" data-target="#collapse${item._id}" aria-expanded="false" aria-controls="collapseExample"></i></a>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="collapse newfeed" idValue="${item._id}" id="collapse${item._id}">
                                                                                        <div class="card card-body">
                                                                                            <div class="post-footer">
                                                                                                <div class="input-group">
                                                                                                    <input class="form-control input-comments" placeholder="Viết bình luận" type="text" />
                                                                                                    <button class="input-group-addon single-comment">
                                                                                                        <i class="fa fa-edit"></i>
                                                                                                    </button>
                                                                                                </div>
                                                                                                <ul class="comments-list navbar-nav parrent-comments">
                                                                                                    <c:forEach var="comment" items="${item.comments}">
                                                                                                        <c:if test="${comment.replyTo==null}">
                                                                                                            <li class="comment nav-item" >
                                                                                                                <a class="pull-left" href="#">  
                                                                                                                    <img class="avatar " src="http://localhost:9032/public/image/${comment.user.avatar}" alt="avatar " />
                                                                                                                </a>
                                                                                                                <div class="comment-body ">
                                                                                                                    <div class="comment-heading ">
                                                                                                                        <h4 class="user "><a href="/user-profile/${comment.user._id}">${comment.user.fullname}</a></h4>
                                                                               
                                                                                                                    </div>
                                                                                                                    <p>${comment.content}<br/>
                                                                                                                        <!--<a href="#">Thích</a>-->                                    
                                                                                                                        <a href="#" data-toggle="collapse" data-target="#reply${comment._id}" >Trả lời</a>
                                                                                                                    <div id="reply${comment._id}" idValue="${comment._id}" class="collapse">
                                                                                                                        <div class="input-group" style="margin-left: -60px;">
                                                                                                                            <a class="pull-left " href="# ">
                                                                                                                                <img class="avatar" src="http://localhost:9032/public/image/${cookie['avatar'].getValue()}" alt="avatar " />
                                                                                                                            </a>
                                                                                                                            <input class="form-control input-comments" placeholder="Phản hồi bình luận" type="text" />
                                                                                                                            <button class="input-group-addon reply-comment">
                                                                                                                                <i class="fa fa-edit"></i>
                                                                                                                            </button>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                                <c:if test="${(comment.reply).size()>0}">
                                                                                                                    <ul class="comments-list navbar-nav subcomment">
                                                                                                                        <c:forEach var="subcomment" items="${comment.reply}">
                                                                                                                            <li class="comment ">
                                                                                                                                <a class="pull-left " href="# ">
                                                                                                                                    <img class="avatar " src="http://localhost:9032/public/image/${subcomment.user.avatar}" alt="avatar " />
                                                                                                                                </a>
                                                                                                                                <div class="comment-body ">
                                                                                                                                    <div class="comment-heading ">
                                                                                                                                        <h4 class="user ">${subcomment.user.fullname}</h4>
                                                                        
                                                                                                                                    </div>
                                                                                                                                    <p>${subcomment.content}
                                                                                                                                        <br/>
                                                                                                                                        <!--<a href="#">Thích</a>-->
                                                                                                                                    <div id="reply2" class="collapse">
                                                                                                                                        <div class="input-group" style="margin-left: -60px;">
                                                                                                                                            <a class="pull-left " href="# ">
                                                                                                                                                <img class="avatar" src="/public/image/avatar/chinese-food-logo-design_139869-105.jpg" alt="avatar " />
                                                                                                                                            </a>
                                                                                                                                            <input class="form-control input-comments" placeholder="Add a comment" type="text" />
                                                                                                                                            <button class="input-group-addon">
                                                                                                                                                <i class="fa fa-edit"></i>
                                                                                                                                            </button>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                                                                                    </p>
                                                                                                                                </div>
                                                                                                                            </li>
                                                                                                                        </c:forEach>
                                                                                                                    </ul>

                                                                                                                </c:if>
                                                                                                            </li>
                                                                                                        </c:if>
                                                                                                    </c:forEach>
                                                                                                </ul>

                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <script async defered>
                                                        goongjs.accessToken = 'uBkpjHKnrHMDwTJr5qytXfcNRtrp6Fp4o8pgM3ur';
                                                        var map = new goongjs.Map({
                                                            container: 'map', // container id
                                                            style: 'https://tiles.goong.io/assets/goong_map_web.json', // stylesheet location
                                                            center: [106.695833, 10.776111], // starting position [lng, lat]
                                                            zoom: 9 // starting zoom
                                                        });

                                                        var geocoder = new GoongGeocoder({
                                                            accessToken: "gZa0FdCRbfdaQ8xZvcroe7dCLcqly5dTwCDz6muj",
                                                            goongjs: goongjs
                                                        })

                                                        var geolocateControl = new goongjs.GeolocateControl({
                                                            positionOptions: {
                                                                enableHighAccuracy: true
                                                            },
                                                            trackUserLocation: true
                                                        })

                                                        map.addControl(new goongjs.FullscreenControl());

                                                        map.on('load', function() {
                                                            map.addSource('single-point', {
                                                                type: 'geojson',
                                                                data: {
                                                                    type: 'FeatureCollection',
                                                                    features: []
                                                                }
                                                            });
                                                            map.addControl(
                                                                    geocoder
                                                                    )
                                                            map.addControl(
                                                                    geolocateControl
                                                                    );
                                                            map.addLayer({
                                                                id: 'point',
                                                                source: 'single-point',
                                                                type: 'circle',
                                                                paint: {
                                                                    'circle-radius': 10,
                                                                    'circle-color': '#448ee4'
                                                                }
                                                            });
                                                        });

                                                        var marker = new goongjs.Marker({
                                                            draggable: true
                                                        })
                                                                .setLngLat([105, 21])
                                                                .addTo(map);

                                                        marker.on('dragend', function() {

                                                            var lngLat = marker.getLngLat();
                                                            fetch('https://rsapi.goong.io/Geocode?latlng=' + lngLat.lat + ',' + lngLat.lng + '&api_key=gZa0FdCRbfdaQ8xZvcroe7dCLcqly5dTwCDz6muj&limit=1')
                                                                    .then(function(response) {
                                                                        return response.json()
                                                                    })
                                                                    .then(function(data) {
                                                                        $("input[name='place']").val(data.results[0].formatted_address);
                                                                    });
                                                        });
                                                        geolocateControl.on("geolocate", function(e) {
                                                            var lng = e.coords.longitude;
                                                            var lat = e.coords.latitude;
                                                            marker._lngLat = {lat: lat, lng: lng}
                                                            fetch('https://rsapi.goong.io/Geocode?latlng=' + lat + ',' + lng + '&api_key=gZa0FdCRbfdaQ8xZvcroe7dCLcqly5dTwCDz6muj', {mode: "cors"})
                                                                    .then(function(response) {
                                                                        return response.json()
                                                                    })
                                                                    .then(function(data) {
                                                                        $("input[name='place']").val(data.results[0].formatted_address);
                                                                    });
                                                        })
                                                        geocoder.on("result", function(e) {
                                                            geocoder.mapMarker.remove();
                                                            marker._lngLat = geocoder.mapMarker._lngLat;
                                                            $("input[name='place']").val(e.result.description);
                                                        })
                                                        $(".btn-location").click(function() {
                                                            $(".goongjs-ctrl-fullscreen").trigger("click");
                                                        })
                                                        $("#mapModel .modal-footer button").click(function() {
                                                            $("#mapModel").modal("hide");
                                                        })
                                                        $(".close").click(function() {
                                                            $("input[name='place']").val("");
                                                            $("#mapModel").modal("hide");
                                                        })
                                                    </script>
                                                    <%@include  file="footer.jsp" %>