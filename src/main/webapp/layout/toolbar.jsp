<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         </c:if>
	                         
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">판매 상품등록</a></li>
		                         <li><a href="#">판매 상품관리</a></li>
		                         
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->
	             <c:if test="${sessionScope.user.role == 'user'}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                  
	                     <ul class="dropdown-menu">
	                         <li><a href="#">상 품 검 색</a></li>
	            		     <li><a href="#">구매이력조회</a></li>	                       
	                    </ul>
	                    </li>
	                    </c:if>
	                    
	                <li class="dropdown">
	                 <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                      <li><a href="#">최근본상품</a></li>
	                 </a>
	             </li>
	             </ul>
	             
	             
	             <ul class="nav navbar-nav navbar-right" >
	             
	             	 <li><a href="#">
	                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></a></span> </li>
	                <li><a href="#">로그아웃</a></li>
	               </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
  Kakao.init('1ac4afdcba93d76c73dd096a46417c6a'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<!-- <button class="api-btn" onclick="kakaoLogout()">로그아웃</button> -->

<script>
  function kakaoLogout() {
    Kakao.Auth.logout()
      .then(function() {
        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
        deleteCookie();
      })
      .catch(function() {
        alert('Not logged in');
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  function deleteCookie() {
    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  }
</script>
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout?menu=manage");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$( "a:contains('판매 상품관리')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
	 	
	 	$( "a:contains('판매 상품등록')" ).on("click" , function() {
			$(self.location).attr("href","/product/addProductView.jsp");
		});
	 	//==============상품 구매 Event 처리 ==================
	 	$( "a:contains('상 품 검 색')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
		//////////////////구매 user///////////////////////
	 	$( "a:contains('구매이력조회')" ).on("click" , function() {
			$(self.location).attr("href","/purchase/listPurchase?menu=search&userId=${user.userId}");
		});
	 	
	 	$( "a:contains('최근본상품')" ).on("click" , function() {
			history(1);
		});
	 	
	 	$( ".glyphicon-shopping-cart" ).on("click" , function() {
	 		$(self.location).attr("href","/purchase/listMarket?userId=${user.userId}");
		});
	 	
	 	function history(){
	 		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	 	}
	</script>  