<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include  file="header.jsp" %>
<c:set var="idUser" value="${cookie['_id'].getValue()}" />
<jsp:useBean id="idUser" type="java.lang.String" />


<div class="container-fluid h-100 " style="margin-top: -20px">
    <div class="row justify-content-center h-100">
        <div class="col-md-4 col-xl-3 chat">
            <div class="card mb-sm-3 mb-md-0 contacts-card">
                <div class="card-header">
                    <div class="input-group">
                        <input type="text" placeholder="Search..." name="" class="form-control search" />
                        <div class="input-group-prepend">
                            <button type="button" class="input-group-text search-btn"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </div>
                <div class="card-body contacts-body">
                    <ui class="contacts">
                        <c:forEach var="item" items="${chatters}">
                            <li class="rounded li-item-chat" idValue="${item.user._id}">
                                <div class="d-flex bd-highlight">
                                    <div class="img-cont">
                                        <img src="http://localhost:9032/public/image/${item.user.avatar}" class="rounded-circle user-img" />
                                    </div>
                                    <div class="user-info">
                                        <span>${item.user.fullname}</span>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ui>
                </div>
                <div class="card-footer"></div>
            </div>
        </div>
        <div class="col-md-8 col-xl-6 chat" id="chatbox">
            <div class="card">
                <div class="card-header msg-head">
                    <div class="d-flex bd-highlight">
                        <div class="img-cont">
                            <img  class="rounded-circle user-img" />
                            <span class="online-icon"></span>
                        </div>
                        <div class="user-info">
                            <span></span>
                        </div>
                    </div>
                    <div class="dropleft action-menu-btn">
                        <button data-toggle="dropdown"><i class="fas fa-ellipsis-v"></i></button>
                        <div class="action-menu dropdown-menu">
                            <ul>
                                <a href="#">
                                    <li class="dropdown-item"><i class="fas fa-user-circle"></i> Trang cá nhân</li>
                                </a>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="card-body msg-card-body">
                    
                </div>
                
                <div class="card-footer">
                    <div class="input-group">
                        <textarea id="type_msg" class="form-control type-msg" placeholder="Type your message..."></textarea>
                        <div class="input-group-append">
                            <span id="send_btn" class="input-group-text send-btn"><i class="fas fa-location-arrow"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<p style="display:none" id="idTag"><%= idUser %></p>
<!--Bootstrap-->
<script src="/public/js/bootstrap/jquery-3.5.1.slim.min.js "></script>
<script src="/public/js/jquery/jquery.min.js "></script>
<script src="/public/js/bootstrap/popper.min.js "></script>
<script src="/public/js/bootstrap/bootstrap.min.js "></script>
<script src="/public/js/swiper.min.js "></script>
<script src="http://localhost:9032/socket.io/socket.io.js"></script>
<script src="/public/js/script.js "></script>
</body>
</html>