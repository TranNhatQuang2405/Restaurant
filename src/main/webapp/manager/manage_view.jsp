<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
	<link rel="stylesheet" href='<c:url value="/manager/stylemanage.css"></c:url>'>
</head>
<body>
	<c:url value="/Manage" var="MANAGE"></c:url>
	<c:url value="/Home" var="HOME"></c:url>
	
	<nav class="nav">
        <div class="container">
            <h1 class="logo"><a href='<c:url value="/Home"></c:url>'>GODZILLA</a></h1>
            <ul style="font-size: 16px;">
                <li><a href="${HOME}">Home</a></li>
                <li><a href="${MANAGE}/ManageOrder" class="current">Manage Order</a></li>
                <li><a href="${MANAGE}/ManageFood">Manage Food</a></li>
                <li><a href="${MANAGE}/ManageBooking">Manage Booking</a></li>
             	<li><a href="${MANAGE}/ManageChat" >Chat With Customer</a></li>             
            </ul>
        </div>
    </nav>
	<main class="container">
		<c:import url="/order/viewcart.jsp"></c:import>
	</main>
</body>
</html>