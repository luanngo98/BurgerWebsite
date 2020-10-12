<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value='/template/login/images/icons/favicon.ico' />"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/vendor/bootstrap/css/bootstrap.min.css' />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css' />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css' />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/vendor/animate/animate.css' />">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/vendor/css-hamburgers/hamburgers.min.css' />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/vendor/select2/select2.min.css' />">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/css/util.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/login/css/main.css' />">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form class="login100-form validate-form" action="j_spring_security_check" id="formLogin" method="post">
					<span class="login100-form-title p-b-55">
						Login
					</span>

					<c:if test="${param.incorrectAccount != null}">
						<div class="alert alert-danger">	
								Username or password incorrect
						</div>
					</c:if>
					<c:if test="${param.accessDenied != null}">
						<div class="alert alert-danger">	
								you Not authorize
						</div>
					</c:if>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" id="userName" name="j_username" placeholder="Tên đăng nhập">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" id="password" name="j_password" placeholder="Mật khẩu">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-lock"></span>
						</span>
					</div>

					<!-- <div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Nhớ mật khẩu
						</label>
					</div> -->
					
					<div class="container-login100-form-btn p-t-25">
						<button class="login100-form-btn">
							Đăng nhập
						</button>
					</div>

					<%-- <div class="text-center w-full p-t-42 p-b-22">
						<span class="txt1">
							Hoặc đăng nhập với
						</span>
					</div>

					<a href="#" class="btn-face m-b-10">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-10">
						<img src="<c:url value='/template/login/images/icons/icon-google.png' />" alt="GOOGLE">
						Google
					</a>

					<div class="text-center w-full p-t-115">
						<span class="txt1">
							Không nhớ mật khẩu?
						</span>

						<a class="txt1 bo1 hov1" href="#">
							Đăng kí ngay					
						</a>
					</div> --%>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="<c:url value='/template/login/vendor/jquery/jquery-3.2.1.min.js' />"></script>
<!--===============================================================================================-->
	<script src="<c:url value='/template/login/vendor/bootstrap/js/popper.js' />"></script>
	<script src="<c:url value='/template/login/vendor/bootstrap/js/bootstrap.min.js' />"></script>
<!--===============================================================================================-->
	<script src="<c:url value='/template/login/vendor/select2/select2.min.js' />"></script>
<!--===============================================================================================-->
	<script src="<c:url value='/template/login/js/main.js' />"></script>

</body>
</html>