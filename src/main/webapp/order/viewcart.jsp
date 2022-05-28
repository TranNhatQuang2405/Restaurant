<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Foores - Single Restaurant Version">
<meta name="author" content="Ansonika">
<title>View Order</title>

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
	<!-- /Page Preload -->
	<main class="pattern_2">
		<c:if test="${order.status == 0}">
			<div style="text-align: center;">
				<img alt="" src='<c:url value="/assets/img/wait.gif"></c:url>'
					width="80px">
				<h3>Status: Waiting For Confirm</h3>
			</div>
		</c:if>
		<c:if test="${order.status == 1}">
			<div style="text-align: center;">
				<img alt="" src='<c:url value="/assets/img/cook.gif"></c:url>'
					width="80px">
				<h3>Status: Cooking Now</h3>
			</div>
		</c:if>
		<c:if test="${order.status == 2}">
			<div style="text-align: center;">
				<img alt="" src='<c:url value="/assets/img/done.gif"></c:url>'
					width="80px">
				<h3>Status: Have Finished</h3>
			</div>
		</c:if>
		<c:if test="${order.status == -1}">
			<div style="text-align: center;">
				<img alt="" src='<c:url value="/assets/img/deny.gif"></c:url>'
					width="80px">
				<h3>Status: Have Denied</h3>
			</div>
		</c:if>
		<form action='<c:url value=""></c:url>' method="post">
			<div class="container margin_60_40">
				<div class="row justify-content-center">
					<div class="col-xl-6 col-lg-8">
						<div class="box_booking_2 style_2">
							<div class="head">
								<div class="title">
									<h3>Personal Details</h3>
								</div>
							</div>
							<!-- /head -->
							<div class="main">
								<div class="form-group">
									<label>First and Last Name</label> <input
										value="<c:out value='${info.fullname}'></c:out>"
										class="form-control" name="fullname"
										placeholder="First and Last Name" required="required"
										readonly="readonly">
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Email Address</label> <input class="form-control"
												name="email" value="<c:out value='${info.email}'></c:out>"
												placeholder="Email Address" required="required"
												readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Phone</label> <input
												value="<c:out value='${info.phone}'></c:out>"
												class="form-control" name="phone" placeholder="Phone"
												required="required" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>Full Address</label> <input
										value="<c:out value='${info.address}'></c:out>"
										class="form-control" name="address" placeholder="Full Address"
										required="required" readonly="readonly">
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>City</label> <input
												value="<c:out value='${info.city}'></c:out>"
												class="form-control" name="city" placeholder="City"
												readonly="readonly">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>Postal Code</label> <input class="form-control"
												placeholder="0123" readonly="readonly">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /box_booking -->
						<div class="box_booking_2 style_2">
							<div class="head">
								<div class="title">
									<h3>Payment Method</h3>
								</div>
							</div>
							<!-- /head -->
							<div class="main">
								<c:if test="${info.typepay.equals('Credit Card')}">
									<div class="payment_select">
										<label class="container_radio">Credit Card <input
											type="radio" value="Credit Card" checked
											name="payment_method"> <span class="checkmark"></span>
										</label> <i class="icon_creditcard"></i>
									</div>
								</c:if>
								<c:if test="${info.typepay.equals('Paypal')}">
									<div class="payment_select" id="paypal">
										<label class="container_radio">Pay with Paypal <input
											type="radio" value="Paypal" name="payment_method"> <span
											class="checkmark"></span>
										</label>
									</div>
								</c:if>
								<c:if test="${info.typepay.equals('Cash')}">
									<div class="payment_select">
										<label class="container_radio">Pay with Cash <input
											type="radio" value="Cash" name="payment_method"> <span
											class="checkmark"></span>
										</label> <i class="icon_wallet"></i>
									</div>
								</c:if>
							</div>
						</div>
						<!-- /box_booking -->
					</div>
					<!-- /col -->
					<div class="col-xl-4 col-lg-4" id="sidebar_fixed">
						<div class="box_booking">
							<div class="head">
								<h3>Order Summary</h3>
							</div>
							<!-- /head -->
							<div class="main">
								<ul>
									<li>Time<span> <c:out value='${order.date}'></c:out>
									</span></li>
									<li>Type<span>Delivery</span></li>
								</ul>
								<hr>
								<ul class="clearfix">
									<c:forEach var="Item" items="${order.foodOrders}">
										<li>${Item.amount}x${Item.food.name}<span>$${Item.food.price*Item.amount}</span></li>
									</c:forEach>
								</ul>
								<ul class="clearfix">
									<li>Subtotal<span>$${Total}</span></li>
									<li>Delivery fee<span>$10</span></li>
									<li class="total">Total<span>$${Total+10}</span></li>
								</ul>
								<input type="hidden" name="action" value="order">
								<c:if test="${not empty sessionScope.manager}">
									<c:if test="${order.status == 0}">
										<a
											href="<c:url value='/Manage/ManageOrder?action=accept&ID=${order.id}'></c:url>"
											class="btn_1 full-width mb_5">Accept</a>
										<a
											href="<c:url value='/Manage/ManageOrder?action=deny&ID=${order.id}'></c:url>"
											class="btn_1 full-width mb_5">Deny</a>
										<a href="<c:url value='/Manage/ManageOrder'></c:url>"
											class="btn_1 full-width mb_5">Close</a>
									</c:if>
									<c:if test="${order.status == 1}">
										<a
											href="<c:url value='/Manage/ManageOrder?action=finished&ID=${order.id}'></c:url>"
											class="btn_1 full-width mb_5">Finished</a>
										<a href="<c:url value='/Manage/ManageOrder'></c:url>"
											class="btn_1 full-width mb_5">Close</a>
									</c:if>
									<c:if test="${order.status == 2 or order.status == -1}">
										<a href='<c:url value="/Manage/ManageOrder"></c:url>'
											class="btn_1 full-width mb_5">Close</a>
									</c:if>
								</c:if>
								<c:if test="${not empty sessionScope.user}">
									<a href="<c:url value='/YourOrder'></c:url>"
										class="btn_1 full-width mb_5">Close</a>
								</c:if>
								<div class="text-center">
									<small>Or Call Us at <strong>(84)938760137</strong></small>
								</div>
							</div>
						</div>
						<!-- /box_booking -->
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</form>
	</main>
	<!-- /main -->
	<!-- Back to top button -->

	<!-- COMMON SCRIPTS -->
	<script src="${JS}/common_scripts.min.js"></script>
	<script src="${JS}/common_func.js"></script>

	<!-- SPECIFIC SCRIPTS -->
	<script src="${JS}/sticky_sidebar.min.js"></script>
	<script src="${JS}/shop_order_func.js"></script>

</body>
</html>