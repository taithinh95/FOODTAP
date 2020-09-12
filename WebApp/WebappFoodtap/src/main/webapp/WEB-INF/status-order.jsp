<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="me" 
     style="height: 50px; 
     width: 50px; 
     background: url('http://localhost:9032/public/image/${order.user.avatar}');
     background-size: cover;
     border:1px none;
     border-radius: 50%">
</div>
<div id="shipper" 
     style="height: 50px; 
     background: url('http://localhost:9032/public/image/${order.shipper.avatar}');
     background-size: cover;
     width: 50px; 
     border:1px none;
     border-radius: 50%">
</div>
<div id="restaurant" 
     style="height: 50px; 
     background: url('http://localhost:9032/public/image/${order.restaurant.avatar}');
     background-size: cover;
     width: 50px; 
     border:1px none;
     border-radius: 50%">
</div>
<div class="container contain" style="margin-top: 100px">
    <h1 style="margin-top: 10px;text-align: center;">Trạng thái đơn hàng</h1>
    <div class="row" style="margin-right: 0;">
        <div class="col-md-8 col-sm-12 info-product" style="margin-top: 25px;">

            <div class="container">
                <div id="map"></div>
            </div>
        </div>

        <div class="col-md-4 info-user" style="background-color: antiquewhite;border-radius: 16px; padding-top: 10px;margin-top: 22px;">

            <div>
                <form class="form-group form-order" action="/order/cancelOrder/${order._id}" method="POST">
                    <div class=" info-more row">
                        <label class="col">Tình trạng: </label>
                        <span class="col" id="status-text">
                            <c:choose>
                                <c:when test="${order.status=='finding'}">
                                    Đang tìm tài xế
                                </c:when>
                                <c:when test="${order.status=='receiving'}">
                                    Đang đi nhận món
                                </c:when>
                                <c:otherwise>
                                    Đang giao đến bạn
                                </c:otherwise>
                            </c:choose>
                        </span>

                    </div>
                    <div class=" info-more row">
                        <label class="col">Tên cửa hàng: </label>
                        <span class="col"> ${order.restaurant.name}</span>
                    </div>
                    <div class=" info-more row">
                        <label class="col">Giao tới: </label>
                        <span class="col"> ${order.address}</span>
                    </div>
                    <div class=" info-more row">
                        <label class="col">Tên người giao: </label>
                        <span class="col shipperName" > ${order.shipper.fullname}</span>
                    </div>
                    <div class=" info-more row">
                        <label class="col">SĐT người giao: </label>
                        <span class="col shipperPhone" > ${order.shipper.phone}</span>
                    </div>
                    <div class=" info-more" style="margin-left: -15px;">
                        <label >Chi tiết đơn hàng:</label>
                        <c:forEach var="item" varStatus="status" items="${order.products}">
                            <div class="row" style="margin: 0 0 0 35px;">


                                <div class="col">

                                    <span > ${item.quantity}</span>x 
                                    <span>${item.product.name}<span>
                                            </div>
                                            <div class="col"><span class="price-foodnumber">${item.product.price}</span>VNĐ</div>
                                            </div>
                                        </c:forEach>
                                        <hr/>
                                        <div class="row" style="margin: 0 0 0 35px;font-weight: 100;">
                                            <div class="col">
                                                Tạm tính: 
                                            </div>

                                            <div class="col"><span class="price-foodnumber total-status"></span>VNĐ</div>

                                        </div>
                                        <div class="row" style="margin: 0 0 0 35px;font-weight: 100;">
                                            <div class="col">
                                                Phí vận chuyển: <span id="distance"></span>km 
                                            </div>
                                            <div class="col"><span class="price-foodnumber fee-status">${order.fee}</span>VNĐ</div>
                                        </div>
                                        <div class="row" style="margin: 0 0 0 35px;color: #ff0000;">
                                            <div class="col">
                                                Phiếu giảm giá: 
                                            </div>
                                            <div class="col"><span class="price-foodnumber discount-status">-${order.discount!=null?order.discount:0}</span>VNĐ</div>
                                        </div>
                                        <div class="row" style="margin: 0 0 0 35px;font-size: 20px;font-weight: 600;">
                                            <div class="col">
                                                Tổng cộng 
                                            </div>
                                            <div class="col"><span class="price-foodnumber totals-status">${order.amount}</span>VNĐ</div>
                                        </div>

                                        <div class="row" style="margin: 0 0 0 35px;font-size: 20px;font-weight: 600;">
                                            <div class="col">Thanh toán </div>
                                            <div class="col"> Tiền mặt</div>

                                        </div>
                                        <button class="btn btn-danger" style="float: right;margin-bottom: 10px;margin-top: 20px;">Hủy đơn hàng</button>
                                        </div>


                                        </form>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <!--Bootstrap-->
                                        <script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
                                        <script src="/public/js/jquery/jquery.min.js "></script>
                                        <script src="/public/js/bootstrap/popper.min.js "></script>
                                        <script src="/public/js/bootstrap/bootstrap.min.js "></script>
                                        <script src="/public/js/swiper.min.js "></script>
                                        <script src="/public/js/jquery-ui.js"></script>
                                        <script src="http://localhost:9032/socket.io/socket.io.js"></script>
                                        <script src="/public/js/script.js "></script>
                                        <script async defered>
                                            var i = 0;
                                            var userLocation;
                                            var restaurantLocation;
                                            var distance;
                                            var pointsToRestaurant;
                                            var shipperLocation;
                                            var marker2; //marker of Shipper

                                            function blink_shipper() {
                                                $("#shipper").fadeOut(2000);
                                                $("#shipper").fadeIn(2000);
                                            }
                                            setInterval(blink_shipper, 1000);
                                            var socket = io('http://localhost:9032');
                                            socket.emit("join", $("#idUser").val());


                                            goongjs.accessToken = 'uBkpjHKnrHMDwTJr5qytXfcNRtrp6Fp4o8pgM3ur';
                                            var map = new goongjs.Map({
                                                container: 'map', // container id
                                                style: 'https://tiles.goong.io/assets/goong_map_web.json', // stylesheet location
                                                center: [106.695833, 10.776111], // starting position [lng, lat]
                                                zoom: 14 // starting zoom
                                            });
                                            marker2 = new goongjs.Marker(shipper)
                                                    .setLngLat([105, 21])
                                                    .addTo(map);

                                            //Marker of user
                                            var marker = new goongjs.Marker(me)
                                                    .setLngLat([105, 21])
                                                    .addTo(map);
                                            //Marker of restaurant
                                            var marker3 = new goongjs.Marker(restaurant)
                                                    .setLngLat([105, 21])
                                                    .addTo(map);


                                            map.addControl(new goongjs.FullscreenControl());

                                            map.on('load', function() {
                                                map.addSource('single-point', {
                                                    type: 'geojson',
                                                    data: {
                                                        type: 'FeatureCollection',
                                                        features: []
                                                    }
                                                });
                                                map.addLayer({
                                                    id: 'point',
                                                    source: 'single-point',
                                                    type: 'circle',
                                                    paint: {
                                                        'circle-radius': 10,
                                                        'circle-color': '#448ee4'
                                                    }
                                                });
                                                //When Shipper accept order
                                                socket.on("acceptOrder", async function(data) {
                                                    console.log("1");
                                                    $("#status-text").html("Đang đi nhận món");
                                                    $(".shipperName").html(data.shipper.fullname);
                                                    $(".shipperPhone").html(data.shipper.phone);
                                                    $("#shipper").css("background", "url('http://localhost:9032/public/image/" + data.shipper.avatar + "')");
                                                    $("#shipper").css("background-size", "cover");
                                                    map.flyTo({
                                                        center: [data.latLng[1], data.latLng[0]],
                                                        zoom: 15
                                                    })
//                                                    var polyline = location.routes[0].overview_polyline.points;
//                                                        var idOrder = '${order._id}';
//                                                        var data = {
//                                                            polyline: polyline,
//                                                            idOrder: idOrder
//                                                        }
//                                                        $.ajax({
//                                                            url: "/sendRouteToShipper/",
//                                                            type: "POST",
//                                                            contentType: "application/json;charset=UTF-8",
//                                                            dataType: 'json',
//                                                            data: JSON.stringify(data),
//                                                            success: function(data) {
//                                                                
//                                                            }
//                                                        })

                                                })
                                                //When Shipper receive Food
                                                socket.on("deliveringOrder", function(data) {
                                                    $("#status-text").html("Đang giao đến bạn");
                                                });
                                                //When order complete
                                                socket.on("completedOrder", function(data) {
                                                    window.location.href = "/detail-order/" + data._id;
                                                })
                                                //When Shipper cancel order
                                                socket.on("cancelOrder", function(data) {
                                                    window.location.href = "/detail-order/" + data._id;
                                                })

                                                //Update shipper's location
                                                socket.on("shipperLocation", function(data) {
                                                    marker2._lngLat = {lat: data.latitude, lng: data.longitude}
                                                    var idOrder = '${order._id}';
                                                    var data = {
                                                        userLocation: userLocation,
                                                        restaurantLocation: restaurantLocation,
                                                        idOrder: idOrder
                                                    }
                                                    
                                                })

                                            });


                                            $("#mapModel .modal-footer button").click(function() {
                                                $("#mapModel").modal("hide");
                                            })
                                            $(".close").click(function() {
                                                $(".input-address").val("");
                                                $("#mapModel").modal("hide");
                                            })
                                            //Fee distance functions

                                            function getLocation(address, target) {
                                                var placeId;
                                                $("#loading-cart").addClass("loading-cart");
                                                $("#img-loadcart").addClass("img-loadcart");
                                                $("html, body").css("pointer-events", "none");

                                                fetch('https://rsapi.goong.io/Place/AutoComplete?input=' + address + '&api_key=gZa0FdCRbfdaQ8xZvcroe7dCLcqly5dTwCDz6muj&limit=1')

                                                        .then(function(response) {
                                                            return response.json()
                                                        })
                                                        .then(function(data) {
                                                            placeId = data.predictions[0].place_id;
                                                            fetch("https://rsapi.goong.io/Place/Detail?placeid=" + placeId + "&api_key=gZa0FdCRbfdaQ8xZvcroe7dCLcqly5dTwCDz6muj")
                                                                    .then(function(response) {
                                                                        return response.json()
                                                                    })
                                                                    .then(function(data) {
                                                                        $("#loading-cart").removeClass("loading-cart");
                                                                        $("html, body").css("pointer-events", "auto");

                                                                        if (target == "user") {
                                                                            userLocation = data.result.geometry.location.lat + "%2C" + data.result.geometry.location.lng;
                                                                        }
                                                                        else {
                                                                            restaurantLocation = data.result.geometry.location.lat + "%2C" + data.result.geometry.location.lng;
                                                                        }

                                                                        if (userLocation && restaurantLocation) {
                                                                            getDistance(userLocation, restaurantLocation).then(function(data) {
                                                                                distance = data.routes[0].legs[0].distance.text;
                                                                                $("#distance").html(distance.split(" ")[0]);

                                                                                map.flyTo({
                                                                                    center: [
                                                                                        userLocation.split("%2C")[1],
                                                                                        userLocation.split("%2C")[0]
                                                                                    ],
                                                                                    zoom: 15
                                                                                });
                                                                                marker._lngLat = {lng: userLocation.split("%2C")[1], lat: userLocation.split("%2C")[0]}
                                                                                marker3._lngLat = {lng: restaurantLocation.split("%2C")[1], lat: restaurantLocation.split("%2C")[0]}
                                                                            });
                                                                        }

                                                                    })
                                                        });
                                            }
                                            function getDistance(origin, dest) {
                                                return new Promise(function(resolve, reject) {
                                                    fetch('https://rsapi.goong.io/Direction?origin=' + origin + '&destination=' + dest + '&api_key=gZa0FdCRbfdaQ8xZvcroe7dCLcqly5dTwCDz6muj&alternatives=true&vehicle=bike')
                                                            .then(function(response) {
                                                                return response.json()
                                                            })
                                                            .then(function(data) {
                                                                resolve(data);
                                                            });
                                                })
                                            }
                                            function sendLocationUser() {
                                                return new Promise(function(resolve, reject) {

                                                })
                                            }
                                            getLocation('${order.restaurant.address}', "restaurant");
                                            getLocation('${order.address}', "user");
                                        </script>
                                        </body>
                                        </html>

