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
		product1.setFilename("iphone.jpg");
		
		Product product2 = new Product("SKU1235", "캐주얼 후드 스웨트셔츠", 70000);
		product2.setRegistrant("한민지");
		product2.setDescription("스타일리시한 캐주얼 후드 스웨트셔츠입니다. 앞면에 로고가 프린팅되어 있으며, 여러 색상과 사이즈로 제공됩니다. 사진은 모델 사진 첨부합니다.");
		product2.setCategory("의류");
		product2.setReleaseDate("2023/01/05");
		product2.setCondition("새 제품");
		product2.setFilename("hoodie.jpg");

		
		Product product3 = new Product("SKU1236", "플로랄 무드 향수", 90000);
		product3.setRegistrant("이민수");
		product3.setDescription("매혹적인 플로럴 무드 향수입니다. 부드러운 향이 지속되며, 섬세하고 여성스러운 느낌을 전달합니다.");
		product3.setCategory("향수");
		product3.setReleaseDate("2023/02/15");
		product3.setCondition("새 제품");
		product3.setFilename("perfume.jpg");

		
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
