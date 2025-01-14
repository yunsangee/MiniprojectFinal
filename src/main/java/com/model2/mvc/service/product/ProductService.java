package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;

	public interface ProductService {
		
		//상품 추가
		public void addProduct(Product product) throws Exception;
		
		//상품 정보 확인
		public Product getProduct(int prodNo) throws Exception;
		
		//상품정보리스트
		public Map<String, Object> getProductList(Search search) throws Exception;
		
		//상품 정보 수정
		public void updateProduct(Product product) throws Exception;
//		
//		//장바구니 구현
//		public Product getCart(Product product)throws Exception;
//	
	}
