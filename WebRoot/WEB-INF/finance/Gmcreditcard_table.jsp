<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.finance.com/core" prefix="s"%>
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
						<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.cardno" >
					<div>银行</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.validitydate" >
					<div>有效期</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.money" >
					<div>额度（元）</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.money" >
					<div>余额（元）</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.bank" >
					<div>卡号</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.accountday" >
					<div>对账日</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.repaymentday" >
					<div>还款日</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.latefee" >
					<div>滞纳金（元）</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.userid"  style="display:none;">
					<div>用户编号</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.balance" style="display:none;">
					<div>余额（元）</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.cardholder">
					<div>持卡人</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.creattime" style="display:none;">
					<div>创建日期</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.updatetime" style="display:none;">
					<div>更新日期</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.remark" style="display:none;">
					<div>备注</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmcreditcard.cardtype" style="display:none;">
					<div>卡片类型</div>
				</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="gmcreditcard" items="${page.result}" varStatus="indexList">
				<tr <c:if test="${indexList.index%2!=0}">class="activetd"</c:if>>
					<td class="gmbbp_tab_input">
								<input type="checkbox" class="ids" name="ids" value="${gmcreditcard.id}"/>
					</td>
					<td ><div><s:dic key="id" value="${gmcreditcard.bank}" /></div></td>
					<td ><div><fmt:formatDate value="${gmcreditcard.validitydate}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td ><div>${gmcreditcard.money}</div></td>
					<td ><div>${gmcreditcard.balance}</div></td>
					<td ><div>${gmcreditcard.cardno}</div></td>
					<td ><div><fmt:formatDate value="${gmcreditcard.accountday}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td ><div><fmt:formatDate value="${gmcreditcard.repaymentday}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td ><div>${gmcreditcard.latefee}</div></td>
					<td style="display:none;"><div>${gmcreditcard.userid}</div></td>
					<td style="display:none;"><div>${gmcreditcard.balance}</div></td>
					<td ><div><s:dic key="id" value="${gmcreditcard.cardholder}" /></div></td>
					<td style="display:none;"><div><fmt:formatDate value="${gmcreditcard.creattime}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td style="display:none;"><div><fmt:formatDate value="${gmcreditcard.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
					<td style="display:none;"><div>${fn:length(gmcreditcard.remark)>32?(fn:substring(gmcreditcard.remark, 0, 16).concat("...")):gmcreditcard.remark}</div></td>
					<td style="display:none;"><div>${fn:length(gmcreditcard.cardtype)>32?(fn:substring(gmcreditcard.cardtype, 0, 16).concat("...")):gmcreditcard.cardtype}</div></td>
					<td class="gmbbp_tablea">
						<a href="#details-modal" data-toggle="modal" class="gmbbp_table_more infohref" infourl="Gmcreditcard!gmbInfo.action?id=${gmcreditcard.id}" data-toggle="modal" data-target="#infoModal">
							详情
						</a>
						<a href="Gmcreditcard!gmbUpdate.action?handle=forwardUpdatePage&id=${gmcreditcard.id}&type=${type}" class="gmbbp_table_edit">
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