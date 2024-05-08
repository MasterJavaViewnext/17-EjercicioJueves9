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
<head>
<meta charset="ISO-8859-1">
<title>Mediamarkt</title>
</head>
<body>
	<form action="AltaServlet" method="GET">
		<input type="submit" value="Alta">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Seccion</th>
					<th>Precio</th>
					<th>Stock</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productos}" var="producto">
					<tr>
						<td><c:out value="${producto.getId()}" /></td>
						<td><c:out value="${producto.getNombre()}" /></td>
						<td><c:out value="${producto.getSeccion()}" /></td>
						<td><c:out value="${producto.getPrecio()}" /></td>
						<td><c:out value="${producto.getStock()}" /></td>
						<td>
							<button type="submit" name="btnModificar" value="${producto.getId()}">Modificar</button>
						</td>
						<td>
							<!-- <button type="submit" name="btnEliminar" value="${producto.getId()}" onclick="form.method='delete';">Eliminar</button>  -->
							<button type="button" onclick="setId(${producto.getId()})">Eliminar</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
<script type="text/javascript">
function setId(id){
    if (!confirm('Estas seguro de que quieres eliminar al usuario con id '+id+'?')){ 
    	e.preventDefault();
    } else {
    	window.location.href='DeleteServlet?eliminar='+id;
    }
}
</script>
</html>