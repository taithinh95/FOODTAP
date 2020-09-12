
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!-- The Modal -->
<div class="modal" id="mapModel">
    <div class="modal-dialog" style="width: 450px">
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
                <button type="submit" class="btn btn-danger submit" >Chấp nhận</button>
            </div>

        </div>
    </div>
</div>
<div class="container registerstore border rounded shadow-sm" style="margin-top:100px;padding-left: 0;padding-right: 0;">
    <ul class="nav nav-tabs flex-nowrap text-center" role="tablist" >
        <li role="presentation" class="nav-item" style="width:50%">
            <a href="#step1" class="nav-link active" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">Bước 1 </a>
        </li>
        <li role="presentation" class="nav-item" style="width:50%">
            <a href="#step2" class="nav-link disabled" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">Bước 2 </a>
        </li>

    </ul>
    <form action="/createRestaurant"  method="POST" enctype="multipart/form-data">
        <div class="tab-content py-2 " >
            <div class="tab-pane active" role="tabpanel" id="step1">
                <h3 class="font-margin text-center">Nhập thông tin</h3>
                <div class="form-group">

                    <div class="gallery">
                        <a id="chossefile">

                            <div class="image-frame-upload" style="border: 1px solid blue;width: 100%;height: 240px; background-size: cover; background-repeat: no-repeat">

                                <span style="position: absolute;margin-top: 21px;color: #5b6dc8;font-size: 100px;opacity: 0.7;margin-left: -30px;cursor: pointer">+</span>
                            </div>
                        </a>
                        <div class="desc ">Chọn ảnh đại diện <input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label>Tên cửa hàng:</label>
                    <input type="text" name="name" class="form-control input-namestore"/><br/>
                    <span class="error error-namestore" style="color: red;margin-left: 200px">Tên cửa hàng không được để trống</span>
                </div>
                <div class="form-group form-inline">
                    <label>Thông tin giới thiệu:</label>
                    <textarea name="description" class="form-control input-info"></textarea>
                </div>
                
                <div class="form-group form-inline">
                    <label>Địa chỉ cửa hàng</label>
                    <div class="input-group flex-nowrap" style="width: 46.5%">
                        <input type="text" class="form-control input-address" name="address" disabled>
                        <div class="input-group-prepend">
                            <button type="button" class="input-group-text btn-location" data-toggle="modal" data-target="#mapModel" ><i class="fas fa-map-marker-alt"></i></button>
                        </div>
                    </div>
                </div>
                
                <ul class="float-right">
                    <li class="list-inline-item">
                        <button type="button" class="btn btn-danger next-step">Tiếp tục</button>
                    </li>
                </ul>
            </div>
            <div class="tab-pane" role="tabpanel" id="step2">
                <h3 class="font-margin text-center">Chọn ảnh giấy phép bán hàng</h3>

                <div class="form-group row">
                    <div class="form-control col-md-7 " style="width: 60%" >
                        <a id="chossefile-giayphep">
                            <div class="image-frame-upload d-flex justify-content-center align-items-md-center" style="border: 1px solid blue; background-size: cover;width: 100%;height: 300px;">
                                <span style=";margin-top: -4px;color: #5b6dc8;font-size: 100px;opacity: 0.7;margin-left: 15px;cursor: pointer">+</span>
                            </div>
                        </a>

                        <div class="desc " style="display: none;"> <input type="file" name="multipartFile" class="btn btn-danger img-giayphep"/></div>

                    </div>
                    <div class="col-md-5">
                        <h2>Chú ý:</h2>
                        <div>
                            <p>- Giấy phép kinh doanh của bạn sẽ được chúng tôi kiểm duyêt.</p>
                            <p>- Nếu chưa có giấy phép bạn có thể hoàn tất đăng ký nhưng sẽ ít khách hàng tin tưởng hơn. CHúng tôi khuyên bạn nên đăng ký giấy phép kinh doanh</p>
                        </div>
                    </div>

                </div>


                <ul class="float-right">
                    <li class="list-inline-item">
                        <button type="button" class="btn btn-outline-danger prev-step">Quay lại</button>
                    </li>
                    <li class="list-inline-item">
                        <button id="submit-create-restaurant" type="submit" class="btn btn-danger btn-info-full next-step">Thanh toán</button>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </form>

</div>
<script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
<script src="/public/js/jquery/jquery.min.js "></script>
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
