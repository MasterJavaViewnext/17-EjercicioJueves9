package com.cursojava.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.cursojava.model.Producto;
import com.cursojava.model.Seccion;

public class TiendaServiceImpl implements TiendaService {

	static ArrayList<Producto> productos = new ArrayList<>(
			List.of(new Producto(1, "ordenador", Seccion.INFORMATICA, 409.95, 4),
					new Producto(2, "altavoces", Seccion.SONIDO, 55.40, 10),
					new Producto(3, "monitor", Seccion.INFORMATICA, 140.00, 6),
					new Producto(4, "consola", Seccion.VIDEOJUEGOS, 430.05, 3),
					new Producto(5, "television", Seccion.TELEVISION, 649.95, 2),
					new Producto(6, "ordenador", Seccion.INFORMATICA, 409.95, 4),
					new Producto(7, "altavoces", Seccion.SONIDO, 55.40, 10),
					new Producto(8, "monitor", Seccion.INFORMATICA, 140.00, 6),
					new Producto(9, "consola", Seccion.VIDEOJUEGOS, 430.05, 3),
					new Producto(10, "television", Seccion.TELEVISION, 649.95, 2),
					new Producto(11, "movil", Seccion.TELEFONIA, 800.05, 1)));

	/**
	 * Método que devuelve el id mas altos de todos los productos o 0 si no hay
	 * productos
	 * 
	 * @return int id
	 */
	public int lastId() {
		int id = 0;
		if (!productos.isEmpty()) {
			id = productos.stream().max((p1, p2) -> {
				return p1.getId() - p2.getId();
			}).get().getId();
		}
		return id;
	}

	@Override
	public List<Producto> listaProductos() {
		return productos;
	}

	@Override
	public List<Producto> listaProductosBySeccion(Seccion seccion) {
		return productos.stream().filter(p -> p.getSeccion().equals(seccion)).toList();
	}

	@Override
	public void insertProducto(Producto producto) {
		producto.setId(lastId() + 1);
		System.out.println(producto);
		productos.add(producto);
	}

	@Override
	public void deleteProducto(Producto producto) {
		productos.remove(producto);
	}

	@Override
	public void deleteProductoById(int id) {
		productos.remove(findById(id));
	}

	@Override
	public void updateProducto(Producto producto) {
		Optional<Producto> productoOriginal = productos.stream().filter(p -> p.getId() == producto.getId()).findFirst();

		productoOriginal.ifPresent(p -> {
			p.setNombre(producto.getNombre());
			p.setSeccion(producto.getSeccion());
			p.setPrecio(producto.getPrecio());
			p.setStock(producto.getStock());
		});
	}

	@Override
	public Producto findById(int id) {
		return productos.stream().filter(p -> p.getId() == id).findAny().orElse(null);
	}

}
