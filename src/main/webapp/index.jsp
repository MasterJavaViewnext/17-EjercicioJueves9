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
<head>
<link rel="stylesheet" type="text/css" href="views/styles/estilos.css">
<link rel="stylesheet" type="text/css" href="views/styles/indexStyle.css">
<meta charset="ISO-8859-1">
<title>Mediamarkt</title>
</head>
<body>
	<form action="AltaServlet" method="GET">
		
		<input type="text" id="filtroNombre" onkeyup="filtrarByNombre()" placeholder="Busqueda por nombre..">
	
		<select id="filtroSeccion" onchange="filtrarBySeccion()">
			<option value="" selected disabled hidden>Selecciona una seccion</option>
			<c:forEach items="${Seccion.values()}" var="seccion">
				<option value="${seccion}">
				${seccion}
				</option>
			</c:forEach>
		</select>
		
		<input type="submit" value="Alta">
	
		<table id="myTable">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Seccion</th>
				<th>Precio</th>
				<th>Stock</th>
			</tr>
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
						<button type="button" onclick="deleteProducto(${producto.getId()})">Eliminar</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
<script type="text/javascript">
function filtrarByNombre() {
	  // Declare variables
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("filtroNombre");
	  filter = input.value.toUpperCase();
	  console.log(filter);
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
}
function filtrarBySeccion() {
	  // Declare variables
	  var input, filter, value, table, tr, td, i, txtValue;
	  input = document.getElementById("filtroSeccion");
	  filter = input.value;
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
}

function deleteProducto(id){
    if (!confirm('Estas seguro de que quieres eliminar al usuario con id '+id+'?')){ 
    	e.preventDefault();
    } else {
    	window.location.href='DeleteServlet?eliminar='+id;
    }
}
</script>
</html>