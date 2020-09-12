 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
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
<!-- The Modal repost -->
<div class="modal fade" id="repostModal">
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
                        <textarea style="width: 100%" rows="5" class="content-report" name="content"></textarea>
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
<!-- The Modal repost -->
<div class="modal fade" id="repostModal">
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
                        <textarea style="width: 100%" rows="5" class="content-report" name="content"></textarea>
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
<!--Modal like and share-->
<div class="modal fade" id="Modallikeshare" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:40%!important;">
        <div class="modal-content">
            <div class="modal-body">
                <ul class="nav nav-tabs flex-nowrap text-center" role="tablist" >
                    <li role="presentation" class="nav-newfeed" style="width:50%">
                        <a href="#steplike" class="nav-link active" data-toggle="tab" aria-controls="steplike" role="tab" title="Like"><i class="fas fa-heart"></i> Lượt thích<span></span></a>

                    </li>
                    <li role="presentation" class="nav-newfeed" style="width:50%">
                        <a href="#stepshare" class="nav-link" data-toggle="tab" aria-controls="stepshare" role="tab" title="Share"><i class="fas fa-share-alt"></i> Lượt chia sẻ <span></span></a>
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
<!-- Modal error -->
<div class="modal fade" id="Modallikeshare" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:40%!important;">
        <div class="modal-content">
            <div class="modal-body">
                <ul class="nav nav-tabs flex-nowrap text-center" role="tablist" >
                    <li role="presentation" class="nav-newfeed" style="width:50%">
                        <a href="#steplike" class="nav-link active" data-toggle="tab" aria-controls="steplike" role="tab" title="Like"><i class="fas fa-heart"></i> Lượt thích: <span>500</span></a>
                    </li>
                    <li role="presentation" class="nav-newfeed" style="width:50%">
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

                                    <input aria-label="quantity" class="input-qty" min="1" max="999" name="" type="number" value="1" />

                                </p>

                                <p class="price-food">Giá : <span class="price-foodnumber"></span> VNĐ</p>

                                <p class="saleoff-food" style="display:none">Giá khuyến mãi : <span class="saleoff-foodnumber"></span> VNĐ</p>

                                <p class="total-food">Thành tiền : <span class="total-foodnumber"></span> VNĐ</p>
                            </div>

                            <div class="rate-content">
                                <ul class="comments-list first navbar-nav">
                                    <li class="comment nav-newfeed">
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

                                                        <a class="dropdown-newfeed" href="#">Báo cáo</a>
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

                                                                <a class="dropdown-newfeed" href="#">Báo cáo</a>
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

                                                                <a class="dropdown-newfeed" href="#">Báo cáo</a>
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
                <button type="button" class="btn btn-danger shop-newfeed-button">Thêm vào giỏ hàng</button>
            </div>
        </div>
    </div>
</div>
<!--<div class="modal fade" id="sothich" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-sothich">
        <div class="modal-content modal-content-sothich">
            <div class="modal-header" style="background-color: #da484a;color: white;">
                <h4 class="modal-title">Hãy chọn 3 mục bạn yêu thích nhất</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center" >
                        <div class="store-sothich">
                            <image src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" class="img-store" alt=""/>
                            <div>Gà gán</div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" style="background-color: #da484a;color: white;">Save changes</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>-->
<!--Content-->
<div class="container" style="margin-top: 100px">
    <div class="body-hide"></div>
    <div class="row">
        <!-- ORDER -->
        <div class="col-sm-12 col-md-2 ">
            <div id="one" >
                <div id="left-menu">
                    <a href="explorestore"><img class="rounded img-order" src="/public/image/Background/87801571-cartoon-fast-food-unhealthy-burger-sandwich-hamburger-pizza-meal-restaurant-menu-snack-vector-illust.jpg" alt="" />
                        <div class="rounded photo">
                            <div>
                                Khám phá<br/> món ngon
                            </div>
                        </div>
                    </a>
                </div>
                <div id="left-menu" style="margin-top: 20px">
                    <a href="/sametaste"><img class="rounded img-order" src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" alt="" />
                        <div class="rounded photo ">
                            <div>
                                Bạn cùng<br/> khẩu vị
                            </div>
                        </div>
                    </a>
                </div>
                <div id="left-menu" style="margin-top: 20px">
                    <a href="/mystore"><img class="rounded img-order" src="/public/image/Background/street-food-trailer-food-truck-cartoon-vector-19682966.jpg" alt="" />
                        <div class="rounded photo ">

                            Cửa hàng<br/> của tôi

                        </div>
                    </a>
                </div>
                <div id="left-menu" style="margin-top: 20px">
                    <a href="/coupon"><img class="rounded img-order" src="/public/image/Background/sale-tag-icon-flat-cartoon-discount-label-vector-23608810.jpg" alt="" />

                        <div class="rounded photo ">
                            <div>
                                Phiếu ăn<br/>giảm giá
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- STATUS -->
<div class="col-12 col-sm-12 col-md-6 scrollpost">

            <c:if test="${newfeed.active == true}">
                <c:choose>
                    <c:when test="${newfeed.product!=null}">
                        <div class="rounded status">
                            <div class="alignment">
                                <div class="media">
                                    <img src="http://localhost:9032/public/image/${newfeed.restaurant.avatar}" alt="avatar" width="50px" class="rounded-circle avatar" />
                                    <div class="media-body">
                                        <div href="" class="name"><a href="/restaurant/${newfeed.restaurant._id}">${newfeed.restaurant.name}</a><img src="http://localhost:9032/public/image/avatar/${newfeed.images[0]}" class="check" alt="" />
                                        </div>
                                    </div>
                                    <div class="dropleft">
                                        <a href="#" data-toggle="dropdown"><i class="fa fa-ellipsis-h" aria-hidden="true" ></i></a>
                                        <div class="dropdown-menu" >
                                            <a class="dropdown-item btn-updateNewfeed" idUpNewfeed="${newfeed._id}"  data-toggle="modal" data-target="#updatenewfeedModal" href="#">Sửa</a>
                                            <a class="dropdown-item btn-hiddennewfeed" idValue="${newfeed._id}" href="">Xóa</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="font1">

                                    ${newfeed.content}
                                </div>
                                <!--                                <div>
                                                                    <a href="#">CoolCream#</a>
                                                                    <a href="#">sweet#</a>
                                                                    <a href="#">fruit#</a>
                                                                    <a href="#">sweetlane#</a>
                                                                </div>-->
                            </div>
                            <div class="image1">
                                <img src="http://localhost:9032/public/image/${newfeed.images[0]}" class="rounded background" alt="" />
                            </div>
                            <div style="margin-top: 2px;display: flex;">
                                <span style="display: flex;" data-toggle="modal" data-target="#Modallikeshare" class="list-like"><div style="margin-right: 5px;margin-left: 15px;"><i  class="fa fa-heart rounded-circle"  aria-hidden="true" style="color: white; background-color: #da484a;padding: 5px;"></i></div><span class="like-count">${(newfeed.likes).size()}</span></span>
                                <div style="width: 100%;text-align: end; padding-right: 15px;"><a data-target="#collapse${newfeed._id}" data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample"><span style="color: black"><span class="count-comment">${(newfeed.comments).size()} </span>bình luận</span></a><span data-toggle="modal" data-target="#Modallikeshare"></span></div>
                            </div>
                            <hr class="hr-newsfeed"/>
                            <div class="icon2">
                                <div class="subicon1">
                                    <a><i class="fas fa-utensils" data-toggle="modal" data-target="#orderModal" idValue="${newfeed.product}"></i>
                                    </a>
                                    <c:set var="checkLike" value="${true}" />
                                    <c:forEach var="like" items="${newfeed.likes}">
                                        <c:if test="${like==cookie['_id'].getValue()}">
                                            <i class="fab fa-gratipay like-newpost"  aria-hidden="true"></i>
                                            <c:set var="checkLike" value="${false}" />
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${checkLike!=false}">
                                        <i class="fa fa-heart like-newpost"  aria-hidden="true"></i>
                                    </c:if>
                                    <a><i class="fa fa-comment" aria-hidden="true" data-toggle="collapse" data-target="#collapse${newfeed._id}" aria-expanded="false" aria-controls="collapseExample"></i></a>
                                </div>
                            </div>

                            <div class="collapse newfeed" idValue="${newfeed._id}" id="collapse${newfeed._id}">
                                <div class="card card-body">
                                    <div class="post-footer">
                                        <div class="input-group">
                                            <input class="form-control input-comments" placeholder="Viết bình luận" type="text" />
                                            <button class="input-group-addon single-comment">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                        </div>
                                        <ul class="comments-list navbar-nav parrent-comments">
                                            <c:forEach var="comment" items="${newfeed.comments}">
                                                <c:if test="${comment.replyTo==null}">
                                                    <li class="comment nav-newfeed" >
                                                        <a class="pull-left" href="#">
                                                            <img class="avatar " src="http://localhost:9032/public/image/${comment.user.avatar}" alt="avatar " />
                                                        </a>
                                                        <div class="comment-body ">
                                                            <div class="comment-heading ">
                                                                <h4 class="user "><a href="/user-profile/${comment.user._id}">${comment.user.fullname}</a></h4>
                                                                <h5 class="time "></h5>
                                                                <div class="report dropright">
                                                                    <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                                    </a>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-newfeed" href="#">Báo cáo</a>
                                                                    </div>
                                                                </div>
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
                                                                                <h4 class="user "><a href="/user-profile/${subcomment.user._id}">${subcomment.user.fullname}</a></h4>
                                                                                <h5 class="time ">3 minutes ago</h5>
                                                                                <div class="report dropright">
                                                                                    <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                                                    </a>
                                                                                    <div class="dropdown-menu dropdown-menu-right">

                                                                                    </div>
                                                                                </div>
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
                                    <c:choose>
                                        <c:when test="${newfeed.restaurant==null}">
                                            <img src="http://localhost:9032/public/image/${newfeed.user.avatar}" alt="avatar" width="50px" class="rounded-circle avatar" />
                                            <div class="media-body">
                                                <div href="" class="name"><a href="/user-profile/${newfeed.user._id}">${newfeed.user.fullname}</a><img src="http://localhost:9032/public/image/avatar/${newfeed.images[0]}" class="check" alt="" />
                                                </div>

                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="http://localhost:9032/public/image/${newfeed.restaurant.avatar}" alt="avatar" width="50px" class="rounded-circle avatar" />
                                            <div class="media-body">
                                                <div href="" class="name"><a href="/restaurant/${newfeed.restaurant._id}">${newfeed.restaurant.name}</a><img src="http://localhost:9032/public/image/avatar/${newfeed.images[0]}" class="check" alt="" />
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="dropleft">
                                        <a href="#" data-toggle="dropdown"><i class="fa fa-ellipsis-h" aria-hidden="true" ></i></a>
                                        <div class="dropdown-menu" >
                                            <a class="dropdown-item btn-updateNewfeed" idUpNewfeed="${newfeed._id}"  data-toggle="modal" data-target="#updatenewfeedModal" href="#">Sửa</a>
                                            <a class="dropdown-item btn-hiddennewfeed" idValue="${newfeed._id}">Xóa</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="font1">

                                    ${newfeed.content}
                                </div>
                                <!--                                <div>
                                                                    <a href="#">CoolCream#</a>
                                                                    <a href="#">sweet#</a>
                                                                    <a href="#">fruit#</a>
                                                                    <a href="#">sweetlane#</a>
                                                                </div>-->
                            </div>
                            <div class="image1">
                                <img src="http://localhost:9032/public/image/${newfeed.images[0]}" class="rounded background" alt="" />
                            </div>
                            <div style="margin-top: 2px;display: flex;">
                                <span style="display: flex;" data-toggle="modal" data-target="#Modallikeshare" class="list-like"><div style="margin-right: 5px;margin-left: 15px;"><i  class="fa fa-heart rounded-circle"  aria-hidden="true" style="color: white; background-color: #da484a;padding: 5px;"></i></div><span class="like-count">${(newfeed.likes).size()}</span></span>
                                <div style="width: 100%;text-align: end; padding-right: 15px;">
                                    <a data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample"><span style="color: black;"><span class="count-comment">${(newfeed.comments).size()}</span> bình luận</span></a></div>
                            </div>
                            <hr class="hr-newsfeed"/>
                            <div class="icon2">
                                <div class="subicon1">
                                    <c:set var="checkLike2" value="${true}" />
                                    <c:forEach var="like" items="${newfeed.likes}">
                                        <c:if test="${like==cookie['_id'].getValue()}">
                                            <i class="fab fa-gratipay like-newpost"  aria-hidden="true"></i>
                                            <c:set var="checkLike2" value="${false}" />
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${checkLike2!=false}">
                                        <i class="fa fa-heart like-newpost"  aria-hidden="true"></i>
                                    </c:if>
                                    <a><i class="fa fa-comment" aria-hidden="true" data-toggle="collapse" data-target="#collapse${newfeed._id}" aria-expanded="false" aria-controls="collapseExample"></i></a>
                                </div>
                            </div>
                            <div class="collapse newfeed" idValue="${newfeed._id}" id="collapse${newfeed._id}">
                                <div class="card card-body">
                                    <div class="post-footer">
                                        <div class="input-group">
                                            <input class="form-control input-comments" placeholder="Viết bình luận" type="text" />
                                            <button class="input-group-addon single-comment">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                        </div>
                                        <ul class="comments-list navbar-nav parrent-comments">
                                            <c:forEach var="comment" items="${newfeed.comments}">
                                                <c:if test="${comment.replyTo==null}">
                                                    <li class="comment nav-newfeed" >
                                                        <a class="pull-left" href="#">
                                                            <img class="avatar " src="http://localhost:9032/public/image/${comment.user.avatar}" alt="avatar " />
                                                        </a>
                                                        <div class="comment-body ">
                                                            <div class="comment-heading ">
                                                                <h4 class="user "><a href="/user-profile/${comment.user._id}">${comment.user.fullname}</a></h4>
                                                                <h5 class="time "></h5>
                                                                <div class="report dropright">
                                                                    <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                                    </a>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-newfeed" href="#">Báo cáo</a>
                                                                    </div>
                                                                </div>
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
                                                                                <h5 class="time ">3 minutes ago</h5>
                                                                                <div class="report dropright">
                                                                                    <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                                                    </a>
                                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                                        <a class="dropdown-newfeed" href="#">Báo cáo</a>
                                                                                    </div>
                                                                                </div>
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
            <div id="loading" ><image src="/public/image/Background/PlushHappygoluckyGoldenmantledgroundsquirrel-max-1mb.gif" style="width: 50px;"/></div>
        </div>
        <!-- Khuyen mai -->
        <div class="col-md-3">
            <div id="four">
                <div class="header-mission"><h4><i class="fa fa-list-alt" aria-hidden="true"></i> Nhiệm vụ tháng</h4></div>
                <div class="mission">

                    <div class="detail-mission">
                        Đặt 3 món trong hôm nay sẽ được tặng voucher 20.000đ
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%"  aria-valuemin="0" aria-valuemax="100"></div>

                        </div>
                        <div style="text-align: end;">3/4</div>
                    </div>
                    <div class="detail-mission">
                        Đặt 2 món tặng bạn bè sẽ được tặng voucher 200.000đ
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>



                        </div>
                        <div style="text-align: end;">1/2</div>
                    </div>
                    <div class="detail-mission">
                        Đặt 3 món trong hôm nay sẽ được tặng voucher 20.000đ
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>

                        </div>
                        <div style="text-align: end;">3/4</div>
                    </div>
                </div>
                <div class="header-mission"><h4><i class="fa fa-list-alt" aria-hidden="true"></i> Nhiệm vụ ngày</h4></div>
                <div class="mission">

                    <div class="detail-mission">
                        Đặt 3 món trong hôm nay sẽ được tặng voucher 20.000đ
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%"  aria-valuemin="0" aria-valuemax="100"></div>

                        </div>
                        <div style="text-align: end;">3/4</div>
                    </div>
                    <div class="detail-mission">
                        Đặt 2 món tặng bạn bè sẽ được tặng voucher 200.000đ
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>



                        </div>
                        <div style="text-align: end;">1/2</div>
                    </div>
                    <div class="detail-mission">
                        Đặt 3 món trong hôm nay sẽ được tặng voucher 20.000đ
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>


                        </div>
                        <div style="text-align: end;">3/4</div>
                    </div>

                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
