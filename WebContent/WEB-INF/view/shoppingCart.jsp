<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.stream.*, java.util.function.*" %>
<%@ page import="main.java.mvc.model.dao.*, main.java.mvc.model.entity.*" %>
<%@ include file="includes.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/app_styles.css" media="screen">
	</head>
	<body>
		<jsp:scriptlet>
			<![CDATA[
		        Map<Integer, Product> cartMap = new HashMap<Integer, Product>();
		        // Recuperamos lista de sesión
			    List<Product> cartList = (List<Product>)session.getAttribute("cartList");
			    Map<Product, Long> groupedCart = new HashMap<Product, Long>();
			    if (cartList != null) {
			    	//procesamos lista
			    	groupedCart = cartList.stream().collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
			    	pageContext.setAttribute("groupedCart", groupedCart);
			    }
		   	]]>
		</jsp:scriptlet>
		<form action="">
		<table class="shoptable">
			<caption>Carro de la compra</caption>
			<thead>
				<tr>
				    <th>Cantidad</th>
				    <th>Producto</th>
				    <th>Descripción</th>
				    <th>Precio</th>
				    <th>Total</th>
			    </tr>
		    </thead>
		    <tbody>		
		        <c:forEach items="${pageScope.groupedCart}" var="entry" varStatus="loop">
			        <tr class="${loop.count % 2 == 0 ? 'even' : 'odd'}">
			        	<td class="center"><c:out value="${entry.value}"></c:out></td>
			            <td class="text"><c:out value="${entry.key.productName}"></c:out></td>
			            <td class="text"><c:out value="${entry.key.description}"></c:out></td>
			            <td class="money"><fmt:formatNumber value = "${entry.key.price}" type = "currency"/></td>
			            <td class="money"><fmt:formatNumber value = "${entry.key.price * entry.value}" type = "currency"/></td>
		             </tr>
		             <c:set var="totalCart" value="${totalCart + entry.key.price * entry.value}" ></c:set>
	           	</c:forEach>
           	</tbody>	
           	<tfoot>
				<tr>
					<th class="money" colspan="4">Total carro:</th>
					<td class="money"><fmt:formatNumber value="${totalCart}" type="currency"/></td>
				</tr>
			</tfoot>
		</table>
		</form>
	</body>
</html>