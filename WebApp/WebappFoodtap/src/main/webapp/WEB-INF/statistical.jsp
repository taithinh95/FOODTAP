
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="header.jsp" %>
<!-- The Modal map -->
<div class="modal fade" id="mapModel">
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
<!--modal detail order-->
<c:forEach var="item" items="${restaurant.orders}">
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="detailorder${item._id}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header" style="color: white; background-color: #da484a">
                    <h5 class="modal-title">Chi tiết đơn hàng: ${item._id}</h5>
                    <button type="button" class="close"  data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="GFG">
                        <div class="row" >
                            <div class="col-md-7 col-sm-12">

                                <div class="container">
                                    <div class="card shopping-cart">
                                        <div class="card-header text-light" style="background-color: #fc7a7b;">
                                            <i class="fas fa-file-alt"></i> Sản phẩm đã mua

                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="card-body">
                                            <!-- PRODUCT -->
                                            <section class="container content-section">
                                                <div class="cart-row">
                                                    <span class="cart-item cart-header cart-column">Món</span>
                                                    <span class="cart-price cart-header cart-column">Giá</span>
                                                    <span class="cart-quantity cart-header cart-column">Số lượng</span>
                                                </div>
                                                <div class="cart-items">
                                                    <c:forEach var="c" items="${item.products}">
                                                        <div class="cart-row">
                                                            <div class="cart-item cart-column">
                                                                <span class="cart-item-title cart-item-title ">${c.product.name}</span>
                                                            </div>
                                                            <span class="cart-price cart-column cart-price-detail">${c.product.price} </span>

                                                            <div class="cart-quantity cart-column">
                                                                <input class="cart-quantity-input" disabled type="number" value="${c.quantity}" max="100">

                                                            </div>
                                                        </div>

                                                    </c:forEach>
                                                </div>
                                                <div class="cart-total row" style="font-weight: 100;">
                                                    <div class="">Tạm tính:</div>

                                                    <div class="col"><span class="cart-total-price">${item.amount}</span>VNĐ</div>
                                                    <input type="text" class="cart-total-price-data" style="display: none;"/>
                                                </div>
                                                <div class="cart-total row" style="font-weight: 100;">
                                                    <div class="">Phí vận chuyển: <span class="price-ship"></span>km</div>

                                                    <div class="col"><span class="cart-ship-price">0</span>VNĐ</div>

                                                </div>

                                                <div class="cart-total row" style="color: #ff0000;">
                                                    <div class="">Phiếu giảm giá:</div>

                                                    <div class="col">-<span class="cart-discount">0</span>VNĐ</div>

                                                </div>
                                                <div class="cart-total row" style="font-size: 20px;font-weight: 600;">
                                                    <div class="">Tổng:</div>

                                                    <div class="col"><span class="cart-total-all">0</span>VNĐ</div>

                                                </div>

                                            </section>
                                        </div>

                                    </div>
                                </div>

                            </div>

                            <div class="col-md-5 info-user" style="height: 100%;background-color: antiquewhite;border-radius: 16px; padding-top: 10px;margin-top: 22px;max-width: 38%;">

                                <div>

                                    <div class=" info-more-modal row">
                                        <label class="col">Tên khách hàng </label>
                                        <span class="col"> <a href="/user-profile/${item.user._id}">${item.user.fullname}</a></span>
                                    </div>
                                    <div class=" info-more-modal row">
                                        <label class="col">Tên người giao </label>
                                        <span class="col"> </span>
                                    </div>
                                    <div class=" info-more-modal row">
                                        <label class="col">SĐT người giao </label>
                                        <span class="col"> </span>

                                    </div>

                                    <div class=" info-more-modal row">
                                        <label class="col">Địa chỉ giao hàng:</label>
                                        <span class="col">${item.address}</span>
                                    </div>
                                    <div class="info-more-modal row">
                                        <label class="col">Thời gian hoàn thành:</label><br/>
                                        <span class="col"> </span>
                                    </div>
                                    <div class="info-more-modal row">
                                        <label class="col">Tình trạng:</label><br/>
                                        <span class="col"> <c:choose>
                                                <c:when test="${item.status=='completed'}">
                                                    Đã hoàn thành
                                                </c:when>
                                                <c:when test="${item.status=='failed'}">
                                                    Đã bị hủy
                                                </c:when>
                                                <c:otherwise>
                                                    Đang tiến hành
                                                </c:otherwise>
                                            </c:choose></span>
                                    </div>
                                    <!--                    <div class="info-more row">
                                                            <label class="col">Thanh Toán:</label><br/>
                                                            <span class="col">Tieenf mat </span>
                                                        </div>-->
                                    <div class="info-more-modal row">
                                        <label class="col">Ghi chú</label><br/>
                                        <span class="col" style="word-break: break-all;">${order.note}</span>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-danger" onclick="printDiv()" >In hóa đơn</button>
                </div>

            </div>
        </div>
    </div>
</c:forEach>

<!--modal post food-->
<div class="modal" id="postModal-food">
    <form action=""  method="POST" enctype="multipart/form-data">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Đăng món</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body" style="overflow: auto;">
                    <div class="post-store rounded">
                        <div class="col-md-12 post-content">
                            <h4>Nhập nội dung</h4>
                            <input type="text" name="restaurant" value="${restaurant._id}" hidden />
                            <textarea class="rounded" name="content"  cols="30" rows="5" placeholder="Hãy đăng tin mới nhất về bạn đến mọi người"></textarea>
                            <div class="d-flex" style="width: 100%">
                                <image class="rounded" src ="http://localhost:9032/public/image/" width="100%" height="100%" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" >Đăng tin</button>
                </div>
            </div>
        </div>
    </form>
</div>


<!--modal create menu-->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdMenu">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header" style="color: white; background-color: #da484a">
                <h5 class="modal-title">Thêm món mới</h5>
                <button type="button" class="close"  data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/product/postProduct" method="POST" enctype="multipart/form-data">
                    <input name="restaurant" value="${restaurant._id}" type="text" hidden/>
                    <div class="form-group">
                        <label >Tên món ăn:</label>
                        <input id="name-food" name="name" type="text" class="form-control"   />
                        <span class="error error-food-name" color="red">Tên món không được để trống</span>
                    </div>
                    <div class="form-group form-inline">
                        <label>Hình:</label>
                    </div>
                    <div class="upload-img-status">
                        <div class="gallery text-center">
                            <a id="chossefile">

                                <div class="image-frame-upload" style="border: 1px solid blue;width: 15%;height: 85px; background-repeat: no-repeat;background-size: cover">
                                    <span class="img-hidden" style="position: absolute;color: #5b6dc8;font-size:100px;opacity: 0.7;left: 35px;top: 105px;cursor: pointer">+</span>

                                </div>
                            </a>
                            <div class="desc "><input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Giá:</label>
                        <input id="price-food" name="price" min="1" value="0" type="number" class="form-control" />
                        <span class="error error-create-price" color="red">Giá món phải lớn hơn 0 và bé hơn 1 triệu</span>
                    </div>
                    <div class="form-group">
                        <label>Giá khuyến mãi:</label>
                        <input id="price-saleoff"  value="0" name="saleoff" type="number" class="form-control" />
                         <span class="error error-saleoff-price" color="red">Giá khuyến mãi phải nhỏ hơn giá món</span>
                    </div>
                    <div class="form-group dropdown row">
                        <label class="col-sm-4">Danh mục</label>
                        <div class="col-sm-2"></div>
                        <input  type="text" class="col-sm-6  searchstore"  data-toggle="dropdown"  id="dropdownMenuButton" placeholder="Chọn danh mục của món" />
                        <input style="margin-top: 5px;" type="text" name="categories"  class="form-control store-coupon"/>
                        <input style="margin-top: 5px;" type="hidden"  class="form-control id-store-coupon" name=""/>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="List" style="max-width: 100%;height: 200px;top:68px!important;overflow: auto;">
                            <c:forEach var="item" items="${foodCaterogys}">
                                <div class="dropdown-item dropdown-item-DM">
                                    <img src="http://localhost:9032/public/image/${item.image}" width="25px" class="search-avatar" alt=""/>
                                    <span class="name-store">${item.name}</span>
                                    <span style="display: none;" class="id-store">${item._id}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <button id="btn-create-food" type="submit" class="btn btn-primary" style="float: right;">Thêm</button>
                </form>

            </div>

        </div>
    </div>
</div>
<!--modal update menu-->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="updateMenu">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header" style="color: white; background-color: #da484a">
                <h5 class="modal-title">Cập nhật món ăn</h5>
                <button type="button" class="close"  data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/product/update" method="POST" enctype="multipart/form-data">
                    <input name="restaurant" value="${restaurant._id}"  hidden />
                    <input name="id" hidden />
                    <div class="form-group">
                        <label >Tên món ăn:</label>
                        <input id="name-update-food" name="name" type="text" class="form-control"   />
                        <span class="error error-name-food-update" color="red">Tên món không được để trống</span>
                    </div>
                    <div class="form-group form-inline">
                        <label>Hình:</label>
                    </div>
                    <div class="upload-img-status">
                        <div class="gallery text-center">
                            <a id="chossefile" class="choosefile">
                                <div class="image-frame-upload" style="border: 1px solid blue;width: 15%;height: 85px">
                                    <span class="img-hidden" style="position: absolute;color: #5b6dc8;font-size:100px;opacity: 0.7;left: 42px;top: 105px;cursor: pointer">+</span>
                                </div>
                            </a>
                            <div class="desc "><input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Giá:</label>
                        <input id="price-update-food" min="1" name="price" type="number" class="form-control" />
                        <span class="error error-update-price" color="red">Giá món phải lớn hơn 0 và bé hơn 1 triệu</span>
                    </div>
                    <div class="form-group">
                        <label>Giá khuyến mãi:</label>
                        <input id="update-saleoff" min="1" name="saleoff" min="1" type="number" class="form-control" />
                        <span class="error error-saleoff-update" color="red">Giá khuyến mãi phải nhỏ hơn giá món</span>
                    </div>
                    <div class="form-group dropdown row">
                        <label class="col-sm-4">Danh mục</label>
                        <div class="col-sm-2"></div>
                        <input  type="text" class="col-sm-6  searchstore"  data-toggle="dropdown"  id="dropdownMenuButton" placeholder="Hãy nhập tên cửa hàng" />
                        <input style="margin-top: 5px;" type="text" name="categories"  class="form-control store-coupon"/>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="List" style="max-width: 100%;height: 200px;top:68px!important;overflow: auto;">
                            <c:forEach var="item" items="${foodCaterogys}">
                                <div class="dropdown-item dropdown-item-DM">
                                    <img src="http://localhost:9032/public/image/${item.image}" width="25px" class="search-avatar" alt=""/>
                                    <span class="name-store">${item.name}</span>
                                    <span style="display: none;" class="id-store">${item._id}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <button id="btn-update-food" type="submit" class="btn btn-primary" style="float: right;">Cập nhật</button>
                </form>

            </div>

        </div>
    </div>
</div>


<div class="container" style="margin-top: 100px">
    <!-- Nav tabs -->
    <div class="form-inline" style="margin-bottom: 10px;text-align: end;flex-direction: row-reverse">

        <a href="/mystore"><button class="btn btn-primary" >Tất cả cửa hàng</button></a>

    </div>
    <ul class="nav nav-tabs">

        <li class="nav-item text-center" style="width:25%">
            <a class="nav-link active" data-toggle="tab" href="#order">Đơn hàng</a>
        </li>
        <li class="nav-item text-center" style="width:25%">
            <a class="nav-link" data-toggle="tab" href="#menu">Menu</a>
        </li>
        <li class="nav-item text-center" style="width:25%">
            <a class="nav-link" data-toggle="tab" href="#store-info"> Thông tin</a>
        </li>
        <li class="nav-item text-center" style="width:25%">
            <a class="nav-link " data-toggle="tab" href="#chart">Sơ đồ thống kê</a>
        </li>


    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane active container" id="order">
            <div class="card shadow mb-4" style="height: 100%;">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold ">Bảng thống kê quản lí đơn hàng</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <!-- <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="dataTables_length" id="dataTable_length"><label>Hiển thị <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> đơn hàng</label></div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div id="dataTable_filter" class="dataTables_filter"><label>Tìm kiếm<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label></div>
                                </div>
                            </div> -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-bordered dataTable" id="dataTable"  width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Mã đơn hàng: activate to sort column descending" style="width: 195px;">Mã đơn hàng</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="SĐT khách hàng: activate to sort column ascending" style="width: 294px;">Khách hàng</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Ngày gửi: activate to sort column ascending" style="width: 142px;">Người giao</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Ngày gửi: activate to sort column ascending" style="width: 142px;">Ngày đặt</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Đơn giá: activate to sort column ascending" style="width: 131px;">Tổng tiền</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Tình trạng: activate to sort column ascending" style="width: 121px;">Tình trạng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${restaurant.orders}">
                                                <tr role="row" class="odd">
                                                    <td class="sorting_1"><a href="" data-toggle="modal" data-target="#detailorder${item._id}">${item._id}</a></td>
                                                    <td><a href="/user-profile/${item.user._id}">${item.user.fullname}</a></td>
                                                    <td>${item.shipper.fullname}</td>
                                                    <td class="date-long">${item.createdAt}</td>
                                                    <td>${item.amount} VNĐ</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item.status=='completed'}">
                                                                Đã hoàn thành
                                                            </c:when>
                                                            <c:when test="${item.status=='failed'}">
                                                                Đã bị hủy
                                                            </c:when>
                                                            <c:otherwise>
                                                                Đang tiến hành
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- <div class="row">
                                <div class="col-sm-12 col-md-5">
                                    <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
                                </div>
                                <div class="col-sm-12 col-md-7">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
                                            <li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                            <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                                            <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
                                            <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
                                            <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
                                            <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li>
                                            <li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane container" id="chart">
            <canvas id="myChart">
            </canvas>

            <canvas id="bestSellerChart">
            </canvas>
<!--            <div class="row">
                 Earnings (Monthly) Card Example 
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Kiếm (Hàng tháng)</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">79,400,000 VND</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                 Earnings (Monthly) Card Example 
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Kiếm (Hàng năm)</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">552,000,000 VND</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                 Earnings (Monthly) Card Example 
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Mục tiêu</div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                        </div>
                                        <div class="col">
                                            <div class="progress progress-sm mr-2">
                                                <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                 Pending Requests Card Example 
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">yêu cầu cần xử lý</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>
        <div class="tab-pane  container" id="store-info" style="max-width: 100% !important;">
            <!--Content-->
            <form action="/restaurant/update" method="POST" enctype="multipart/form-data">
                <div class="container store-info" style="margin-top: 20px;">
                    <div class="text-center ">
                        <h1>Thông tin cửa hàng</h1>    
                    </div>
                    <hr/>
                    <div class="row h-100">
                        <div class="col-md-6">
                            <div class="gallery fix-store">   
                                <div class="form-group form-control text-center" style="width: 50% !important; margin-left: 190px">
                                    <a id="chossefile" class="choosefile">

                                        <div class="image-frame-upload" style="background:url('http://localhost:9032/public/image/${restaurant.avatar}');border: 1px solid blue;width: 100%;height: 240px; background-size: cover; background-repeat: no-repeat">
                                            <span class="img-hidden" style="position: absolute;margin-top: 21px;color: #5b6dc8;font-size: 100px;opacity: 0.7;margin-left: -30px;cursor: pointer">+</span>

                                        </div>
                                    </a>
                                    <div class="desc ">Chọn đại diện cửa hàng <input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                                </div>
                                <input name="id" value="${restaurant._id}" hidden />
                                <div class="form-group row">
                                    <label class="col-md-3">Tên cửa hàng</label>

                                    <div class="col-md-9 input-group-prepend">
                                        <input name="name" type="text" readonly="true" value="${restaurant.name}" class="form-control"  >

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Địa chỉ</label>
                                    <div class="col-md-9 input-group-prepend">
                                        <input name="address" type="text" readonly="true" value="${restaurant.address}" class="form-control input-address" >
                                        <button type="button" class="input-group-text btn-location" data-toggle="modal" data-target="#mapModel" ><i class="fas fa-map-marker-alt"></i></button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Thông tin mô tả</label>

                                    <div class="col-md-9 input-group-prepend">
                                        <textarea  type="text" name="description" id="textupdateinfo" class="form-control">${restaurant.description}</textarea>

                                    </div>
                                    <span class="col-md-3"></span>
                                    <span class="col-md-9 error error-textupdateinfo" color="red">Thông tin mô tả phải ít nhất 20 ký tự</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3"> Mở cửa</label>
                                    <div class="col-md-9 input-group-prepend">
                                        <select  type="text" id="openAt" name="openAt" class="form-control"  >
                                            <option value="">----Chọn thời gian mở cửa----</option>
                                            <option value="07:00">07:00</option>
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="13:00">13:00</option>
                                            <option value="14:00">14:00</option>
                                            <option value="15:00">15:00</option>
                                            <option value="16:00">16:00</option>
                                            <option value="17:00">17:00</option>
                                            <option value="18:00">18:00</option>
                                            <option value="19:00">19:00</option>
                                            <option value="20:00">20:00</option>
                                        </select>

                                    </div>
                                    <span class="col-md-3"></span>
                                    <span class=" col-md-9 error error-openAt" color="red">Giờ mở cửa chưa được chọn</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3"> Đóng cửa</label>

                                    <div class="col-md-9 input-group-prepend">
                                        <select id="closeAt" type="text" name="closeAt" class="form-control">
                                            <option value="" >----Chọn thời gian đóng cửa----</option>
                                            <option value="08:00">08:00</option>
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="12:00">12:00</option>
                                            <option value="13:00">13:00</option>
                                            <option value="14:00">14:00</option>
                                            <option value="15:00">15:00</option>
                                            <option value="16:00">16:00</option>
                                            <option value="17:00">17:00</option>
                                            <option value="18:00">18:00</option>
                                            <option value="19:00">19:00</option>
                                            <option value="20:00">20:00</option>
                                            <option value="21:00">21:00</option>
                                            <option value="22:00">22:00</option>
                                        </select>

                                    </div>
                                    <span class="col-md-3"></span>
                                    <span class=" col-md-9 error error-closeAt" color="red">Giờ đóng phải sau giờ mở cửa</span>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${restaurant.licenseImage==null}">
                                <div class="col-md-6">
                                    <div class="gallery add-paper">   
                                        <div class="form-group form-control text-center" style="width: 50% !important;margin-left: 178px">
                                            <a id="chossefile" class="choosefile">
                                                <div class="image-frame-upload" style="border: 1px solid blue;width: 100%;height: 240px; ">
                                                    <span style="position: absolute;margin-top: 21px;color: #5b6dc8;font-size: 100px;opacity: 0.7;margin-left: -30px;cursor: pointer">+</span>
                                                </div>
                                            </a>
                                            <div class="desc ">Thêm giấy phép bán hàng <input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                                        </div>
                                        <h2>Chú ý:</h2>   
                                        <p>- Bạn chưa có giấy phép kinh doanh<br/>- Nếu chưa có giấy phép bạn có thể hoàn tất đăng ký nhưng sẽ ít khách hàng tin tưởng hơn. Chúng tôi khuyên bạn nên đăng ký giấy phép kinh doanh</p>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-6" style="display:none">
                                    <div class="gallery add-paper">   
                                        <div class="form-group form-control text-center" style="width: 50% !important;margin-left: 178px">
                                            <a id="chossefile" class="choosefile">
                                                <div class="image-frame-upload" style="border: 1px solid blue;width: 100%;height: 240px; background-size: cover; background-repeat: no-repeat">
                                                    <span style="position: absolute;margin-top: 21px;color: #5b6dc8;font-size: 100px;opacity: 0.7;margin-left: -30px;cursor: pointer">+</span>
                                                </div>
                                            </a>
                                            <div class="desc ">Thêm giấy phép bán hàng <input style="width: 100%; display: none;" type="file" name="multipartFile" class="btn btn-danger img-store-register"/></div>
                                        </div>
                                        <h2>Chú ý:</h2>   
                                        <p>- Bạn chưa có giấy phép kinh doanh<br/>- Nếu chưa có giấy phép bạn có thể hoàn tất đăng ký nhưng sẽ ít khách hàng tin tưởng hơn. Chúng tôi khuyên bạn nên đăng ký giấy phép kinh doanh</p>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div style="width: 100%;padding-left: 50%">
                        <button class="col-6 btn btn-primary btn-sm float-right" id="btn-updateinfostore">Thay đổi</button>
                    </div>

                </div>
            </form>
        </div>
        <div class="tab-pane container" id="menu" style="max-width: 100% !important;">
            <div class="mb-4 form-inline" style="margin-top: 10px;text-align: start;">
                <button class="btn btn-info btn-icon-split" style="margin-left: 10px;" data-toggle="modal" data-target="#mdMenu"><i class="fas fa-file-medical" ></i> Thêm</button>
                <!--                <select name="" class="form-control " style="margin-left: 10px">
                                    <option value=" " disabled selected>Hãy chọn mục từ cửa hàng</option>
                                    <option value="1 ">Option 1</option>
                                    <option value="2 ">Option 2</option>
                                    <option value="3 ">Option 3</option>
                                </select>-->
            </div>
            <div class="card shadow mb-4" style="height: 100%;">
                <div class="card-body">
                    <div class="">
                        <table id="dtmenu" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Ảnh</th>
                                    <th>Tên món</th>
                                    <th>Danh mục</th>
                                    <th>Giá</th>
                                    <th>Giá khuyến mãi</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <c:forEach var="item" items="${restaurant.menus}">
                                    <tr role="row" class="even">
                                        <td><a href=""><image src="http://localhost:9032/public/image/${item.image}"  style="width: 100px; height: 100px"/></a></td>
                                        <td><a href="">${item.name} </a></td>
                                        <td>
                                            <c:forEach var="c" items="${item.category}">
                                                ${c.name}, 
                                            </c:forEach>
                                        </td>
                                        <td>${item.price} VND</td>
                                        <td><c:if test="${item.saleoff!=null}">${item.saleoff} VND</c:if></td>
                                            <td>
                                                <div class="d-flex justify-content-md-center"> 
                                                    <button  type="button" idValue="${item._id}" class="btn btn-info updateProduct" data-toggle="modal" data-target="#updateMenu">CẬP NHẬT</button>
                                                <button  type="button" idValue="${item._id}" class="btn btn-danger postFoodNewFeed" data-toggle="modal" data-target="#postModal-food">ĐĂNG TIN</button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</div>
<!--Bootstrap-->
<script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
<script src="/public/js/jquery/jquery.min.js "></script>
<script src="/public/js/bootstrap/popper.min.js "></script>
<script src="/public/js/bootstrap/bootstrap.min.js "></script>
<script src="/public/js/sb-admin-2.min.js"></script>
<script src="/public/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script src="/public/js/datatables-demo.js  "></script>
<script src="/public/js/Chart.min.js"></script>
<script src="/public/js/swiper.min.js"></script>
<script src="http://localhost:9032/socket.io/socket.io.js"></script>
<script src="/public/js/script.js "></script>
<script>
                        var listOrders;
                        var bestSell;
                        function countBestSeller(orderList) {
                            var stringArray = orderList.reduce(function(x, y) {
                                y.products.forEach(function(product) {
                                    x.push(product.product.name);
                                });
                                return x;
                            }, []);
                            var occurrences = {};
                            for (var i = 0, j = stringArray.length; i < j; i++) {
                                occurrences[stringArray[i]] = (occurrences[stringArray[i]] || 0) + 1;
                            }
                            return Object.entries(occurrences).sort(function(a, b) {
                                return  b[1] - a[1];
                            });
                        }
                        callAjax("/getMyRestaurantOrders/${restaurant._id}", "GET", null, function(data) {
                            listOrders = data.orders.filter(function(item) {
                                return ((item.status == "completed")) && (new Date(item.createdAt).getUTCMonth() == new Date().getUTCMonth())
                            });
                            listOrdersIncludeCanceled = data.orders.filter(function(item) {
                                return ((item.status == "completed") || (item.status == "failed")) && (new Date(item.createdAt).getUTCMonth() == new Date().getUTCMonth())
                            });
                            bestSell = countBestSeller(listOrders)
                            listOrders = groupBy(listOrders, "createdAt");
                            listOrders = listOrders.sort(function(b, a) {
                                return  new Date(b[0].createdAt) - new Date(a[0].createdAt);
                            });
                            // Global options
                            Chart.defaults.global.defaultFontFamily = 'Lato';
                            Chart.defaults.global.defaultFontSize = 20;
                            Chart.defaults.global.defaultFontColor = '#777';
                            amountInMonth = listOrders.map(function(item) {
                                return item.reduce(function(x, y) {
                                    return x + y.amount;
                                }, 0)
                            })
                            var chart = new Chart(myChart, {
                                type: 'line',
                                data: {
                                    labels: ['Ngày 1', '2', '3', ' 4', ' 5', ' 6', ' 7', ' 8', ' 9', ' 10', ' 11', ' 12', ' 13', ' 14', ' 15', ' 16', ' 17', ' 18', ' 19', ' 20', ' 21', ' 22', ' 23', ' 24', ' 25', ' 26', ' 27', ' 28', ' 29', ' 30'],
                                    datasets: [{
                                            label: ['Doanh thu'],
                                            data: amountInMonth,
                                            backgroundColor: 'rgba(0, 0, 0, 0)',
                                            borderWidth: 2,
                                            borderColor: '#da484a',
                                            hoverborderWidth: 3,
                                            hoverborderColor: '#000',
                                        }],
                                },
                                options: {
                                    title: {
                                        display: 'true',
                                        text: 'Doanh thu trong tháng này',
                                        fontSize: 30,
                                        fontStyle: 'bold',
                                    },
                                    legend: {
                                        display: 'true',
                                        position: 'right',
                                        labels: {
                                            fontColor: '#000',
                                        }
                                    },
                                    layout: {
                                        padding: {
                                            left: 50,
                                            right: 0,
                                            bottom: 50,
                                            top: 50,
                                        },
                                    },
                                    animation: {
                                        duration: 2000,
                                        easing: 'linear',
                                    },
                                },
                            });
                            var myPieChart = new Chart(bestSellerChart, {
                                type: 'doughnut',
                                data: {
                                    datasets: [
                                        {
                                            label: "Top",
                                            data: [
                                                bestSell[0][1],
                                                bestSell[1][1],
                                                bestSell[2][1],
                                            ],
                                            backgroundColor: ['rgba(66, 135, 245)', 'rgba(218, 245, 4)', 'rgba(201, 20, 47)']
                                        }
                                    ],
                                    labels: [bestSell[0][0],
                                        bestSell[1][0],
                                        bestSell[2][0], ],
                                },
                                options: {
                                    title: {
                                        display: 'true',
                                        text: 'Bán chạy nhất tháng theo số đơn',
                                        fontSize: 30,
                                        fontStyle: 'bold',
                                    },
                                    legend: {
                                        display: 'true',
                                        position: 'right',
                                        labels: {
                                            fontColor: '#000',
                                        }
                                    },
                                    layout: {
                                        padding: {
                                            left: 50,
                                            right: 0,
                                            bottom: 50,
                                            top: 50,
                                        },
                                    },
                                    animation: {
                                        duration: 2000,
                                        easing: 'linear',
                                    },
                                },
                            });
                        })

                        var progress = document.getElementById('animationProgress');
                        let myChart = document.getElementById('myChart').getContext('2d');

                        bestSellerChart = document.getElementById("bestSellerChart").getContext('2d');
                        function groupBy(collection, property) {
                            var i = 0, val, index,
                                    values = [], result = [];
                            for (; i < collection.length; i++) {
                                val = collection[i][property];
                                index = values.indexOf(val);
                                if (index > -1)
                                    result[index].push(collection[i]);
                                else {
                                    values.push(val);
                                    result.push([collection[i]]);
                                }
                            }
                            return result;
                        }





</script>
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
                    getLocation($(".input-address").val(), "user");
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
                    getLocation($(".input-address").val(), "user");
                });
    })
    geocoder.on("result", function(e) {
        geocoder.mapMarker.remove();
        marker._lngLat = geocoder.mapMarker._lngLat;
        $(".input-address").val(e.result.description);
        getLocation($(".input-address").val(), "user");
    })

    $("#mapModel .modal-footer button").click(function() {
        $("#mapModel").modal("hide");
    })
    $(".close").click(function() {
        $(".input-address").val("");
        $("#mapModel").modal("hide");
    })
    //Fee distance functions
    var userLocation;
    var restaurantLocation;
    var distance;
    function getLocation(address, target) {
        var placeId;

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

                                if (target == "user") {
                                    userLocation = data.result.geometry.location.lat + "%2C" + data.result.geometry.location.lng;
                                }
                                else {
                                    restaurantLocation = data.result.geometry.location.lat + "%2C" + data.result.geometry.location.lng;
                                }

                                if (userLocation && restaurantLocation) {
                                    getDistance(userLocation, restaurantLocation).then(function(data) {
                                        distance = data.routes[0].legs[0].distance.text;
                                        $(".cart-total-title span").html(distance.split(" ")[0]);
                                        if (distance.split(" ")[0] <= 3)
                                        {
                                            $(".cart-ship-price").html("15,000");
                                        }
                                        else if (distance.split(" ")[0] <= 5) {
                                            $(".cart-ship-price").html("20,000");
                                        }
                                        else {
                                            var x = distance.split(" ")[0];
                                            var priceship = 20000 + 5000 * (x - 5);
                                            priceship = format2(priceship, "").replace(".000", "");
                                            $(".cart-ship-price").html(priceship);
                                        }
                                        updateCartTotal();
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
    getLocation('${user.cart[0].product.restaurant.address}', "restaurant");
    getLocation('${user.address}', "user");

</script>
</body>

</html>

