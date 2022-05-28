<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
   
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
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

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
        <div class="container d-flex justify-content-center justify-content-md-between">

            <div class="contact-info d-flex align-items-center">
                <i class="bi bi-phone d-flex align-items-center"><span>(+84) 938760123</span></i>
                <i class="bi bi-clock d-flex align-items-center ms-4"><span> Mon-Sat: 9AM - 23PM</span></i>
            </div>
            <div class="languages d-none d-md-flex align-items-center">
                <ul>
                    <c:if test="${empty sessionScope.user}">
                    	<li class="signIn"><a href='<c:url value="/Home/Login"></c:url>'>Sign In</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                    	<li class="signOut"><a href='#'>Hi ${sessionScope.user.email}</a></li>
                    	<li class="signOut"><a href='<c:url value="/Home/Login?logout=true"></c:url>'>Sign Out</a></li>
                    </c:if>
                    
                </ul>
            </div>
        </div>
    </div>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-cente">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
			<c:url var="HOME" value="/Home"></c:url>

            <h1 class="logo me-auto me-lg-0"><a href="${HOME}">Godziila</a></h1>
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
                    <li class="dropdown">
                    	<a href="#"><span>Order</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="<c:url value='/YourCart'></c:url>">Your Cart</a></li>
                            <li><a href='<c:url value="/YourOrder"></c:url>'>Your Order</a></li>
                        </ul>
                    </li>
                    <li><a class="nav-link scrollto" href="${HOME}#contact">Contact</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
            <!-- .navbar -->
            <a href="${HOME}#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>
            <a href='<c:url value="/MenuOrder"></c:url>' class="book-a-table-btn scrollto d-none d-lg-flex" id="yourcart">Continue Shop</a>

        </div>
    </header>
    <!-- End Header -->

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
            <div class="row">
                <div class="col-lg-8">
                    <h1>Welcome to <span>Godziila</span></h1>
                    <h2>Thanks For Order</h2>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero -->

    <main id="thanks"> 
        <c:import url="/order/thanks.jsp"></c:import>
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
                                1 Vo Van Ngan Street <br> Linh Chieu<br><br>
                                <strong>Phone:</strong> (+84) 938760137<br>
                                <strong>Email:</strong> godzillarestaurant5@gmail.com<br>
                            </p>
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="${HOME}#hero">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="${HOME}#about">About us</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="${HOME}#menu">Menu</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="${HOME}#events">Event</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Services</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="${HOME}#book-a-table">Book A Table</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="<c:url value='/MenuOrder'></c:url>">Order Online</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong><span>Godziila</span></strong>. All Rights Reserved
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

   
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
	<!--Start of Tawk.to Script-->
	<script src="assets/js/chatService.js" ></script>
</body>
</html>