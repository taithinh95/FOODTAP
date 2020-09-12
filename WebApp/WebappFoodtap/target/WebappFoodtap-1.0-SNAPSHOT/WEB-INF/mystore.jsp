<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!--modal thông báo-->
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
<div class="container" style="margin-top: 150px">
    <div class="d-flex justify-content-between">
        <h2>Quản lý cửa hàng</h2>
        <span class="tooltip-addstore">
            <a href="/registerstore" class="btn btn-danger btn-createstore" ><i class="fas fa-plus" style="margin-right: 10px;"></i>Thêm cửa hàng</a>
        </spand>
        
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>Ảnh đại diện</th>
                <th>Tên cửa hàng </th>
                <th>Trạng thái</th>
                <th>Người sở hữu</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${listRestaurants}">
                <tr class="store-count">
                    <td><img height="100" width="100" src="http://localhost:9032/public/image/${item.avatar}" /></td>
                    <td>${item.name}</td>
                    <td>${item.verified?"Hoạt động":"Chưa có giấy phép"}</td>
                    <td><a href="/user-profile/${item.managers[0].user._id}">${item.managers[0].user.fullname}</a></td>
                    <td><div style="width: 120px"><a href="/manageMyRestaurant/${item._id}" class="btn btn-outline-danger form-control">Quản lý</a></div></td>
                    <td><div style="width: 120px"><a href="/store-profile/${item._id}" class="btn btn-outline-primary form-control">Trang</a></div></td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

</div>
<!--Bootstrap-->
<script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
<script src="/public/js/jquery/jquery.min.js"></script>
<script src="/public/js/bootstrap/popper.min.js "></script>
<script src="/public/js/bootstrap/bootstrap.min.js "></script>
<script src="/public/js/swiper.min.js "></script>
<script src="http://localhost:9032/socket.io/socket.io.js"></script>
<script src="/public/js/script.js "></script>
</body>
</html>
