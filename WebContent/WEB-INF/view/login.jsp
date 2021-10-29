<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ page session="false" %>
<%@ include file="includes.jsp" %>

<%! String nombreClase = "Login Tienda";
	
	public String getNombreClase() {
		return nombreClase;
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title><%= getNombreClase() %></title>
		<link rel="stylesheet" href="<spring:url value="resources/css/app_styles.css" htmlEscape="true"/>" type="text/css" />
	</head>
	<body>
		<h1 class="center fontCalibri">Login</h1>
		<%@ include file="loginForm.html" %>
		<br><br>
		<%@ include file="footer.jsp" %>
	</body>
</html>