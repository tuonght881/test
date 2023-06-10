<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div></div>
	<table border="1" style="width: 100%;">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Amount</th>
			<th></th>
		</tr>
		<c:forEach var="item" items="${cart}">
			<form action="/cart/update/${item.product_id}" method="post">
				<input type="hidden" name="id" value="${item.id}">
				<tr>
					<td>${item.product_id}</td>
					<td>${item.product_name}</td>
					<td>${item.product_price}</td>
					<td><input name="qty" value="${item.qty}"
						onblur="this.form.submit()" style="width: 50px;"></td>
					<td>${item.price * item.qty}</td>
					<td><a href="/cart/remove/${item.product_id}">Remove</a></td>
				</tr>
			</form>
		</c:forEach>
	</table>
	<a href="/cart/clear">Clear cart</a>
	<a href="/item/index">Add more</a>
</body>
</html>