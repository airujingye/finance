<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
</head>
<body>
<div class="gmbbp_cont_table">
	<!-- 列表开始 -->
	<a class="btn active gmb_set_textBox btn-primary" href="javascript:;" style="float: left; z-index: 50; margin-left: 5px; text-decoration: none;display:none;" contenteditable="true">设置文本</a>
	<a class="btn active gmb_set_tables" href="javascript:;" style="float: left; z-index: 50; text-decoration: none;display:none;" contenteditable="true">设置表格</a>
	<table id="dbtable" border="0" width="100%" class="lyrow ui-draggable gmbbp_table gmb_pageinfo" data-setting = "1">
		<thead>
			<tr class="column ui-sortable gmbbp_tab_title">
				<td class="gmbbp_tab_input"><input type="checkbox" class="allCheck"/></td>
						<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.money" >
					<div>金额</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.paytype" >
					<div>支付类型</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.userid" >
					<div>用户编号</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.remark" >
					<div>备注</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.paytime" >
					<div>支付时间</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.consumetype" >
					<div>消费类型</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.financetype" >
					<div>类型</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.updatetime" >
					<div>更新日期</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmfinance.creattime" style="display:none;">
					<div>创建日期</div>
				</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="gmfinance" items="${page.result}" varStatus="indexList">
				<tr <c:if test="${indexList.index%2!=0}">class="activetd"</c:if>>
					<td class="gmbbp_tab_input">
								<input type="checkbox" class="ids" name="ids" value="${gmfinance.id}"/>
					</td>
					<td ><div>${gmfinance.money}</div></td>
					<td ><div>${gmfinance.paytype}</div></td>
					<td ><div>${gmfinance.userid}</div></td>
					<td ><div>${fn:length(gmfinance.remark)>32?(fn:substring(gmfinance.remark, 0, 16).concat("...")):gmfinance.remark}</div></td>
					<td ><div><fmt:formatDate value="${gmfinance.paytime}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td ><div>${gmfinance.consumetype}</div></td>
					<td ><div>${gmfinance.financetype}</div></td>
					<td ><div><fmt:formatDate value="${gmfinance.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td style="display:none;"><div><fmt:formatDate value="${gmfinance.creattime}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td class="gmbbp_tablea">
						<a href="#details-modal" data-toggle="modal" class="gmbbp_table_more infohref" infourl="Gmfinance!gmbInfo.action?id=${gmfinance.id}" data-toggle="modal" data-target="#infoModal">
							详情
						</a>
						<a href="Gmfinance!gmbUpdate.action?handle=forwardUpdatePage&id=${gmfinance.id}" class="gmbbp_table_edit">
							编辑
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 列表结束-->
<!-- 引用分页页面 -->
<c:if test="${page.pageCount>1}">
	<%@ include file="../../common/pager.jsp"%>
</c:if>
</body>
</html>