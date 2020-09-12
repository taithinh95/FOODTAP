<%-- 
    Document   : index
    Created on : Aug 1, 2020, 4:52:39 PM
    Author     : Admin
--%>

<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Index Page</title>
        <link rel="stylesheet" type="text/css" href="/public/css/sb-admin-2.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this page -->
        <link href="/public/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <img src="/public/image/logo/7bb4b065-907a-40b6-9b64-0440362db8d3_200x200.png" width="65px"/>
                    </div>
                    <div class="sidebar-brand-text mx-3">FoodTap Admin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0"/>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="/">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Biểu đồ</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider"/>
                <!-- Heading -->
                <div class="sidebar-heading">
                    Trang
                </div>


                <!-- Nav Item - user -->
                <li class="nav-item">
                    <a class="nav-link" href="/user">
                        <span>Người dùng</span></a>
                </li>
                 <!-- Nav Item - shipper -->
                <li class="nav-item">
                    <a class="nav-link" href="/foodCategory">

                        <span>Danh mục</span></a>
                </li>
                <!-- Nav Item - shipper -->
                <li class="nav-item">
                    <a class="nav-link" href="/shipper">

                        <span>Người vận chuyển</span></a>
                </li>
                <!-- Nav Item - restaurant -->
                <li class="nav-item">
                    <a class="nav-link" href="/restaurant">
                        <span>Cửa hàng</span></a>
                </li>
                <!-- Nav Item - coupon -->
                <li class="nav-item">
                    <a class="nav-link" href="/coupon">
                        <span>Mã giảm giá</span></a>
                </li>
                <!-- Nav Item - report -->
                <li class="nav-item">
                    <a class="nav-link" href="/reports">
                        <span>Báo cáo</span></a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="/newfeed">
                        <span>Bài đăng</span></a>
                </li>
                 
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block"/>

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->
