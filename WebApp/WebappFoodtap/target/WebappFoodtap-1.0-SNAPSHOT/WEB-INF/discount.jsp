<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>

<!-- Modal restaurant -->


<!-- Modal error -->


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
                    <a href="#"><img class="rounded img-order" src="/public/image/Background/sale-tag-icon-flat-cartoon-discount-label-vector-23608810.jpg" alt="" />

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
        <div class="col-12 col-sm-12 col-md-6 scrollpost" style="background-color: white;">
            <c:forEach var="item" items="${coupons}">
                <div class="d-flex bd-highlight mb-3">
                    <div class="p-2 bd-highlight">
                        <img src="http://localhost:9032/public/image/${item.image}" width="200px" height="100%"/>
                    </div>
                    <div class="p-2 bd-highlight">
                        <div><a href="" id="coupon-details" data-toggle="modal" idValue="${item._id}" data-target="#storeModal${item._id}">${item.code}</a></div>
                        <div>${item.description}</div>
                    </div>
                </div>
                <div class="modal fade" id="storeModal${item._id}" tabindex="-1" role="dialog" aria-labelledby="storeModal" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:75%!important;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Các cửa hàng áp dụng</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <c:forEach var="restaurant" items="${item.restaurants}">
                                        <div class="col-sm-3 store-modal-discount">
                                            <a href="/restaurant/${restaurant._id}">
                                                <div style="position: relative;">
                                                    <img src="http://localhost:9032/public/image/${restaurant.avatar}"  width="100%" height="254px"/>
                                                    <div class="name-store-modal-discount">${restaurant.name}</div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>                
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
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

