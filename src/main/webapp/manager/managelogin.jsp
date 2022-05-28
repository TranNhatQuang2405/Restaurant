<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Bootstrap CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	
	<title>Login Manager</title>
	<style type="text/css">
	.gradient-custom {
		/* fallback for old browsers */
		background: #6a11cb;
		/* Chrome 10-25, Safari 5.1-6 */
		background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1),
			rgba(37, 117, 252, 1));
		/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		background: linear-gradient(to right, rgba(106, 17, 203, 1),
			rgba(37, 117, 252, 1))
	}
	</style>
</head>
<body>
	<section class="gradient-custom">
		<form class="container py-5 h-100" action='<c:url value="/Manage/Login"></c:url>' method="post">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">
							<div class="mb-md-5 mt-md-4 pb-5">
								<h2 class="fw-bold mb-2 text-uppercase">Login to Manage</h2>
								<p class="text-white-50 mb-5">Please enter your login and password!</p>
								<div class="form-outline form-white mb-4">
									<label style="float: left;" class="form-label" for="typeEmailX">Email</label>
									<input type="email" name="email" id="typeEmailX" class="form-control form-control-lg" required="required"/> 
								</div>
								<div class="form-outline form-white mb-4">
									<label style="float: left;" class="form-label" for="typePasswordX">Password</label>
									<input type="password" name="password" id="typePasswordX" class="form-control form-control-lg" required="required"/> 
								</div>
								<input type="hidden" value="login" name="action">
								<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
								<button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
								<br />
								<c:if test="${not empty error}">
									<div  class="alert alert-danger"><c:out value="${error}"></c:out> </div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>