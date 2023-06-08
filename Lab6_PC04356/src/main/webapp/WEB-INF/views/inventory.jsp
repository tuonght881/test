<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>Loai hang</th>
			<th>Tong gia</th>
			<th>So san pham</th>
		</tr>
		<c:forEach var="item" items="${list}">
			<tr>
				<th>${item.group.name }</th>
				<th>${item.sum }</th>
				<th>${item.count }</th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>