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
						<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasemenu.name" >
					<div>名称</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasemenu.keyword" >
					<div>关键字</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasemenu.parentid" >
					<div>父节点</div>
				</td>
				<td class="box box-element ui-draggable" data-setting = "1" name="gmbbasemenu.url" >
					<div>菜单地址</div>
				</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="gmbbasemenu" items="${page.result}" varStatus="indexList">
				<tr <c:if test="${indexList.index%2!=0}">class="activetd"</c:if>>
					<td class="gmbbp_tab_input">
								<input type="checkbox" class="ids" name="ids" value="${gmbbasemenu.id}"/>
								<c:if test="${gmbbasemenu.isParent}">
									<span class="glyphicon glyphicon-folder-open"></span>
								</c:if>
					</td>
					<td ><div>${fn:length(gmbbasemenu.name)>32?(fn:substring(gmbbasemenu.name, 0, 16).concat("...")):gmbbasemenu.name}</div></td>
					<td ><div>${fn:length(gmbbasemenu.keyword)>32?(fn:substring(gmbbasemenu.keyword, 0, 16).concat("...")):gmbbasemenu.keyword}</div></td>
					<td ><div>${gmbbasemenu.parentid}</div></td>
					<td ><div>${fn:length(gmbbasemenu.url)>32?(fn:substring(gmbbasemenu.url, 0, 16).concat("...")):gmbbasemenu.url}</div></td>
					<td class="gmbbp_tablea">
						<a href="#details-modal" data-toggle="modal" class="gmbbp_table_more infohref" infourl="Gmbbasemenu!gmbInfo.action?id=${gmbbasemenu.id}" data-toggle="modal" data-target="#infoModal">
							详情
						</a>
						<a href="Gmbbasemenu!gmbUpdate.action?handle=${gmbbasemenu.isParent?'forwardCatalogUpdatePage':'forwardUpdatePage'}&id=${gmbbasemenu.id}" class="gmbbp_table_edit">
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