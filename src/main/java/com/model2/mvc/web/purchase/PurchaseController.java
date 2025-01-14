package com.model2.mvc.web.purchase;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.user.UserService;



//==> 회원관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value = "addPurchase", method=RequestMethod.GET)

	public String addProduct(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
	    System.out.println("/purchase/addPurchase : GET");
	    System.out.println("prodNo: " + prodNo);

	    
        Product product = purchaseService.getPurchase02(prodNo);
    
        model.addAttribute("product", product);
	    model.addAttribute("tranNo", prodNo);

	    return "forward:/purchase/addPurchaseView.jsp";
	}

			
	@RequestMapping(value = "addPurchase", method=RequestMethod.POST)
	public String addPurchase( HttpServletRequest request,
							   @ModelAttribute("purchase") Purchase purchase, 
							   @RequestParam("prodNo") int prodNo,
							   @RequestParam("buyerId") String userId,
							   Model model) throws Exception {

		System.out.println("/purchase/addPurchase : POST");
		
		//Business Logic
		HttpSession session=request.getSession();
		
	    User user = userService.getUser(userId);
	    Product product = productService.getProduct(prodNo);
	    purchase.setBuyer(user);
	    purchase.setPurchaseProd(product);
	    
	    purchaseService.addPurchase(purchase);	
	    
	    model.addAttribute("purchase",purchase);
		
		System.out.println("addpurchaseaction : "+purchase);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public String getPurchase(HttpServletRequest request,
			   @ModelAttribute("purchase") Purchase purchase, 
			   @RequestParam("tranNo") int tranNo,
			   Model model) throws Exception {
		
		System.out.println("/purchase/getPurchase");
		//Business Logic
		// Model 과 View 연결
		HttpSession session=request.getSession();
		String userId = (String)session.getAttribute("userId");
	    Product product = productService.getProduct(tranNo);
	  
	  
	    
	    purchaseService.getPurchase(tranNo);
	    purchase = purchaseService.getPurchase(tranNo);
	    model.addAttribute("purchase", purchase);
		
	    return "forward:/purchase/getPurchase.jsp";
        
	}

	@RequestMapping(value = "updatePurchase", method=RequestMethod.GET)
	public String updatePurchaseView(@RequestParam("tranNo") int tranNo ,
									HttpServletRequest request,
									Model model ) throws Exception{
			
		System.out.println("/updatePurchaseView.do");
		//Business Logic
	
		Purchase purchase = purchaseService.getPurchase(tranNo);
		System.out.println(purchase);
		model.addAttribute("purchase", purchase);
		return "forward:/purchase/updatePurchaseView.jsp";
		//return null;
	}

	@RequestMapping(value = "updatePurchase", method=RequestMethod.POST)
	public String updatePurchase( HttpServletRequest request, 
								  @ModelAttribute("purchase") Purchase purchase ,
								  Model model ) throws Exception{

		System.out.println("/purchase/updatePurchase");
		//Business Logic
		HttpSession session=request.getSession();
		purchase.setBuyer((User)session.getAttribute("user"));
		purchase.setPurchaseProd(new Product());
		
		
		purchaseService.updatePurchase(purchase);
		purchase = purchaseService.getPurchase(purchase.getTranNo());
		System.out.println(request.getParameter("regDate"));
		//purchase.setOrderDate(Date.valueOf(request.getParameter("regDate")));
		//Product getProd = productService.getProduct(tranNo);
		System.out.println("prodno test: " + purchase);
		purchase.setPurchaseProd(productService.getProduct(purchase.getPurchaseProd().getProdNo()));
	
		//Business Logic
		// Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchase.jsp";
	}

	@RequestMapping(value="listPurchase")
	public String listPurchase( @ModelAttribute("Product") Product product,
								@ModelAttribute("search") Search search , 
								Model model , HttpServletRequest request) throws Exception{
		
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
		
		return "forward:/purchase/getPurchaseList.jsp";
	}
	
	@RequestMapping(value = "updateTranCode", method =RequestMethod.GET)
	public String updateTranCodeByProd(@ModelAttribute("Purchase") Purchase purchase,
						@RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateTranCode.do");
		//Business Logic
		
		purchaseService.updateTranCode(prodNo);
		
		System.out.println("/updateTranCodeByProd.do");
		//Business Logic
		// Model 과 View 연결
			
		return "forward:/purchase/listPurchase";
	}
}