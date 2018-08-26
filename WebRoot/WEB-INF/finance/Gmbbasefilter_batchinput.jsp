<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>权限过滤管理-权限过滤编辑</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
<body>
<div class="container-fluid gmp GMAdmin">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form style="width:100%;height:100%;" id="listForm" method="post" class="form-horizontal" action="Gmbbasefilter!${isAddAction?'gmbAdd':'gmbUpdate'}.action" role="form">
		<div class="row gmbbp_content gmbbp_contentposition gmbbp_content_top120">
			<div class="col-md-12 gmbbp_content_padding">
<!-- 左侧菜单区域开始 -->
				<div class="col-md-2 gmbbp_contleft gmbbp_cont_left">
					<div class="gmbbp_cont_lefttitle">菜单</div>
						<div class="gmbbp_cont_nav">
							<ul class="lyrow ui-draggable column ui-sortable gmbbp_cont_treeborderNo gmbbp_cont_navl">
							<div></div>
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
			
				<!-- 表单区域开始 -->
					<div class="col-md-10 gmbbp_height gmbbp_size_right">
						<div class="col-md-12 gmbbp_content_right">
							<div class="col-md-12 gmbbp_con_righttitle">
								<!--内容右侧title部分开始-->
								<div class="gmbbp_conright_logo">&nbsp;&nbsp;${isAddAction?'批量创建':'编辑'}权限过滤</div>
								<!--内容右侧表格部分-->
								<div class="col-md-12 gmbbp_int_formcreat gmb_pageinfo">
									<div class="col-md-12 tab-content gmbbp_formlistcon">
										<div role="tabpanel" class="col-md-12 tab-pane active" id="tabgmbbasefilter">
											<input type="hidden" name="id" value="${gmbbasefilter.id}" />
											<input type="hidden" id="isAddAction" value="${isAddAction}" />
									 
							<div class="col-md-12 lyrow ui-draggable" data-setting = "2">
								<div class="col-md-12 column ui-sortable gmbbp_batchinputform_formgroup gmbbp_cont_treeborderNo gmdemolist">
									<button type="button" class="btn btn-default gmbbp_batchinput_close gmdeletbox" style="display:none;">X删除</button>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        名称:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="64"
													name="gmbbasefilterList[0].name" value="${gmbbasefilter.name}"
													placeholder="名称"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        地址:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="512"
													name="gmbbasefilterList[0].url" value="${gmbbasefilter.url}"
													placeholder="地址"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        是否过滤:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="1"
													name="gmbbasefilterList[0].isFilter" value="${gmbbasefilter.isFilter}"
													placeholder="是否过滤"/>
											</div>
										</div>
									</div>
									</div>
											<a href="javascript:;" class="gmbbp_batchinput_addone gmaddbox">+增加一条</a>
										</div>
									</div>
								</div>
								<div class="gmbbp_conright_subbox col-md-12">
									<div class="gmbbp_conright_butsub">
										<button type="submit" class="gmbbp_conright_butsave sub gmb_Validator" style="border: none;">保存</button>
										<button type="button" class="gmbbp_conright_butno" onclick="javascript:history.go(-1)">取消</button>
									</div>
								</div>
							</div>
						</div>
					</div>
			</form>
		</div>
	</div>
</div>	
<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
</head>
<script type="text/javascript">
	
	$(".sub").click(function(){
		if(!GM.Validator.baseValidate()){
			return false;
		};
	});
	/*初始化GreatMap控件*/
	GM.init();
	$(function() {
		
	});
	$().ready(function(){
		$("li[as='gmbbasefilter']").addClass("active");
	});
</script>
</body>
</html>