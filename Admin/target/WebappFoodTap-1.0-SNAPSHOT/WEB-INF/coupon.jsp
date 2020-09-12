<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <form class="form-inline">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
            </form>

            <!-- Topbar Search -->
            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Tìm kiếm..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-danger" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
            </form>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">

                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                <li class="nav-item dropdown no-arrow d-sm-none">
                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-search fa-fw"></i>
                    </a>
                    <!-- Dropdown - Messages -->
                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Tìm kiếm..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-danger" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>

                <!-- Nav Item - Alerts -->
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>
                        <!-- Counter - Alerts -->
                        <span class="badge badge-danger badge-counter">3+</span>
                    </a>
                    <!-- Dropdown - Alerts -->
                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                        <h6 class="dropdown-header">
                            Alerts Center
                        </h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-primary">
                                    <i class="fas fa-file-alt text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 12, 2019</div>
                                <span class="font-weight-bold">A new monthly report is ready to download!</span>
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-success">
                                    <i class="fas fa-donate text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 7, 2019</div>
                                $290.29 has been deposited into your account!
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-warning">
                                    <i class="fas fa-exclamation-triangle text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 2, 2019</div>
                                Spending Alert: We've noticed unusually high spending for your account.
                            </div>
                        </a>
                        <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                    </div>
                </li>



                <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                        <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Chuyển vào trang người dùng
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Đăng xuất
                        </a>
                    </div>
                </li>

            </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">



            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <td class="d-flex"><button style="width: 20%" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createmodal">Thêm</button>
                </div>
                <div class="card-body">
                    <div class="table-responsive" style="overflow-x: hidden !important">
                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <!--                                        <div class="row">
                                                                        <div class="col-sm-12 col-md-6">
                                                                            <div class="dataTables_length" id="dataTable_length"><label>Show <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>
                                                                        </div>
                                                                        <div class="col-sm-12 col-md-6">
                                                                            <div id="dataTable_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label></div>
                                                                        </div>
                                                                    </div>-->
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-bordered table-hover dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 195px;">Tên</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 100px;">Ảnh</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 100px;">Mã</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 100px;">Ngày hết hạn</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 50px;">Phần trăm giảm</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 100px;">Sô tiền giảm</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 100px;">Tiền đơn tối thiểu</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 100px;">Giảm tối đa</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 50px;">Nội dung</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" style="width: 100px;">Cửa hàng sử dụng</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"  style="width: 200px;"></th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:forEach var="item" items="${coupons}">
                                                <tr role="row" class="odd odd-coupon">
                                                    <td class="sorting_1"> ${item.name}</td>
                                                    <td class="sorting"><img src ="http://localhost:9032/public/image/${item.image}" style="width: 100px"/></td>
                                                    <td class="sorting">${item.code}</td>

                                                    <td class="updatedAt date-long">  <input type="hidden" class="inputupdatedAt" name="inputupdatedAt" value="${item.exp}"/></td>
                                                    <td>${item.percent}</td>
                                                    <td>${item.discount}</td>
                                                    <td>${item.max}</td>
                                                    <td>${item.min}</td>
                                                    <td>${item.description}</td>
                                                    <td>
                                                        <c:forEach var="c" items="${item.restaurants}">
                                                            ${c.name},
                                                        </c:forEach>
                                                    </td>

                                                    <td class="d-flex">
                                                        <button type="button" class="btn btn-success form-control btn-updateCoupon" style="margin-right: 10px;" value="${item.code}"
                                                                data-toggle="modal" data-target="#updateCoupon" data-whatever="@getbootstrap">Cập nhật</button>

                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--                                        <div class="row">
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
                                                                    </div>-->
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your Website 2020</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sẵn sàng rời đi ?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Ch?n "??ng xu?t" d??i ?ây n?u b?n ?ã s?n sàng ?? k?t thúc phiên hi?n t?i c?a b?n.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>
<!--Modal coupon-->
<div class="modal fade" id="createmodal" tabindex="-1" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Tạo mã giảm giá</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/coupon/postCoupon" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Tên</label>
                        <input id="coupon-name" type="text" class="form-control" name="name"/>
                        <span class="error error-coupon-name">Tên mã giảm giá không được để trống</span>
                    </div>
                    <div class="form-group">
                        <label>Mã giảm giá</label>
                        <input id="coupon" type="text" class="form-control" name="code"/>
                        <span class="error error-coupon">Mã giảm giá không được để trống</span>
                    </div>
                    <div class="form-group">
                        <label>Ngày hết hạn</label>
                        <input type="date" class="form-control date-exp" name="exp"/>
                        <span class="error error-date">Ngày hết hạn phải sau thời điểm hiện tại</span>
                    </div>
                    <div class="form-group">
                        <label for="discount" class="col-form-label">Giảm theo giá</label>
                        <input type="number" min="0" max="5000000" value="0" class="form-control pricediscount"  name="discount">
                        
                    </div>
                     <div class="form-group ">
                        <label for="percent" class="col-form-label">Phần trăm giảm giá</label>
                        <input type="number" min="0" max="100" value="0"  class="form-control percent-createcoupon"  name="percent">
                      
                    </div>
                    <div class="form-group form-hidden form-maxcoupon" >
                        <label for="max"    class="col-form-label">Giảm tối đa</label>
                        <input type="number" min="0" max="500000" value="0" class="form-control max-price" name="max">
                    </div>
                    <div class="form-group">
                        <label for="min"  class="col-form-label">Đơn hàng tối thiểu</label>
                        <input type="number" min="0" max="500000" value="0" class="form-control min-price" name="min">
                    </div>
                   

                    <div class="form-group">
                        <label>Nội dung</label>
                        <textarea id="areacoupon"  rows="2" class="form-control" name="description"></textarea>
                        <span  class="error error-coupon-text">Nội dung không được để trống</span>
                    </div>

                    <div class="upload-img-status">
                        <div class="gallery text-center">
                            <a id="chossefile">
                                <div class="image-frame-upload" style="border: 1px solid blue;width: 20%;height: 85px; background-repeat: no-repeat;background-size: cover;background-position: center">
                                  
                                </div>
                            </a>
                            <div class="desc "><input style="width: 100%; display: none;"  type="file" name="multipartFile" class=" img-store-register img-createcoupon"></div>
                        </div>
                    </div>
                    
                    <span class="error error-imgcreatecoupon">Bạn chưa chọn ảnh cho mã giảm giá</span>

            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" id="btn-coupon" type="submit">Thêm</button>

            </div>
            </form> 
        </div>
    </div>
</div>
<div class="modal fade" id="updateCoupon" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/coupon/updateCoupon" method="POST" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="code" class="col-form-label">Mã giảm giá</label>
                        <input type="text" class="form-control name-shipper" id="code" name="code" required>
                       <span class="error error-coupon">Mã giảm giá không được để trống</span>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-form-label">Tên:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                        
                    </div>
                    <div class="form-group">
                        <label for="exp" class="col-form-label">Ngày hiệu lực</label>
                        <input type="date" class="form-control date-exps" id="exp" name="exp">
                 
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-form-label">Nội dung</label>
                        <textarea class="form-control" id="description" name="description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="discount" class="col-form-label">Giảm theo giá</label>
                        <input type="number" min="0" max="5000000" value="0" class="form-control .pricediscount" id="discount" name="discount">
                    </div>
                     <div class="form-group">
                        <label for="percent" class="col-form-label">Phần trăm giảm giá</label>
                        <input type="number" class="form-control percent-createcoupon" min="0" max="100" value="0" id="percent" name="percent">
                    </div>
                    <div class="form-group">
                        <label for="max" class="col-form-label">Giảm tối đa</label>
                        <input type="number" min="0" max="5000000" value="0" class="form-control max-price" id="max" name="max">
                    </div>
                    <div class="form-group">
                        <label for="min" class="col-form-label">Đơn hàng tối thiểu</label>
                        <input type="number" min="0" max="5000000" value="0"  class="form-control" id="min" name="min">
                    </div>
                   

                    <div class="form-group dropdown row">
                        <label class="col-sm-4">Cửa hàng áp dụng</label>
                        <div class="col-sm-2"></div>
                        <input  type="text" class="col-sm-6  searchstore" data-toggle="dropdown"  id="dropdownMenuButton" placeholder="Hãy nhập tên cửa hàng" />
                        <textarea style="margin-top: 5px;" cols="3" class="form-control store-coupon" name="restaurants" id="restaurants"></textarea>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="max-width: 100%;height: 200px;top:68px!important;overflow: auto;">
                            <c:forEach var="item" items="${restaurants}">
                                <div class="dropdown-item">
                                    <img src="http://localhost:9032/public/image/${item.avatar}" width="25px" class="search-avatar" alt=""/>
                                    <span class="name-store">${item.name}</span>

                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="upload-img-status">
                        <div class="gallery text-center">
                            <a class="choosefile">
                                <div class="image-frame-upload" style="border: 1px solid blue;width: 20%;height: 85px; background-repeat: no-repeat;background-size: cover;background-position: center">
                                    <span class="img-hidden" style="position: absolute;color: #5b6dc8;font-size:100px;opacity: 0.7;left: 32px;bottom: -10px;cursor: pointer">+</span>
                                </div>
                            </a>
                            <div class="desc "><input style="width: 100%; display: none;"  type="file" name="multipartFile" class=" img-store-register"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary btn-upcoupon">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>



<%@include file="footer.jsp" %>