<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		
//		1ac4afdcba93d76c73dd096a46417c6a
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default ">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
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
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	                
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
<!-- <  	ToolBar End /////////////////////////////////////
   	
	 화면구성 div Start /////////////////////////////////////
	<div class="container">
		
다단레이아웃  Start ///////////////////////////////////// 
		<div class="row">
	
		Menu 구성 Start /////////////////////////////////////     	
			<div class="col-md-3">
		        
		       	 회원관리 목록에 제목
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			 회원관리 아이템
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">상품검색</a></li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">최근본상품</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			 Menu 구성 end /////////////////////////////////////   

	 	 	 Main start /////////////////////////////////////   -->	
	 	 	<div class="text-center">
				<div class="jumbotron">
			  		<h1>Model2 MVC Shop</h1>
			  		<p>로그인 후 사용가능...</p>
			  		
			  		<p>아이디가 없으면</p>
			  		<p>회원가입 하세요.</p>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">로 그 인</a><br/><br/><br/>
	  				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
 					 <img src="/images/kakao_login.png" width="222"
    alt="카카오 로그인 버튼" />
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
 	 integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
      const KaApiKey = '1ac4afdcba93d76c73dd096a46417c6a';
      //2. 카카오 초기화
      Kakao.init(KaApiKey);
      Kakao.isInitialized();
      //3. 카카오로그인 코드 확인
      function loginWithKakao() {
        Kakao.Auth.login({
          success: function (authObj) {
            console.log(authObj); //access토큰 값
            Kakao.Auth.setAccessToken(authObj.access_token); //access 토큰 값 저장
            getInfo();
          },
          fail: function (err) {
            console.log(err);
          },
        });
      }
      //4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜 사용자 정보 받아옴.
      function getInfo() {
        Kakao.API.request({
          url: "/v2/user/me",
          success: function (res) {
            console.log(res);
            var id = res.id;
            var profile_nickname = res.kakao_account.profile.nickname;
            localStorage.setItem("nickname", profile_nickname);
           
            console.log(profile_nickname);
         
          },
          fail: function (error) {
            alert("카카오 로그인 실패" + JSON.stringify(error));
          },
        });
      }

      //5.로그아웃 기능 - 카카오 서버에 접속하는 액세스 토큰을 만료 시킨다.
      function kakaoLogOut() {
        if (!Kakao.Auth.getAccessToken()) {
          alert("로그인을 먼저 하세요.");
          return;
        }
        Kakao.Auth.logout(function () {
          alert("로그아웃" + Kakao.Auth.getAccessToken());
        });
      }
    </script>	
<!-- 			  			
 <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
  Kakao.init('1ac4afdcba93d76c73dd096a46417c6a'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="/images/kakao_login.png" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/main.jsp',
      state: 'userme',
    });
    Kakao.Auth.login({
        success: function (authObj) {
            console.log(authObj); // access토큰 값
            Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

            getInfo();
        },
        fail: function (err) {
            console.log(err);
        }
    });


  function requestUserInfo() {
	    Kakao.API.request({
	      url: '/v2/user/me',
	    })
	      .then(function(res) {
	        alert(JSON.stringify(res));
	      })
	      .catch(function(err) {
	        alert(
	          'failed to request user information: ' + JSON.stringify(err)
	        );
	      });
	  }
  
  function getInfo() {
      Kakao.API.request({
          url: '/v2/user/me',
          success: function (res) {
              console.log(res);
              // 이메일, 성별, 닉네임, 프로필이미지             
              var profile_nickname = res.kakao_account.profile.nickname;
             

              console.log(profile_nickname);
          },
          fail: function (error) {
              alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
          }
      });
  }
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
}
</script>  -->

			  		</div>
			  	
			  	</div>
	        </div> -->
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>