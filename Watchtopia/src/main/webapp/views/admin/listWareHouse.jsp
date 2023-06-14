<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản Phẩm</title>
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
			<a href="/home/watch" class="logo d-flex align-items-center"> <img
				src="/icon/smartwatch-app.png" alt="/home/watch"> <span
				class="d-none d-lg-block text-uppercase">Watchtopia</span>
			</a> <i class="fa-solid fa-bars-staggered toggle-sidebar-btn"
				style="font-size: 25px;"></i>
		</div>
		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Tìm kiếm ...">
				<button type="submit" title="Search">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="fa-solid fa-magnifying-glass"></i>
				</a></li>

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="/icon/avatarNEW.png" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">${username.fullname}</span>
				</a>

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${username.email}</h6> <span>Admin</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href=""> <i class="fa-solid fa-circle-user"></i> <span>Trang
									Cá Nhân</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href=""> <i class="fa-solid fa-user-gear"></i> <span>Cài
									Đặt</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href=""> <i class="fa-solid fa-circle-question"></i> <span>Cần
									Hỗ Trợ ?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="/account/logout"> <i
								class="fa-solid fa-arrow-right-from-bracket"></i> <span>Đăng
									Xuất</span>
						</a></li>

					</ul></li>
			</ul>
		</nav>
	</header>

	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link " href="/admin/thongke">
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
                        <a href="/product/addproduct">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Thêm Sản Phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="/product/UpdateProduct">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Cập Nhật Sản Phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/inventory">
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
                        <a href="/product/listproduct">
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
                        <a href="/admin/userlist">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Danh Sách Tài Khoản</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/historylogs">
                            <i class="fa-solid fa-caret-right" style="font-size: 15px;"></i><span>Lịch Sử Đănh Nhập</span>
                        </a>
                    </li>
                </ul>
            </li>

			<hr>

			<li class="nav-item"><a class="nav-link collapsed"
				href="/home/profile"> <i class="fa-solid fa-circle-user"></i> <span>Trang
						Cá Nhân</span>
			</a></li>
		</ul>
	</aside>



    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Kho</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/Statistics.html">Trang Chủ</a></li>
                    <li class="breadcrumb-item"><a href="/Statistics.html">Sản Phẩm</a></li>
                    <li class="breadcrumb-item active">Kho</li>
                </ol>
            </nav>
        </div>
        <section class="section dashboard">
            <div class="row">
                <div class="col-xl-12">
                    <table class="table table-dark table-striped table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Mã</th>
                                <th scope="col">Tên Sản Phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Mô Tả</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Đồng Hồ LC Cao Cấp</td>
                                <td>1 000 000</td>
                                <td>Đồng hồ nam Thông minh </td>
                                <td><a href="#">Cập nhật</a></td>
                            </tr>
                            <tr>
                                <th scope="row">1</th>
                                <td>Đồng Hồ LC Cao Cấp</td>
                                <td>1 000 000</td>
                                <td>Đồng hồ nam Thông minh </td>
                                <td><a href="#">Cập nhật</a></td>
                            </tr>
                            <tr>
                                <th scope="row">1</th>
                                <td>Đồng Hồ LC Cao Cấp</td>
                                <td>1 000 000</td>
                                <td>Đồng hồ nam Thông minh </td>
                                <td><a href="#">Cập nhật</a></td>
                            </tr>
                            <tr>
                                <th scope="row">1</th>
                                <td>Đồng Hồ LC Cao Cấp</td>
                                <td>1 000 000</td>
                                <td>Đồng hồ nam Thông minh </td>
                                <td><a href="#">Cập nhật</a></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="card">
                        <div class="card-body pt-3">
                            <ul class="nav nav-tabs nav-tabs-bordered">
                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#addProduct">Cập Nhật Kho Sản Phẩm</button>
                                </li>
                            </ul>
                            <div class="tab-content pt-2">
                                <div class="tab-pane fade show active pt-3" id="addProduct">
                                    <form>
                                        <div class="row mb-3">
                                            <label for="" class="col-md-4 col-lg-3 col-form-label">Hình ảnh</label>
                                            <div class="col-md-8 col-lg-9">
                                                <img src="/img/w1.png" alt="" style="width: 10%;">

                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Tên Sản Phẩm</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="fullName" type="text" class="form-control" id="fullName" placeholder="Tên sản phẩm">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="price" class="col-md-4 col-lg-3 col-form-label">Số Lượng</label>
                                            <div class="col-md-8 col-lg-9">
                                                <input name="price" type="text" class="form-control" id="price">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="Country" class="col-md-4 col-lg-3 col-form-label"></label>
                                            <div class="col-md-8 col-lg-9">
                                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
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