<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String gmBase = request.getContextPath(); %>
<c:set var="redirect" value="${'./main.jsp' }"></c:set>
<c:set var="queryString" value="${pageContext.request.queryString}"></c:set>
<c:if test="${!empty queryString}">
	<c:set var="redirect" value="${fn:replace(queryString, 'redirectUrl=', '')}"></c:set>
</c:if>
<!DOCTYPE HTML>
<html>
  <head>
    <title>success</title>   
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
  </head>
  <body>
	<div class="container-fluid gmbbp_bg gmbbp_successfail_background gmbbp_success_blue ">
	    <div class="row">
	        <div class="col-md-5 text-right">
	            <div class="gmbbp_bg_title"></div>
	        </div>
	        <div class="col-md-7">
	            <p class="text-left gmb_successfail_font gmb_successfail_color">恭喜您，操作成功！</p>
	            <p class="text-left"><span id="gmbbp_time">3</span> 秒后跳转到上一页，如没有跳转，请 
	            <a href="${redirect }" class="gmb_successfail_color">点击这里</a>
	            </p>
	        </div>
	    </div>
	</div>
	<div id="gmbsucess" style="display:none;"></div>
	<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
  </body>
</html>