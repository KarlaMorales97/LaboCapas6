<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="resources/jquery-1.12.3.js"></script>
<script type="text/javascript" src="resources/sweetalert/sweetalert.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpringJPA</title>
</head>
<body class="grad1">
	<form action="${pageContext.request.contextPath}/save" method="post"> 
		<input type="submit" value="Agregar nuevo usuario">
	</form>
	<br>
	<table>
		<tr>
			<th>Edit</th>
			<th>Id</th>
			<th>Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Status</th>
		</tr>
			<c:forEach items="${students}" var="students">
				<tr>
					<td><input type="button" class="myButton" value="Editar"
						onclick="location.href='${pageContext.request.contextPath}/editarEstudiante?cStudent=${students.cStudent}'"></td>
					<td>${students.cStudent}</td>
					<td>${students.sName}</td>
					<td>${students.lName}</td>
					<td>${students.sAge}</td>
					<td>${students.activoDelegate}</td>
				</tr>	
			</c:forEach>
	</table>
	

	
</body>
</html>