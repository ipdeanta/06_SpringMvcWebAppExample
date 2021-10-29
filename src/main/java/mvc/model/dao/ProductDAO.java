package main.java.mvc.model.dao;

import java.util.HashMap;
import java.util.Map;

import main.java.mvc.model.entity.Product;

public class ProductDAO {

	
	public static Map<Integer, Product> generateProductMap() {
		Map<Integer, Product> list = new HashMap<Integer, Product>();
		Product product;
		product = new Product().setProductIdValue(1)
							   .setProductNameValue("Logitech MB")
							   .setDescriptionValue("Ratón inalámbrico Bluetooth")
							   .setPriceValue(19.99);		
		list.put(product.getProductId(), product);
		product = new Product().setProductIdValue(2)
							   .setProductNameValue("MSI Phoenix 15E")
							   .setDescriptionValue("Teclado Gaming con iluminación RGB")
							   .setPriceValue(39.95);		
		list.put(product.getProductId(), product);
		product = new Product().setProductIdValue(3)
							   .setProductNameValue("MSI Optix MAG271P")
							   .setDescriptionValue("Monitor Gaming 27\" 144 Hz 1080p")
							   .setPriceValue(219.90);		
		list.put(product.getProductId(), product);
		product = new Product().setProductIdValue(4)
							   .setProductNameValue("AMD Ryzen 4100F")
							   .setDescriptionValue("CPU 3.1 Ghz (con disipador)")
							   .setPriceValue(99.99);		
		list.put(product.getProductId(), product);
		product = new Product().setProductIdValue(5)
							   .setProductNameValue("Asus ROG NH450B")
							   .setDescriptionValue("Placa base socket AM4+, 4 slots DDR4, 2 PCI-e x16")
							   .setPriceValue(134.45);		
		list.put(product.getProductId(), product);
		return list;
	}
}