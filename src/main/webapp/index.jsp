<%@page import="com.cursojava.model.Seccion"%>
<%@page import="com.cursojava.service.TiendaServiceImpl"%>
<%@page import="com.cursojava.model.Producto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
TiendaServiceImpl tienda = new TiendaServiceImpl();
List<Producto> productos = tienda.listaProductos();
request.getSession().setAttribute("productos", productos);
%>
<!DOCTYPE html>
<html>
<head><!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="views/styles/estilos.css">
<link rel="stylesheet" type="text/css"
	href="views/styles/indexStyle.css">
<meta charset="ISO-8859-1">
<title>Tienda de electrónica</title>
</head>
<body>
<%@include file="views/header.html"%>
	<form action="AltaServlet" method="GET">
		<div id="inputs">
			<input type="text" id="filtroNombre" onkeyup="filtrarByNombre()"
				placeholder="Busqueda por nombre.."> <select
				id="filtroSeccion" onchange="filtrarBySeccion()">
				<option value="" selected disabled hidden>Selecciona una
					seccion</option>
				<c:forEach items="${Seccion.values()}" var="seccion">
					<option value="${seccion}">${seccion}</option>
				</c:forEach>
			</select> <input id=btnAlta type="submit" value="Añadir">
		</div>
		<table id="myTable">
			<tr>
				<th onclick="sortTableByNumero(0)">ID</th>
				<th onclick="sortTableByLetra(1)">Nombre</th>
				<th onclick="sortTableByLetra(2)">Seccion</th>
				<th onclick="sortTableByNumero(3)">Precio</th>
				<th onclick="sortTableByNumero(4)">Stock</th>
			</tr>
			<c:forEach items="${productos}" var="producto">
				<tr>
					<td><c:out value="${producto.getId()}" /></td>
					<td><c:out value="${producto.getNombre()}" /></td>
					<td><c:out value="${producto.getSeccion()}" /></td>
					<td><c:out value="${producto.getPrecio()}" /></td>
					<td><c:out value="${producto.getStock()}" /></td>
					<td>
						<button type="submit" name="btnModificar"
							value="${producto.getId()}">Modificar</button>
					</td>
					<td>
						<button class="btnDelete" type="button" onclick="deleteProducto(${producto.getId()})">
						<i class="fa fa-trash"></i></button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
<%@include file="views/footer.html"%>
</body>
<script src="views/index.js"></script>
</html>