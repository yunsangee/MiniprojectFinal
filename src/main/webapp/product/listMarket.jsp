<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width" initial-scale=1.0/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/CommonScript.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
<!--    <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
    
    .image-box {
    display: flex; /* Use flexbox */
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    width: 100%;
    height: 300px; /* 이미지의 높이와 동일하게 설정 */
    overflow: hidden; /* 이미지가 박스를 벗어나지 않도록 함 */
	}

	.thumbnail-image {
    width: 60%; /* 이미지가 박스 안에 꽉 차게 함 */
    height: auto; /* 이미지 비율 유지 */
	}
    body{
       	padding-top : 50px;
    	 padding-bottom: 370px; /* 페이지 하단 여백 설정 */
   		 margin-bottom: 370px; /* 페이지 하단 여백 설정 */
    	}
    	
    h3 {
 	 text-align: center;
		}	
	footer {
    position: fixed; /* 고정 위치 설정 */
    bottom: 0; /* 화면 하단에 배치 */
    width: 100%; /* 전체 너비 설정 */
    background-color: #f5f5f5; /* 배경색 설정 */
    height: 50px; /* 높이 설정 */
    line-height: 50px; /* 수직 가운데 정렬 */
    text-align: center; /* 가운데 정렬 */
    margin: 0; /* 마진 초기화 */
    padding: 0; /* 패딩 초기화 */
}
    </style>
    
   <script type="text/javascript">
  
   //============== 검색 =================
   $(function(currentPage) {
		 $( ".btn-default" ).on("click" , function() {
			 currentPage=1;
			 $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();		});
	 }); 
   
   $(function() {
	 
	    $(".ct_list_pop td:nth-child(7)").on("click", function() {
	    	var prodNo = $(this).closest("tr").find('input[name^="prodNo"]').val();
	    	$(this).closest("form").append('<input type="hidden" name^="prodNo" value="' + prodNo + '">');
	        $(this).closest("form").submit();
	        $.ajax({
	            url: "/product/json/getProduct/" + prodNo,
	            method: "GET",
	            dataType: "json",
	            success: function(JSONData, status) {
	                var displayValue = "<h6>" +
	                    "상품명 : " + JSONData.prodName + "<br>" +
	                    "상품상세정보 : " + JSONData.prodDetail + "<br>" +
	                    "제조일자 : " + JSONData.manuDate + "<br>" +
	                    "가격 : " + JSONData.price + "<br>" +
	                    "</h6>";
	                
	                $("h3").remove();
	                $("#" + prodNo + "").html(displayValue);
	            }
	        });
	    });
   });
   
   $(function() {
	    $(".btn-primary").on("click", function() {
	    	 var prodNo = $(this).closest('.thumbnail').find('<input type="hidden" name="prodNo').val();
	         $(this).closest("form").append('<input type="hidden" name="prodNo" value="' + prodNo + '">');
	         $(this).closest("form").submit();
	       
	        self.location="/product/getProduct?menu=${param.menu}&prodNo="+prodNo;
	    });
	});
     
	    //trancode 처리
	    $(function() {
    $("#tranCode").on("click", function() {
        var prodNo = $(this).closest('.thumbnail').find('input[name^="prodNo"]').val();
        $(this).closest("form").append('<input type="hidden" name="prodNo" value="' + prodNo + '">');
        $(this).closest("form").submit();
        alert(prodNo);
        self.location = "/product/updateTranCodeByProd?prodNo=" + prodNo + "&menu=${param.menu}";
    });
});

</script>
</head>

<body>


<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
<div class="page-header text-info">
	<h2>상품 목록조회</h2>
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio1">스포츠 용품</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2">가전제품</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio3">식물/화분</label>
  
   <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio4">음료/주류</label>
  
   <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio5">문구/완구</label>
</div>
 </div>
	    
	    <div class="col-md-6 text-left">
  	<p class="text-primary">
  		전체  ${resultPage.totalCount } 건수
   	</p>
</div>

<div class="col-md-6 text-right">

	<form class="form-inline" name="detailForm">
			    
<div class="form-group">
 <select class="form-control" name="searchCondition" >
   <option value="0"  ${!empty search.searchCondition && search.searchCondition == 0 ? "selected":"" }>상품번호</option>
   <option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected":"" }>상품명</option>
   <option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected":"" }>상품가격</option>
 </select>  
</div>   
	
<div class="form-group">
  <label class="sr-only" for="searchKeyword">검색어</label>
  <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
	 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
</div>
				  
<button type="button" class="btn btn-default">검색</button>	
	
<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
</form>
</div>	    	
</div>

<%-- <tbody>
<c:set var="i" value="0" />
<c:forEach var="vo" items="${list}">
    
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
            <div class="image-box">
                <img src="/images/uploadFiles/${vo.fileName}" class="thumbnail-image" width="300px" height="300px">
                </div>
                <input type="hidden" name="prodNo${i}" value="${vo.prodNo }">
                <div class="caption">
                    <h3>${vo.prodName}</h3>
                    <p>${vo.prodDetail}</p>
                    <p>가격 : ${vo.price}</p>
                    <p><a href="#" class="btn btn-primary" role="button">상품 상세 정보</a>
                    <a href="#" class="btn btn-default" role="button">장바구니 담기</a></p>
                </div>
            </div>
        </div>
   
</c:forEach>

</tbody>
 --%>
<div id="thumbnailContainer">
   
</div>

<script>
$(function() {
	
	  $(document).on("click", ".btn-primary", function() {
		    var prodNo = $(this).closest('.thumbnail').find('input[name^="prodNo"]').val();
	        alert(prodNo);
	        self.location="/product/getProduct?menu=${param.menu}&prodNo="+prodNo;
	  });
	        
    var currentPage = 1;
    var isLoading = false;

    function loadProducts() {
        if (isLoading) return;

        isLoading = true;
        $.ajax({
            type: "post",
            url: "/product/json/listProduct",
            contentType: "application/json",
            data: JSON.stringify({ "currentPage": currentPage }),
            success: function(data, status) {
                if (data.list.length > 0) {
                    $.each(data.list, function(index, product) {
                        var thumbnailHtml =
                            '<div class="col-sm-6 col-md-4">' +
                            '<div class="thumbnail">' +
                            '<div class="image-box">' +
                            '<img src="/images/uploadFiles/' + product.fileName + '" class="thumbnail-image" width="300px" height="300px">' +
                            '</div>' +
                            '<input type="hidden" name="prodNo' + index + '" value="' + product.prodNo + '">' +
                            '<div class="caption">' +
                            '<h3>' + product.prodName + '</h3>' +
                            '<p>' + product.prodDetail + '</p>' +
                            '<p>가격 : ' + product.price + '</p>' +
                            '<p><a href="#" class="btn btn-primary" role="button">상품 상세 정보</a>' +
                            '<a href="#" class="btn btn-default" role="button">장바구니 담기</a></p>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        $("#thumbnailContainer").append(thumbnailHtml);
                    });
                    currentPage++;
                    isLoading = false;
                }
            }
        });
    }

    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
            loadProducts();
        }
    });

    loadProducts(); // 페이지 로드 시 한 번 호출하여 초기 데이터 가져오기
});

</script>

<%-- 
<footer>
<div class="container">
	
<table class="table table-hover table-striped" >   


 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	</table>
	</div>
	</footer> --%>
</body>
</html>