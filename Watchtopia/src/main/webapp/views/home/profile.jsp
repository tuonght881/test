<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Cá Nhân</title>
<link rel="shortcut icon" href="/icon/smartwatch-app.png"
	type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="/css/profile.css">
<link rel="stylesheet" href="/css/responsive.css">

<script src="/js/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
	integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
	integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
	crossorigin="anonymous"></script>
</head>
<body>
    <div class="cover">
        <header id="header">
            <div class="d-flex flex-column">
                <div class="profile">
                    <img src="/icon/avatarNEW.png" alt="" class="img-fluid rounded-circle">
                    <h1 class="text-light"><a href="index.html">Lucas BC</a></h1>
                    <div class="social-links mt-3 text-center">
                        <a href="https://tungle04.bio.link/" class="twitter"><i class="fa-brands fa-twitter"></i></a>
                        <a href="#" class="facebook"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="instagram"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#" class="google-plus"><i class="fa-brands fa-tiktok"></i></a>
                        <a href="https://www.youtube.com/channel/UCJBe9YBO5qVgwlmkDyN9q6A" class="linkedin"><i class="fa-brands fa-youtube"></i></a>
                    </div>
                </div>
                <nav id="navbar" class="nav-menu navbar">
                    <ul>
                        <li><a href="#about" class="nav-link scrollto active"><i class="fa-solid fa-user text-white"></i> <span>Thông Tin Cá Nhân</span></a></li>
                        <li><a href="#updateProflie" class="nav-link scrollto"><i class="fa-solid fa-pen-to-square text-white"></i> <span>Cập Nhật Thông Tin Cá Nhân</span></a></li>
                        <li><a href="#passwordUpdate" class="nav-link scrollto"><i class="fa-solid fa-passport text-white"></i> <span>Đổi Mật Khẩu</span></a></li>
                        <li><a href="/account/logout" class="nav-link scrollto"><i class="fa-solid fa-arrow-right-from-bracket text-white"></i> <span>Đăng Xuất</span></a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main id="main">
            <section id="about" class="about">

                <div class="container">
                    <h3><i class="fa-solid fa-grip-lines-vertical"></i> Thông Tin Cá Nhân</h3>
                    <div class="card mb-12" style="margin: 10px  0 10px 0;">
                        <div class="row g-0">
                            <div class="col-md-2" style="padding: 10px;">
                                <img src="/icon/avatarNEW.png" class="img-fluid rounded-start" alt="avatarNEW">
                            </div>
                            <div class="col-md-10">
                                <div class="card-body">
                                    <h5 class="card-title">${user.fullname}</h5>
                                    <p class="card-text">Sinh Viên Công Nghệ Thông Tin</p>
                                    <p class="card-text"><small class="text-body-secondary">Cập nhật 3 tiếng trước</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="card" style="width: 18rem;">
                                <div class="card-header">
                                    <i class="fa-solid fa-mobile"></i> Liên Hệ
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><i class="fa-solid fa-phone"></i> 083 856 5542</li>
                                    <li class="list-group-item"><i class="fa-solid fa-envelope"></i>${user.email}</li>
                                    <li class="list-group-item"><i class="fa-solid fa-location-dot"></i> Khóm 6A thị trấn sông đốc</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="card" style="width: 18rem;">
                                <div class="card-header">
                                    <i class="fa-solid fa-heart"></i> Sở Thích
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><i class="fa-solid fa-gamepad"></i> Liên Quân</li>
                                    <li class="list-group-item"><i class="fa-solid fa-table-tennis-paddle-ball"></i> Đánh Cầu Lông</li>
                                    <li class="list-group-item"><i class="fa-solid fa-book-open"></i> Đọc Sách</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <form action="" method="post">
                                <div class="row">
                                    <div class="col">
                                        <label for="">Họ và tên</label>
                                        <input type="text" name="fullname" value="${user.fullname}" class="form-control" placeholder="Tô Quốc Tùng">
                                    </div>
                                    <div class="col">
                                        <label for="">Email</label>
                                        <input type="text" name="email" value="${user.email}" class="form-control" placeholder="tungto753@gmail.com">
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px;">
                                    <div class="col">
                                        <label for="">Số điện thoại</label>
                                        <input type="text" name="phone" value="${user.phone}" class="form-control" placeholder="tungto753">
                                    </div>
                                    <div class="col">
                                        <label for="">Mật khẩu</label>
                                        <input type="text" name="passwords" value="${user.passwords}" class="form-control" placeholder="khongcomatkhau">
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <section id="updateProflie" class="updateProflie">
                <div class="container ">
                    <h3><i class="fa-solid fa-grip-lines-vertical"></i> Cập Nhật Thông Tin Cá Nhân</h3>
                    <form action="" method="post" class="container-update-proflie">
                        <div class="row">
                            <div class="col-sm-4">
                                <img src="/icon/avatarNEW.png" class="img-thumbnail" alt="..." style="width: 70%;padding: 10px; border: none;">
                            </div>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col">
                                        <label for="">Họ và tên</label>
                                        <input type="text" name="fullname" value="${user.fullname}" class="form-control" placeholder="Tô Quốc Tùng">
                                    </div>
                                    <div class="col">
                                        <label for="">Email</label>
                                        <input type="text" name="email" value="${user.email}" class="form-control" placeholder="tungto753@gmail.com">
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px; margin-bottom: 20px;">
                                    <div class="col">
                                        <label for="">Số điện thoại</label>
                                        <input type="text" name="phone" value="${user.phone}" class="form-control" placeholder="tungto753">
                                    </div>
                                    <div class="col">
                                        <label for="">Mật khẩu</label>
                                        <input type="text" name="passwords" value="${user.passwords}" class="form-control" placeholder="khongcomatkhau">
                                    </div>
                                </div>
                                <button type="button" class="btn btn-outline-secondary btn-update">Cập nhật</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <section id="passwordUpdate">
                <div class="container ">
                    <h3><i class="fa-solid fa-grip-lines-vertical"></i> Đổi Mật Khẩu</h3>
                    <form action="" method="get" class="container-update-proflie" style="margin-bottom: 120px;">
                        <strong>Đổi Mật Khẩu</strong><br>
                        <p>Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu với bất kỳ ai.</p>
                        <hr>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Mật khẩu cũ</label>
                            <div class="col-sm-10">
                                <input type="text" name="passwords" class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">Mật khẩu mới</label>
                            <div class="col-sm-10">
                                <input type="password" name="passwordsNew" class="form-control" id="inputPassword3">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">Nhập lại mật khẩu mới</label>
                            <div class="col-sm-10">
                                <input type="password" name="passwordsNew2" class="form-control" id="inputPassword3">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputPassword3" class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10">
                                <button type="button" class="btn btn-outline-secondary">Xác nhận</button>
                            </div>
                        </div>
                        <hr>
                        <a href="/account/forgetPassword" style="text-decoration: none; color:rgb(103, 103, 103);">
                            <p class="text-center">Bạn quên mật khẩu?</p>
                        </a>
                    </form>
                </div>
                <hr style="color:orange; height:5px; background-color: orange;">
            </section>
        </main>
    </div>
    <div class="backTop">
        <button onclick="topFunction()" id="totop" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
    </div>
    <script src="/js/backTop.js"></script>
</body>
</html>