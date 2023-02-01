<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! Something went worng..</title>
<%@include file="HelperPages/CssLink.jsp" %>
</head>
<body>
<div class="container text-center">
<img  src="img/error.png" class="img-fluid">
<h3 class="display-3">Sorry ! Something Went Wrong.....</h3>
<%=exception %>
<br>
<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
</div>

</body>
</html>