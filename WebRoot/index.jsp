<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String gmBase = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="viewport" name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
<link rel="stylesheet"
	href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_login.css"
	type="text/css" />
<title>财务管理系统-登录</title>
</head>
<body>
	<div class="container-fluid">
		<!--导航 begin-->
		<nav class="row gmbbp_login_nav">
			<div class="col-xs-6 col-sm-6 col-md-9 col-lg-9 gmbbp_login_nav_left">
				<h1>
					<a class="gmbbl_login" href="<%=gmBase%>"><img
						src="./img/gmss_logo.png" /></a>
				</h1>
			</div>
			<div
				class="col-xs-6 col-sm-6 col-md-3 col-lg-3 gmbbp_login_nav_right">
				<a href="#">联系我们</a> <a
					href="#">关于我们</a>
			</div>
		</nav>
		<!--导航 end-->
		<!--login 登录 begin-->
		<div class="row gmbbp_login_body">
			<div class="gmbbp_login_box">
				<h3 class="gmbbp_login_userlogin">用户登录/LOGIN</h3>
				<form id="GMBFormLogin"
					action="<%=gmBase%>/finance/Gmsecurity!login.action" method="post"
					gmforword="main.jsp">
					<!--用户名 begin-->
					<div class="form-group gmbbp_login_username">
						<i class="gmbbp_login_userbg gmbbp_login_bg1"></i> <input
							type="text"
							class="form-control gmbbp_login_input_box gmb_required"
							value="greatmap_admin_sqm" name="gmbbaseuser.username"
							placeholder="您的用户名" required autofocus />
					</div>
					<!--用户名 end-->
					<!--用户密码 begin-->
					<div class="form-group gmbbp_login_password">
						<i class="gmbbp_login_userbg gmbbp_login_bg2"></i> <input
							type="password"
							class="form-control gmbbp_login_input_box gmb_required"
							name="gmbbaseuser.password" placeholder="您的密码" />
					</div>
					<!--用户密码 end-->
					<!--记住密码 begin-->
					<div class="gmbbp_login_checkbox">
						<label> <input type="checkbox"> 记住密码
						</label>
					</div>
					<!--记住密码 end-->
					<button type="button"
						class="btn btn-default gmbbp_login_input_sub GMB_Btn_Login">登录</button>
					<%-- 后台登录用户 --%>
					<input type="hidden" name="gmusertype" value="admin">
				</form>
			</div>
		</div>
		<!--body 登录 end-->
		<footer class=" text-center gmbbp_login_foot">
			© 版权所有2012-2018 
		</footer>
	</div>
	<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
	<script type="text/javascript"
		src="<%=gmBase%>/gmstatic/js/GreatMap/GreatMap.Login.js"></script>
</body>
</html>
