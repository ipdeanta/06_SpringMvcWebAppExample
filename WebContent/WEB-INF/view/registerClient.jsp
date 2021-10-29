<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Client register form</title>
		<link rel="stylesheet" href="<spring:url value="resources/css/app_styles.css" htmlEscape="true"/>" type="text/css" />
	</head>
	<body class="fontCalibri">
		<h1 class="center fontCalibri">Registro</h1>
		<p><p>
		<form:form action="processRegister" modelAttribute="newClient" method="POST">
			<div>
				<form:label path="id">Identificador</form:label>
				<form:input path="id" />
				<form:errors path="id" class="errorMessage"/>
			</div>  
			<div>
				<form:label path="name">Nombre</form:label>
				<form:input path="name" />
				<form:errors path="name" class="errorMessage"/>
			</div>  
			<div>
				<form:label path="surname">Apellido</form:label>
				<form:input path="surname" />
			</div>
			<div>
				<form:label path="email">E-mail</form:label>
				<form:input path="email" />
				<form:errors path="email" class="errorMessage"/>
			</div>
			<div>
				<form:label path="customValidationField">Campo especial</form:label>
				<form:input path="customValidationField" />
				<form:errors path="customValidationField" class="errorMessage"/>
			</div>  
			<div>
				<form:label path="option">Opciones</form:label>
				<form:select path="option">
					<form:option value="option1" label="Opción 1"/>
					<form:option value="option2" label="Opción 2"/>
					<form:option value="option3" label="Opción 3"/>
				</form:select>
			</div>
			<div>
				<form:label path="personType">Tipo de persona:</form:label>
				<form:radiobutton path="personType" value="F" checked="true"/> Física
				<form:radiobutton path="personType" value="J"/> Jurídica
			</div>
			<div>
				Autorizo a recibir recibir novedades, publicidad y/o promociones comerciales <form:checkbox path="authorizedAdvertising"/>
			</div> 
			<div class="center">
				<input type="submit" value="Register">
				<input type="reset" value="Clear">
			</div>
			
		</form:form>  
	</body>
</html>