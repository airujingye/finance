<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmcreditcard}" data-setting = "4">
	<a href="#" class="active gmbbp_nav_level1" data-menu="gm_credit_card0">财务管理</a>
	<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
		<div class="column ui-sortable gmbbp_cont_treeborderNo">
			<%-- <li  class="box box-element ui-draggable" data-setting = "4">
				<a href="<%=gmBase%>/finance/Gmcreditcard!gmbList.action?type=credit" data-menu="gm_credit_card1"><span></span> 信用卡表</a>
			</li>
			<li  class="box box-element ui-draggable" data-setting = "4">
				<a href="<%=gmBase%>/finance/Gmcreditcard!gmbList.action?type=bank" data-menu="gm_credit_card1"><span></span> 储蓄卡表</a>
			</li> --%>
			<li  class="box box-element ui-draggable" data-setting = "4">
				<a href="<%=gmBase%>/finance/Gmcreditcard!gmbList.action" data-menu="gm_credit_card"><span></span> 账户列表</a>
			</li>
			<li class="box box-element ui-draggable" data-setting = "4">
				<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action" class="active"  data-menu="gm_finance1"><span></span> 收支列表</a>
			</li>
			<%-- <li class="box box-element ui-draggable" data-setting = "4">
				<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action?type=pay" <c:if test="${type eq 'pay'}">class="active"</c:if>  data-menu="gm_finance1"><span></span> 支出列表</a>
			</li>
			<li class="box box-element ui-draggable" data-setting = "4">
				<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action?type=income" <c:if test="${type eq 'income'}">class="active"</c:if> data-menu="gm_finance1"><span></span> 收入列表</a>
			</li> --%>
		</div>
	</ul>
</li>