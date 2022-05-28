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

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

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

			<h1 class="logo me-auto me-lg-0">
				<a href="Home">Godziila</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li><a class="nav-link scrollto active" href="#hero">Home</a></li>
					<li><a class="nav-link scrollto" href="#about">About</a></li>
					<li><a class="nav-link scrollto" href="#menu">Menu</a></li>
					<li><a class="nav-link scrollto" href="#specials">Specials</a></li>
					<li><a class="nav-link scrollto" href="#events">Events</a></li>
					<li><a class="nav-link scrollto" href="#gallery">Gallery</a></li>
					<li class="dropdown"><a href="#"><span>Order</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="<c:url value='/YourCart'></c:url>">Your
									Cart</a></li>
							<li><a href='<c:url value="/YourOrder"></c:url>'>Your
									Order</a></li>
						</ul></li>
					<li><a class="nav-link scrollto" href="#contact">Contact</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
			<a href="#book-a-table"
				class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>
			<a href="MenuOrder"
				class="book-a-table-btn scrollto d-none d-lg-flex">Order Online</a>
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
					<h2>The best choice for you</h2>

					<div class="btns">
						<a href="#menu" class="btn-menu animated fadeInUp scrollto">Our
							Menu</a> <a href="#book-a-table"
							class="btn-book animated fadeInUp scrollto">Book a Table</a>
					</div>
				</div>
				<div
					class="col-lg-4 d-flex align-items-center justify-content-center position-relative"
					data-aos="zoom-in" data-aos-delay="200">
					<a href="https://youtu.be/PZ4pctQMdg4" class="glightbox play-btn"></a>
				</div>

			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in"
						data-aos-delay="100">
						<div class="about-img">
							<img src="assets/img/about.jpg" alt="">
						</div>
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
						<h3>Godzilla is a fresh restaurant</h3>
						<p class="fst-italic">We launch in the summer of 2021. Since
							then, Godzilla has achieved many successes in the culinary market
						</p>
						<ul>
							<li><i class="bi bi-check-circle"></i> Coming to Godziila,
								you can not only enjoy the dishes with the taste of Vietnam's
								homeland, but also enjoy famous dishes in the world.</li>
							<li><i class="bi bi-check-circle"></i> Besides, you will be
								immersed in a quiet romantic space to relax after a stressful
								working week</li>
						</ul>
						<p>We promise our service will satisfy you</p>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->

		<!-- ======= Why Us Section ======= -->
		<section id="why-us" class="why-us">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Why Us</h2>
					<p>Why Choose Our Restaurant</p>
				</div>

				<div class="row">

					<div class="col-lg-4">
						<div class="box" data-aos="zoom-in" data-aos-delay="100">
							<span>01</span>
							<h4>Fast</h4>
							<p>We provide the fastest service for you</p>
						</div>
					</div>

					<div class="col-lg-4 mt-4 mt-lg-0">
						<div class="box" data-aos="zoom-in" data-aos-delay="200">
							<span>02</span>
							<h4>Safe</h4>
							<p>Our restaurant meets all food hygiene standards</p>
						</div>
					</div>

					<div class="col-lg-4 mt-4 mt-lg-0">
						<div class="box" data-aos="zoom-in" data-aos-delay="300">
							<span>03</span>
							<h4>Cheap</h4>
							<p>The price of foods will not disappoint you</p>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Why Us Section -->

		<!-- ======= Menu Section ======= -->
		<section id="menu" class="menu section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Menu</h2>
					<p>Check Our Tasty Menu</p>
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
								<img alt="Image" src="<c:out value='${item.image}'></c:out>"
									class="menu-img">
								<div class="menu-content">
									<a href=""><c:out value='${item.name}'></c:out></a><span>$<c:out
											value='${item.price}'></c:out></span>
								</div>
								<div class="menu-ingredients">
									<c:out value='${item.description}'></c:out>
								</div>
							</div>
						</c:if>
						<c:if test='${item.foodType.equals("main")}'>
							<div class="col-lg-6 menu-item filter-main">
								<img alt="Image" src="<c:out value='${item.image}'></c:out>"
									class="menu-img" alt="">
								<div class="menu-content">
									<a href=""><c:out value='${item.name}'></c:out></a><span>$<c:out
											value='${item.price}'></c:out></span>
								</div>
								<div class="menu-ingredients">
									<c:out value='${item.description}'></c:out>
								</div>
							</div>
						</c:if>
						<c:if test='${item.foodType.equals("drink")}'>
							<div class="col-lg-6 menu-item filter-drink">
								<img alt="Image" src="<c:out value='${item.image}'></c:out>"
									class="menu-img" alt="">
								<div class="menu-content">
									<a href=""><c:out value='${item.name}'></c:out></a><span>$<c:out
											value='${item.price}'></c:out></span>
								</div>
								<div class="menu-ingredients">
									<c:out value='${item.description}'></c:out>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- End Menu Section -->

		<!-- ======= Specials Section ======= -->
		<section id="specials" class="specials">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Specials</h2>
					<p>Check Our Specials</p>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-3">
						<ul class="nav nav-tabs flex-column">
							<li class="nav-item"><a class="nav-link active show"
								data-bs-toggle="tab" href="#tab-1">Banh Xeo</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#tab-2">Thai hot pot </a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#tab-3">Pasta</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#tab-4">Beefsteak</a></li>
							<li class="nav-item"><a class="nav-link"
								data-bs-toggle="tab" href="#tab-5">Sushi</a></li>
						</ul>
					</div>
					<div class="col-lg-9 mt-4 mt-lg-0">
						<div class="tab-content">
							<div class="tab-pane active show" id="tab-1">
								<div class="row">
									<div class="col-lg-8 details order-2 order-lg-1">
										<h3>Traditional dish</h3>
										<p class="fst-italic">Banh xeo is a popular cake in Asia</p>
										<p>the Japanese and Korean version of banh xeo has flour
											on the outside, and inside is stuffed with shrimp, meat, bean
											sprouts, kimchi, potatoes, chives,; Shrimp, meat, cabbage are
											fried to yellow color, molded into a circle or folded into a
											semicircle</p>
									</div>
									<div class="col-lg-4 text-center order-1 order-lg-2">
										<img src="assets/img/special_1.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-2">
								<div class="row">
									<div class="col-lg-8 details order-2 order-lg-1">
										<h3>Spicy hot pot dish</h3>
										<p class="fst-italic">Thai hot pot, or simply called hot
											pot in Thailand, is a variation of hot pot in Thailand</p>
										<p>Thai Hot Pot is also one of the specialties and
											traditional dishes of this country. Thai hot pot is basically
											a hot dish where diners dip meat, seafood, noodles and
											vegetables in a pot of cooking broth at the table and dip it
											in a mixture before eating.</p>
									</div>
									<div class="col-lg-4 text-center order-1 order-lg-2">
										<img src="assets/img/special_2.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-3">
								<div class="row">
									<div class="col-lg-8 details order-2 order-lg-1">
										<h3>Taste from Italy</h3>
										<p class="fst-italic">Pasta is a traditional Italian food
											that has been around since 1154.</p>
										<p>Pasta has more than 310 varieties with 1,300 different
											names, flavors and shapes. From long, tubular stems to
											spirals, bows, butterflies, shellsâ¦ Although this number is
											extremely large, all types of Pasta share the same main
											ingredients as Semolina flour and water.</p>
									</div>
									<div class="col-lg-4 text-center order-1 order-lg-2">
										<img src="assets/img/special_3.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-4">
								<div class="row">
									<div class="col-lg-8 details order-2 order-lg-1">
										<h3>Food of luxury</h3>
										<p class="fst-italic">beefsteak, often called just steak,
											is a flat cut of beef with parallel faces, usually cut
											perpendicular to the muscle fibers.</p>
										<p>In common restaurant service a single serving has a raw
											mass ranging from 120 to 600 grams. Beef steaks are usually
											grilled, pan-fried, or broiled. The more tender cuts from the
											loin and rib are cooked quickly, using dry heat, and served
											whole. Less tender cuts from the chuck or round are cooked
											with moist heat or are mechanically tenderized</p>
									</div>
									<div class="col-lg-4 text-center order-1 order-lg-2">
										<img src="assets/img/special_4.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-5">
								<div class="row">
									<div class="col-lg-8 details order-2 order-lg-1">
										<h3>Samurai food</h3>
										<p class="fst-italic">Sushi is a traditional Japanese food
											and is very popular all over the world</p>
										<p>Sushi is a Japanese dish consisting of rice mixed with
											vinegar (shari) combined with other ingredients (neta). Neta
											and sushi presentation are varied, but the main ingredient
											that all sushi has is shari. The most popular neta is
											seafood. Sliced raw meat is called sashimi.</p>
									</div>
									<div class="col-lg-4 text-center order-1 order-lg-2">
										<img src="assets/img/special_5.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Specials Section -->

		<!-- ======= Events Section ======= -->
		<section id="events" class="events">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Events</h2>
					<p>Organize Your Events in our Restaurant</p>
				</div>

				<div class="events-slider swiper" data-aos="fade-up"
					data-aos-delay="100">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="row event-item">
								<div class="col-lg-6">
									<img src="assets/img/event-birthday.jpg" class="img-fluid"
										alt="">
								</div>
								<div class="col-lg-6 pt-4 pt-lg-0 content">
									<h3>Birthday Parties</h3>
									<div class="price">
										<p>
											<span>$189</span>
										</p>
									</div>
									<p class="fst-italic">Do you want to have a surprise
										birthday party?</p>
									<ul>
										<li><i class="bi bi-check-circled"></i> We provide the
											best quality birthday party service.</li>
										<li><i class="bi bi-check-circled"></i> The dishes are
											selected at your disposal at a very cheap and reasonable
											cost.</li>
										<li><i class="bi bi-check-circled"></i> The birthday room
											will be decorated in the most perfect way.</li>
									</ul>
									<p>Enjoy your upcoming birthday at our restaurant</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="row event-item">
								<div class="col-lg-6">
									<img src="assets/img/even-wedding.jpg" class="img-fluid" alt="">
								</div>
								<div class="col-lg-6 pt-4 pt-lg-0 content">
									<h3>Wedding</h3>
									<div class="price">
										<p>
											<span>$290</span>
										</p>
									</div>
									<p class="fst-italic">You are planning to choose a
										restaurant to hold the important wedding of your life. Then
										our restaurant is the best choice Make your wedding party an
										unforgettable event</p>
									<ul>
										<li><i class="bi bi-check-circled"></i> You will also be
											provided with wedding attire and other related items.</li>
										<li><i class="bi bi-check-circled"></i> The restaurant
											will hold a grand ceremony for your wedding party that cannot
											be cheaper elsewhere.</li>
										<li><i class="bi bi-check-circled"></i> You can also
											participate in the lucky draw for the luckiest couple.</li>
									</ul>
									<p>Let's make your wedding party an unforgettable event</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="row event-item">
								<div class="col-lg-6">
									<img src="assets/img/event-custom.jpg" class="img-fluid" alt="">
								</div>
								<div class="col-lg-6 pt-4 pt-lg-0 content">
									<h3>Custom Parties</h3>
									<div class="price">
										<p>
											<span>$99</span>
										</p>
									</div>
									<p class="fst-italic">With the need to organize a simple
										party, not too picky, this option is very suitable for you</p>
									<ul>
										<li><i class="bi bi-check-circled"></i> The cost is only
											a third of other parties.</li>
										<li><i class="bi bi-check-circled"></i> You will still
											enjoy delicious food.</li>
										<li><i class="bi bi-check-circled"></i> And the cost will
											be completely reasonable.</li>
									</ul>
									<p>Let's make an appointment for your party</p>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Events Section -->

		<!-- ======= Book A Table Section ======= -->
		<section id="book-a-table" class="book-a-table">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Reservation</h2>
					<p>Book a Table</p>
				</div>

				<form action='<c:url value="/BookATable"></c:url>' method="post"
					class="email-form">
					<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
					<div class="row">
						<div class="col-lg-4 col-md-6 form-group">
							<input type="text" name="name" class="form-control" id="name"
								placeholder="Your Name" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" required="required">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="Your Email" data-rule="email"
								data-msg="Please enter a valid email" required="required">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
							<input type="text" class="form-control" name="phone" id="phone"
								placeholder="Your Phone" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" required="required">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3">
							<input type="date" name="date" class="form-control" id="date"
								placeholder="Date" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" required="required">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3">
							<input type="time" class="form-control" name="time" id="time"
								placeholder="Time" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" required="required">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3">
							<input type="number" value="0" class="form-control"
								name="npeople" id="people" placeholder="# of people"
								data-rule="minlen:1" data-msg="Please enter at least 1 chars">
							<div class="validate"></div>
						</div>
						<input type="hidden" name="status" value="0" />
					</div>
					<div class="form-group mt-3">
						<textarea class="form-control" name="message" rows="5"
							placeholder="Message"></textarea>
						<div class="validate"></div>
					</div>
					<div class="mb-3">
						<div class="loading">Loading</div>
					</div>

					<div class="text-center">
						<button type="submit">Book a Table</button>
					</div>
				</form>
				<c:if test="${not empty error_booking}">
					<div style="margin-top: 10px; text-align: center;"
						class="alert alert-danger">${error_booking}</div>
				</c:if>
				<c:if test="${not empty message_booking}">
					<div style="margin-top: 10px; text-align: center;"
						class="alert alert-success">Your booking request was sent.
						We will call back or send an Email to confirm your reservation.
						Thank you!</div>
				</c:if>
			</div>
		</section>
		<!-- End Book A Table Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Testimonials</h2>
					<p>What they're saying about us</p>
				</div>

				<div class="testimonials-slider swiper" data-aos="fade-up"
					data-aos-delay="100">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="testimonial-item">
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> The
									restaurant has a lot of delicious and attractive food. I have
									eaten here many times and am very satisfied. <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
								<img src="assets/img/testimonials/testimonials-1.jpg"
									class="testimonial-img" alt="">
								<h3>Saul Goodman</h3>
								<h4>Ceo &amp; Founder</h4>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> This is
									my first time going to this restaurant and feel very satisfied
									with the service quality as well as the food of the restaurant.
									I will recommend this restaurant to my friends <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
								<img src="assets/img/testimonials/testimonials-2.jpg"
									class="testimonial-img" alt="">
								<h3>Sara Wilsson</h3>
								<h4>Designer</h4>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> The space
									of the restaurant is very spacious and airy. The service staff
									are very enthusiastic and happy with the customers. I will
									support the restaurant many more times. <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
								<img src="assets/img/testimonials/testimonials-3.jpg"
									class="testimonial-img" alt="">
								<h3>Jena Karlis</h3>
								<h4>Store Owner</h4>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> The
									restaurant is very luxurious and the service is very attentive
									and enthusiastic. delicious food. I really like this
									restaurant. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
								<img src="assets/img/testimonials/testimonials-4.jpg"
									class="testimonial-img" alt="">
								<h3>Matt Brandon</h3>
								<h4>Freelancer</h4>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> Great
									food and affordable prices. The location in the center is very
									convenient for everyone. I really like this restaurant. <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
								<img src="assets/img/testimonials/testimonials-5.jpg"
									class="testimonial-img" alt="">
								<h3>John Larson</h3>
								<h4>Entrepreneur</h4>
							</div>
						</div>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

		<!-- ======= Gallery Section ======= -->
		<section id="gallery" class="gallery">

			<div class="container" data-aos="fade-up">
				<div class="section-title">
					<h2>Gallery</h2>
					<p>Some photos from Our Restaurant</p>
				</div>
			</div>

			<div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

				<div class="row g-0">

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-1.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-2.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-3.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-4.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-5.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-6.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-7.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-4">
						<div class="gallery-item">
							<a href="assets/img/gallery/gallery-8.jpg"
								class="gallery-lightbox" data-gall="gallery-item"> <img
								src="assets/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
							</a>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!--End Gallery Section -->


		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Contact</h2>
					<p>Contact Us</p>
				</div>
			</div>

			<div data-aos="fade-up">
				<iframe style="border: 0; width: 100%; height: 350px;"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4842318813194!2d106.7697336141057!3d10.850726660786599!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2sus!4v1632661099272!5m2!1svi!2sus"
					frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="container" data-aos="fade-up">

				<div class="row mt-5">

					<div class="col-lg-4">
						<div class="info">
							<div class="address">
								<i class="bi bi-geo-alt"></i>
								<h4>Location:</h4>
								<p>1 Vo Van Ngan Street, Linh Chieu, Thu Duc City</p>
							</div>

							<div class="open-hours">
								<i class="bi bi-clock"></i>
								<h4>Open Hours:</h4>
								<p>
									Monday-Saturday:<br> 9:00 AM - 23:00 PM
								</p>
							</div>

							<div class="email">
								<i class="bi bi-envelope"></i>
								<h4>Email:</h4>
								<p>godzillarestaurant5@gmail.com</p>
							</div>

							<div class="phone">
								<i class="bi bi-phone"></i>
								<h4>Call:</h4>
								<p>(+84) 938760137</p>
							</div>

						</div>

					</div>

					<div class="col-lg-8 mt-5 mt-lg-0"></div>

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

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
							<li><i class="bx bx-chevron-right"></i> <a href="#hero">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#about">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#menu">Menu</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#events">Event</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a
								href="#book-a-table">Book A Table</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Order
									Online</a></li>
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
	<!--Start of Tawk.to Script-->
	<script src="assets/js/chatService.js" ></script>
	<!--End of Tawk.to Script-->
</body>

</html>