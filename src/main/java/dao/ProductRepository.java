package dao;

import java.util.ArrayList;
import dto.Product;


public class ProductRepository{
	
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance(){
		return instance;
	} 
	
	
	public ProductRepository() {
	
		Product product1= new Product("ISBN1234","C# 프로그래밍", 27000);
		product1.setAuthor("우재남");
		product1.setDescription("C#을 처음 접하는 독자를 대상으로 일대일 수업처럼 자세히 설명한 책이다. 꼭 알아야 할 핵심 개념은 기본 예제로 최대한 쉽게 설명했으며, 중요한 내용은 응용 예제, 퀴즈, 셀프 스터디, 예제 모음으로 한번 더 복습할 수 있다.");
		product1.setPublisher("한빛아카데미");
		product1.setCategory("IT모바일");
		product1.setUnitsInStock(1000);	
		product1.setReleaseDate("2022/10/06");
		product1.setFilename("ISBN1234.jpg");
		
		Product product2 = new Product("ISBN1235","자바마스터", 30000);
		product2.setAuthor("송미영");
		product2.setDescription("자바를 처음 배우는 학생을 위해 자바의 기본 개념과 실습 예제를 그림을 이용하여 쉽게 설명합니다. 자바의 이론적 개념→기본 예제→프로젝트 순으로 단계별 학습이 가능하며, 각 챕터의 프로젝트를 실습하면서 온라인 서점을 완성할 수 있도록 구성하였습니다.");
		product2.setPublisher("한빛아카데미");
		product2.setCategory("IT모바일");
		product2.setUnitsInStock(1000);		
		product2.setReleaseDate("2023/01/01");
		product2.setFilename("ISBN1235.jpg");
		
		Product product3= new Product("ISBN1236","파이썬 프로그래밍", 30000);
		product3.setAuthor("최성철");
		product3.setDescription(" 파이썬으로 프로그래밍을 시작하는 입문자가 쉽게 이해할 수 있도록 기본 개념을 상세하게 설명하며, 다양한 예제를 제시합니다. 또한 프로그래밍의 기초 원리를 이해하면서 파이썬으로 데이터를 처리하는 기법도 배웁니다.");
		product3.setPublisher("한빛아카데미");
		product3.setCategory("IT모바일");
		product3.setUnitsInStock(1000);	
		product3.setReleaseDate("2023/01/01");
		product3.setFilename("ISBN1236.jpg");
		
		listOfProducts.add(product1);
		listOfProducts.add(product2);
		listOfProducts.add(product3);
		
		
	}
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
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
