<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pago confirmado</title>
		<link rel="stylesheet" type="text/css" href="css/app_styles.css" media="screen">
	</head>
	<body>
		<h2 class="center">Su pago ha sido confirmado. Gracias por su compra.</h2>
		<br><br>
		<form action="" method="post">
			<p class="center">
				<button type="submit" formaction="returnShop">Seguir comprando</button>				
			</p>
		</form>	
		<br><br>
		<%@ include file="footer.jsp" %>
	</body>
</html>