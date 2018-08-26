<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- page文本框 begin -->
	<input type="hidden" class="pageInput" name="page.pageNumber"
		id="pageNumber" value="${page.pageNumber}" />
	<input type="hidden" class="pageInput" name="page.searchBy"
		id="searchBy" value="${page.searchBy}" />
	<input type="hidden" class="pageInput" name="page.keyword" id="keyword"
		value="${page.keyword}" />
	<input type="hidden" class="pageInput" name="page.orderBy" id="orderBy"
		value="${page.orderBy}" />
	<input type="hidden" class="pageInput" name="page.pageSize"
		id="pageSize" value="${page.pageSize}" />
	<input type="hidden" class="pageInput" name="page.order" id="order"
		value="${page.order}" />
	<input type="hidden" class="pageInput" name="page.totalCount"
		id="count" value="${page.totalCount}" />
	<input type="hidden" class="pageInput" name="page.pageCount"
		id="pageCount" value="${page.pageCount}" />
	<!-- page文本框 end -->
	<!-- 分页begin -->
	<!--内容右侧分页部分-->
	<div class="col-lg-12 col-md-12 col-sm-12 gmbbp_pagebox">
		<div class="gmbbp_page" id="pageul"></div>
	</div>
