<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${param.paytype eq '0' }">现金</c:when>
	<c:when test="${param.paytype eq '1' }">浦发信用卡</c:when>
	<c:when test="${param.paytype eq '2' }">交通信用卡</c:when>
	<c:when test="${param.paytype eq '3' }">招商信用卡</c:when>
	<c:when test="${param.paytype eq '4' }">京东白条</c:when>
</c:choose>