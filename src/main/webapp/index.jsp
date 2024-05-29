<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
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
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
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
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
	                
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
<!-- <  	ToolBar End /////////////////////////////////////
   	
	 ȭ�鱸�� div Start /////////////////////////////////////
	<div class="container">
		
�ٴܷ��̾ƿ�  Start ///////////////////////////////////// 
		<div class="row">
	
		Menu ���� Start /////////////////////////////////////     	
			<div class="col-md-3">
		        
		       	 ȸ������ ��Ͽ� ����
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			 ȸ������ ������
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
						  <li class="list-group-item">
						  	<a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">�ֱٺ���ǰ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			 Menu ���� end /////////////////////////////////////   

	 	 	 Main start /////////////////////////////////////   -->	
	 	 	<div class="text-center">
				<div class="jumbotron">
			  		<h1>Model2 MVC Shop</h1>
			  		<p>�α��� �� ��밡��...</p>
			  		
			  		<p>���̵� ������</p>
			  		<p>ȸ������ �ϼ���.</p>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">ȸ������</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">�� �� ��</a><br/><br/><br/>
	  				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
 					 <img src="/images/kakao_login.png" width="222"
    alt="īī�� �α��� ��ư" />
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
 	 integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
      const KaApiKey = '1ac4afdcba93d76c73dd096a46417c6a';
      //2. īī�� �ʱ�ȭ
      Kakao.init(KaApiKey);
      Kakao.isInitialized();
      //3. īī���α��� �ڵ� Ȯ��
      function loginWithKakao() {
        Kakao.Auth.login({
          success: function (authObj) {
            console.log(authObj); //access��ū ��
            Kakao.Auth.setAccessToken(authObj.access_token); //access ��ū �� ����
            getInfo();
          },
          fail: function (err) {
            console.log(err);
          },
        });
      }
      //4. ������ ��ū�� �߱޹ް�, �Ʒ� �Լ��� ȣ����� ����� ���� �޾ƿ�.
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
            alert("īī�� �α��� ����" + JSON.stringify(error));
          },
        });
      }

      //5.�α׾ƿ� ��� - īī�� ������ �����ϴ� �׼��� ��ū�� ���� ��Ų��.
      function kakaoLogOut() {
        if (!Kakao.Auth.getAccessToken()) {
          alert("�α����� ���� �ϼ���.");
          return;
        }
        Kakao.Auth.logout(function () {
          alert("�α׾ƿ�" + Kakao.Auth.getAccessToken());
        });
      }
    </script>	
<!-- 			  			
 <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
  Kakao.init('1ac4afdcba93d76c73dd096a46417c6a'); // ����Ϸ��� ���� JavaScript Ű �Է�
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="/images/kakao_login.png" width="222"
    alt="īī�� �α��� ��ư" />
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
            console.log(authObj); // access��ū ��
            Kakao.Auth.setAccessToken(authObj.access_token); // access��ū�� ����

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
              // �̸���, ����, �г���, �������̹���             
              var profile_nickname = res.kakao_account.profile.nickname;
             

              console.log(profile_nickname);
          },
          fail: function (error) {
              alert('īī�� �α��ο� �����߽��ϴ�. �����ڿ��� �����ϼ���.' + JSON.stringify(error));
          }
      });
  }
  // �Ʒ��� ���� ���� UI �ڵ��Դϴ�.
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
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>