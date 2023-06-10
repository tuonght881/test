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

		<div class="popup">
			<form class="form" action="/account/forgetPassword" method="post">
				<div class="icon">
					<img src="/icon/smartwatch-app.png" alt="">
				</div>
				<div class="note">
					<label class="title">Quên mật khẩu?</label> <span class="subtitle">Vì
						vấn đề bảo mật, vui lòng không chia sẻ mật khẩu với người khác.</span>
				</div>
				<input placeholder="Enter your e-mail" title="Enter your e-mail"
					name="email" type="email" class="input_field">
				<button class="submit">Gửi</button>
				<div class="w-100">
					<c:if test="${errorNull == true}">
						<div class="alert alert-danger" role="alert">Email không tồn
							tại!</div>
					</c:if>
				</div>
			</form>
		</div>
	</div>
</body>

</html>