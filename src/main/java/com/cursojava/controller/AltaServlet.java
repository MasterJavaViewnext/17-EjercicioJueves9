package com.cursojava.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.cursojava.model.Producto;
import com.cursojava.model.Seccion;
import com.cursojava.service.TiendaServiceImpl;

public class AltaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static TiendaServiceImpl tienda = new TiendaServiceImpl();
	
	/**
	 * Método que llama el botón alta desde la pantalla principal
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id;
			try {
				id = Integer.parseInt(request.getParameter("btnModificar"));
			} catch(NumberFormatException e) {
				id = 0;
			}
		session.setAttribute("producto", tienda.findById(id));
		
		request.getRequestDispatcher("views/form.jsp").forward(request, response);
	}

	/**
	 * Metodo que llama la vista form.jsp para añadir o actualizar un producto
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Producto productoOriginal = (Producto)request.getSession().getAttribute("producto");
		Producto producto = new Producto();
		producto.setNombre(request.getParameter("nombre"));
		producto.setSeccion(Seccion.valueOf(request.getParameter("seccion")));
		producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
		producto.setStock(Long.parseLong(request.getParameter("stock")));

		System.out.println("OG-> "+productoOriginal);
		System.out.println("nuevo-> "+producto);
		if (productoOriginal == null) {
			tienda.insertProducto(producto);
		} else {
			producto.setId(productoOriginal.getId());
			tienda.updateProducto(producto);
		}
		response.sendRedirect("index.jsp");
	}


}
