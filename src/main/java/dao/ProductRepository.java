package dao;

import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product product1 = new Product("SKU1234", "아이폰 12", 600000);
		product1.setRegistrant("김혜진");
		product1.setDescription("깨끗하게 사용한 아이폰 12입니다. 기스 거의 없고, 배터리 성능도 양호합니다.");
		product1.setCategory("전자제품");
		product1.setReleaseDate("2022/11/10");
		product1.setCondition("중고상품");
		product1.setFilename("SKU1234.jpg");
		
		Product product2 = new Product("SKU1235", "삼성 갤럭시 S21", 700000);
		product2.setRegistrant("한민지");
		product2.setDescription("삼성 갤럭시 S21 중고폰입니다. 화면에 약간의 스크래치가 있지만, 사용에는 문제가 없습니다.");
		product2.setCategory("전자제품");
		product2.setReleaseDate("2023/01/05");
		product2.setCondition("중고상품");
		product2.setFilename("SKU1235.jpg");
		
		Product product3 = new Product("SKU1236", "LG 그램 노트북", 900000);
		product3.setRegistrant("이민수");
		product3.setDescription("LG 그램 2021년형 모델입니다. 가벼운 사용감이 있으며, 모든 기능 정상 작동합니다.");
		product3.setCategory("전자제품");
		product3.setReleaseDate("2023/02/15");
		product3.setCondition("중고상품");
		product3.setFilename("SKU1236.jpg");
		
		listOfProducts.add(product1);
		listOfProducts.add(product2);
		listOfProducts.add(product3);
	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	public Product getProductById(String productId) {
		Product productById = null;

		for (Product product : listOfProducts) {
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
