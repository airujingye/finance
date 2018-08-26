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
	<title>数据字典管理-数据字典编辑</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
<body>
<div class="container-fluid gmp GMAdmin">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form style="width:100%;height:100%;" id="listForm" method="post" class="form-horizontal" action="Gmbbasedatadic!${isAddAction?'gmbAdd':'gmbUpdate'}.action" role="form">
		<div class="row gmbbp_content gmbbp_contentposition gmbbp_content_top120">
			<div class="col-md-12 gmbbp_content_padding">
<!-- 左侧菜单区域开始 -->
				<div class="col-md-2 gmbbp_contleft gmbbp_cont_left">
					<div class="gmbbp_cont_lefttitle">菜单</div>
						<div class="gmbbp_cont_nav">
							<ul class="lyrow ui-draggable column ui-sortable gmbbp_cont_treeborderNo gmbbp_cont_navl">
							<div></div>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbasedatadic}">
								<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmbbasedatadic}" data-setting = "4">
									<a href="#" class="active gmbbp_nav_level1" data-menu="gmb_base_datadic0">数据字典管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li  class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmbbasedatadic!gmbList.action" class="active" data-menu="gmb_base_datadic1"><span></span> 数据字典列表</a>
											</li>
										</div>
									</ul>
								</li>
							</c:if>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbasefilter}">
								<li class="lyrow ui-draggable gmcif" test="${!empty gmbasemenu.gmb_menus_gmbbasefilter}" data-setting = "4">
								<a href="#" class="gmbbp_navl_normal gmbbp_nav_level1" data-menu="gmb_base_filter0">权限过滤管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar" >
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li class="box box-element ui-draggable" data-setting = "4">
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
							<div class="col-md-12">
								<div class="gmbbp_cont_treetitle 
									gmbbp_cont_treetitlebgup">
									
										树导航&nbsp;
								</div>
								<div class="gmbbp_cont_treecon" style="padding-left:20px;display:none;">
									<!-- 侧栏树代码 -->
									<div class="zTreeDemoBackground left bg-ztree">
										<ul id="treegmbbasedatadic" class="ztree GMZtree" gmOnClick="zTreeOnClick" gmTreeIsEnable="false" gmTreeShowName="name" gmTreeUrl="<%=gmBase%>/finance/Gmbbasedatadic!gmbList.action?handle=forwardListParentTree"></ul>
									</div>
								</div>
							</div>						
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
								<div class="gmbbp_conright_logo">&nbsp;&nbsp;${isAddAction?'批量创建':'编辑'}数据字典</div>
								<!--内容右侧表格部分-->
								<div class="col-md-12 gmbbp_int_formcreat gmb_pageinfo">
									<div class="col-md-12 tab-content gmbbp_formlistcon">
										<div role="tabpanel" class="col-md-12 tab-pane active" id="tabgmbbasedatadic">
											<input type="hidden" name="id" value="${gmbbasedatadic.id}" />
											<input type="hidden" id="isAddAction" value="${isAddAction}" />
									 
							<div class="col-md-12 lyrow ui-draggable" data-setting = "2">
								<div class="col-md-12 column ui-sortable gmbbp_batchinputform_formgroup gmbbp_cont_treeborderNo gmdemolist">
									<button type="button" class="btn btn-default gmbbp_batchinput_close gmdeletbox" style="display:none;">X删除</button>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											            <span>*</span>
											        名称:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input  gmb_required" maxlength="45"
													name="gmbbasedatadicList[0].name" value="${gmbbasedatadic.name}"
													placeholder="名称" required/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											            <span>*</span>
											        代码:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input  gmb_required" maxlength="45"
													name="gmbbasedatadicList[0].code" value="${gmbbasedatadic.code}"
													placeholder="代码" required/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        父节点:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<div class="input-group from-tree" gmZtreeTid="nameparentNode" title="点击选择节点" gmKeyName="name"
													gmTreeIsEnable='false' gmtreeurl="../finance/Gmbbasedatadic!gmbList.action?handle=forwardListParentTree">
													<input type="text" class="form-control gmbbp_input parentId GMZtree" src="<%=gmBase%>/finance/Gmbbasedatadic!getGmbbasedatadicObj.action?id=${gmbbasedatadic.parentid}" showname="name" value="${isAddAction? addGmbbasedatadic.name==null?"顶级节点":addGmbbasedatadic.name : parentObj==null?"顶级节点":parentObj.name }" readonly/>
													<input type="hidden" name="gmbbasedatadicList[0].parentid" value="${isAddAction ? addGmbbasedatadic.id==null?"0":addGmbbasedatadic.id : gmbbasedatadic.parentid }" readonly/>
													<div class="input-group-addon">选择</div>
												</div>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
												<label> 
													是否是父节点:
												</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<select class="form-control gmbbp_input " name="gmbbasedatadicList[0].isParent" placeholder="是否是父节点">
													<option value="">请选择</option>
													<option value="true" <c:if test="${gmbbasedatadic.isParent||isAddAction}">selected="selected"</c:if>>是</option>
													<option value="false" <c:if test="${!gmbbasedatadic.isParent&&!isAddAction||(!isCatalog&&isAddAction)}">selected="selected"</c:if>>否</option>
												</select>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        描述:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="45"
													name="gmbbasedatadicList[0].description" value="${gmbbasedatadic.description}"
													placeholder="描述"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
												<label> 
													内置数据:
												</label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<select class="form-control gmbbp_input " name="gmbbasedatadicList[0].isInternal" placeholder="内置数据">
													<option value="">请选择</option>
													<option value="true" <c:if test="${gmbbasedatadic.isInternal||isAddAction}">selected="selected"</c:if>>是</option>
													<option value="false" <c:if test="${!gmbbasedatadic.isInternal&&!isAddAction}">selected="selected"</c:if>>否</option>
												</select>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        关键字:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="320"
													name="gmbbasedatadicList[0].gmkeycode" value="${gmbbasedatadic.gmkeycode}"
													placeholder="关键字"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        排序号:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="10"
													name="gmbbasedatadicList[0].gmorder" value="${gmbbasedatadic.gmorder}"
													placeholder="排序号"/>
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
	
	/*JQUERY执行方法*/
	$().ready( function() {
		/*提交按钮验证*/      
	    $(".rolesubmit").click(function(){
	    	/*验证输入内容不能全为空*/
            if(!returnValidateNull()){
            	return false;
            }
	    	/*判断是否符合规范*/
		   	if($(".has-error").length<1)
				return true;/*允许提交*/
			alert("请修正红色高亮内容,否则无法提交!");/*弹出错误提示*/
			return false;/*不允许提交*/
	    });
	});
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
		$("li[as='gmbbasedatadic']").addClass("active");
	});
</script>
</body>
</html>