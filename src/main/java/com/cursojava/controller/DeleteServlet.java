package com.cursojava.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cursojava.service.TiendaServiceImpl;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static TiendaServiceImpl tienda = new TiendaServiceImpl();
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id;
		try {
			id = Integer.parseInt(request.getParameter("eliminar"));
		} catch(NumberFormatException e) {
			id = 0;
		}
		if (id != 0) {
			tienda.deleteProductoById(id);
		}
		response.sendRedirect("index.jsp");
	}


}
