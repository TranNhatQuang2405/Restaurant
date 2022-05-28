<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Error 404</title>
	<meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/apple-touch-icon.jpg" rel="icon">
    <link href="assets/img/apple-touch-icon.jpg" rel="apple-touch-icon">

   <!-- Vendor CSS Files -->
    <link href="<c:url value='/assets/vendor/animate.css/animate.min.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/aos/aos.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/bootstrap-icons/bootstrap-icons.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/boxicons/css/boxicons.min.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/glightbox/css/glightbox.min.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/swiper/swiper-bundle.min.css'></c:url>" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href=" <c:url value='/assets/css/style.css'></c:url>" rel="stylesheet">
</head>
<body>
<c:url var="link" value="/assets/img/Hero_bg.jpg"></c:url>
<div style="width: 100%;height: 100vh;background: url(${link}) top center; background-size:cover;">
	<!-- ======= Top Bar ======= -->
    <div id="topbar" class="d-flex align-items-center fixed-top">
        <div class="container d-flex justify-content-center justify-content-md-between">

            <div class="contact-info d-flex align-items-center">
                <i class="bi bi-phone d-flex align-items-center"><span>(+84) 938760123</span></i>
                <i class="bi bi-clock d-flex align-items-center ms-4"><span> Mon-Sat: 9AM - 23PM</span></i>
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
                    <li class="dropdown"><a href="#"><span>Order</span> <i class="bi bi-chevron-down"></i></a>
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
            <a href="<c:url value='/MenuOrder'></c:url>" class="book-a-table-btn scrollto d-none d-lg-flex">Order Online</a>
        </div>
    </header>
    <!-- End Header -->
	
	<div class="d-flex flex-column align-items-center" style="padding-top: 40vh;color: #591d1d; font-size: 30px;">
		<h1>Error 404</h1>
		<p>We cannot find the page you wanted.</p>
		<p>To continue, click the Back button.</p>
	</div>
	
</div>
</body>
</html>