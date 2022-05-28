<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Foores - Single Restaurant Version">
    <meta name="author" content="Ansonika">
    <title>Godzilla Restaurant</title>

	<c:url var="CSS" value="/order/css"></c:url>
	<c:url var="JS" value="/order/js"></c:url>
    <!-- BASE CSS -->
    <link href="${CSS}/vendors.min.css" rel="stylesheet">
    <link href="${CSS}/style.css" rel="stylesheet">

</head>

<body>
	<div id="preloader">
        <div data-loader="circle-side"></div>
    </div>
    
    <main class="pattern_2">
		<div class="container margin_60_40">
		    <div class="row justify-content-center">
		        <div class="col-lg-4">
		        	<div class="box_booking_2">
		                <div class="head">
		                    <div class="title">
		                    <h3>Godzilla Restaurant</h3>
		                    1 Vo Van Ngan St, Thu Duc - <a href="https://goo.gl/maps/vPgJSpsHS5HosQg69">Get directions</a>
		                </div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                	<div id="confirm">
								<div class="icon icon--order-success svg add_bottom_15">
									<svg xmlns="http://www.w3.org/2000/svg" width="72" height="72">
										<g fill="none" stroke="#8EC343" stroke-width="2">
											<circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
											<path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
										</g>
									</svg>
								</div>
								<h3>Order Successfully!!!</h3>
								<p>We will contact you when we confirm this order</p>
								<p>Have A Nice Day !!!</p>
							</div>
		                </div>
		            </div>
		            <!-- /box_booking -->
		        </div>
		        <!-- /col -->
		    </div>
		    <!-- /row -->
		</div>
		<!-- /container -->
		
	</main>
	<!-- /main -->
    
    <!-- COMMON SCRIPTS -->
    <script src="${JS}/common_scripts.min.js"></script>
    <script src="${JS}/common_func.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="${JS}/sticky_sidebar.min.js"></script>
    <script src="${JS}/shop_order_func.js"></script>
</body>
</html>