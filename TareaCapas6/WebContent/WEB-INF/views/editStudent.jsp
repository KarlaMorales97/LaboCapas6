<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/jquery-1.12.3.js"></script>
<script type="text/javascript" src="resources/jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/jquery-ui/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inicial</title>
</head>
<body class="grad1">

<script type="text/javascript">
	function limpiarCampos(){
		$("#nombre").val("");
		$("#apellido").val("");
		$("#edad").val("");
		$('#estado').prop('checked', false);
		$('#save').prop('disabled', true);
	}
</script>

	<h2>Registro de estudiante:</h2>
	<form:form id="form1" method="post" modelAttribute="student" action="${pageContext.request.contextPath}/saveStudent">
		<form:input type="hidden" id="cStudent" path="cStudent" />
		<table cellpadding="5">
			<tr>
				<td>Nombres:</td>
				<td><form:input type="text" id="nombre" path="sName" /></td>
			</tr>
			<tr>
				<td>Apellidos:</td>
				<td><form:input type="text" id="apellido" path="lName" /></td>
			</tr>
			<tr>
				<td>Edad:</td>
				<td><form:input type="number" id="edad" path="sAge" />
				
			</tr>
			<tr>
				<td>Estado</td>
				<td><form:checkbox id="estado" path="bActivo" /> Activo</td>
			</tr>
			<tr>
				<td><input id="save" type="submit" value="Guardar estudiante" class="myButton"  /></td>
				<td><input class="myButton" type="button" onclick="location.href='${pageContext.request.contextPath}/'" value="Ir a inicio" /></td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${resultado==1}">
				<script type="text/javascript">
					limpiarCampos();
				</script>
				<span><b>El estudiante fue guardado con &eacute;xito</b></span>
			</c:when>
			<c:when test="${resultado==0}">
				<span><b>Ocurrio un error al guardar al estudiante</b></span>
			</c:when>
		</c:choose>
	</form:form>
</body>
</html>