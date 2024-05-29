package com.model2.mvc.web.product;

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
import com.model2.mvc.service.product.ProductService;



//==> 회원관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("${pageSize}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@ModelAttribute Product product,
		    Model model, MultipartHttpServletRequest request	) throws Exception {
		
		
		
	    System.out.println("/product/addProduct : POST");
	    List<MultipartFile> fileList = request.getFiles("imagefile");

	    String uploadFolder = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Model2MVCShopReal\\images\\uploadFiles";
	    List<String> fileNames = new ArrayList<>();
	    
	    for(MultipartFile multipartFile : fileList) {
							
	    	
	    	String orgFileName = multipartFile.getOriginalFilename();
	    	long filesize = multipartFile.getSize();
	    	
	    	fileNames.add(orgFileName);
	    	
	    	String saveFile = uploadFolder + orgFileName;
			System.out.println("--------------------");
			System.out.println("Upload File Name" + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size" + multipartFile.getSize());
			
			
			try {
				multipartFile.transferTo(new File(saveFile));
			}catch(Exception e) {
				e.printStackTrace();

			}
			StringBuilder sb = new StringBuilder();
			for(String name : fileNames) {
				sb.append(name).append(",");
			}
			
			if(sb.length()>0) {
				sb.deleteCharAt(sb.length()-1);
			}
			
			String fileNameCSV = sb.toString();
			
               	
	    // Business Logic
		
		  product.setProdName(request.getParameter("prodName"));
		  product.setProdDetail(request.getParameter("prodDetail"));
		  product.setPrice(Integer.parseInt(request.getParameter("price")));
		  product.setManuDate(product.getManuDate().replace("-", ""));
		  product.setFileName(fileNameCSV);
		
	    
	    productService.addProduct(product);
	    model.addAttribute("product", product);
	    }
	        	    
	    return product;
	}
	
	

	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo,
			HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
	
		
		String history = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("history")) {
                    history = cookie.getValue();
                    break;
                }
            }
        }
        
        String newProdNo = request.getParameter("prodNo");
        if (newProdNo != null && !newProdNo.isEmpty()) {
            if (history == null) {
                history = ":" + newProdNo;
            } else {
                history += ":" + newProdNo;
            }

            Cookie historyCookie = new Cookie("history", history);
            historyCookie.setPath("/");
            response.addCookie(historyCookie);
        }
           return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/listProduct")
	public Map<String, Object> listProduct( @RequestBody(required=false) Search search , Model model , HttpServletRequest request) throws Exception{
		
		request.getAttribute("prodNo");
		
		System.out.println("/product/listProduct : POST");
		if(search==null) {
			search = new Search();
		}
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return productService.getProductList(search);
	}
		

}