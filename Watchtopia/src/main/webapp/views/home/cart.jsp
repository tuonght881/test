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
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#" style="color: red; font-size: 30px;">
				<img src="/icon/smartwatch-app.png" alt="Logo" width="50"
				height="44" class="d-inline-block align-text-top"> Lucas Shop
			</a>

			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"
						style="font-size: 20px; font-weight: 400;">| Giỏ Hàng</a></li>
				</ul>
				<form class="form">
					<label for="search"> <input required="" autocomplete="off"
						placeholder="Đồng hồ nam -50%" id="search" type="text">
						<div class="icon">
							<svg stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"
								fill="none" xmlns="http://www.w3.org/2000/svg" class="swap-on">
                                <path
									d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
									stroke-linejoin="round" stroke-linecap="round"></path>
                            </svg>
							<svg stroke-width="2" stroke="currentColor" viewBox="0 0 24 24"
								fill="none" xmlns="http://www.w3.org/2000/svg" class="swap-off">
                                <path d="M10 19l-7-7m0 0l7-7m-7 7h18"
									stroke-linejoin="round" stroke-linecap="round"></path>
                            </svg>
						</div>
						<button type="reset" class="close-btn">
							<svg viewBox="0 0 20 20" class="h-5 w-5"
								xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd"
									d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
									fill-rule="evenodd"></path>
                            </svg>
						</button>
					</label>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<section class="h-100 h-custom">
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
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${cart}">
										<tr>
											<th scope="row">
												<div class="d-flex align-items-center">
													<img src="/img/${item.product_img}"
														class="img-fluid rounded-3" style="width: 120px;" alt="">
													<div class="flex-column ms-4">
														<p class="mb-2">${item.product_name}</p>
														<p class="mb-0">${item.type}</p>
													</div>
												</div>
											</th>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500;">
													<strike>300.000 VNĐ</strike>${item.product_price}</p>
											</td>
											<td class="align-middle">
												<div class="d-flex flex-row">
													<button class="btn btn-link px-2"
														onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
														<i class="fa-solid fa-minus"></i>
													</button>

													<input id="form1" min="0" name="quantity" value="2"
														type="number" class="form-control form-control-sm"
														style="width: 50px;" />

													<button class="btn btn-link px-2"
														onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
														<i class="fa-solid fa-plus"></i>
													</button>
												</div>
											</td>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500;">${item.product_price}</p>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="card shadow-2-strong mb-5 mb-lg-0"
							style="border-radius: 16px;">
							<div class="card-body p-4">

								<div class="row">
									<div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
										<form>
											<div class="d-flex flex-row pb-3">
												<div class="d-flex align-items-center pe-2">
													<input class="form-check-input" type="radio"
														name="radioNoLabel" id="radioNoLabel1v" value=""
														aria-label="..." checked />
												</div>
												<div class="rounded border w-100 p-3">
													<p class="d-flex align-items-center mb-0">
														<i class="fab fa-cc-mastercard fa-2x text-dark pe-2"></i>Thẻ
														tín dụng
													</p>
												</div>
											</div>
											<div class="d-flex flex-row pb-3">
												<div class="d-flex align-items-center pe-2">
													<input class="form-check-input" type="radio"
														name="radioNoLabel" id="radioNoLabel2v" value=""
														aria-label="..." />
												</div>
												<div class="rounded border w-100 p-3">
													<p class="d-flex align-items-center mb-0">
														<i class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Thẻ
														ghi nợ
													</p>
												</div>
											</div>
											<div class="d-flex flex-row">
												<div class="d-flex align-items-center pe-2">
													<input class="form-check-input" type="radio"
														name="radioNoLabel" id="radioNoLabel3v" value=""
														aria-label="..." />
												</div>
												<div class="rounded border w-100 p-3">
													<p class="d-flex align-items-center mb-0">
														<i class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
													</p>
												</div>
											</div>
										</form>
									</div>
									<div class="col-md-6 col-lg-4 col-xl-6">
										<div class="row">
											<div class="col-12 col-xl-6">
												<div class="form-outline mb-4 mb-xl-5">
													<input type="text" id="typeName"
														class="form-control form-control-lg" siez="17"
														placeholder="John Smith" /> <label class="form-label"
														for="typeName">Tên trên thẻ</label>
												</div>
												<div class="form-outline mb-4 mb-xl-5">
													<input type="text" id="typeExp"
														class="form-control form-control-lg" placeholder="MM/YY"
														size="7" id="exp" minlength="7" maxlength="7" /> <label
														class="form-label" for="typeExp">Hết Hạn</label>
												</div>
											</div>
											<div class="col-12 col-xl-6">
												<div class="form-outline mb-4 mb-xl-5">
													<input type="text" id="typeText"
														class="form-control form-control-lg" siez="17"
														placeholder="1111 2222 3333 4444" minlength="19"
														maxlength="19" /> <label class="form-label"
														for="typeText">Số thẻ</label>
												</div>
												<div class="form-outline mb-4 mb-xl-5">
													<input type="password" id="typeText"
														class="form-control form-control-lg"
														placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3"
														maxlength="3" /> <label class="form-label" for="typeText">Cvv</label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-xl-3">
										<div class="d-flex justify-content-between"
											style="font-weight: 500;">
											<p class="mb-2">Tổng tiền hàng</p>
											<p class="mb-2">500.000 VNĐ</p>
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
											<p class="mb-2" style="color: red;">500.000 VNĐ</p>
										</div>
										<button class="btn_DH">
											<span>Đặt Hàng</span>
										</button>
									</div>
								</div>
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
								style="font-size: 44px;" class="fa-brands fa-cc-visa"></i></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><i
								style="font-size: 44px;" class="fa-brands fa-cc-paypal"></i></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><i
								style="font-size: 44px;" class="fa-brands fa-cc-jcb"></i></a></li>
						<li class="mb-2"><a href="#" class="text-muted"><i
								style="font-size: 44px;" class="fa-brands fa-cc-amex"></i></a></li>
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
							target="_blank" title="twitter"><i
								class="fab  fa-2x fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="#" class="text-muted"
							target="_blank" title="facebook"><i
								class="fab fa-2x fa-facebook-f"></i></a></li>
						<li class="list-inline-item"><a href="#" class="text-muted"
							target="_blank" title="instagram"><i
								class="fab fa-2x fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="#" class="text-muted"
							target="_blank" title="pinterest"><i
								class="fab fa-2x fa-youtube"></i></a></li>
						<li class="list-inline-item"><a href="#" class="text-muted"
							target="_blank" title="vimeo"><i class="fab fa-2x fa-google"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr class="p-0 m-0 b-0">


		<div class="bg-light py-2">
			<div class="container text-center">
				&copy; <span id="displayYear"></span> FPT POLYTECHNIC CAN THO 2023 <a
					href="https://www.facebook.com/profile.php?id=100070215626147"
					class="text-muted">- TO QUOC TUNG PC04315</a>
			</div>
		</div>

	</footer>
</body>
</html>