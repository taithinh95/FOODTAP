
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<style>
    #map {
        height: 500px;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/@goongmaps/goong-js@1.0.2/dist/goong-js.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@goongmaps/goong-js@1.0.2/dist/goong-js.css" rel="stylesheet" />
<script src='https://cdn.jsdelivr.net/npm/@goongmaps/goong-geocoder@1.0.2/dist/goong-geocoder.min.js'></script>
<link href="https://cdn.jsdelivr.net/npm/@goongmaps/goong-geocoder@1.0.2/dist/goong-geocoder.css" rel="stylesheet"
      type="text/css" />
<a onclick="topFunction()" id="myBtn" title="Go to top">Top</a>
<!-- The Modal vị trí-->
<div class="modal" id="mapModeluserupdate">
    <div class="modal-dialog">
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
                <button type="button" class="btn btn-danger" >Chấp nhận</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal change pass-->
<div class="modal fade" role="dialog" id="Modelmatkhau">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"> Đổi mật khẩu</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="/changePassword" method="POST">
                    <div class="form-group">
                        <label>Mật khẩu cũ</label>
                        <input type="password" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu mới</label>
                        <input type="password" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Nhập lại mật khẩu mới</label>
                        <input type="password" class="form-control"  >
                    </div>
                    <button type="submit" class="btn btn-primary">Chấp nhận</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Content-->

<div style="margin-top: 100px;">
    <div class="container-fluid bg-light text-dark">
        <div class="row justify-content-center">
            <h1>Thông tin của bạn</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center h-100">
            <div class="col col-sm-6 col-md-7 col-lg-4 col-xl-6 h-100">
                <form action="/updateUser" method="POST" enctype="multipart/form-data">   
                    <div class="form-group form-control mx-auto text-center" style="width: 48%">
                        <div class="upload-img-status">
                            <div class="gallery text-center">
                                <a id="chossefile">
                                    <div class="image-frame-upload" style="border: 1px solid blue;width: 100%;height: 240px; background-size: 100% 100%; background-position: center; background-repeat: no-repeat">
                                        <span class="img-hidden" style="position: absolute;margin-top: 21px;color: #5b6dc8;font-size: 100px;opacity: 0.7;margin-left: -30px;cursor: pointer">+</span>
                                    </div>
                                </a>
                                <div class="desc ">Chọn ảnh đại diện <input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3">Họ và tên</label>
                        <div class="col-md-9 input-group-prepend">
                            <input id="user-name"  type="text" value="${user.fullname}" name="fullname" class="form-control"/><br/>
                        </div>
                        <span class="error error-username" style="color: red;margin-left: 210px">Họ và tên không được để trống</span>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3">SĐT</label>
                        <div class="col-md-9 input-group-prepend">
                            <input  type="text" value="${user.phone}" name="phone" disabled class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3">Địa chỉ</label>
                        <div class="col-md-9 input-group-prepend">
                            <input readonly="true"  type="text" value="${user.address}" name="address" class="form-control input-address" />
                            <button style="color: #da484a" type="button" class="input-group-text btn-location" data-toggle="modal" data-target="#mapModeluserupdate" ><i class="fas fa-map-marker-alt"></i></button>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3">Thông tin mô tả</label>
                        <div class="col-md-9 input-group-prepend">
                            <textarea  row="3" value="${user.description}" name="description" class="form-control" > </textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="container">
                            <div class="row">
                                <div class="col"><button class="col-7 btn btn-secondary btn-sm float-left" data-toggle="modal" data-target="#Modelmatkhau" type="button">Đổi mật khẩu</button></div>
                                <div class="col"><button id="btn-change" type="submit" class="col-6 btn btn-primary btn-sm float-right">Thay đổi</button></div>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>
    </div>

</div>

<script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
<script src="/public/js/jquery/jquery.min.js "></script>
<script src="/public/js/bootstrap/popper.min.js "></script>
<script src="/public/js/bootstrap/bootstrap.min.js "></script>
<script src="/public/js/swiper.min.js "></script>
<script src="/public/js/jquery-ui.js"></script>
<script src="http://localhost:9032/socket.io/socket.io.js"></script>
<script src="/public/js/script.js "></script>
<script>
    $(document).ready(function() {
        var imageFrame = $("input[type=file]").parent().siblings(0).children(0);
        imageFrame.css('background-image', 'url("http://localhost:9032/public/image/${user.avatar}');
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
        $("#mapModeluserupdate .modal-footer button").click(function() {
            $("#mapModeluserupdate").modal("hide");
        })
        $("#mapModeluserupdate .close").click(function() {
            $(".input-address").val("");
            $("#mapModeluserupdate").modal("hide");
        })
    })
</script>
</body>
</html>