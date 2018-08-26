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
						<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.name" >
					<div>名称</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.code" >
					<div>代码</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.parentid" >
					<div>目录</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.description" >
					<div>描述</div>
				</td>
				<!-- <td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.isInternal" >
					<div>内置数据</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.gmkeycode" >
					<div>关键字</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasedatadic.gmorder" >
					<div>排序号</div>
				</td> -->
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="gmbbasedatadic" items="${page.result}" varStatus="indexList">
				<tr <c:if test="${indexList.index%2!=0}">class="activetd"</c:if>>
					<td class="gmbbp_tab_input">
								<c:if test="${gmbbasedatadic.isInternal}">
									<span class="glyphicon glyphicon-lock"></span>
								</c:if>
								<c:if test="${!gmbbasedatadic.isInternal}">
									<input type="checkbox" class="ids" name="ids" value="${gmbbasedatadic.id}"/>
								</c:if>
								<c:if test="${gmbbasedatadic.isParent}">
									<span class="glyphicon glyphicon-folder-open"></span>
								</c:if>
					</td>
					<td ><div>${fn:length(gmbbasedatadic.name)>32?(fn:substring(gmbbasedatadic.name, 0, 16).concat("...")):gmbbasedatadic.name}</div></td>
					<td ><div>${fn:length(gmbbasedatadic.code)>32?(fn:substring(gmbbasedatadic.code, 0, 16).concat("...")):gmbbasedatadic.code}</div></td>
					<td ><div>${gmbbasedatadic.parentid}</div></td>
					<td ><div>${fn:length(gmbbasedatadic.description)>32?(fn:substring(gmbbasedatadic.description, 0, 16).concat("...")):gmbbasedatadic.description}</div></td>
					<%-- <td ><div>${gmbbasedatadic.isInternal?'是':'否'}</div></td>
					<td ><div>${fn:length(gmbbasedatadic.gmkeycode)>32?(fn:substring(gmbbasedatadic.gmkeycode, 0, 16).concat("...")):gmbbasedatadic.gmkeycode}</div></td>
					<td ><div>${gmbbasedatadic.gmorder}</div></td> --%>
					<td class="gmbbp_tablea">
						<a href="#details-modal" data-toggle="modal" class="gmbbp_table_more infohref" infourl="Gmbbasedatadic!gmbInfo.action?id=${gmbbasedatadic.id}" data-toggle="modal" data-target="#infoModal">
							详情
						</a>
						<a href="Gmbbasedatadic!gmbUpdate.action?handle=${gmbbasedatadic.isParent?'forwardCatalogUpdatePage':'forwardUpdatePage'}&id=${gmbbasedatadic.id}" class="gmbbp_table_edit">
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