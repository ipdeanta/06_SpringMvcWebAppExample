<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Confirm registration</title>
	</head>
	<body>
		El cliente <strong>${newClient.name}</strong> <strong>${newClient.surname}</strong> se ha registrado correctamente.
		<br>
		El e-mail de registro es <strong>${newClient.email}</strong>.
		<br>
		La opción elegida es <strong>${newClient.option}</strong>.
		<br>
		El tipo de persona es <strong>${newClient.personType == 'F' ? 'Física' : 'Jurídica'}</strong>.
		<br>
		El envío de publicidad ha sido <strong>${newClient.authorizedAdvertising? 'autorizado' : 'desautorizado'}</strong>.
	</body>
</html>