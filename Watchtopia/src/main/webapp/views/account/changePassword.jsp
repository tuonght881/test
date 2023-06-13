<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Quên Mật Khẩu</title>
<link rel="icon" type="image/x-icon" href="/icon/smartwatch-app.png">
<link rel="stylesheet" href="/css/forgetPassword.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/responsive.css">
</head>
<body>
	<div class="cover">
		<!-- <nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand text-uppercase" href="#"
					style="color: red; font-size: 30px;"> <img
					src="/icon/smartwatch-app.png" alt="Logo" width="50" height="44"
					class="d-inline-block align-text-top"> Watchtopia Shop
				</a>

				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#"
							style="font-size: 20px; font-weight: 400;">Quên Mật Khẩu</a></li>
					</ul>
					<span class="navbar-text"> <a href="#"
						style="text-decoration: none; color: red;">Cần giúp đỡ?</a>
					</span>
				</div>
			</div>
		</nav> -->
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<a class="navbar-brand" href="/home/watch"
						style="margin-left: 15px;"> <span class="text-uppercase">
							Watchtopia Shop </span>
					</a>
				</ul>
				<span class="navbar-text"> <a href="#"
					style="text-decoration: none; color: red;">Cần giúp đỡ?</a>
				</span>
			</div>
		</div>
	</nav>

		<div class="form-box">
			<form class="form-change" action="/account/changePassword"
				method="post">
				<span class="title-change">Đổi Mật Khẩu</span> <span
					class="subtitle-change">Vui lòng không chia sẻ mật khẩu.</span>
				<div class="form-container-change">
					<input type="password" class="input-change" name="passwords"
						placeholder="Mật khẩu mới"> <input type="password"
						class="input-change" name="passwordsTwo"
						placeholder="Nhập lại mật khẩu">
				</div>
				<button>Đổi mật khẩu</button>
				<div class="form-container-change">
					<c:if test="${succ == true}">
						<div class="alert alert-success" role="alert">Đổi mật khẩu thành công!</div>
					</c:if>
					<c:if test="${errorNull == true}">
						<div class="alert alert-danger" role="alert">Xác nhận mật
							khẩu không đúng!</div>
					</c:if>
				</div>
			</form>
			<div class="form-section-change">
				<p>
					Bạn đã có tài khoản? <a href="/account/login">Đăng nhập</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>