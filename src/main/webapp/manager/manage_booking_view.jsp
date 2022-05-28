<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href='<c:url value="/manager/stylemanage.css"></c:url>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/style.css"></c:url>'>
</head>
<body class="body">
	<c:url value="/Manage" var="MANAGE"></c:url>
	<c:url value="/Home" var="HOME"></c:url>

	<nav class="nav">
		<div class="container">
			<h1 class="logo">
				<a href='<c:url value="/Home"></c:url>'>GODZILLA</a>
			</h1>
			<ul>
				<li><a href="${HOME}">Home</a></li>
				<li><a href="${MANAGE}/ManageOrder">Manage Order</a></li>
				<li><a href="${MANAGE}/ManageFood">Manage Food</a></li>
				<li><a href="${MANAGE}/ManageBooking" class="current">Manage
						Booking</a></li>
				<li><a href="${MANAGE}/ManageChat">Chat With Customer</a></li>
			</ul>
		</div>
	</nav>
	<main class="container">
		<section id="book-a-table" class="book-a-table">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Reservation</h2>
					<p>Status: ${booking.status==0 ? "Waiting For Confirm":(booking.status==1 ?"Waiting For Customer":(booking.status==2 ?"Finished":"Denied"))}</p>
				</div>
				<form action='<c:url value="/BookATable"></c:url>' method="post"
					class="email-form">
					<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
					<div class="row">
						<div class="col-lg-4 col-md-6 form-group">
							<input type="text" value=" <c:out value='${booking.name}'/>"
								name="name" class="form-control" id="name"
								placeholder="Your Name" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" readonly="readonly">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
							<input type="email"
								value="<c:out value='${booking.email}'></c:out>"
								class="form-control" name="email" id="email"
								placeholder="Your Email" data-rule="email"
								data-msg="Please enter a valid email" readonly="readonly">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3 mt-md-0">
							<input type="text"
								value="<c:out value='${booking.phone}'></c:out>"
								class="form-control" name="phone" id="phone"
								placeholder="Your Phone" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" readonly="readonly">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3">
							<input type="date" value="${booking.date}" name="date"
								class="form-control" id="date" placeholder="Date"
								data-rule="minlen:4" data-msg="Please enter at least 4 chars"
								readonly="readonly">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3">
							<input type="time"
								value="<c:out value='${booking.time}'></c:out>"
								class="form-control" name="time" id="time" placeholder="Time"
								data-rule="minlen:4" data-msg="Please enter at least 4 chars"
								readonly="readonly">
							<div class="validate"></div>
						</div>
						<div class="col-lg-4 col-md-6 form-group mt-3">
							<input type="number"
								value="<c:out value='${booking.npeople}'></c:out>"
								class="form-control" name="npeople" id="people"
								placeholder="# of people" data-rule="minlen:1"
								data-msg="Please enter at least 1 chars" readonly="readonly">
							<div class="validate"></div>
						</div>
						<input type="hidden" name="status"
							value="<c:out value='${booking.status}'></c:out>" />
					</div>
					<div class="form-group mt-3">
						<textarea class="form-control"
							value="<c:out value='${booking.message}'></c:out>" name="message"
							rows="5" placeholder="Message" readonly="readonly"></textarea>
						<div class="validate"></div>
					</div>
					<div class="mb-3">
						<div class="loading">Loading</div>
					</div>

					<div class="text-center">
						<c:if test="${not empty sessionScope.manager}">
							<c:if test="${booking.status == 0}">
								<button type="submit"
									formaction="<c:url value='/Manage/ManageBooking?action=accept&ID=${booking.id}'></c:url>"
									class="btn_1 full-width mb_5">Accept</button>
								<button type="submit"
									formaction="<c:url value='/Manage/ManageBooking?action=deny&ID=${booking.id}'></c:url>"
									class="btn_1 full-width mb_5">Deny</button>
								<button type="submit"
									formaction="<c:url value='/Manage/ManageBooking'></c:url>"
									class="btn_1 full-width mb_5">Close</button>
							</c:if>
							<c:if test="${booking.status == 1}">
								<button type="submit"
									formaction="<c:url value='/Manage/ManageBooking?action=finished&ID=${booking.id}'></c:url>"
									class="btn_1 full-width mb_5">Finished</button>
								<button type="submit"
									formaction="<c:url value='/Manage/ManageBooking'></c:url>"
									class="btn_1 full-width mb_5">Close</button>
							</c:if>
							<c:if test="${booking.status == 2 or booking.status == -1}">
								<button type="submit"
									formaction="<c:url value='/Manage/ManageBooking'></c:url>"
									class="btn_1 full-width mb_5">Close</button>
							</c:if>
						</c:if>
					</div>
				</form>
			</div>
		</section>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src='<c:url value ="/manager/manager.js"></c:url>'></script>
</body>
</html>