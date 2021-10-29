<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, main.java.mvc.model.dao.*, main.java.mvc.model.entity.*" %>
<%@ include file="includes.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shop</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/app_styles.css" media="screen">
	</head>
	<body class="fontCalibri">
		<!-- Declarations -->
		<%!		
			final static int MOUSE_ID = 1;
			final static String COOKIE_NAME_MOUSE = "shop_prueba.seen_mouse";
			boolean recomendMouse = false;
			Map<Integer, Product> productMap = ProductDAO.generateProductMap();			
		%>

		<%
		  // Cargamos los productos
		  List<Product> productList = new ArrayList<Product>(productMap.values());
		  pageContext.setAttribute("productList", productList);
		   
		  // Procesamos las cookies
		  Cookie[] cookies = request.getCookies();
		  if (cookies != null) {
			  System.out.println("cookies antes = " + cookies.length);
			  for (Cookie cookie : cookies) {
				  if (cookie.getName().equals(COOKIE_NAME_MOUSE)) {
					  recomendMouse = Boolean.parseBoolean(cookie.getValue());
					  break;
				  }
			  }
		  }
		%>
		<h3>Bienvenido, ${clientName}.</h3>
		<div><%= recomendMouse ? "Tenemos las siguientes recomendaciones de mouses para ti <a href=\"https:\\www.google.es\"class=\"button\">aquí</a>." : "" %></div>
		<br><br>
		<form action="" method="post">
			<table class="shoptable">
				<caption>Listado de productos</caption>
				<thead>
					<tr>
					    <th>Añadir</th>
					    <th>Producto</th>
					    <th>Descripción</th>
					    <th>Precio</th>
				    </tr>
			    </thead>
			    <c:forEach items="${pageScope.productList}" var="product" varStatus="loop" begin="0" end="${pageScope.productList.size() - 1}">
					<tr class="${loop.count % 2 == 0 ? 'even' : 'odd'}">
			        	<td class="center"><input type="checkbox" id="chkItem${product.productId}" name="shopItems" value="${product.productId}"></td>
			            <td class="text"><c:out value="${product.productName}"></c:out></td>
			            <td class="text"><c:out value="${product.description}"></c:out></td>
			            <td class="money"><fmt:formatNumber value="${product.price}" type="currency"/></td>		            
			        </tr>
			    </c:forEach>
			</table>
			<p class="center">
				<!-- <input type="submit" value="Comprar" id="button-create" />
				<input type="reset" value="Limpiar" id="button-clean" /> -->
				<button type="submit" formaction="refreshShop">Añadir al carro</button>
				<button type="reset">Limpiar</button>				
			</p>
		</form>
		<%
		  // Recuperamos el carro de la compra
		  List<Product> cartList = (List<Product>)session.getAttribute("cartList");
		  if (cartList == null) {
			  cartList = new ArrayList<Product>();
		  }
		  
		  // procesamos productos seleccionados
		  boolean hasMouse = false;
		  String[] selectedProducts = request.getParameterValues("shopItems");
		  if (selectedProducts != null) {
			  for (String selectedId : selectedProducts) {
				  int productId = Integer.parseInt(selectedId);
				  cartList.add(productMap.get(productId));
				  hasMouse = hasMouse || productId == MOUSE_ID;
			  } 
		  }
		  session.setAttribute("cartList", cartList);
		  
		// creamos cookie con par nombre-valor
		  if (hasMouse) {
			  Cookie mouseCookie = new Cookie(COOKIE_NAME_MOUSE, "true");
			  // vida de la cookie (en segundos)
			  mouseCookie.setMaxAge(5 * 60); // 5 min
			  response.addCookie(mouseCookie);
		  }
		%>
		<br><br>
		<div><jsp:include page="shoppingCart.jsp" /></div>
		<form>
			<p class="center">
				<button type="submit" formaction="doConfirmPayment">Ir al pago</button>			
			</p>
		</form>			
		<br><br>
		<%@ include file="footer.jsp" %>
	</body>
</html>