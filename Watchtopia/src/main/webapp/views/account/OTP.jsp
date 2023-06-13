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
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
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
		</nav>

		<form class="form-OTP" action="/account/OTP" method="post">
			<div class="title-OTP">OTP</div>
			<div class="title-OTP">Mã xác nhận</div>
			<p class="message-OTP">Chúng tôi đã gửi mã xác minh đến email của
				bạn!</p>
			<div class="inputs-OTP">
				<input id="input1-OTP" type="text" name="numberOne" maxlength="1"> <input
					id="input2-OTP" type="text" name="numberTwo" maxlength="1"> <input
					id="input3-OTP" type="text" name="numberThree" maxlength="1"> <input
					id="input4-OTP" type="text" name="numberFour" maxlength="1">
			</div>
			<button class="action-OTP">Xác minh tôi</button>
			<div class="inputs-OTP">
					<c:if test="${errorNull == true}">
						<div class="alert alert-danger" role="alert">Mã OTP không đúng!</div>
					</c:if>
				</div>
		</form>
	</div>
</body>
</html>