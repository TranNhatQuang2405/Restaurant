<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body class="body">
	<c:url value="/Manage" var="MANAGE"></c:url>
	<c:url value="/Home" var="HOME"></c:url>
	
	<nav class="nav">
        <div class="container">
            <h1 class="logo"><a href='<c:url value="/Home"></c:url>'>GODZILLA</a></h1>
            <ul>
                <li><a href="${HOME}">Home</a></li>
                <li><a href="${MANAGE}/ManageOrder">Manage Order</a></li>
                <li><a href="${MANAGE}/ManageFood">Manage Food</a></li>
                <li><a href="${MANAGE}/ManageBooking" >Manage Booking</a></li>
                <li><a href="${MANAGE}/ManageChat" class="current" >Chat With Customer</a></li>                
            </ul>
        </div>
    </nav>
    <main class="container" style="background-color: white;">
	    <iframe src="https://dashboard.tawk.to/#/chat" width="100%" height="800" ></iframe>
    </main>
    <div>${sessionScope.error_view_booking}</div>
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<script type="text/javascript" src='<c:url value ="/manager/manager.js"></c:url>'></script>
</body>
</html>