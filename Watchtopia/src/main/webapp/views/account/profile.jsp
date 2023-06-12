<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
					<img src="/icon/avatarNEW.png" alt=""
						class="img-fluid rounded-circle">
					<h1 class="text-light">
						<a href="index.html">Lucas BC</a>
					</h1>
					<div class="social-links mt-3 text-center">
						<a href="#" class="facebook"><i
							class="fa-brands fa-facebook-f"></i></a> <a href="#"
							class="instagram"><i class="fa-brands fa-instagram"></i></a>
					</div>
				</div>
				<nav id="navbar" class="nav-menu navbar">
					<ul>
						<li><a href="#about" class="nav-link scrollto active"><i
								class="fa-solid fa-user text-white"></i> <span>Thông Tin
									Cá Nhân</span></a></li>
						<li><a href="/account/logout" class="nav-link scrollto"><i
								class="fa-solid fa-arrow-right-from-bracket text-white"></i> <span>Đăng
									Xuất</span></a></li>
					</ul>
				</nav>
			</div>
		</header>

		<main id="main">
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="navbarText">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<a class="navbar-brand" href="/home/watch"
								style="margin-left: 15px;"> <strong class="text-uppercase">
									Watchtopia Shop </strong>
							</a>
						</ul>
						<span class="navbar-text"> <a href="#"
							style="text-decoration: none; color: red;">Cần giúp đỡ?</a>
						</span>
					</div>
				</div>
			</nav>
			<br>
			<section id="about" class="about">

				<div class="container">
					<h3>
						<i class="fa-solid fa-grip-lines-vertical"></i> Thông Tin Cá Nhân
					</h3>
					<div class="card mb-12" style="margin: 10px 0 10px 0;">
						<div class="row g-0">
							<div class="col-md-2" style="padding: 10px;">
								<img src="/icon/avatarNEW.png" class="img-fluid rounded-start"
									alt="avatarNEW">
							</div>
							<div class="col-md-10" style="padding: 10px;">
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><i class="fa-solid fa-user"></i>
										<strong>${user.fullname}</strong></li>
									<li class="list-group-item"><i class="fa-solid fa-phone"></i>
										${user.phone}</li>
									<li class="list-group-item"><i
										class="fa-solid fa-envelope"></i> ${user.email}</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="col-sm-8">
						<h3>
							<i class="fa-solid fa-grip-lines-vertical"></i> Cập Nhật Thông
							Tin Cá Nhân
						</h3>
						<form action="/account/updateinfo" method="post"
							class="container-update-proflie">
							<div class="row">
								<div class="col-sm-12">
									<div class="row">
										<div class="col">
											<label for="">Họ và tên</label> <input type="text"
												name="fullname" value="${user.fullname}"
												class="form-control" placeholder="Fullname">
										</div>
										<div class="col">
											<label for="">Email</label> <input type="text" name="email"
												value="${user.email}" class="form-control"
												placeholder="Email" disabled>
										</div>
									</div>
									<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
										<div class="col">
											<label for="">Số điện thoại</label> <input type="text"
												name="phone" value="${user.phone }" class="form-control"
												placeholder="Phone">
										</div>
										<div class="col">
											<label for="">Mật khẩu</label> <input type="text"
												name="passwords" value="${user.passwords}"
												class="form-control" placeholder="khongcomatkhau" disabled>
										</div>
										<div style="padding-top: 15px">
											<button type="submit"
												class="btn btn-outline-secondary btn-update">Cập
												nhật</button>
										</div>
									</div>
									<div>
										<c:if test="${succ == true}">
											<div class="alert alert-success" role="alert">Cập nhật
												thành công</div>
										</c:if>
									</div>

								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
			<br>

			<div class="container ">
				<h3>
					<i class="fa-solid fa-grip-lines-vertical"></i> Đổi Mật Khẩu
				</h3>
				<form action="/account/changepasspro" method="post"
					class="container-update-proflie" style="margin-bottom: 120px;">
					<strong>Đổi Mật Khẩu</strong><br>
					<p>Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu với
						bất kỳ ai.</p>
					<hr>
					<div class="row mb-3">
						<label for="inputEmail3" class="col-sm-2 col-form-label">Mật
							khẩu cũ</label>
						<div class="col-sm-10">
							<input type="text" name="pass" class="form-control"
								id="inputEmail3">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label">Mật
							khẩu mới</label>
						<div class="col-sm-10">
							<input type="password" name="np" class="form-control"
								id="inputPassword3">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label">Nhập
							lại mật khẩu mới</label>
						<div class="col-sm-10">
							<input type="password" name="np2" class="form-control"
								id="inputPassword3">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label"></label>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-outline-secondary">Xác
								nhận</button>
						</div>
					</div>
					<div>
						<c:if test="${succRP == true}">
							<div class="alert alert-success" role="alert">Cập nhật
								thành công</div>
						</c:if>
						<c:if test="${errorNullRP == true}">
							<div class="alert alert-danger" role="alert">Cập nhật thất
								bại</div>
						</c:if>
					</div>
					<hr>
					<a href="/account/forgetPassword"
						style="text-decoration: none; color: rgb(103, 103, 103);">
						<p class="text-center">Bạn quên mật khẩu?</p>
					</a>
				</form>
			</div>
			<hr style="color: orange; height: 5px; background-color: orange;">
		</main>
	</div>
	<div class="backTop">
		<button onclick="topFunction()" id="totop" title="Go to top">
			<i class="fa-solid fa-arrow-up"></i>
		</button>
	</div>
	<script src="/js/backTop.js"></script>
</body>
</html>