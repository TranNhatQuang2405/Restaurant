<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Godziila Restaurant</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/apple-touch-icon.jpg" rel="icon">
<link href="assets/img/apple-touch-icon.jpg" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Restaurantly - v3.5.0
  * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Top Bar ======= -->
	<div id="topbar" class="d-flex align-items-center fixed-top">
		<div
			class="container d-flex justify-content-center justify-content-md-between">

			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-phone d-flex align-items-center"><span>(+84)
						938760123</span></i> <i class="bi bi-clock d-flex align-items-center ms-4"><span>
						Mon-Sat: 9AM - 23PM</span></i>
			</div>
			<div class="languages d-none d-md-flex align-items-center">
				<ul>
					<c:if test="${empty sessionScope.user}">
						<li class="signIn"><a
							href='<c:url value="/Home/Login"></c:url>'>Sign In</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
						<li class="signOut"><a href='#'>Hi
								${sessionScope.user.email}</a></li>
						<li class="signOut"><a
							href='<c:url value="/Home/Login?logout=true"></c:url>'>Sign
								Out</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-cente">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
			<c:url var="HOME" value="/Home"></c:url>

			<h1 class="logo me-auto me-lg-0">
				<a href="${HOME}">Godziila</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li><a class="nav-link scrollto active" href="${HOME}">Home</a></li>
					<li><a class="nav-link scrollto" href="${HOME}#about">About</a></li>
					<li><a class="nav-link scrollto" href="${HOME}#menu">Menu</a></li>
					<li><a class="nav-link scrollto" href="${HOME}#specials">Specials</a></li>
					<li><a class="nav-link scrollto" href="${HOME}#events">Events</a></li>
					<li><a class="nav-link scrollto" href="${HOME}#gallery">Gallery</a></li>
					<li class="dropdown"><a href="#"><span>Order</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="<c:url value='/YourCart'></c:url>">Your
									Cart</a></li>
							<li><a href='<c:url value="/YourOrder"></c:url>'>Your
									Order</a></li>
						</ul></li>
					<li><a class="nav-link scrollto" href="${HOME}#contact">Contact</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
			<a href="${HOME}#book-a-table"
				class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>
			<button class="book-a-table-btn scrollto d-none d-lg-flex"
				id="yourcart">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
  					<path
						d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
				</svg>
				&nbsp; Your Cart
			</button>
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div class="container position-relative text-center text-lg-start"
			data-aos="zoom-in" data-aos-delay="100">
			<div class="row">
				<div class="col-lg-8">
					<h1>
						Welcome to <span>Godziila</span>
					</h1>
					<h2>Our menu is here</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<!-- ======= Menu Section ======= -->
		<section id="menu" class="menu section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Menu</h2>
					<p>Check Our Tasty Menu</p>
					<div class="col-md-6 form-group mt-3 mt-md-0">
						<form action='<c:url value="/MenuOrder#menu"></c:url>'
							method="post">
							<input value="find" name="action" type="hidden"> <input
								style="padding: 5px; display: inline; border-radius: 20px; float: left; height: 40px; width: 420px; font-size: 20px;"
								type="text" name="FindFood" id="FindFood"
								value="<c:out value='${FindFood}'/>" class="form-group"
								placeholder="input name of food">
							<button id="FIND" style="display: inline;"
								class="book-a-table-btn scrollto d-none d-lg-flex" type="submit">Find</button>
							<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
						</form>

					</div>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="menu-flters">
							<li data-filter="*" class="filter-active">All</li>
							<li data-filter=".filter-starters">Starters</li>
							<li data-filter=".filter-main">Main</li>
							<li data-filter=".filter-drink">Dessert and Drinks</li>
						</ul>
					</div>
				</div>

				<div class="row menu-container" data-aos="fade-up"
					data-aos-delay="200">
					<c:forEach var="item" items="${foods}">
						<c:if test='${item.foodType.equals("starters")}'>
							<div class="col-lg-6 menu-item filter-starters">
								<input type="hidden" value="<c:out value='${item.id}'></c:out>"
									name="ID" /> <img alt="Image"
									src="<c:out value='${item.image}'></c:out>" class="menu-img">
								<div class="menu-content">
									<a href=""><c:out value='${item.name}'></c:out> </a><span>$<c:out
											value='${item.price}'></c:out></span>
								</div>
								<div class="menu-ingredients">
									<c:out value='${item.description}'></c:out>
								</div>
								<div class="menu-add-to-cart">
									<button>Add to Cart</button>
								</div>
							</div>
						</c:if>
						<c:if test='${item.foodType.equals("main")}'>
							<div class="col-lg-6 menu-item filter-main">
								<input type="hidden" value="<c:out value='${item.id}'></c:out>"
									name="ID" /> <img alt="Image"
									src="<c:out value='${item.image}'></c:out>" class="menu-img"
									alt="">
								<div class="menu-content">
									<a href=""><c:out value='${item.name}'></c:out></a><span>$<c:out
											value='${item.price}'></c:out></span>
								</div>
								<div class="menu-ingredients">
									<c:out value='${item.description}'></c:out>
								</div>
								<div class="menu-add-to-cart">
									<button>Add to Cart</button>
								</div>
							</div>
						</c:if>
						<c:if test='${item.foodType.equals("drink")}'>
							<div class="col-lg-6 menu-item filter-drink">
								<input type="hidden" value="<c:out value='${item.id}'></c:out>"
									name="ID" /> <img alt="Image"
									src="<c:out value='${item.image}'></c:out>" class="menu-img"
									alt="">
								<div class="menu-content">
									<a href=""><c:out value='${item.name}'></c:out></a><span>$<c:out
											value='${item.price}'></c:out></span>
								</div>
								<div class="menu-ingredients">
									<c:out value='${item.description}'></c:out>
								</div>
								<div class="menu-add-to-cart">
									<button>Add to Cart</button>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- End Menu Section -->
		<section class="yourcart">
			<i class="fa fa-times" aria-hidden="true"></i>
			<h2>Your Cart</h2>
			<form action="<c:url value='/YourCart'></c:url>" method="post">
				<input type="hidden" value="add" name="action" />
				<table>
					<thead>
						<tr>
							<th>Food</th>
							<th>Cost</th>
							<th>Amout</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Item" items="${listFood}">
							<tr>
								<td style="align-items: center;"><img style="width: 70px;"
									src="<c:out value='${Item.food.image}'></c:out>" alt="" /></td>
								<td><span>$<c:out value='${Item.food.price}'></c:out></span></td>
								<td><input class="id-food" type="hidden"
									value="<c:out value='${Item.food.id}'></c:out>" name="FOODID" />
									<input class="amount" style="width: 40px; outline: none;"
									type="number" name="AMOUNT"
									value="<c:out value='${Item.amount}'></c:out>" min="1" /></td>
								<td class="delete" style="cursor: pointer;"><i
									class="fa fa-trash"></i></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="total_price"
					style="font-weight: bold; text-align: right;">
					Total: $
					<c:out value='${total}'></c:out>
				</div>
				<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
				<button class="cart-btn">Update Your Cart</button>
			</form>
		</section>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>Restaurantly</h3>
							<p>
								1 Vo Van Ngan Street <br> Linh Chieu<br> <br> <strong>Phone:</strong>
								(+84) 938760137<br> <strong>Email:</strong>
								godzillarestaurant5@gmail.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
									href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
								<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
								<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a
								href="${HOME}#hero">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								href="${HOME}#about">About us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								href="${HOME}#menu">Menu</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								href="${HOME}#events">Event</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a
								href="${HOME}#book-a-table">Book A Table</a></li>
							<li><i class="bx bx-chevron-right"></i> <a
								href="<c:url value='/MenuOrder'></c:url>">Order Online</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Godziila</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
				Designed by <a href="">Godzilla</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/script.js"></script>
	<!--Start of Tawk.to Script-->
	<script src="assets/js/chatService.js"></script>

</body>

</html>