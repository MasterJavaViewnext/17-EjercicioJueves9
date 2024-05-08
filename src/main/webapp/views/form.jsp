<%@page import="com.cursojava.model.Seccion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/estilos.css">
<link rel="stylesheet" type="text/css" href="styles/formStyle.css">
<meta charset="ISO-8859-1">
<title>Formulario</title>
</head>
<body>
<form action="AltaServlet" method="POST">
		<div>
			<label for="nombre">Nombre:</label> <input type="text" id="nombre"
				name="nombre" value="${producto.getNombre()}" required/>
		</div>
		<div>
			<label for="seccion">Seccion:</label> 
			<select name="seccion" required>
				<option value="" selected disabled hidden>Selecciona una seccion</option>
				<c:forEach items="${Seccion.values()}" var="seccion">
					<!-- Comprueba cual es la seccion que coincide para seleccionarla cuando actualizamos -->
					<option value="${seccion}" ${seccion == producto.getSeccion() ? 'selected="selected"' : ''}>
					${seccion}
					</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label for="precio">Precio:</label> <input type="number"
				id="precio" name="precio" min="0" value="${producto.getPrecio()}" step=".01" required/>
		</div>
		<div>
			<label for="stock">Stock:</label> <input type="number"
				id="stock" name="stock" min="0" value="${producto.getStock()}" required/>
		</div>
		<div class="button">
			<button type="submit">${producto == null ? "Añadir" : "Actualizar" }</button>
		</div>
	</form>
</body>
</html>