package com.model2.mvc.web.purchase;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


@CrossOrigin(origins = "http://192.168.0.51:3000")
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestReactController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	public PurchaseRestReactController(){
		System.out.println(this.getClass());
	}
	
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("${pageSize}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	

	@RequestMapping(value="/react/listPurchase")
	public Map<String, Object> listPurchase( @RequestBody Search search , Model model  , 
							 HttpServletRequest request) throws Exception{
		
		System.out.println("/purchase/listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
				
		// Business logic 수행
		Map<String , Object> map = purchaseService.getPurchaseList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return map;
	}
	
	@RequestMapping(value = "react/getPurchase/{tranNo}", method = RequestMethod.GET)
	public Purchase postPurchase(HttpServletRequest request,
	        @ModelAttribute("purchase") Purchase purchase,
	        @PathVariable int tranNo,
	        Model model) throws Exception {

	    System.out.println("/purchase/getPurchase (POST)");

	    // Business Logic
	    // Model and View Connection
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    Product product = productService.getProduct(tranNo);

	    purchaseService.getPurchase(tranNo);
	    purchase = purchaseService.getPurchase(tranNo);

	    return purchaseService.getPurchase(tranNo);
	}

}