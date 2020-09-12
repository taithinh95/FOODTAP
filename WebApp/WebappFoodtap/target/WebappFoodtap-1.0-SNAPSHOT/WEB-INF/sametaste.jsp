
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<div class="container sametaste" style="margin-top: 100px">
    <div class="row">
        <div class="col-12 col-sm-12 col-md-12">
            <div class=" justify-content-between" style="width: 99%">
                <div class="profile-text-hot">
                    Bạn bè của tôi
                </div>
               
            </div>
            <div class="profile-menu-hot row">
                <c:forEach var="item" items="${friends}">
                    <div class="col-md-3  ">
                        <div class="hovereffect">
                            <a href="/user-profile/${item.user._id}" >
                                <img class="img-responsive" src="http://localhost:9032/public/image/${item.user.avatar}" alt="" />

                            </a>
                            <div class="absohovereffect">
                             
                                    <a href="/user-profile/${item.user._id}"><div style="width: 100%;font-size: 25px; color: white;font-family: auto" >${item.user.fullname}</div></a>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="justify-content-between" style="width: 99%">
                <div class="profile-text-hot">
                    Mọi người
                </div>
                
            </div>
            <div class="profile-menu-hot row">
                <c:forEach var="item" items="${users}">
                    <c:if test="${item._id!=cookie['_id'].getValue()}">
                        <div class="col-md-3  ">
                            <div class="hovereffect">
                                <a href="/user-profile/${item._id}" >
                                    <img class="img-responsive" src="http://localhost:9032/public/image/${item.avatar}" alt="" />

                                </a>
                                <div class="absohovereffect">
                                   
                                        <a href="/user-profile/${item._id}"><div style="width: 100%;font-size: 25px; color: white;font-family: auto">${item.fullname} </div></a>
                                      

                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

           
            <div class="profile-menu-near row">
                <c:forEach var="item" items="${users}">
                    <c:if test="${item._id!=cookie['_id'].getValue()}">
                        <div class="col-md-3  ">
                            <div class="hovereffect">
                                <a href="/user-profile/${item._id}" >
                                    <img class="img-responsive" src="http://localhost:9032/public/image/${item.avatar}" alt="" />
                                </a>
                                <div class="absohovereffect">
                                    
                                        <a href="/user-profile/${item._id}"><div style="width: 100%;font-size: 25px; color: white;font-family: auto">${item.fullname} </div></a>
                                    

                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
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

</body>
</html>