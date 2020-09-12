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
<!-- The Modal repost -->
<div class="modal fade" id="repostModal" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" style="width: 450px;">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Báo cáo quản trị</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="#" enctype="" method="POST">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        <h3>Nội dung</h3>
                        <textarea  style="width: 100%" rows="5" class="content-report" name="content"></textarea>
                        <span class="error error-reports" style="color: red">Báo cáo không được để trống</span>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger submit send-report"  >Gửi</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--Modal Friend-->
<div class="modal" id="see-friends" >
    <div class="modal-dialog" >
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Bạn bè</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body friends-modal-all-user" style="overflow: auto;max-height: 350px">
                <div class="d-flex align-items-md-center justify-content-between" style="margin-bottom: 10px;">
                    <div class="coupon-container d-flex align-items-md-center">
                        <img src="/public/image/avatar/momo.png" class="img-coupon" />
                        <p>Huy Trần</p>
                    </div>
                    <button  class="btn btn-success float-right ">Hủy kết bạn</button>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!--Modal Album-->
<div class="modal" id="see-img" >
    <div class="modal-dialog" style="max-width:60%!important;">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Ảnh</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="overflow: auto;max-height: 350px">
                <div class=" align-items-md-center justify-content-between">
                    <div class="coupon-container row img-modal-all-user">
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

<!-- The Modal order -->
<div class="modal" id="postModal-user-profile">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Bản đồ</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger " data-dismiss="modal" >Chấp nhận</button>
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
                            <img class="rounded img-status" src="/public/image/images new feed/fruity-tingle-ice-cream-cones-121035-1.jpg" alt="" />
                            <div>
                                <h1 class="title-food">Kem trái cây rừng </h1>
                                <div class="rate text-center">
                                    <div class="stars">
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
                                    <div class="text-like">14k lượt thích</div>
                                </div>
                                <p>Với 7 loại trái cây rung ngon thơm ngọt lịm: dâu, táo, cherry, hạnh nhân... Giúp bạn giải tỏa căng thẳng trong những ngày hè đầy áp lực...</p>
                            </div>
                            <div class="rounded box-quantity mx-auto">
                                <p class="form-inline quantity">
                                    Số lượng :

                                    <input aria-label="quantity" class="input-qty" min="1" max="50" name="" type="number" value="1" />

                                </p>

                                <p class="price-food">Giá : <span class="price-foodnumber-through"></span> VNĐ</p>
                                <p class="price-food">Giá khuyến mãi : <span class="price-foodnumber"></span> VNĐ</p>
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
                                                            <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="#">Ẩn bình luận</a>

                                                                <a class="dropdown-item" href="#">Báo cáo</a>
                                                            </div>
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
                                                            <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="#">Ẩn bình luận</a>

                                                                <a class="dropdown-item" href="#">Báo cáo</a>
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

<!--Content-->
<a onclick="topFunction()" id="myBtn" title="Go to top">Top</a>
<div class="container" style="margin-top: 100px">
    <div class="row user-profile">
        <!-- Menu of food -->
        <div class="col-10 col-sm-10 col-md-11">
            <div class="row profile-header">
                <div class="col-md-4 profile-avartar">
                    <div style="margin-top: 30px" class="d-flex">
                        <div class="profile-container-img">
                            <img src="http://localhost:9032/public/image/${user.avatar}" class="rounded-circle img-avartar" alt="" />
                        </div>
                        <div class="profile-name">
                            <div class="text-name">${user.fullname}</div>
                            <div class="text-like">${(user.followers).size()} theo dõi</div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4" style="padding-right: 0 !important;">
                    <div class="profile-intro">
                        <h2 class="text-center ">Giới thiệu: </h2>
                        <p>-<span style="font-weight: bold;">Địa chỉ:</span>  ${user.address}.</p>
                        <p>-<span style="font-weight: bold;">Mô tả bản thân:</span> ${user.description}</p>  
                    </div>
                </div>
                <div class="col-md-2 profile-container-buttons">
                    <c:set var="check" value="${true}" />
                    <c:forEach var="item" items="${user.followers}">
                        <c:if test="${(cookie['_id'].getValue()) == item}">
                            <button id="btn-follow" class="btn btn-primary form-control" idValue="${user._id}">Đang theo dõi</button>  
                            <c:set var="check" value="${false}" />
                        </c:if>
                    </c:forEach>
                    <c:if test="${check==true}">
                        <button id="btn-follow" class="btn btn-primary form-control" idValue="${user._id}"><i class="fas fa-user-circle"></i>Theo dõi</button>         
                    </c:if>
                    <c:set var="check" value="${true}" />
                    <c:forEach var="item" items="${user.friends}">
                        <c:if test="${(cookie['_id'].getValue()) == item.user._id}">
                            <c:choose>
                                <c:when test="${item.status=='accepted'}">
                                    <button id="btn-friends" class="btn btn-success form-control send-request-friend" idValue="${user._id}"><i class="fas fa-users-slash"></i>Hủy bạn</button>
                                </c:when>
                                <c:when test="${item.status=='requested'}">
                                    <button id="btn-friends" class="btn btn-success form-control send-request-friend" idValue="${user._id}"><i class="fas fa-users-slash"></i>Hủy yêu cầu</button>
                                </c:when>
                                <c:when test="${item.status=='pending'}">
                                    <button id="btn-friends" class="btn btn-success form-control send-request-friend" idValue="${user._id}"><i class="fas fa-user-plus"></i>Chấp nhận</button>
                                </c:when>
                            </c:choose>
                            <c:set var="check" value="${false}" />
                        </c:if>
                    </c:forEach>
                    <c:if test="${check==true}">
                        <button id="btn-friends" class="btn btn-success form-control send-request-friend" idValue="${user._id}"><i class="fas fa-user-plus"></i>Kết bạn</button>      
                    </c:if>

                    <button class="btn btn-danger form-control btn-report" isValue="${user._id}" typed="user"  data-toggle="modal" data-target="#repostModal"><i class="fas fa-poll-h" ></i>Báo cáo</button>
                </div>
                <div class="col-md-1 containers-sendmess" style="padding-right: 0 !important;">
                    <button class="btn btn-primary form-control send-large-button" idValue="${user._id}" nameValue="${user.fullname}" avatarValue="${user.avatar}"><i class="far fa-comment"></i><br/>Gửi tin</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 list">
                    <div class="profile-list-img rounded" >
                        <div class="img-list">
                            <h3><i class="fas fa-image"></i>Ảnh</h3>
                            <div class="img-contain row">
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

                        <a href="#" class="img-all-user-id d-flex justify-content-end" style="margin-right: 10px" idValue="${user._id}"   data-toggle="modal" data-target="#see-img" >Xem tất cả</a>

                    </div>
                    <div class="profile-list-friend rounded" >
                        <div class="friend-list">
                            <h3><i class="fas fa-user-friends"></i>Bạn bè </h3>
                            <div class="img-contain row ">
                                <c:forEach  var="item" items="${user.friends}">
                                    <c:if test="${item.status =='accepted'}">
                                        <div class="img-contains col-sm-4">
                                            <image class="rounded" src ="http://localhost:9032/public/image/${item.user.avatar}" />
                                            <a href="/user-profile/${item.user._id}">${item.user.fullname}</a>
                                        </div>
                                    </c:if>

                                </c:forEach>
                            </div>


                        </div>
                        <a href="#" idValue="${user._id}" class="friend-userpage d-flex justify-content-end"  style="margin-right: 10px" data-toggle="modal" data-target="#see-friends">Xem tất cả</a>

                    </div>
                </div>
                <div class="col-md-8" style="padding-top: 10px;">
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
                                                        <a class="dropdown-item btn-report" isValue="${item.restaurant._id}" typed="newfeed" href="#" data-toggle="modal" data-target="#repostModal">Báo cáo</a>
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
                                            <div style="width: 100%;text-align: end; padding-right: 15px;"><a data-toggle="collapse" href="#" data-target="#collapse${item._id}" role="button" aria-expanded="false" aria-controls="collapseExample"><span style="color: black;"><span class="count-comment">${(item.comments).size()}</span> bình luận</span></a>
                                                <!--                                                                                <a href="" data-toggle="modal" data-target="#Modallikeshare" style="color: black;"><span>200 chia sẻ</span></a>-->
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
                                                        <a class="dropdown-item btn-report" isValue="${user._id}" typed="newfeed" href="#" data-toggle="modal" data-target="#repostModal">Báo cáo</a>
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
                                            <div style="width: 100%;text-align: end; padding-right: 15px;"><a data-toggle="collapse" href="#" data-target="#collapse${item._id}" role="button" aria-expanded="false" aria-controls="collapseExample"><span style="color: black;"><span class="count-comment">${(item.comments).size()}</span> bình luận</span></a>
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

        <%@include  file="footer.jsp" %>