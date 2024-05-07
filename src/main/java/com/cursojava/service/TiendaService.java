package com.cursojava.service;

import java.util.List;

import com.cursojava.model.Producto;
import com.cursojava.model.Seccion;

public interface TiendaService {
	
	public List<Producto> listaProductos();
	public List<Producto> listaProductosBySeccion(Seccion seccion);
	public void insertProducto(Producto producto);
	public void deleteProducto(Producto producto);
	public void deleteProductoById(int id);
	public void updateProducto(Producto producto);
	public Producto findById(int id);
}
