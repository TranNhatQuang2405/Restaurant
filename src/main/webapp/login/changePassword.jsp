<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

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
	
	<title>Authentication</title>
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

	<form action='<c:url value="/Home/ChangePassword"></c:url>' method="post">
		<section class="gradient-custom">
			<div class="container py-5 h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						<div class="card bg-dark text-white" style="border-radius: 1rem;">
							<div class="card-body p-5 text-center">
								<div class="mb-md-5 mt-md-4 pb-5">
									<h2 class="fw-bold mb-5 text-uppercase">Change Password</h2>
									<p class="text-white-50">Fill information to change Password</p>

									<div class="form-outline form-white mb-4">
										<label class="form-label" for="email">Your email: </label>
										<input type="email" id="email" name="email" value='<c:out value="${email}"></c:out>' 
											class="form-control form-control-lg" />
											<label class="form-label" for="typePasswordX">New Password: </label>
										<input type="password" id="typePasswordX" name="password" value='<c:out value="${password}"></c:out>'
											class="form-control form-control-lg" />
											<label class="form-label" for="retype">Retype New Password: </label>
										<input type="password" id="retype" name="retype" value='<c:out value="${retype}"></c:out>'
											class="form-control form-control-lg" />
									</div>
									<input type="hidden" value="true" name="change"/>
									<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
									<button class="btn btn-outline-light btn-lg px-5" type="submit">Change</button>
									<p><c:out value="${message}"></c:out></p>
									<a href='<c:url value="/Home"></c:url>'>Home</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>