<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>基础用户管理-基础用户编辑</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
</head>
<body>
<div class="container-fluid gmp GMAdmin">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form style="width:100%;height:100%;display:inline-block;" id="listForm" method="post" class="form-horizontal column ui-sortable gmbbp_cont_treeborderNo" action="Gmbbaseuser!${isAddAction?'gmbAdd':'gmbUpdate'}.action" role="form">
		<div class="row gmbbp_content gmbbp_contentposition">
		  <div class="col-md-12 gmbbp_content_padding">
			<!-- 左侧菜单开始 -->
<!-- 左侧菜单区域开始 -->
				<div class="col-md-2 gmbbp_contleft gmbbp_cont_left">
					<div class="gmbbp_cont_lefttitle">菜单</div>
						<div class="gmbbp_cont_nav">
							<ul class="lyrow ui-draggable column ui-sortable gmbbp_cont_treeborderNo gmbbp_cont_navl">
							<div></div>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbasemenu}">
								<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmbbasemenu}" data-setting = "4">
									<a href="#" class="gmbbp_navl_normal gmbbp_nav_level1" data-menu="gmb_base_menu0">菜单表管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li  class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmbbasemenu!gmbList.action" class="active" data-menu="gmb_base_menu1"><span></span> 菜单表列表</a>
											</li>
										</div>
									</ul>
								</li>
							</c:if>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbaserole}">
								<li class="lyrow ui-draggable gmcif" test="${!empty gmbasemenu.gmb_menus_gmbbaserole}" data-setting = "4">
								<a href="#" class="gmbbp_navl_normal gmbbp_nav_level1" data-menu="gmb_base_role0">基础角色管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar" >
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmbbaserole!gmbList.action" class="active" data-menu="gmb_base_role1"><span></span> 基础角色列表</a>
											</li>
										</div>
									</ul>
								</li>
							</c:if>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmbbaseuser}">
								<li class="lyrow ui-draggable gmcif" test="${!empty gmbasemenu.gmb_menus_gmbbaseuser}" data-setting = "4">
								<a href="#" class="active gmbbp_nav_level1" data-menu="gmb_base_user0">基础用户管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar" style="display:none;">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmbbaseuser!gmbList.action" class="active" data-menu="gmb_base_user1"><span></span> 基础用户列表</a>
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
			<!-- 左侧菜单结束 -->
			<!-- 表单区域开始 -->
			<div class="col-md-10 gmbbp_contentbox gmbbp_height gmbbp_size_right">
				<div class="col-md-12 gmbbp_content_right">
					<div class="col-md-12 gmbbp_con_righttitle">
						<!--内容右侧title部分开始-->
						<div class="gmbbp_conright_logo">&nbsp;&nbsp;${isAddAction?'创建':'编辑'}基础用户</div>
					</div>
					<!--右侧编辑部分-->
					<div class="col-md-12 gmbbp_int_formcreat gmb_pageinfo">
						<div class="col-md-12 gmbbp_int_formlisttitle">
							<ul class="nav nav-tabs gmbbp_tab_panel column ui-sortable" role="tablist">
								<li role="presentation" class="lyrow ui-draggable active" data-setting = "1"><a href="#tabgmbbaseuser" aria-controls="home" role="tab" data-toggle="tab">基础用户基本信息</a></li>
											<li role="presentation" class="lyrow ui-draggable" data-setting = "1"><a href="#tab_gmbbaseuser_gm_credit_card_ibfk_1" data-toggle="tab">信用卡</a></li>
											<li role="presentation" class="lyrow ui-draggable" data-setting = "1"><a href="#tab_gmbbaseuser_gm_finance_ibfk_1" data-toggle="tab">财务</a></li>
													<li role="presentation" class="lyrow ui-draggable" data-setting = "1"><a href="#tab_gmbbaseuser_gmbbasemenus" data-toggle="tab">菜单表</a></li>
													<li role="presentation" class="lyrow ui-draggable" data-setting = "1"><a href="#tab_gmbbaseuser_gmbbaseroles" data-toggle="tab">基础角色</a></li>
							</ul>
						</div>
						<div class="col-md-12 tab-content gmbbp_formlistcon">
							<div role="tabpanel" class="col-md-12 tab-pane active" id="tabgmbbaseuser">
								<input type="hidden" name="id" value="${gmbbaseuser.id}" />
								<input type="hidden" id="isAddAction" value="${isAddAction}" />
							
							<div class="col-md-12 lyrow ui-draggable" data-setting = "1">
								<div class="col-md-12 column ui-sortable gmbbp_cont_treeborderNo">
																	<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        用户名:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="64"
													name="gmbbaseuser.username" value="${gmbbaseuser.username}"
													placeholder="用户名"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        密码:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="password" class="form-control gmbbp_input gmb_password " maxlength="128"
													name="gmbbaseuser.password" value="${gmbbaseuser.password}"
													placeholder="密码"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        姓名:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="32"
													name="gmbbaseuser.zhname" value="${gmbbaseuser.zhname}"
													placeholder="姓名"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        用户类型:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="32"
													name="gmbbaseuser.gmusertype" value="${gmbbaseuser.gmusertype}"
													placeholder="用户类型"/>
											</div>
										</div>
										
								</div>
							</div>
							</div>
							<!-- 遍历关联表开始  -->
										<div class="tab-pane" style="overflow:hidden;" id="tab_gmbbaseuser_gm_credit_card_ibfk_1" length="${fn:length(gmbbaseuser.gmcreditcardibfk1)>0?(fn:length(gmbbaseuser.gmcreditcardibfk1)-1):0}">
											<div>
												<div class="row" style="position: relative;">
							
							<div class="col-md-12 lyrow ui-draggable" data-setting = "1">
								<div class="col-md-12 column ui-sortable gmbbp_cont_treeborderNo">
																	<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        金额:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmbbaseuser.gmcreditcardibfk1[0].money" value="${gmbbaseuser.gmcreditcardibfk1[0].money}"
													placeholder="金额"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        银行:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="32"
													name="gmbbaseuser.gmcreditcardibfk1[0].bank" value="${gmbbaseuser.gmcreditcardibfk1[0].bank}"
													placeholder="银行"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        对账日:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_accountday" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[0].accountday" placeholder="对账日" value="<fmt:formatDate value="${gmbbaseuser.gmcreditcardibfk1[0].accountday}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        还款日:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_repaymentday" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[0].repaymentday" placeholder="还款日" value="<fmt:formatDate value="${gmbbaseuser.gmcreditcardibfk1[0].repaymentday}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        滞纳金:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmbbaseuser.gmcreditcardibfk1[0].latefee" value="${gmbbaseuser.gmcreditcardibfk1[0].latefee}"
													placeholder="滞纳金"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        用户编号:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<input type="text" class="form-control gmbbp_input " maxlength="32"
												name="gmbbaseuser.gmcreditcardibfk1[0].userid.id" value="${gmbbaseuser.gmcreditcardibfk1[0].userid.id}"
												placeholder="用户编号"/>
										</div>
									</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        备注:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="512"
													name="gmbbaseuser.gmcreditcardibfk1[0].remark" value="${gmbbaseuser.gmcreditcardibfk1[0].remark}"
													placeholder="备注"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        创建日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_creattime" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[0].creattime" placeholder="创建日期" value="<fmt:formatDate value="${gmbbaseuser.gmcreditcardibfk1[0].creattime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        更新日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_updatetime" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[0].updatetime" placeholder="更新日期" value="<fmt:formatDate value="${gmbbaseuser.gmcreditcardibfk1[0].updatetime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
													<div style="display:none; position: absolute;right:100px;top:3px;" class="bdelfromadd">
														<button type="button" class="btn btn-default">
															<span class="glyphicon glyphicon-remove"></span>删除
														</button>
													</div>
													<hr style=" width:100%;height:1px;border:none;border-top:1px dashed #e1e6ed;" />
												</div>
												<c:if test="${!isAddAction}">
													<c:forEach var="gmcreditcardibfk1" items="${gmbbaseuser.gmcreditcardibfk1}" varStatus="indexlist">
														<c:if test="${indexlist.index>0}">
															<div class="row" style="position: relative;">
							
							<div class="col-md-12 lyrow ui-draggable" data-setting = "1">
								<div class="col-md-12 column ui-sortable gmbbp_cont_treeborderNo">
																	<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        金额:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].money" value="${gmcreditcardibfk1.money}"
													placeholder="金额"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        银行:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="32"
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].bank" value="${gmcreditcardibfk1.bank}"
													placeholder="银行"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        对账日:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_accountday" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].accountday" placeholder="对账日" value="<fmt:formatDate value="${gmcreditcardibfk1.accountday}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        还款日:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_repaymentday" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].repaymentday" placeholder="还款日" value="<fmt:formatDate value="${gmcreditcardibfk1.repaymentday}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        滞纳金:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].latefee" value="${gmcreditcardibfk1.latefee}"
													placeholder="滞纳金"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        用户编号:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<input type="text" class="form-control gmbbp_input " maxlength="32"
												name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].userid.id" value="${gmcreditcardibfk1.userid.id}"
												placeholder="用户编号"/>
										</div>
									</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        备注:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="512"
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].remark" value="${gmcreditcardibfk1.remark}"
													placeholder="备注"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        创建日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_creattime" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].creattime" placeholder="创建日期" value="<fmt:formatDate value="${gmcreditcardibfk1.creattime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        更新日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_updatetime" size="16" 
													name="gmbbaseuser.gmcreditcardibfk1[indexlist.index].updatetime" placeholder="更新日期" value="<fmt:formatDate value="${gmcreditcardibfk1.updatetime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
																<div style="position: absolute;right:100px;top:3px;" class="bdelfromadd">
																	<button type="button" class="btn btn-default">
																		<span class="glyphicon glyphicon-remove"></span>删除
																	</button>
																</div>
																<hr style=" width:100%;height:1px;border:none;border-top:1px dashed #e1e6ed;" />
															</div>	
														</c:if>
													</c:forEach>
												</c:if>
											</div>
													<div class="col-sm-6" style="text-align:center;padding-bottom:20px;">
														<button type="button" class="btn btn-default buttontools bfromadd">
															<span class="glyphicon glyphicon-plus-sign"></span> 新增一条
														</button>
													</div>
												</div>
										<div class="tab-pane" style="overflow:hidden;" id="tab_gmbbaseuser_gm_finance_ibfk_1" length="${fn:length(gmbbaseuser.gmfinanceibfk1)>0?(fn:length(gmbbaseuser.gmfinanceibfk1)-1):0}">
											<div>
												<div class="row" style="position: relative;">
							
							<div class="col-md-12 lyrow ui-draggable" data-setting = "1">
								<div class="col-md-12 column ui-sortable gmbbp_cont_treeborderNo">
																	<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        金额:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmbbaseuser.gmfinanceibfk1[0].money" value="${gmbbaseuser.gmfinanceibfk1[0].money}"
													placeholder="金额"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        支付类型:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="32"
													name="gmbbaseuser.gmfinanceibfk1[0].paytype" value="${gmbbaseuser.gmfinanceibfk1[0].paytype}"
													placeholder="支付类型"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        用户编号:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<input type="text" class="form-control gmbbp_input " maxlength="32"
												name="gmbbaseuser.gmfinanceibfk1[0].userid.id" value="${gmbbaseuser.gmfinanceibfk1[0].userid.id}"
												placeholder="用户编号"/>
										</div>
									</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        备注:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="512"
													name="gmbbaseuser.gmfinanceibfk1[0].remark" value="${gmbbaseuser.gmfinanceibfk1[0].remark}"
													placeholder="备注"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        创建日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_creattime" size="16" 
													name="gmbbaseuser.gmfinanceibfk1[0].creattime" placeholder="创建日期" value="<fmt:formatDate value="${gmbbaseuser.gmfinanceibfk1[0].creattime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        更新日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_updatetime" size="16" 
													name="gmbbaseuser.gmfinanceibfk1[0].updatetime" placeholder="更新日期" value="<fmt:formatDate value="${gmbbaseuser.gmfinanceibfk1[0].updatetime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
													<div style="display:none; position: absolute;right:100px;top:3px;" class="bdelfromadd">
														<button type="button" class="btn btn-default">
															<span class="glyphicon glyphicon-remove"></span>删除
														</button>
													</div>
													<hr style=" width:100%;height:1px;border:none;border-top:1px dashed #e1e6ed;" />
												</div>
												<c:if test="${!isAddAction}">
													<c:forEach var="gmfinanceibfk1" items="${gmbbaseuser.gmfinanceibfk1}" varStatus="indexlist">
														<c:if test="${indexlist.index>0}">
															<div class="row" style="position: relative;">
							
							<div class="col-md-12 lyrow ui-draggable" data-setting = "1">
								<div class="col-md-12 column ui-sortable gmbbp_cont_treeborderNo">
																	<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        金额:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmbbaseuser.gmfinanceibfk1[indexlist.index].money" value="${gmfinanceibfk1.money}"
													placeholder="金额"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        支付类型:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="32"
													name="gmbbaseuser.gmfinanceibfk1[indexlist.index].paytype" value="${gmfinanceibfk1.paytype}"
													placeholder="支付类型"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        用户编号:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<input type="text" class="form-control gmbbp_input " maxlength="32"
												name="gmbbaseuser.gmfinanceibfk1[indexlist.index].userid.id" value="${gmfinanceibfk1.userid.id}"
												placeholder="用户编号"/>
										</div>
									</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        备注:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="512"
													name="gmbbaseuser.gmfinanceibfk1[indexlist.index].remark" value="${gmfinanceibfk1.remark}"
													placeholder="备注"/>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        创建日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_creattime" size="16" 
													name="gmbbaseuser.gmfinanceibfk1[indexlist.index].creattime" placeholder="创建日期" value="<fmt:formatDate value="${gmfinanceibfk1.creattime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        更新日期:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<div class="input-group date form_datetime" data-date=""
												data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
												<input class="form-control gmbbp_input " id="dtp_updatetime" size="16" 
													name="gmbbaseuser.gmfinanceibfk1[indexlist.index].updatetime" placeholder="更新日期" value="<fmt:formatDate value="${gmfinanceibfk1.updatetime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
													readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
																<div style="position: absolute;right:100px;top:3px;" class="bdelfromadd">
																	<button type="button" class="btn btn-default">
																		<span class="glyphicon glyphicon-remove"></span>删除
																	</button>
																</div>
																<hr style=" width:100%;height:1px;border:none;border-top:1px dashed #e1e6ed;" />
															</div>	
														</c:if>
													</c:forEach>
												</c:if>
											</div>
													<div class="col-sm-6" style="text-align:center;padding-bottom:20px;">
														<button type="button" class="btn btn-default buttontools bfromadd">
															<span class="glyphicon glyphicon-plus-sign"></span> 新增一条
														</button>
													</div>
												</div>
												<div class="tab-pane" id="tab_gmbbaseuser_gmbbasemenus">
														<div class="zTreeDemoBackground left bg-ztree">
															<ul id="treegmbbasemenu" class="ztree GMZtree" gmTreeShowName="name" gmTreeIsAsync="false" gmonasyncsuccess="panelAsyncSuccess" gmTreeUrl="<%=gmBase%>/finance/Gmbbasemenu!gmbList.action?handle=forwardAllList"
																gmTreeActiveData="<c:forEach var="item" varStatus="status" items="${gmbbaseuser.gmbbasemenus}">${!status.first?',':''}${item.id}</c:forEach>"></ul>
														</div>
												</div>
												<div class="tab-pane" id="tab_gmbbaseuser_gmbbaseroles">
														<!-- 列表开始 -->
														<table id="gmbbaseroletable" class="table table-bordered gmbbp_conrtable-hover gmb_pageinfo">
															<tr class="active">
																		<td>
																			<input type="checkbox" class="gmbbaseroleallCheck" />
																		</td>								
																		<td >角色名称</td>
															</tr>							
														</table>
														<!-- 列表结束-->
												</div>
									<!-- 遍历关联表结束 -->
								</div>
							</div>
							<div class="col-md-12 gmbbp_conright_subbox">
								<div class="gmbbp_conright_butsub">
									<button type="submit" class="gmbbp_conright_butsave sub gmb_Validator" style="border: none;">保存</button>
									<button type="button" class="gmbbp_conright_butno" onclick="javascript:history.go(-1)">取消</button>
								</div>
							</div>	
						</div>
					</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
<script type="text/javascript">
	$().ready( function() {
		$("a[data-toggle='tab']").click(function(){
			if(!GM.Validator.areaValidate()){
				return false;
			}
		});
				/*获取非树结构的多对多数据*/
				var gmbbaseroles ;
				$.ajax({
					url : "<%=gmBase%>/finance/Gmbbaserole!gmbList.action?handle=forwardAllList",
					type: "POST",
					dataType: "json",
					cache: false,
					async: false,
					success:function(data){
						/*拼接数据*/
						var datas = "";
						if(data!=null&&data.length>0){
							gmbbaseroles = data;
							for(var i=0;i<data.length;i++){
								datas+="<tr>";
										datas+="<td><input type=\"checkbox\" class=\"gmbbaseroleids\" name=\"gmbbaseuser.gmbbaseroles["+i+"].id\" value=\""+data[i].id+"\" /></td>";
										datas+="<td >"+data[i].name+"</td>";
								datas+="</tr>";
							}
						}
						 /*获取表格对象*/
						 var gmbbaseroletable = $("#gmbbaseroletable");
						 gmbbaseroletable.append(datas);
						 GM.Util.idAllCheckMethod("gmbbaseroletable","gmbbaseroleallCheck","gmbbaseroleids");
				    }
				 });
				 /*回显*/
				 if(gmbbaseroles!=null&&gmbbaseroles.length>0){
					 var needId = $("input[name='id']").val();
					 if(needId!=null && needId!=""){
					 	 $.ajax({
							url : "<%=gmBase%>/finance/Gmbbaseuser!gmbList.action?handle=forwardAjaxDicInfo&id="+needId,
							type: "POST",
							dataType: "json",
							cache: false,
							async: false,
							success:function(data){
								GM.QueryList.feedback(data.gmbbaseroles,"gmbbaseroleallCheck","gmbbaseroleids");
					        }
						 });
					 }
				 }
		/*提交按钮事件*/
		$(".sub").click(function(){
			if(!GM.Validator.baseValidate()){
				return false;
			};
			/*获取当前的form表单*/
			var form=$("#listForm");
					var gm_credit_card_ibfk_1inputs = $("#tab_gmbbaseuser_gm_credit_card_ibfk_1 *");
					for(var i=0;i<gm_credit_card_ibfk_1inputs.length;i++){
						if(gm_credit_card_ibfk_1inputs[i].localName=="input"||gm_credit_card_ibfk_1inputs[i].localName=="select"||gm_credit_card_ibfk_1inputs[i].localName=="textarea"){
							if(gm_credit_card_ibfk_1inputs[i].value==""||gm_credit_card_ibfk_1inputs[i].value==null){
								gm_credit_card_ibfk_1inputs[i].disabled="disabled";
							}
						}
					}
					var gm_finance_ibfk_1inputs = $("#tab_gmbbaseuser_gm_finance_ibfk_1 *");
					for(var i=0;i<gm_finance_ibfk_1inputs.length;i++){
						if(gm_finance_ibfk_1inputs[i].localName=="input"||gm_finance_ibfk_1inputs[i].localName=="select"||gm_finance_ibfk_1inputs[i].localName=="textarea"){
							if(gm_finance_ibfk_1inputs[i].value==""||gm_finance_ibfk_1inputs[i].value==null){
								gm_finance_ibfk_1inputs[i].disabled="disabled";
							}
						}
					}
			/*判断菜单表树是否加载完成*/
			if($.fn.zTree.getZTreeObj("treegmbbasemenu")==null){
				 $.messager.alert(菜单表 + "树未加载完成");
				return false;
			}
			/*获取菜单表树*/
			var gmbbasemenus = GM.Input.getNeedNodes("treegmbbasemenu");
			
			/*自动封装菜单表表单*/
			GM.Input.createInputByProperty("gmbbaseuser.gmbbasemenus","id","hidden",gmbbasemenus,form[0]);
		});
	});
	/*初始化GreatMap控件*/
	GM.init();
	$(function() {
		/*添加数据*/
		$(".bfromadd").click(function(){
			/*设置菜单*/
		  	var forminput = $(this).parent().prev("div").children("div").first().clone(false);
			/*清空Value*/
		  	forminput.find("input").val("");
		  	/*遍历所有Name*/
		  	var tabServiceNameS = forminput.find("*[name]");
		  	forminput.find(".bdelfromadd").show();
		  	var length = parseInt($(this).parent().parent().attr("length"))+1;
		  	for(var j=0;j<tabServiceNameS.length;j++){
		  		var inputName = tabServiceNameS[j];
		  		if(inputName.name.indexOf("[0]")>-1){
		  			inputName.name=inputName.name.replace("[0]","["+length+"]");
		  		}
		  	}
		  	$(this).parent().parent().attr("length",length);
		  	$(this).parent().prev("div").append(forminput);
		  	
		  	$(".bdelfromadd").click(function(){
		  		$(this).parent().remove();
		  	});
		});
		
		$(".bdelfromadd").click(function(){
			$(this).parent().remove();
		});
		
	});
	$().ready(function(){
		$("li[as='gmbbaseuser']").addClass("active");
	});
</script>
</body>
</html>