<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê</title>
    <link rel="icon" type="image/x-icon" href="/icon/statustic.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/statustics.css">
    <script src="/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>

<body>
    <header id="header" class="header fixed-top d-flex align-items-center">
        <div class="d-flex align-items-center justify-content-between">
            <a href="index.html" class="logo d-flex align-items-center">
                <img src="/icon/smartwatch-app.png" alt="">
                <span class="d-none d-lg-block">LUCAS SHOP</span>
            </a>
            <i class="fa-solid fa-bars-staggered toggle-sidebar-btn" style="font-size: 25px;"></i>
        </div>
        <div class="search-bar">
            <form class="search-form d-flex align-items-center" method="POST" action="#">
                <input type="text" name="query" placeholder="Tìm kiếm ...">
                <button type="submit" title="Search"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">
                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link nav-icon search-bar-toggle " href="#">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </a>
                </li>

                <li class="nav-item dropdown pe-3">
                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                        <img src="/icon/avatarNEW.png" alt="Profile" class="rounded-circle">
                        <span class="d-none d-md-block dropdown-toggle ps-2">Lucas</span>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                        <li class="dropdown-header">
                            <h6>Lucas - Tung</h6>
                            <span>Admin</span>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="">
                                <i class="fa-solid fa-circle-user"></i>
                                <span>Trang Cá Nhân</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="">
                                <i class="fa-solid fa-user-gear"></i>
                                <span>Cài Đặt</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="">
                                <i class="fa-solid fa-circle-question"></i>
                                <span>Cần Hỗ Trợ ?</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="/account/logout">
                                <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                <span>Đăng Xuất</span>
                            </a>
                        </li>

                    </ul>
                </li>
            </ul>
        </nav>
    </header>

    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link " href="">
                    <i class="fa-regular fa-clipboard"></i>
                    <span>Thống Kê</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                    <i class="fa-solid fa-clock"></i><span>Sản Phẩm</span>
                    <i class="fa-solid fa-caret-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Thêm Sản Phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Cập Nhật Sản Phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Nhập Kho Sản Phẩm</span>
                        </a>
                    </li>
                </ul>
            </li>


            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                    <i class="fa-solid fa-table-list"></i><span>Danh Sách</span>
                    <i class="fa-solid fa-caret-down ms-auto"></i>
                </a>
                <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Danh Sách Sản Phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Danh Sách Kho</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#listUsers-nav" data-bs-toggle="collapse" href="#">
                    <i class="fa-solid fa-users"></i><span>Người Dùng</span>
                    <i class="fa-solid fa-caret-down ms-auto"></i>
                </a>
                <ul id="listUsers-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Danh Sách Tài Khoản</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Lịch Sử Đănh Nhập</span>
                        </a>
                    </li>
                </ul>
            </li>

            <hr>

            <li class="nav-item">
                <a class="nav-link collapsed" href="profile.html">
                    <i class="fa-solid fa-circle-user"></i>
                    <span>Trang Cá Nhân</span>
                </a>
            </li>
        </ul>
    </aside>


    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Thống Kê</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/Statistics.html">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Thống Kê</li>
                </ol>
            </nav>
        </div>
        <section class="section dashboard">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card mb-3" style="max-width: 540px; background-color:white">
                            <div class="row g-0">
                                <div class="col-md-4 card-">
                                    <i class="fa-regular fa-eye fai" style="font-size: 30px; color: rgb(164, 164, 164);"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title" style="color: blue; font-weight: 600;">1,500</h5>
                                        <p class="card-text" style="color: gray;">Lượt xem</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4 card-">
                                    <i class="fa-solid fa-cart-shopping fai" style="font-size: 30px; color: rgb(164, 164, 164);"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title" style="color: blue; font-weight: 600;">1,500</h5>
                                        <p class="card-text" style="color: gray;">Lượt bán</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4 card-">
                                    <i class="fa-regular fa-comments fai" style="font-size: 30px; color: rgb(164, 164, 164);"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title" style="color: blue; font-weight: 600;">1,500</h5>
                                        <p class="card-text" style="color: gray;">Bình luận</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card text-bg-primary mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4 card-">
                                    <i class="fa-solid fa-money-bills fai" style="font-size: 30px;"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title" style="font-weight: 600;">$5,500</h5>
                                        <p class="card-text">Doanh thu</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total Quantity</th>
                            <th scope="col">Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${listTK }" varStatus="loop">
                        <tr>
                            <th scope="row">${loop.index }</th>
                            <td>${item.name }</td>
                            <td>${item.price }</td>
                            <td>${item.total_qty }</td>
                            <td>${item.total_qty * item.price }</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

    </main>

    <footer id="footer" class="footer">
        <div class="copyright">
            &copy; CAO ĐẲNG THỰC HÀNH FPT POLYTECHNIC CƠ SỞ CẦN THƠ 2023
        </div>
        <div class="credits">

            Designed by <a href="/memberInformation.html">Tùng - Thiên - Tường - Phát - Hào</a>
        </div>
    </footer>
    <div class="backTop">
        <button onclick="topFunction()" id="totop" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
    </div>

    <script src="/js/statistics.js"></script>
    <script src="/js/backTop.js"></script>
</body>

</html>