<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
	<title>财务管理系统首页</title>
</head>
<body>
<div class="container-fluid gmbbp_bg gmbbp_401blue ">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center">
                <div class="gmbbp_bg_title"></div>
            </div>
            <p class="text-center">很遗憾，您未经授权访问...</p>
            <p class="text-center"><span id="gmbbp_time">3</span> 秒后跳转到首页，如没有跳转，请 <a href="./main.jsp">点击这里</a></p>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
</html>