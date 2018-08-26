<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>权限过滤管理-权限过滤列表</title>
	<link rel="stylesheet"  href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css"  type="text/css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
</head>
<body>
<div class="container-fluid gmp GMAdmin ">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form id="listForm" class="form-horizontal" method="post" action="Gmbbasefilter!gmbList.action">
		<div class="row gmbbp_content gmbbp_contentposition">
			<div class="col-md-12 gmbbp_content_padding">
			  	<!--左侧导航开始-->
<!-- 左侧菜单区域开始 -->
				<div class="col-md-2 gmbbp_contleft gmbbp_cont_left">
					<div class="gmbbp_cont_lefttitle">菜单</div>
						<div class="gmbbp_cont_nav">
							<ul class="lyrow ui-draggable column ui-sortable gmbbp_cont_treeborderNo gmbbp_cont_navl">
							<div></div>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbasedatadic}">
								<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmbbasedatadic}" data-setting = "4">
									<a href="#" class="gmbbp_nav_level1" data-menu="gmb_base_datadic0">数据字典管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li  class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmbbasedatadic!gmbList.action" data-menu="gmb_base_datadic1"><span></span> 数据字典列表</a>
											</li>
										</div>
									</ul>
								</li>
							</c:if>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbasefilter}">
								<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmbbasefilter}" data-setting = "4">
									<a href="#" class="active gmbbp_nav_level1" data-menu="gmb_base_filter0">权限过滤管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li  class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmbbasefilter!gmbList.action" class="active" data-menu="gmb_base_filter1"><span></span> 权限过滤列表</a>
											</li>
										</div>
									</ul>
								</li>
							</c:if>
						</ul>
					</div>
					<!--内容左侧树导航开始-->
<div class="lyrow ui-draggable gmbbp_cont_tree" style="display:none">
						<div class="column ui-sortable gmbbp_cont_treeborderNo">
						</div>
					</div>
					<!--内容左侧树导航结束-->
				</div>
<!-- 左侧菜单区域结束 -->	
				<!--左侧导航结束-->				
				<!--内容右侧内容开始-->
	  			<div class="col-md-10 gmbbp_contentbox gmbbp_height gmbbp_size_right">
		  			<div class="col-md-12 gmbbp_content_right">
		  				<!--内容右侧title部分-->
						<div class="col-md-12 gmbbp_con_righttitle">
							<div class="col-md-7">
								<div class="gmbbp_conright_logo">&nbsp;&nbsp;权限过滤管理</div>
								<div class="gmbbp_conright_msg">
										<button type="button" class="btn btn-default" style="border: 0px solid;" id="addButton" url="Gmbbasefilter!gmbAdd.action?handle=forwardAddPage">
											<span class="glyphicon glyphicon-plus-sign gmss_span1" aria-hidden="true"></span> 添加
										</button>
										<button type="button" class="btn btn-default" style="border: 0px solid;" id="deleteButton" data-toggle="modal" data-target="#delModal" url="Gmbbasefilter!gmbDelete.action" disabled>
											<span class="glyphicon glyphicon-remove-sign gmss_span2" aria-hidden="true"></span> 删除
										</button>
									<div class="dropdown gmbbp_pagemsg">
										<button class="btn btn-default dropdown-toggle gmbbp_pagemsgbox" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
											高级功能 |
											<span class="caret"></span>
										</button>
									    <ul class="dropdown-menu gmbbp_select" role="menu" aria-labelledby="dropdownMenu1">						
											<li class="mpageactive"><a href="Gmbbasefilter!gmbAdd.action?handle=forwardbatchAddPage">批量添加</a></li>
											<li url="Gmbbasefilter!gmbAdd.action?handle=forwardAjaxAdd&importState=true&fields=id,name,url,isFilter" class="gmbtnupload" id="gmb_batch_import_path"><a href="#">批量导入</a></li>
											<li><a href="javascript:;" data-toggle="modal" data-target="#batchExport">批量导出</a></li>
											<li role="separator" class="divider" style="height:1px;"></li>
											    <div class="gmbbp_gjpage" id="pageSizeOption">
												   <li class="mpageactive"><a href="#" val="10">每页显示10</a></li>
												   <li><a href="#" val="20">每页显示20</a></li>
												   <li><a href="#" val="50">每页显示50</a></li>
											    </div>
									    </ul>
									</div>
								</div>
							</div>
							<div class="col-md-5 gmbbp_size_right">
								<div class="gmbbp_conright_search gmbbp_size_right">
									<div class="visible-lg-inline-block visible-sm-inline-block visible-md-inline-block visible-xs-inline-block gmbbp_size_right">
										<input type="text" class="form-control input-sm gmbbp_conseach" name="fullSearch" value="" placeholder="名称 地址  " id="fullSearch"/>&nbsp;&nbsp;
												<input type="hidden" name="searchColumns" value="name">
												<input type="hidden" name="searchColumns" value="url">
										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-primary gmbbp_conr_search searchButton selButton" style="padding-right:0;">
												<span class="glyphicon glyphicon-search"></span> 查询 &nbsp;&nbsp;|
											</button>
											<button type="button" class="btn btn-sm btn-primary dropdown-toggle gmbbp_conr_search bsearchmodel" aria-expanded="false" style="padding-left:5px;border-left:none">
												<span class="caret" ></span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>	
						<div class="col-md-12 panel-body panel-table" style="padding:0px;" url="<%=gmBase %>/finance/Gmbbasefilter!gmbList.action?handle=forwardListPage">
							<jsp:include page="Gmbbasefilter_table.jsp"></jsp:include>
						</div>
					</div>
				</div>	
			</div>
	 	</div>
	 	<!--内容右侧内容结束-->
	 	 
	<!-- 高级查询开始 -->
	<div tabindex="-1" class="modal fade" id="searchModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content gmbbp_search_box">
				<div class="modal-header gmbbp_search_title">
					<BUTTON class="close" type="button" data-dismiss="modal">
						<SPAN aria-hidden="true">×</SPAN><SPAN class="sr-only">Close</SPAN>
					</BUTTON>
					<H4 class="modal-title" id="myModalLabel"><span class="gmbbp_modal_lines"></span>高级查询窗口</H4>
				</div>				
				<div class="modal-body">
					<div class="input-group">
						<!-- 高级查询表单开始 -->
						<div class="form-group col-sm-6 gmbbp_search_formgroup">
							<label  class="col-sm-4 control-label gmbbp_inputtext">名称：</label>
							<div class="col-sm-8">
								<input type="hidden" name="searchFilter.searchFilters[0].columnName" value="name" />
								<input type="hidden" name="searchFilter.searchFilters[0].operate" value="LIKE" />
								<input type="hidden" name="searchFilter.searchFilters[0].relation" value="AND" />
							    <input type="text" class="form-control gmp_input" name="searchFilter.searchFilters[0].stringValue"
									value="${gmbbasefilter.name}" placeholder="名称" />
							</div>
						</div>
						<div class="form-group col-sm-6 gmbbp_search_formgroup">
							<label  class="col-sm-4 control-label gmbbp_inputtext">地址：</label>
							<div class="col-sm-8">
								<input type="hidden" name="searchFilter.searchFilters[1].columnName" value="url" />
								<input type="hidden" name="searchFilter.searchFilters[1].operate" value="LIKE" />
								<input type="hidden" name="searchFilter.searchFilters[1].relation" value="AND" />
							    <input type="text" class="form-control gmp_input" name="searchFilter.searchFilters[1].stringValue"
									value="${gmbbasefilter.url}" placeholder="地址" />
							</div>
						</div>
						<div class="form-group col-sm-6 gmbbp_search_formgroup">
							<label  class="col-sm-4 control-label gmbbp_inputtext">是否过滤：</label>
							<div class="col-sm-8">
								<input type="hidden" name="searchFilter.searchFilters[2].columnName" value="isFilter" />
								<input type="hidden" name="searchFilter.searchFilters[2].operate" value="=" />
								<input type="hidden" name="searchFilter.searchFilters[2].relation" value="AND" />
								<select class="form-control gmbbp_search_input" name="searchFilter.searchFilters[2].stringValue" placeholder="是否过滤">
									<option value="admin" selected="selected">全部</option>
									<option value="true">是</option>
									<option value="false">否</option>
								</select>
							</div>
						</div>
					</div>
					<!-- 高级查询表单结束 -->
				</div>
				<div class="modal-footer gmbbp_search_foot">
					<button class="btn selButton gmbbp_search_butsave" type="button">查询</button>
					<button class="btn btn-default gmbbp_search_butno" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 高级查询结束 -->
	
	<!-- 详细信息开始 -->
	<div tabindex="-1" class="modal fade" id="infoModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content gmbbp_search_box">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<SPAN aria-hidden="true">×</SPAN><SPAN class="sr-only">Close</SPAN>
					</button>
					<H4 class="modal-title"><span class="gmbbp_modal_lines"></span>详情</H4>
				</div>
				<div class="modal-body gmbbp_infoModal_height">
					<iframe width="100%" height="100%" frameborder="0" class="gmbbp_list_iframe" id="infobody"></iframe>	
				</div>
				<div class="modal-footer gmbbp_search_foot">
					<button class="btn btn-default btn-sm gmbbp_search_butno closeButton" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 详细信息结束 -->
	
	<!-- 批量导出modal开始-->
	<div tabindex="-1" class="modal fade" id="batchExport" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content gmbbp_search_box">
				<div class="modal-header search_title">
					<button class="close" type="button" data-dismiss="modal">
						<SPAN aria-hidden="true">×</SPAN><SPAN class="sr-only">Close</SPAN>
					</button>
					<H4 class="modal-title"><span class="gmbbp_modal_lines"></span>批量导出</H4>
				</div>
				<div class="modal-body">
					<div class="gmbbp_modaltable" id="gmbbp_list_modaltable">
						<table class="table">
							<tbody>
								<tr>
									<td><input type="checkbox" class="gmbbp_modal_allCheck"></td>
									<td>全选</td>
								</tr>
									<tr>
										<td><input type="checkbox" name="gmbbp_modal_ids" value="name" class="gmbbp_modal_ids"></td>
										<td>名称</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="gmbbp_modal_ids" value="url" class="gmbbp_modal_ids"></td>
										<td>地址</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="gmbbp_modal_ids" value="isFilter" class="gmbbp_modal_ids"></td>
										<td>是否过滤</td>
									</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer gmbbp_search_foot">
					<a class="gmbbp_list_displaynone" href="Gmbbasefilter!gmbList.action?handle=forwardAjaxList&exportState=true&fields=" style="display:none;"></a>
					<button type="button" class="btn gmbbp_search_butsave" id="gmbbp_allExport">导出</button>
					<button class="btn btn-default btn-sm gmbbp_search_butno closeButton" type="button" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 批量导出modal结束-->
	
	<!-- 删除确认modal开始-->
	<div tabindex="-1" class="modal fade" id="delModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content gmbbp_search_box">
				<div class="modal-header search_title">
					<button class="close" type="button" data-dismiss="modal">
						<SPAN aria-hidden="true">×</SPAN><SPAN class="sr-only">Close</SPAN>
					</button>
					<H4 class="modal-title"><span class="gmbbp_modal_lines"></span>提示信息</H4>
				</div>
				<div class="modal-body infobody">
					确定要删除吗！！！
				</div>
				<div class="modal-footer gmbbp_search_foot">
					<button class="btn gmbbp_search_butsave sureDel" type="button">确定</button>
					<button class="btn btn-default btn-sm gmbbp_search_butno closeButton" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 删除确认modal结束-->
	</form>
</div>
<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
</body>
</html>