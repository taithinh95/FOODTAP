
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<!-<!-- The Modal order -->
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
<!-- The Modal -->
<div class="modal" id="mapModel-profile">
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
                <button type="button" class="btn btn-danger" data-dismiss="modal">Chấp nhận</button>
            </div>

        </div>
    </div>
</div>
<!-- The Modal post-->
<div class="modal" id="postModal-profile">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Đăng món</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Chấp nhận</button>
            </div>

        </div>
    </div>
</div>
<a onclick="topFunction()" id="myBtn" title="Go to top">Top</a>
<!--Content-->
<div class="container profile" style="margin-top: 100px">
    <div class="row">
        <!-- Menu of food -->
        <div class="col-10 col-sm-10 col-md-11">
            <div class="row profile-header">
                <div class="col-md-4 profile-avartar">
                    <div class="d-flex">
                        <div class="profile-container-img">
                            <img src="http://localhost:9032/public/image/${restaurant.avatar}" class="rounded-circle img-avartar" alt=""  />
                        </div>
                        <div class="profile-name">
                            <div class="text-name">${restaurant.name} 
                                <c:if test="${restaurant.verified == true}">
                                    <img src="/public/image/Background/Tick_Mark_Dark-512.webp" width="20px" />
                                </c:if>
                            </div>
                            <div class="text-like">${(restaurant.followers).size()} lượt thích</div>
                            <div class="stars">
                                <div class="text-center">
                                    <c:set var="totalRating" value="${0}" />
                                    <c:set var="countRating" value="${0}" />
                                    <c:forEach items="${restaurant.rating}" var="item">
                                        <c:set var="totalRating" value="${totalRating+item.stars}" />
                                        <c:set var="countRating" value="${countRating+1}" />

                                    </c:forEach>
                                    <c:set var="TB" value="${totalRating/countRating}"/>

                                    <c:choose>
                                        <c:when test="${totalRating==0}">
                                            <div>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>

                                            </div>
                                        </c:when>
                                        <c:when test="${TB < 5 && TB>=4.5}">
                                            <div>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>

                                            </div>
                                        </c:when>
                                        <c:when test="${TB < 4.5 && TB>=3.5}">
                                            <div>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                            </div>
                                        </c:when>
                                        <c:when test="${TB < 3.5 && TB>=2.5}">
                                            <div>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                            </div>
                                        </c:when>
                                        <c:when test="${TB < 2.5 && TB >=1.5}">
                                            <div>
                                                <span class="fa fa-star checked-rating"></span>
                                                <span class="fa fa-star checked-rating"></span>
                                            </div>
                                        </c:when>

                                        <c:otherwise>
                                            <div>
                                                <span class="fa fa-star checked-rating"></span>

                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <a href="/restaurant/${restaurant._id}"><img class="rounded img-order-header" src="/public/image/Background/87801571-cartoon-fast-food-unhealthy-burger-sandwich-hamburger-pizza-meal-restaurant-menu-snack-vector-illust.jpg" alt="" />
                            <div class="rounded photo-header">
                                <div>
                                    Quay lại <br/>bài viết
                                </div>

                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-2 profile-container-button">
                    <button class="btn btn-primary form-control"><i class="far fa-thumbs-up"></i>Thích</button>
                    <button class="btn btn-success form-control"><i class="fas fa-user-circle"></i>Giới thiệu</button>
                    <button class="btn btn-danger form-control"><i class="fas fa-poll-h"></i> Báo cáo</button>
                </div>
                <div class="col-md-2 container-sendmess" style="padding-right: 0 !important;">
                    <button class="btn btn-primary "><i class="far fa-comment"></i><br/>Gửi tin</button>
                </div>
            </div>

            <div class="profile-menu">
                <div class="col-md-1">Danh mục sản phẩm</div>
                <div class="col-md-11" style="padding-right: 0 !important;">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="profile-menu-row">
                                    <c:forEach var="item" items="${restaurant.category}">
                                        <c:if test="${item!= null}">
                                            <div class="col-md-3">
                                                <a href="#"><img class="rounded " src="http://localhost:9032/public/image/${item.image}" alt="" />
                                                    <div class="rounded photo">
                                                        <div>
                                                            ${item.name}
                                                        </div>

                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                </div>

                            </div>
                            <div class="swiper-slide">
                                <div class="profile-menu-row">
                                    <div class="profile-menu-row1">
                                        <c:forEach var="item" begin="8" end="11" items="${restaurant.menus}">
                                            <c:forEach var="c" items="${item.category}">

                                                <div class="col-md-3">
                                                    <a href="#"><img class="rounded " src="http://localhost:9032/public/image/${c.image}" alt="" />
                                                        <div class="rounded photo">
                                                            <div>
                                                                ${c.name}
                                                            </div>

                                                        </div>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="profile-menu-row1">

                                    <c:forEach var="item" begin="11" end="14" items="${restaurant.menus}">
                                        <c:forEach var="c" items="${item.category}">

                                            <div class="col-md-3">
                                                <a href="#"><img class="rounded " src="http://localhost:9032/public/image/${c.image}"    alt="" />
                                                    <div class="rounded photo">
                                                        <div>
                                                            ${c.name}
                                                        </div>

                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>

                </div>
            </div>
            <div class="profile-text-hot">
                Hot nhất
            </div>
            <div class="profile-menu-hot row">
                <c:forEach items="${restaurant.menus}" begin="0" end="5" var="item">
                    <div class="col-md-4" >
                        <a href="" class="click-img" data-toggle="modal" data-target="#orderModal" idValue="${item._id}">
                            <img src="http://localhost:9032/public/image/${item.image}" class="order-img" alt="" />
                            <p>${item.name}</p>
                            <div class="text-price"><span class="price-foodnumber">${item.price}</span> <span>VNĐ</span></div>
                        </a> 
                    </div>
                </c:forEach>
            </div>

            <div class="profile-text-hot">
                Mới nhất
            </div>
            <div class="profile-menu-hot row">
                <c:forEach items="${restaurant.menus}" begin="0" end="5" var="item">
                    <div class="col-md-4" >
                        <a href="" class="click-img" data-toggle="modal" data-target="#orderModal" idValue="${item._id}">
                            <img src="http://localhost:9032/public/image/${item.image}" class="order-img" alt="" />
                            <p>${item.name}</p>
                            <div class="text-price"><span class="price-foodnumber">${item.price}</span> <span>VNĐ</span></div>
                        </a> 
                    </div>
                </c:forEach>
            </div>

            <!--            <div class="text-center">
                            <button type="button" class="btn btn-primary mx-auto dropdown-toggle" id="view-all" data-toggle="collapse" data-target="#see-more"> Xem tất cả</button>
                        </div>
                        <div id="see-more" class="collapse">
            
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="profile-menu-hot row ">
            <c:forEach items="${restaurant.menus}" begin="1" end="6" var="item">
                <div class="col-md-4" >
                    <a href="" class="click-img" data-toggle="modal" data-target="#order-menu-all" idValue="${item._id}">
                        <img src="http://localhost:9032/public/image/${item.image}" class="order-img" alt="" />
                        <p>${item.name}</p>
                        <div class="text-price"><span class="price-foodnumber">${item.price}</span> <span>VNĐ</span></div>
                    </a> 
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="carousel-item">
        <div class="profile-menu-hot ">
            <div class="col-md-4">
                <img src="/public/image/images new feed/pastaveg_640x480.jpg" alt="" />
                <a href="">Nui xào bơ tỏi</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà phô mai</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà nướng mật ong</a>
                <div class="text-price">77.000</div>
            </div>
        </div>
        <div class="profile-menu-hot ">
            <div class="col-md-4">
                <img src="/public/image/images new feed/pastaveg_640x480.jpg" alt="" />
                <a href="">Nui xào bơ tỏi</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà phô mai</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà nướng mật ong</a>
                <div class="text-price">77.000</div>
            </div>
        </div>
    </div>
    <div class="carousel-item">
        <div class="profile-menu-hot ">
            <div class="col-md-4">
                <img src="/public/image/images new feed/pastaveg_640x480.jpg" alt="" />
                <a href="">Nui xào bơ tỏi</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà phô mai</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà nướng mật ong</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà nướng mật ong</a>
                <div class="text-price">77.000</div>
            </div>

        </div>
        <div class="profile-menu-hot ">
            <div class="col-md-4">
                <img src="/public/image/images new feed/pastaveg_640x480.jpg" alt="" />
                <a href="">Nui xào bơ tỏi</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà phô mai</a>
                <div class="text-price">77.000</div>
            </div>
            <div class="col-md-4">
                <img src="/public/image/images new feed/chinese-625_625x350_81466064119.jpg" alt="" />
                <a href="">Gà nướng mật ong</a>
                <div class="text-price">77.000</div>
            </div>
        </div>

    </div>
</div>
</div>
</div>-->
        </div>

        <%@include  file="footer.jsp" %>