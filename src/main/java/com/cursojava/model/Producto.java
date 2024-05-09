package com.cursojava.model;

public class Producto {
	
	private int id;
	private String nombre;
	private Seccion seccion;
	private double precio;
	private long stock;
	
	public Producto() {
	}
	
	public Producto(int id, String nombre, Seccion seccion, double precio, long stock) {
		this.id = id;
		this.nombre = nombre;
		this.seccion = seccion;
		this.precio = precio;
		this.stock = stock;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Seccion getSeccion() {
		return seccion;
	}
	public void setSeccion(Seccion seccion) {
		this.seccion = seccion;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public long getStock() {
		return stock;
	}
	public void setStock(long stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Producto [id=").append(id).append(", nombre=").append(nombre).append(", seccion=")
				.append(seccion).append(", precio=").append(precio).append(", stock=").append(stock).append("]");
		return builder.toString();
	}
	
	
	
}
