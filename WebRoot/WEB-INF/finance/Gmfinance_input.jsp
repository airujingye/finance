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
	<title>财务管理-财务编辑</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
</head>
<body>
<div class="container-fluid gmp GMAdmin">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form style="width:100%;height:100%;display:inline-block;" id="listForm" method="post" class="form-horizontal column ui-sortable gmbbp_cont_treeborderNo" action="Gmfinance!${isAddAction?'gmbAdd':'gmbUpdate'}.action" role="form">
		<div class="row gmbbp_content gmbbp_contentposition">
		  <div class="col-md-12 gmbbp_content_padding">
			<!-- 左侧菜单开始 -->
<!-- 左侧菜单区域开始 -->
				<div class="col-md-2 gmbbp_contleft gmbbp_cont_left">
					<div class="gmbbp_cont_lefttitle">菜单</div>
						<div class="gmbbp_cont_nav">
							<ul class="lyrow ui-draggable column ui-sortable gmbbp_cont_treeborderNo gmbbp_cont_navl">
							<div></div>
							<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmcreditcard}" data-setting = "4">
								<a href="#" class="active gmbbp_nav_level1" data-menu="gm_credit_card0">财务管理</a>
								<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
									<div class="column ui-sortable gmbbp_cont_treeborderNo">
										<li  class="box box-element ui-draggable" data-setting = "4">
											<a href="<%=gmBase%>/finance/Gmcreditcard!gmbList.action" data-menu="gm_credit_card1"><span></span> 信用卡表</a>
										</li>
										<li  class="box box-element ui-draggable" data-setting = "4">
											<a href="<%=gmBase%>/finance/Gmcreditcard!gmbList.action" data-menu="gm_credit_card1"><span></span> 储蓄卡表</a>
										</li>
										<li class="box box-element ui-draggable" data-setting = "4">
											<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action" class="active"  data-menu="gm_finance1"><span></span> 收支列表</a>
										</li>
										<%-- <li class="box box-element ui-draggable" data-setting = "4">
											<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action" <c:if test="${type eq 'pay' }">class="active"</c:if>  data-menu="gm_finance1"><span></span> 支出列表</a>
										</li> --%>
										<%-- <li class="box box-element ui-draggable" data-setting = "4">
											<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action" <c:if test="${type eq 'income' }">class="active"</c:if> data-menu="gm_finance1"><span></span> 收入列表</a>
										</li> --%>
									</div>
								</ul>
							</li>
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
						<div class="gmbbp_conright_logo">&nbsp;&nbsp;${isAddAction?'创建':'编辑'}财务</div>
					</div>
					<!--右侧编辑部分-->
					<div class="col-md-12 gmbbp_int_formcreat gmb_pageinfo">
						<div class="col-md-12 gmbbp_int_formlisttitle">
							<ul class="nav nav-tabs gmbbp_tab_panel column ui-sortable" role="tablist">
								<li role="presentation" class="lyrow ui-draggable active" data-setting = "1"><a href="#tabgmfinance" aria-controls="home" role="tab" data-toggle="tab">财务基本信息</a></li>
							</ul>
						</div>
						<div class="col-md-12 tab-content gmbbp_formlistcon">
							<div role="tabpanel" class="col-md-12 tab-pane active" id="tabgmfinance">
								<input type="hidden" name="id" value="${gmfinance.id}" />
								<input type="hidden" id="isAddAction" value="${isAddAction}" />
							
							<div class="col-md-12 lyrow ui-draggable" data-setting = "1">
								<div class="col-md-12 column ui-sortable gmbbp_cont_treeborderNo">
																	<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        金额（元）:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmfinance.money" value="${gmfinance.money}"
													placeholder="金额"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        支出/收入:
											    </label>
											</div>
												<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
													<select class="form-control gmbbp_input " name="gmfinance.financetype" placeholder="类型">
														<option value="" selected="selected">请选择</option>
															<option value="pay" ${gmfinance.financetype=='pay'}?'selected="selected"':''>支出</option>
															<option value="income" ${gmfinance.financetype=='income'}?'selected="selected"':''>收入</option>
													</select>
												</div>
										</div>
										<%-- <input type="hidden" name="gmfinance.financetype" value="${type}"/> --%>
										<%-- <input type="hidden" name="type" value="${type}"/> --%>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        明细:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<select class="form-control gmbbp_input datadic" name="gmfinance.consumetype" keyName="code" keyValue="<c:if test="${type eq 'pay' }">zhichu</c:if><c:if test="${type eq 'income' }">shouru</c:if>" defaultValue="${gmfinance.consumetype}" placeholder="银行" url="/Finance/finance/Gmbdatadic!getDataDicOption.action">
													<option value="" selected="selected">请选择</option>
													<c:if test="${!isAddAction }">
														<option value="${gmfinance.consumetype}" selected="selected">${gmfinance.consumetype}</option>
													</c:if>
												</select>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        账户:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<select class="form-control gmbbp_input datadic" name="gmfinance.paytype" keyName="code" keyValue="bank" defaultValue="${gmfinance.paytype}" placeholder="账户" url="/Finance/finance/Gmbdatadic!getDataDicOption.action">
													<option value="" selected="selected">请选择</option>
													<c:if test="${!isAddAction }">
														<option value="${gmfinance.paytype}" selected="selected">${gmfinance.paytype}</option>
													</c:if>
												</select>
											</div>
										</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
										<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
										    <label> 
										        持卡人:
										    </label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
											<select class="form-control gmbbp_input datadic" name="gmfinance.cardholder" keyName="code" keyValue="chikaren" defaultValue="${gmfinance.cardholder}" placeholder="银行" url="/Finance/finance/Gmbdatadic!getDataDicOption.action">
												<option value="" selected="selected">请选择</option>
												<c:if test="${!isAddAction }">
													<option value="${gmfinance.cardholder}" selected="selected">${gmfinance.cardholder}</option>
												</c:if>
											</select>
										</div>
									</div>
									<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        卡片类型:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<select class="form-control gmbbp_input datadic" name="gmfinance.cardtype" keyName="code" keyValue="card_type" defaultValue="${gmfinance.cardtype}" placeholder="卡片类型" url="/Finance/finance/Gmbdatadic!getDataDicOption.action">
													<option value="" selected="selected">请选择</option>
													<c:if test="${!isAddAction }">
														<option value="${gmfinance.cardtype}" selected="selected">${gmfinance.cardtype}</option>
													</c:if>
												</select>
											</div>
										</div>
									<div class="col-lg-4 col-md-4 col-sm-6 form-group">
										<div class="col-lg-4 col-md-4 col-sm-4 control-label gmbbp_inputtext">
											<label>发生时间:</label>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8 input-group date form_datetime gmp_inputHeight"   data-date=""
											data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
											<input class="form-control" id="dtp_createtime" size="16"
											name="gmfinance.paytime" placeholder="发生时间" value="<fmt:formatDate type="both" value="${gmfinance.paytime}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly   />
											<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
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
													name="gmfinance.remark" value="${gmfinance.remark}"
													placeholder="备注"/>
											</div>
										</div>
								</div>
							</div>
							</div>
							<!-- 遍历关联表开始  -->
									<!-- 遍历关联表结束 -->
								</div>
							</div>
							<div class="col-md-12 gmbbp_conright_subbox">
								<div class="gmbbp_conright_butsub">
								<input  name="gmfinance.userid.id" value="${sessionScope.gmloginuser.id}" type="hidden"/>
								<input name="gmfinance.creattime" placeholder="创建日期" value="<fmt:formatDate value="${gmfinance.creattime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="hidden">
									<input name="gmfinance.updatetime" placeholder="更新日期" value="<fmt:formatDate value="${gmfinance.updatetime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="hidden">
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
		$("li[as='gmfinance']").addClass("active");
	});
</script>
</body>
</html>