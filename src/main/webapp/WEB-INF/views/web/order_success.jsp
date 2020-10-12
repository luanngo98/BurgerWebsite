<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Burger</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/template/web/img/favicon.png' />">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet"
	href="<c:url value='/template/web/css/bootstrap.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/owl.carousel.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/magnific-popup.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/font-awesome.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/themify-icons.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/nice-select.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/flaticon.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/animate.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/slicknav.css' />">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/style.css' />">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-5 col-lg-5">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a class="active" href="<c:url value="/trang-chu"/>">home</a></li>
										<li><a href="<c:url value="/trang-chu#menu"/>">Menu</a></li>
										<li><a href="<c:url value="/trang-chu#about"/>">About</a></li>
										<li><a href="contact.html">Contact</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-2 col-lg-2">
							<div class="logo-img">
								<a href="<c:url value="/trang-chu"/>"> <img
									src="<c:url value='/template/web/img/logo.png' />" alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-5 col-lg-5 d-none d-lg-block">
							<div class="book_room">
								<div class="socail_links">
									<ul>
										<li><a href="#"> <i class="fa fa-instagram"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-twitter"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-facebook"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-google-plus"></i>
										</a></li>
									</ul>
								</div>
								<div class="book_btn d-none d-xl-block">
									<a class="#" href="#">+10 367 453 7382</a>
								</div>
								<div class="book_btn d-none d-xl-block">
									<a href="<c:url value='/cart'/>"> <i class="fa fa-cart-plus"></i></a>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->

	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg_2">
		<h3>Cart</h3>
	</div>
	<!-- bradcam_area_end -->

	<div class="best_burgers_area">
		<div class="container">
			<h2>Đặt hàng thành công</h2>
			<div><a href="<c:url value="/trang-chu#menu" />"><b>Click vào đây</b></a> để tiếp tục mua hàng</div>
		</div>
	</div>



	<footer class="footer">
		<div class="footer_top">
			<div class="container">
				<div class="row">
					<div class="col-xl-4 col-md-6 col-lg-4">
						<div class="footer_widget text-center ">
							<h3 class="footer_title pos_margin">New York</h3>
							<p>
								5th flora, 700/D kings road, <br> green lane New York-1782
								<br> <a href="#">info@burger.com</a>
							</p>
							<a class="number" href="#">+10 378 483 6782</a>

						</div>
					</div>
					<div class="col-xl-4 col-md-6 col-lg-4">
						<div class="footer_widget text-center ">
							<h3 class="footer_title pos_margin">California</h3>
							<p>
								5th flora, 700/D kings road, <br> green lane New York-1782
								<br> <a href="#">info@burger.com</a>
							</p>
							<a class="number" href="#">+10 378 483 6782</a>

						</div>
					</div>
					<div class="col-xl-4 col-md-12 col-lg-4">
						<div class="footer_widget">
							<h3 class="footer_title">Stay Connected</h3>
							<form action="#" class="newsletter_form">
								<input type="text" placeholder="Enter your mail">
								<button type="submit">Sign Up</button>
							</form>
							<p class="newsletter_text">Stay connect with us to get
								exclusive offer!</p>
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-lg-4">
						<div class="socail_links text-center">
							<ul>
								<li><a href="#"> <i class="ti-instagram"></i>
								</a></li>
								<li><a href="#"> <i class="ti-twitter-alt"></i>
								</a></li>
								<li><a href="#"> <i class="ti-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="fa fa-google-plus"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copy-right_text">
			<div class="container">
				<div class="footer_border"></div>
				<div class="row">
					<div class="col-xl-12">
						<p class="copy_right text-center">
							<!-- Link back to Colorlib can't be removed. /template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This /template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. /template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!-- JS here -->
	<script
		src="<c:url value='/template/web/js/vendor/modernizr-3.5.0.min.js' />"></script>
	<script
		src="<c:url value='/template/web/js/vendor/jquery-1.12.4.min.js' />"></script>
	<script src="<c:url value='/template/web/js/popper.min.js' />"></script>
	<script src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/template/web/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/template/web/js/isotope.pkgd.min.js' />"></script>
	<script src="<c:url value='/template/web/js/ajax-form.js' />"></script>
	<script src="<c:url value='/template/web/js/waypoints.min.js' />"></script>
	<script
		src="<c:url value='/template/web/js/jquery.counterup.min.js' />"></script>
	<script
		src="<c:url value='/template/web/js/imagesloaded.pkgd.min.js' />"></script>
	<script src="<c:url value='/template/web/js/scrollIt.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery.scrollUp.min.js' />"></script>
	<script src="<c:url value='/template/web/js/wow.min.js' />"></script>
	<script src="<c:url value='/template/web/js/nice-select.min.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery.slicknav.min.js' />"></script>
	<script
		src="<c:url value='/template/web/js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='/template/web/js/plugins.js' />"></script>

	<!--contact js-->
	<script src="<c:url value='/template/web/js/contact.js' />"></script>
	<script
		src="<c:url value='/template/web/js/jquery.ajaxchimp.min.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery.form.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery.validate.min.js' />"></script>
	<script src="<c:url value='/template/web/js/mail-script.js' />"></script>

	<script src="<c:url value='/template/web/js/main.js' />"></script>

</body>

</html>