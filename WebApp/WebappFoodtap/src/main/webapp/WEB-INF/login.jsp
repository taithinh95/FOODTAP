
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="/public/fontawesome-free-5.13.1-web/fonts/mvboli.ttf" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'>
        <link href="/public/fontawesome-free-5.13.1-web/css/all.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/public/css/styte.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/css/sb-admin-2.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/@goongmaps/goong-js@1.0.2/dist/goong-js.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/@goongmaps/goong-js@1.0.2/dist/goong-js.css" rel="stylesheet" />
        <script src='https://cdn.jsdelivr.net/npm/@goongmaps/goong-geocoder@1.0.2/dist/goong-geocoder.min.js'></script>
        <link href="https://cdn.jsdelivr.net/npm/@goongmaps/goong-geocoder@1.0.2/dist/goong-geocoder.css" rel="stylesheet"
              type="text/css" />
        <style>
            #map {
                height: 500px;
            }
        </style>
    </head>

    <body>
        <!--modal thoong bao-->
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

        <!-- The Modal -->
        <div class="modal" id="mapModel">
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
                        <button type="button" class="btn btn-danger submit" >Chấp nhận</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container login">
            <div class="row login-row">
                <div class="col-lg-1 col-md-1 col-sm-1 login-food d-flex align-items-md-center">
                    <div>
                        <img src="/public/image/logo/7bb4b065-907a-40b6-9b64-0440362db8d3_200x200.png" class="img-login-logo" alt="" />
                        <h1>Food<br/>tap</h1>
                        <img src="/public/image/logo/7bb4b065-907a-40b6-9b64-0440362db8d3_200x200.png" class="img-login-logo" alt="" />
                    </div>
                </div>

                <div class="col-lg-8 col-md-8  login-sign">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs justify-content-center text-center" >
                        <li class="nav-item">
                            <a class="nav-link active login-tab" data-toggle="tab" href="#login">Đăng Nhập</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link register-tab" data-toggle="tab" href="#register">Tạo Tài Khoản</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content " style="height: 100%">
                        <div class="tab-pane container active login-in text-center" id="login"> 
                            <div class="search-background">
                                <img src="/public/image/Background/33367357.jpg" width="100%"/>
                            </div>
                            <div class="login-container">
                                <form class="login-form d-flex justify-content-md-center align-items-md-center h-100  " id="commentForm" action="/login" method="POST">
                                    <div class="form-group ">
                                        <input id="phone-login" type="text" name="phone" class="form-control " placeholder="SĐT"/>

                                    </div>
                                    <div class="form-group ">
                                        <input type="password" name="password" class="form-control " placeholder="Mật Khẩu " />
                                        <span class="error error-pass">${message}</span>
                                    </div>


                                    <div style="width: 50%">
                                        <button class="btn btn-danger form-control btn-login ">Đăng nhập</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <div class="tab-pane container fade" id="register">
                            <div class="search-background">
                                <img src="/public/image/Background/33367357.jpg" width="100%">/
                            </div>
                            <div class="login-container">
                                <span class="error error-register">${messageRegister}</span>
                                <form class="login-form d-flex justify-content-md-center align-items-md-center h-100"  action="/register" method = "POST">

                                    <div class="form-group ">
                                        <input id="fullname-register" type="text" name="fullname" class="form-control input-name" placeholder="Họ và tên " />
                                        <span class="error error-user-mess" color="red">Họ và tên phải từ 2 ký tự đến 20 ký tự(không có ký tự đặc biệt)</span>

                                    </div>
                                    <div class="form-group ">
                                        <input type="text" id="phone-register" name="phone" class="form-control input-phone" placeholder="SĐT " />
                                        <span class="error error-phone" color="red">Số điện thoại không hợp lệ</span>
                                        <span class="error error-existUser" color="red">SĐT đã tồn tại, vui lòng nhập SĐT khác</span>
                                    </div>
                                    <div class="form-group ">
                                        <input type="password" id="password-register" name="password" class="form-control input-phone" placeholder="Mật khẩu"/>
                                        <span class="error error-password" color="red">Mật khẩu phải hơn 8 ký tự(bao gồm cả chữ thường, chữ hoa và ít nhất 1 số)</span>
                                    </div>
                                    <div class="form-group ">
                                        <input type="password" id="repassword-register" class="form-control input-phone" placeholder="Nhập lại mật khẩu"/>
                                        <span class="error error-repassword" color="red">Mật khẩu không khớp</span>
                                    </div>
                                    <div class="form-group ">
                                        <label >Giới tính: </label><br/>
                                        <input type="radio" name="gender" value="false" class="input-male" checked/><label style="margin-left: 10px; ">Nam</label>
                                        <input type="radio" name="gender" value="true" class="input-female" /><label style="margin-left: 10px; ">Nữ</label>
                                    </div>
                                    <div class="form-group form-inline">
                                        <div class="input-group flex-nowrap" style="width: 94.5%">
                                            <input id="address-register" type="text" name="address" class="form-control input-address" >
                                            <div class="input-group-prepend">
                                                <button  type="button" class="input-group-text btn-location" data-toggle="modal" data-target="#mapModel" ><i class="fas fa-map-marker-alt"></i></button>
                                            </div>

                                        </div>
                                        <!-- The Modal -->

                                    </div>
                                    <br/>


                                    <div class="text-center" style="width: 50%">
                                        <button type="submit" id="btn-register" class="btn btn-danger form-control btn-register">Đăng Ký</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-1 col-md-1  login-foods d-flex align-items-md-center ">
                    <div class="text ">
                        <img src="/public/image/logo/7bb4b065-907a-40b6-9b64-0440362db8d3_200x200.png " class="img-login-logo " alt=" " />
                        <h1>one<br/>tap<br/>for<br/>all<br/>foods</h1>
                        <img src="/public/image/logo/7bb4b065-907a-40b6-9b64-0440362db8d3_200x200.png " class="img-login-logo " alt=" " />
                    </div>
                </div>
            </div>
        </div>
        <!--Bootstrap-->
        <script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
        <script src="/public/js/jquery/jquery.min.js"></script>
        <script src="/public/js/bootstrap/popper.min.js "></script>
        <script src="/public/js/bootstrap/bootstrap.min.js "></script>
        <script src="/public/js/swiper.min.js "></script>
        <script src="http://localhost:9032/socket.io/socket.io.js"></script>
        <script src="/public/js/script.js "></script>
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
    </body>

</html>