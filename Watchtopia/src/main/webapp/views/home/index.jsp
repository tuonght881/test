<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<link rel="icon" type="image/x-icon" href="/icon/smartwatch-app.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/CardMagic.css">
<link rel="stylesheet" href="/css/chatBox.css">
<link rel="stylesheet" href="/css/responsive.css">
<link rel="stylesheet" href="/css/loading.css">

<script src="/js/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="cover">
		<!-- menu  -->
		<header class="header_section">
			<div class="container-fluid">
				<div class="row no-gutters" style="height: 15px;">
					<div class="col-12 col-sm-6 col-md-8" style="margin-top: -20px;">
						<ul class="nav nav-top">
 							<c:if test="${hidden == false}">
								<li class="nav-item nav_item"><a
									class="nav-link nav_link active" href="/account/login"
									style="color: rgb(0, 0, 0);">Đăng nhập</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/account/register" style="color: rgb(0, 0, 0);">Đăng
										ký</a></li>
							</c:if>
						</ul>
					</div>
					<div class="col-6 col-md-4" style="margin-top: -20px;">
						<ul class="nav" style="float: right;">
							<li class="nav-item dropdown"><a href="#" class="nav-link"
								style="color: rgb(0, 0, 0);">Ngôn ngữ</a>
								<div class="dropdown-content">
									<a class="dropdown-item" href="#">Việt Nam</a> <a
										class="dropdown-item" href="#">English</a> <a
										class="dropdown-item" href="#">中国</a>
								</div></li>
							<li class="nav-item"><a class="nav-link" href="#"
								style="color: rgb(0, 0, 0);"><i class="fa-solid fa-question"></i>
									Giúp đỡ ?</a></li>
						</ul>
					</div>
				</div>
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="/home/watch"
						style="margin-left: 15px;"> <span class="text-uppercase">
							Watchtopia Shop </span>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="watches.html">
									Đồng Hồ </a></li>
							<li class="nav-item"><a class="nav-link" href="about.html">
									Giới Thiệu </a></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">Liên
									Hệ</a></li>
						</ul>

						<div class="user_option-box">
							<div class="container">
								<input placeholder="Nhập tên đồng hồ ..." required=""
									class="input" name="search" type="text">
								<a class="icon" href="/home/search">
									<i class="fa-brands fa-searchengin"></i>
								</a>
							</div>

							<a href="/home/profile"> <i class="fa fa-user"
								aria-hidden="true"></i>
							</a> <a href="/cart/view"> <i class="fa fa-cart-plus"
								aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- Slide banner -->

		<section>
			<div class="row">
				<div class="col-sm-1 icon_header">
					<i class="fa-brands fa-facebook-f"></i> <i
						class="fa-brands fa-instagram"></i>
				</div>
				<div class="col-sm-11">
					<div class="slider">
						<div class="list">
							<div class="item">
								<img src="/img/Slide1.jpg" alt="">
							</div>
							<div class="item">
								<img src="/img/Slide2.jpg" alt="">
							</div>
							<div class="item">
								<img src="/img/Slide3.jpg" alt="">
							</div>
							<div class="item">
								<img src="/img/Slide4.jpg" alt="">
							</div>
							<div class="item">
								<img src="/img/Slide5.jpg" alt="">
							</div>
						</div>
						<div class="buttons">
							<button id="prev">
								<i class="fa-solid fa-angle-left"></i>
							</button>
							<button id="next">
								<i class="fa-solid fa-angle-right"></i>
							</button>
						</div>
						<ul class="dots">
							<li class="active"></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>

			</div>
		</section>
		<!-- Danh Sách Sản Phẩm -->
		<section class="shop_section layout_padding">
			<c:if test="${userNull == true}">
				<div class="notification">
					<div class="toast-war warning-war">
						<i class="fa-solid fa-triangle-exclamation"></i>
						<div class="content">
							<div class="title-war">Cảnh Báo!</div>
							<span>Bạn chưa đăng nhập vào tài khoản.</span>
						</div>
					</div>
				</div>
			</c:if>
			<div class="container">

				<div class="heading_container heading_center">
					<h2>Đồng Hồ Mới Nhất</h2>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="box">
							<a href="/home/detailWatched/${item.product_id}">
								<div class="img-box">
									<img src="/img/${item.product_img}" alt="">
								</div>
								<div class="detail-box">
									<h6>${item.product_name}</h6>
									<h6>
										Giá: <span> ${item.product_price} VNĐ </span>
									</h6>
								</div>
								<div class="new">
									<span> Nổi Bật </span>
								</div>
							</a>
						</div>
					</div>
					<c:forEach var="p" items="${items}">
						<div class="col-sm-6 col-xl-3">

							<div class="box">
								<a href="/home/detailWatched/${p.product_id}">
									<div class="img-box">
										<img src="/img/${p.product_img}" alt="">
									</div>
									<div class="detail-box">
										<h6>${p.product_name}</h6>
										<h6>
											Giá: <span> ${p.product_price} VNĐ </span>
										</h6>
									</div>
									<div class="new">
										<span> Mới </span>
									</div>
								</a>
							</div>

						</div>
					</c:forEach>
				</div>
				<div class="btn-box">
					<a href=""> Tất cả </a>
				</div>
			</div>
		</section>
		<!-- Layout giới thiệu Chức năng sản phẩm -->
		<section class="feature_section layout_padding">
			<div class="container">
				<div class="heading_container">
					<h2>Các Tính Năng Của Đồng Hồ Của Chúng Tôi</h2>
					<p>Đồng hồ của tôi bao gồm các tính năng này</p>
				</div>
				<div class="row">
					<div class="col-sm-6 col-lg-3">
						<div class="box">
							<div class="img-box">
								<img src="/img/f1.png" alt="">
							</div>
							<div class="detail-box">
								<h5>Theo Dõi Thể Dục</h5>
								<p>Theo dõi sức khỏe và nhịp tim thông báo tình trạng sức
									khỏe</p>
								<a href=""> <span> Đọc thêm </span> <i
									class="fa fa-long-arrow-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="box">
							<div class="img-box">
								<img src="/img/f2.png" alt="">
							</div>
							<div class="detail-box">
								<h5>Cảnh báo & Thông báo</h5>
								<p>Đặt báo thức - đặt lịch quan trọng dễ dàng đặt thông báo
								</p>
								<a href=""> <span> Đọc thêm </span> <i
									class="fa fa-long-arrow-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="box">
							<div class="img-box">
								<img src="/img/f3.png" alt="">
							</div>
							<div class="detail-box">
								<h5>Tin Nhắn</h5>
								<p>Gửi tin nhắn hay gọi điện như một chiếc điện thoại nhỏ
									tiện lợi</p>
								<a href=""> <span> Đọc thêm </span> <i
									class="fa fa-long-arrow-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-lg-3">
						<div class="box">
							<div class="img-box">
								<img src="/img/f4.png" alt="">
							</div>
							<div class="detail-box">
								<h5>Bluetooth</h5>
								<p>Có thể bật bluetooth để truyền tệp hoặc kết nối với các
									thiết bị khác</p>
								<a href=""> <span> Đọc thêm </span> <i
									class="fa fa-long-arrow-right" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-box">
					<a href=""> Xem thêm </a>
				</div>
			</div>
		</section>
		<!-- Layout giới liên hệ góp ý sản phẩm -->
		<section class="contact_section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="form_container">
							<div class="heading_container">
								<h2>Liên Hệ</h2>
							</div>
							<form action="/account/sendEmail" method="post">
								<div>
									<input type="text" name="fullname" placeholder="Họ và tên " />
								</div>
								<div>
									<input type="email" name="email" placeholder="Email" />
								</div>
								<div>
									<input type="text" name="phone" placeholder="Số điện thoại" />
								</div>
								<div>
									<input type="text" name="content" class="message-box"
										placeholder="Nội dung" />
								</div>
								<div class="d-flex ">
									<button>Gửi</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-6">
						<div class="img-box">
							<img src="/img/contact-img.jpg" alt="">
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Layout giới đánh giá sản phẩm -->
		<section class="Customer_reviews">
			<h2 class="text-center">
				<strong>Đánh Giá Nổi Bật</strong>
			</h2>
			<p class="text-center">Đánh giá của khách hàng dành cho sản phẩm
				của Lucas Shop.</p>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-6">
						<div class="card">
							<div class="card-img"></div>
							<div class="card-info">
								<p class="text-body">Đóng gói tạm ổn, dây cao su đẹp, mặt
									đồng hồ không trầy, chỉnh giờ và phút được. Mở bằng nút tròn,
									chỉnh phút là nút tròn, chỉnh giờ là nút dài. Giá 15.000 vậy là
									tốt rồi ạ.</p>
								<button type="button" class="btn btn-dark">Lucas</button>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card">
							<div class="card-img"></div>
							<div class="card-info">
								<p class="text-body">Vs giá này thì sp như vậy là wá OK r
									Shipper cực kì thân thiện Có điều đồng hồ bị mất 1 miếng gài
									lại nhma k s đẹp nhà Nên mua nha mn</p>
								<button type="button" class="btn btn-dark">Tùng</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!-- back to top -->
		<div class="backTop">
			<button onclick="topFunction()" id="totop" title="Go to top">
				<i class="fa-solid fa-arrow-up"></i>
			</button>
		</div>
		<!-- hỗ trợ -->
		<div class="fabs">
			<div class="chat">
				<div class="chat_header">
					<div class="chat_option">
						<div class="header_img">
							<img src="/icon/avatarNEW.png" />
						</div>
						<span id="chat_head">Lucas Tùng</span> <br> <span
							class="agent"><i class="fa-solid fa-circle"
							style="color: rgb(0, 224, 0);"></i> Hoạt Động</span> <span
							class="online">(Online)</span> <span id="chat_fullscreen_loader"
							class="chat_fullscreen_loader"><i
							class="fa-solid fa-expand"></i></span>

					</div>

				</div>
				<div class="chat_body chat_login">
					<a id="chat_first_screen" class="fab"><i
						class="fa-solid fa-arrow-right" style="color: #ffff;"></i></a>
					<p>Lucas Shop, Xin kính chào quý khách!</p>

				</div>
				<div id="chat_converse" class="chat_conversion chat_converse">

					<a id="chat_second_screen" class="fab"><i
						class="fa-solid fa-comments" style="color: #ffff;"></i></a> <span
						class="chat_msg_item chat_msg_item_admin">
						<div class="chat_avatar">
							<img src="/icon/avatarNEW.png" />
						</div>Tôi có thể giúp được gì cho bạn?
					</span> <span class="chat_msg_item chat_msg_item_user"> Hello!</span> <span
						class="status">20m ago</span> <span
						class="chat_msg_item chat_msg_item_admin">
						<div class="chat_avatar">
							<img src="/icon/avatarNEW.png" />
						</div>Tôi có thể giúp được gì cho bạn?
					</span> <span class="chat_msg_item chat_msg_item_user"> Tôi muốn
						hỏi về các loại đồng hồ cặp.</span> <span class="status2">1m ago</span>
				</div>
				<div class="fab_field">
					<a id="fab_camera" class="fab"><i class="fa-solid fa-camera"></i></a>
					<a id="fab_send" class="fab"><i class="fa-solid fa-paper-plane"></i></a>
					<textarea id="chatSend" name="chat_message"
						placeholder="Send a message" class="chat_field chat_message"></textarea>
				</div>
			</div>
			<a id="prime" class="fab"><i
				class="prime zmdi zmdi-comment-outline" style="color: #ffff;"></i></a>
		</div>
		<!-- footer -->
		<footer class="footer_section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 footer-col">
						<div class="footer_detail">
							<h4>GIỚI THIỆU</h4>
							<p style="color: #ffff;">Lucas Shop chuyên bán những dòng
								đồng hồ nam - nữ thời trang phù hợp cho tất cả các lứa tuổi</p>
							<div class="footer_social">
								<a href=""> <i class="fa-brands fa-facebook"></i> <!-- 								</a> <a href=""> <i class="fa-brands fa-linkedin-in"></i>
								</a> <a href=""> <i class="fa-brands fa-tiktok"></i> -->
								</a> <a href=""> <i class="fa-brands fa-instagram"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 footer-col">
						<div class="footer_contact">
							<h4>LIÊN HỆ</h4>
							<div class="contact_link_box">
								<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
									<span> Khóm 6A, Trần Văn Thời, Cà Mau, Việt Nam </span>
								</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i>
									<span> 012 345 678 </span>
								</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
									<span> tungtqpc04315@fpt.edu.vn </span></a> </a> <a href=""> <i
									class="fa fa-envelope" aria-hidden="true"></i> <span>
										thiendtpc@fpt.edu.vn </span></a> </a> <a href=""> <i
									class="fa fa-envelope" aria-hidden="true"></i> <span>
										tuonghtpc04356.edu.vn </span></a> </a> <a href=""> <i
									class="fa fa-envelope" aria-hidden="true"></i> <span>
										haoncpc04337@fpt.edu.vn </span></a> </a> <a href=""> <i
									class="fa fa-envelope" aria-hidden="true"></i> <span>
										phatdlgpc@fpt.edu.vn </span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 footer-col">
						<div class="footer_contact">
							<h4>ĐĂNG KÝ</h4>
							<form action="#">
								<input type="text" placeholder="Enter email" />
								<button type="submit">Đăng ký</button>
							</form>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 footer-col">
						<div class="map_container">
							<div class="map">
								<div id="googleMap">
									<iframe
										src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3940.347174056731!2d104.81688607363257!3d9.032060288943903!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a6a5fedba779c3%3A0x8235711c1f809bc8!2zS2jDs20gNmEgVGjhu4sgVHLhuqVuIFPDtG5nIMSQ4buRYyBodXnhu4duIFRy4bqnbiBWxINuIFRo4budaSB04buJbmggQ8OgIE1hdQ!5e0!3m2!1svi!2s!4v1682506129325!5m2!1svi!2s"
										height="500px" style="border: 0;" allowfullscreen=""
										loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="footer-info">
					<p>
						&copy; <span id="displayYear"></span> FPT POLYTECHNIC CAN THO 2023
					</p>
				</div>
			</div>
		</footer>
	</div>

	<!-- loading -->
	<!-- <div class="loader">
        <div class="loader-inner">
            <span class="l">L</span>
            <span class="o">o</span>
            <span class="a">a</span>
            <span class="d">d</span>
            <span class="i">i</span>
            <span class="n">n</span>
            <span class="g">g</span>
            <span class="d1">.</span>
            <span class="d2">.</span>
            <span class="d3">.</span>
        </div>
    </div> -->

	<script src="/js/slide.js"></script>
	<script src="/js/backTop.js"></script>
	<script src="/js/chatBox.js"></script>
	<!-- <script src="/js/loading.js"></script> -->
	<script src="/js/notification.js"></script>
</body>
</html>