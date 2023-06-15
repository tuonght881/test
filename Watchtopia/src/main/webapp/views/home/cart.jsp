<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ Hàng</title>
<link rel="icon" type="image/x-icon" href="/icon/smartwatch-app.png">
<link rel="stylesheet" href="/css/shell.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/index.css">
</head>

<body>
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

	<div class="container">
		<section class="h-100 h-custom">
		<c:if test="${addressNull == true}">
				<div class="notification">
					<div class="toast-war warning-war">
						<i class="fa-solid fa-triangle-exclamation"></i>
						<div class="content">
							<div class="title-war">Cảnh Báo!</div>
							<span>Bạn chưa nhập đủ thông tin nhận hàng.</span>
						</div>
					</div>
				</div>
			</c:if>
			<div class="container h-100 py-5">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col">

						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th scope="col" class="h5">Sản Phẩm</th>
										<th scope="col">Đơn Giá</th>
										<th scope="col">Số Lượng</th>
										<th scope="col">Thành Tiền</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${cart}">
										<tr>
											<th scope="row">
												<div class="d-flex align-items-center">
													<img src="/img/${item.product.product_img}"
														class="img-fluid rounded-3" style="width: 120px;" alt="">
													<div class="flex-column ms-4">
														<p class="mb-2">${item.product.product_name}</p>
														<p class="mb-0">${item.product.type.types_name}</p>
													</div>
												</div>
											</th>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500;">
													${item.product.product_price}</p>
											</td>
											<td class="align-middle">
												<div class="d-flex flex-row">
													<a class="btn btn-link px-2"
														href="/cart/update?id=${item.product.product_id}&action=tru"
														onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
														<i class="fa-solid fa-minus"></i>
													</a> <input id="form1" min="1" name="quantitys"
														value="${item.quantity}" type="number"
														class="form-control form-control-sm" style="width: 50px;" />

													<a class="btn btn-link px-2"
														href="/cart/update?id=${item.product.product_id}&action=cong"
														onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
														<i class="fa-solid fa-plus"></i>
													</a>
												</div>
											</td>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500;">${item.product.product_price * item.quantity}</p>
											</td>
											<td class="align-middle"><a
												href="/cart/remove/${item.product.product_id}">Xoá</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="card shadow-2-strong mb-5 mb-lg-0"
							style="border-radius: 16px;">
							<div class="card-body p-4">
								<form action="/cart/pay" method="post">
									<div class="row">
										<div class="col-md-9 col-lg-4 col-xl-9">
											<div class="row">
												<div class="col-12 col-xl-12">
													<div class="form-outline mb-4 mb-xl-5">
														<label class="form-label" for="typeExp">Tên Người Nhận
														</label> 
														<input type="text" id="typeExp" name="fullname"
															class="form-control form-control-lg" placeholder="Tên người nhận"
															id="exp" />
													</div>
													<div class="form-outline mb-4 mb-xl-5">
														<label class="form-label" for="typeExp">Số Điện Thoại
														 </label> <input type="text" id="typeExp" name="phone"
															class="form-control form-control-lg" placeholder="Số điện thoại"
															/>
													</div>

													<div class="form-outline mb-4 mb-xl-5">
														<label class="form-label" for="typeName">Địa chỉ</label>
														<textarea rows="" cols="" id="typeName" name="address"
															class="form-control form-control-lg" placeholder="Địa chỉ"></textarea>
													</div>

												</div>
											</div>
										</div>
										<div class="col-lg-4 col-xl-3">
											<div class="d-flex justify-content-between"
												style="font-weight: 500;">
												<p class="mb-2">Tổng tiền hàng</p>
												<p class="mb-2">${sum}VNĐ</p>
											</div>
											<div class="d-flex justify-content-between"
												style="font-weight: 500;">
												<p class="mb-0">Phí vận chuyển</p>
												<p class="mb-0">0 VNĐ</p>
											</div>
											<hr class="my-4">
											<div class="d-flex justify-content-between mb-4"
												style="font-weight: 500;">
												<p class="mb-2">Tổng Thanh Toán</p>
												<p class="mb-2" style="color: red;">${sum}VNĐ</p>
											</div>
											<button class="btn_DH">
												<span>Đặt Hàng</span>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<footer class="bg-white" style="border-top: 3px solid orange;">
		<div class="container py-5">
			<div class="row py-3">

				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">CHĂM SÓC
						KHÁCH HÀNG</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Trung Tâm
								Trợ Giúp</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Hướng Dẫn
								Mua Hàng</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Hướng Dẫn
								Bán Hàng</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Thanh
								Toán</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Vận
								Chuyển</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Trả Hàng
								& Hoàn Tiền</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Chính
								Sách Bảo Hành</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Về Lucas Shop</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted">Giới
								Thiệu Về Lucas Shop Việt Nam</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Tuyển
								Dụng</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Điều Kiện
								Lucas Shop</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Chính
								Sách Bảo Mật</a></li>
						<li class="mb-2"><a href="#" class="text-muted">Chính
								Hãng</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Thanh Toán</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted"><i
								style="font-size: 44px;" class="fa-solid fa-truck"></i></a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">Vận Chuyển</h6>
					<ul class="list-unstyled mb-0">
						<li class="mb-2"><a href="#" class="text-muted"><img
								src="https://down-vn.img.susercontent.com/file/5e7282bd0f7ee0872fdb0bd1d40fbe9e"
								alt=""></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><img
								src="https://down-vn.img.susercontent.com/file/d10b0ec09f0322f9201a4f3daf378ed2"
								alt=""></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><img
								src="https://down-vn.img.susercontent.com/file/0d349e22ca8d4337d11c9b134cf9fe63"
								alt=""></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><img
								src="https://down-vn.img.susercontent.com/file/b8348201b4611fc3315b82765d35fc63"
								alt=""></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><img
								src="https://down-vn.img.susercontent.com/file/3900aefbf52b1c180ba66e5ec91190e5"
								alt=""></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><img
								src="https://down-vn.img.susercontent.com/file/77bf96a871418fbc21cc63dd39fb5f15"
								alt=""></a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 mb-lg-0">
					<h6 class="text-uppercase font-weight-bold mb-4">THEO DÕI
						CHÚNG TÔI TRÊN</h6>
					<ul class="list-inline mt-4">
						<li class="list-inline-item"><a href="#" class="text-muted"
							target="_blank" title="facebook"><i
								class="fab fa-2x fa-facebook-f"></i></a></li>
						<li class="list-inline-item"><a href="#" class="text-muted"
							target="_blank" title="instagram"><i
								class="fab fa-2x fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr class="p-0 m-0 b-0">


		<div class="bg-light py-2">
			<div class="container text-center">
				&copy; <span id="displayYear"></span> FPT POLYTECHNIC CAN THO 2023
			</div>
		</div>

	</footer>
	
	<script src="/js/notification.js"></script>
</body>
</html>