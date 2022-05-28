<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
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
<link rel="stylesheet"
	href='<c:url value="/manager/stylemanage.css"></c:url>'>
<title>Manage Food</title>
<style type="text/css">
#displayImg>img {
	width: 200px;
	height: 200px;
	border: solid;
}
</style>
</head>
<body>
	<c:url value="/Manage" var="MANAGE"></c:url>
	<c:url value="/Home" var="HOME"></c:url>
	<header>
		<nav class="nav">
			<div class="container">
				<h1 class="logo">
					<a href='<c:url value="/Home"></c:url>'>GODZILLA</a>
				</h1>
				<ul>
					<li><a href="${HOME}">Home</a></li>
					<li><a href="${MANAGE}/ManageOrder">Manage Order</a></li>
					<li><a href="${MANAGE}/ManageFood" class="current">Manage
							Food</a></li>
					<li><a href="${MANAGE}/ManageBooking">Manage Booking</a></li>
					<li><a href="${MANAGE}/ManageChat">Chat With Customer</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="container">
		<center>
			<h1>Manage Food</h1>
		</center>
		<div class="row">
			<div class="col">
				<c:if test="${not empty message}">
					<div class="alert alert-success">
						<c:out value="${message}"></c:out>
					</div>
				</c:if>
				<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<c:out value="${error}"></c:out>
					</div>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<form id="myform"
					action="<c:url value="/Manage/ManageFood"></c:url>"
					enctype="multipart/form-data" method="post">
					<input type="hidden" value="${sessionScope.new_csrf}" name="csrf">
					<input id="action" type="hidden" name="action" value="add" />
					<div class="form-group">
						<label for="id">Food ID:</label> <input id="ID" type="number"
							name="id" class="form-control"
							value="<c:out value='${food.id}'></c:out>" />
					</div>
					<div class="form-group">
						<label for="name">Food Name:</label> <input type="text"
							class="form-control" name="name" id="name"
							value="<c:out value='${food.name}'></c:out>" />
					</div>
					<div class="form-group">
						<label for="price">Price: </label> <input type="number"
							class="form-control" name="price" id="price"
							value="<c:out value='${food.price}'></c:out>" />
					</div>
					<div class="form-group">
						<label for="description">Description: </label> <input type="text"
							class="form-control" name="description" id="description"
							value="<c:out value='${food.description}'></c:out>" />
					</div>
					<div class="form-group">
						<label>Type Of Food: </label>
						<div class="form-check form-check-inline">
							<input type="radio" checked="checked" class="form-check-input"
								value="starters" name="foodType" id="starters"
								${food.foodType.equals("starters")? 'checked':'' } /> <label
								class="form-check-label" for="starters">Starters</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" class="form-check-input" value="main"
								name="foodType" id="main"
								${food.foodType.equals("main")? 'checked':'' } /> <label
								class="form-check-label" for="main">Main</label>
						</div>
						<div class="form-check form-check-inline">
							<input type="radio" class="form-check-input" value="drink"
								name="foodType" id="drink"
								${food.foodType.equals("drink")? 'checked':'' } /> <label
								class="form-check-label" for="drink">Dessert and Drinks</label>
						</div>
					</div>
					<input type="hidden" class="IMAGE"
						value="<c:out value='${food.image}'></c:out>" name="image" />
					<div class="form-group">
						<label for="upload">Image: </label> <input type="file"
							class="form-control" name="upload" id="upload"
							onchange="ImagesFileAsURL()" />
					</div>
					<br />
					<div id="displayImg">
						<c:if test="${not empty food}">
							<c:if test='${not empty food.image}'>
								<img alt="Image" src="<c:out value='${food.image}'></c:out>">
							</c:if>
						</c:if>
					</div>
					<script type="text/javascript">
						function ImagesFileAsURL() {
							var fileSelected = document
									.getElementById('upload').files;
							if (fileSelected.length > 0) {
								var fileToLoad = fileSelected[0];
								var fileReader = new FileReader();
								fileReader.onload = function(fileLoaderEvent) {
									var srcData = fileLoaderEvent.target.result;
									var newImage = document
											.createElement('img');
									newImage.src = srcData;
									document.getElementById('displayImg').innerHTML = newImage.outerHTML;
								}
								fileReader.readAsDataURL(fileToLoad);
							}
						}
					</script>
					<br />
					<div class="form-group">
						<input value="Create" type="button" onclick="Add()"
							class="btn btn-primary" id="ADD"> <input value="Update"
							type="button" onclick="Update()" class="btn btn-warning" id="UP">
						<input value="Delete" type="button" onclick="Delete()"
							class="btn btn-danger" id="DE">
						<button type="submit" class="btn btn-info"
							formaction="<c:url value='/Manage/ManageFood?action=reset'></c:url>">Reset</button>
					</div>
				</form>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<table class="table table-stripe">
					<tr>
						<th width="8%">Food ID</th>
						<th>Food Name</th>
						<th>Food Type</th>
						<th>Price</th>
						<th>Image</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach var="item" items="${foods}">
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.foodType}</td>
							<td>${item.price}</td>
							<td><img src="${item.image}" width="80px" height="80px"
								alt="Image" /></td>
							<td><a
								href="<c:url value='/Manage/ManageFood?foodID=${item.id}&action=edit'></c:url>">Edit</a>
								<a
								href="<c:url value='/Manage/ManageFood?id=${item.id}&action=delete'></c:url>">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/8.5.0/firebase-app.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.5.0/firebase-storage.js"></script>
	<script nonce='<c:out value="${sessionScope.src_token}"></c:out>'>
		var firebaseConfig = {
			apiKey : "AIzaSyBOhI0IsCMob6UsgpAqH4L-_YKIfyevDFU",
			authDomain : "finalprojectweb555.firebaseapp.com",
			databaseURL : "https://finalprojectweb555-default-rtdb.firebaseio.com",
			projectId : "finalprojectweb555",
			storageBucket : "finalprojectweb555.appspot.com",
			messagingSenderId : "732888363289",
			appId : "1:732888363289:web:892428b3d2b24f48441588",
			measurementId : "G-LCZRP21DC6"
		};
		firebase.initializeApp(firebaseConfig);
	</script>
	<script defer src='<c:url value="/manager/upload.js"></c:url>'></script>

</body>
</html>