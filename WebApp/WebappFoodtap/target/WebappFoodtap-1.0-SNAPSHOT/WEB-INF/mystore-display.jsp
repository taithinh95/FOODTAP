<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<!-- The Modal map -->
<div class="modal" id="mapModel-store" >
    <div class="modal-dialog" style="width: 450px;">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Bản đồ</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body justify-content-center">
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
<div class="modal" id="postModel-store">
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
                <button type="button" class="btn btn-danger" data-dismiss="modal">Chấp nhận</button>
            </div>
        </div>
    </div>
</div>
<!-- The Modal -->
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
                        <div class="info-product">
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

                                    <input aria-label="quantity" class="input-qty" min="1" max="999" name="quantity" type="number" value="1" />

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
<div class="container store-profile" style="margin-top: 100px">
    <div class="row ">
        <!-- Menu of food -->
        <div class="col-10 col-sm-10 col-md-11">
            <div class="row profile-header">
                <div class="col-md-4 profile-avartar">
                    <div class="d-flex">
                        <div class="profile-container-img">
                            <img src="http://localhost:9032/public/image/${restaurant.avatar}" class="rounded-circle img-avartar" alt="" />

                        </div>
                        <div class="profile-name">
                            <div class="text-name">${restaurant.name}</div>
                            <div class="text-like">${(restaurant.followers).size()} lượt thích</div>
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
                        </div>
                    </div>
                </div>
                <div class="col-md-5 store-menu">
                    <div>
                        <a href="/mystore-profile"><img class="rounded img-order-header" src="/public/image/Background/87801571-cartoon-fast-food-unhealthy-burger-sandwich-hamburger-pizza-meal-restaurant-menu-snack-vector-illust.jpg" alt="" />
                            <div class="rounded photo-header">
                                <div>
                                    Thực đơn
                                </div>

                            </div>
                        </a>
                    </div>    
                </div>

                <div class="col-md-1 profile-container-buttons">
                    <button href="/store-info" class="btn btn-primary form-control"><i class="far fa-thumbs-up"></i>Lượt thích</button>
                    <button class="btn btn-success form-control"><i class="fas fa-star"></i>Lượt đánh giá</button>
                    <a href="/statistical?#chart"><button class="btn btn-danger form-control"><i class="fas fa-poll-h"></i>Thống kê</button></a>
                </div>
                <div class="col-md-1 containers-sendmess" style="padding-right: 0 !important;">
                    <button class="btn btn-primary form-control "><i class="fas fa-user-edit"></i><br/>Thông tin</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2" style="position: relative;top:10px">
                    <div>
                        <a href="/explorestore"><img class="rounded img-order" src="/public/image/Background/87801571-cartoon-fast-food-unhealthy-burger-sandwich-hamburger-pizza-meal-restaurant-menu-snack-vector-illust.jpg" alt="" />
                            <div class="rounded photo">
                                <div>
                                    Khám phá<br/> món ngon
                                </div>

                            </div>
                        </a>
                    </div>
                    <div style="margin-top: 20px">
                        <a href="/sametaste"><img class="rounded img-order" src="/public/image/Background/set-of-children-eating-together-vector-22784582.jpg" alt="" />
                            <div class="rounded photo ">
                                <div>
                                    Bạn cùng<br/> khẩu vị
                                </div>
                            </div>
                        </a>
                    </div>
                    <div style="margin-top: 20px">
                        <a href="/mystore"><img class="rounded img-order" src="/public/image/Background/street-food-trailer-food-truck-cartoon-vector-19682966.jpg" alt="" />
                            <div class="rounded photo ">
                                Gian hàng <br/> của tôi
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col-md-10" >
                    <div class="post-store rounded">
                        <form class="row" action="/newfeed/postNewfeed" method="POST">
                            <div class="col-md-8 post-content">
                                <textarea class="rounded" name="content" id="" cols="30" rows="5" placeholder="Hãy đăng tin mới nhất về bạn đến mọi người"></textarea>
                                <div class="d-flex" style="width: 30%">
                                    <image class="rounded" src ="/public/image/images new feed/fruity-tingle-ice-cream-cones-121035-1.jpg" width="80%" height="85px" />
                                    <div class="upload-img-status" >
                                        <div class="gallery text-center">
                                            <a id="chossefile">
                                                <div class="image-frame-upload" style="border: 1px solid blue;width: 17%;height: 85px;position: absolute">
                                                    <span class="img-hidden" style="position: absolute;color: #5b6dc8;font-size:100px;opacity: 0.7;left: 8px;bottom:-20px;">+</span>
                                                </div>
                                            </a>
                                            <div class="desc "><input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label  style="font-size: 10px;width: 100%" for="upload-photo"  class="btn btn-success"><i class="fas fa-image"></i> Ảnh/Video</label>
                                        <input type="file"  id="upload-photo"/>
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-success" type="button" style="margin-bottom: -5px;" data-toggle="modal" data-target="#mapModel-store"><i class="fas fa-map-marker-alt"></i> Địa điểm</button>

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-success" data-target="#postModel-store" data-toggle="modal"><i class="fas fa-hamburger"></i> Đăng món</button>
                                    </div>
                                </div>
                                <hr/>
                                <div>
                                    <button class="btn btn-primary">Đăng</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <c:forEach var="item" items="${restaurant.newfeeds}">
                        <div class="rounded status">
                            <div class="alignment">
                                <div class="media">
                                    <img src="http://localhost:9032/public/image/${restaurant.avatar}" alt="avatar" width="50px" class="rounded-circle avatar" />
                                    <div class="media-body">
                                        <div href="#" class="name"><a href="#">${restaurant.name}</a><img src="http://localhost:9032/public/image/avatar/${item.images[0]}" class="check" alt="" />
                                        </div>

                                    </div>
                                    <div class="dropleft">
                                        <a href="#" data-toggle="dropdown"><i class="fa fa-ellipsis-h" aria-hidden="true" ></i></a>
                                        <div class="dropdown-menu" >
                                            <a class="dropdown-item" href="#">Ẩn</a>
                                            <a class="dropdown-item" href="#">Sửa</a>
                                            <a class="dropdown-item" href="#">Xóa</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="font1">
                                    ${item.content}
                                </div>
                                <div>
                                    <a href="#">CoolCream#</a>
                                    <a href="#">sweet#</a>
                                    <a href="#">fruit#</a>
                                    <a href="#">sweetlane#</a>
                                </div>


                            </div>
                            <div class="image1">
                                <img src="http://localhost:9032/public/image/${item.images[0]}" class="rounded background" alt="" />
                            </div>
                            <div style="margin-top: 2px;display: flex;">
                                <span style="display: flex;" data-toggle="modal" data-target="#Modallikeshare" class="list-like"><div style="margin-right: 5px;margin-left: 15px;"><i  class="fa fa-heart rounded-circle"  aria-hidden="true" style="color: white; background-color: #da484a;padding: 5px;"></i></div><span class="like-count">${(item.likes).size()}</span></span>
                                <div style="width: 100%;text-align: end; padding-right: 15px;"><a data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample"><span class="count-comment">200 bình luận</span></a><span>200 chia sẻ</span></div>
                            </div>
                            <hr class="hr-newsfeed"/>
                            <div class="icon2">
                                <div class="subicon1">
                                    <a><i class="fas fa-utensils" data-toggle="modal" data-target="#orderModal" idValue="${item.product}"></i>
                                    </a>
                                            <i class="fa fa-heart like-newpost"  aria-hidden="true"></i>
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
                                                                <h5 class="time "></h5>
                                                                <div class="report dropright">
                                                                    <a href="#" class="" data-toggle="dropdown"> <i class="fas fa-ellipsis-h" aria-hidden="true"></i>
                                                                    </a>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Báo cáo</a>
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
                                                                                        <a class="dropdown-item" href="#">Ẩn bình luận</a>
                                                                                        <a class="dropdown-item" href="#">Sửa </a>
                                                                                        <a class="dropdown-item" href="#">Báo cáo</a>
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
                            $(".input-address").val(data.results[0].formatted_address);
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
                            $(".input-address").val(data.results[0].formatted_address);
                        });
            })
            geocoder.on("result", function(e) {
                geocoder.mapMarker.remove();
                marker._lngLat = geocoder.mapMarker._lngLat;
                $(".input-address").val(e.result.description);
            })
            $(".btn-location").click(function() {
                $(".goongjs-ctrl-fullscreen").trigger("click");
            })
            $("#mapModel .modal-footer button").click(function() {
                $("#mapModel").modal("hide");
            })
            $(".close").click(function() {
                $(".input-address").val("");
                $("#mapModel").modal("hide");
            })
        </script>
        <%@include  file="footer.jsp" %>