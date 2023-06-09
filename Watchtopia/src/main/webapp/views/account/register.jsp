<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký</title>
<link rel="icon" type="image/x-icon" href="/icon/smartwatch-app.png">
<link rel="stylesheet" href="/css/login.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand text-uppercase" href="#" style="color: red; font-size: 30px;">
				<img src="/icon/smartwatch-app.png" alt="Logo" width="50"
				height="44" class="d-inline-block align-text-top"> Watchtopia Shop
			</a>

			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"
						style="font-size: 20px; font-weight: 400;">Đăng Ký</a></li>
				</ul>
				<span class="navbar-text"> <a href="#"
					style="text-decoration: none; color: red;">Cần giúp đỡ?</a>
				</span>
			</div>
		</div>
	</nav>
	<div class="container_banner">
		<form class="form_container" action="/account/register" method="post">
			<div class="logo_container"></div>
			<div class="title_container">
				<p class="title">Đăng Ký</p>
				<span class="subtitle"> Bắt đầu với ứng dụng của chúng tôi,
					chỉ cần tạo một tài khoản và tận hưởng trải nghiệm mua sắm. </span>
			</div>
			<br>
			<div class="input_container">
				<label class="input_label" for="email_field">Họ Và Tên</label> <input
					placeholder="Your full name" name="fullname" type="text"
					class="input_field_two" id="email_field">
			</div>
			<div class="input_container">
				<label class="input_label" for="email_field">Email</label> <input
					placeholder="name@mail.com" name="email" type="email"
					class="input_field_two" id="email_field">
			</div>
			<div class="input_container">
				<label class="input_label" for="password_field">Mật Khẩu</label> <input
					placeholder="Password" name="passwords" type="password"
					class="input_field_two" id="password_field">
			</div>
			<button type="submit" class="sign-in_btn">
				<span>Đăng Ký</span>
			</button>
			<div class="input_container">
				<c:if test="${succ == true}">
					<div class="alert alert-success" role="alert">Đăng ký tài khoản thành công!</div>
				</c:if>
				<c:if test="${errorEmail == true}">
					<div class="alert alert-danger" role="alert">Đăng ký tài khoản thất bại! (email đã tồn tại.)</div>
				</c:if>
				<c:if test="${errorNull == true}">
					<div class="alert alert-danger" role="alert">Vui lòng không để trống ô nhập!</div>
				</c:if>
			</div>
			<div class="separator">
				<hr class="line">
				<span>Hoặc</span>
				<hr class="line">
			</div>
			<button title="Sign In" type="submit" class="sign-in_ggl">
				<svg height="18" width="18" viewBox="0 0 32 32"
					xmlns:xlink="http://www.w3.org/1999/xlink"
					xmlns="http://www.w3.org/2000/svg">
                <defs>
                  <path
						d="M44.5 20H24v8.5h11.8C34.7 33.9 30.1 37 24 37c-7.2 0-13-5.8-13-13s5.8-13 13-13c3.1 0 5.9 1.1 8.1 2.9l6.4-6.4C34.6 4.1 29.6 2 24 2 11.8 2 2 11.8 2 24s9.8 22 22 22c11 0 21-8 21-22 0-1.3-.2-2.7-.5-4z"
						id="A"></path>
                </defs>
                <clipPath id="B">
                  
                </clipPath>
                <g
						transform="matrix(.727273 0 0 .727273 -.954545 -1.45455)">
                  <path fill="#fbbc05" clip-path="url(#B)"
						d="M0 37V11l17 13z"></path>
                  <path fill="#ea4335" clip-path="url(#B)"
						d="M0 11l17 13 7-6.1L48 14V0H0z"></path>
                  <path fill="#34a853" clip-path="url(#B)"
						d="M0 37l30-23 7.9 1L48 0v48H0z"></path>
                  <path fill="#4285f4" clip-path="url(#B)"
						d="M48 48L17 24l-4-3 35-10z"></path>
                </g>
              </svg>
				<span> <img
					src="https://img.icons8.com/fluency/48/null/google-logo.png"
					style="width: 28px;" /> Đăng ký với Google
				</span>
			</button>
			<button type="submit" class="sign-in_apl">
				<span><img
					src="https://img.icons8.com/fluency/48/null/facebook-new.png"
					style="width: 28px;" /> Đăng ký với Facebook</span>
			</button>
			<p class="note">
				Bạn đã có tài khoản? <a href="/account/login"
					style="color: red; text-decoration: none;">Đăng Nhập</a>
			</p>
		</form>
	</div>
</body>
</html>