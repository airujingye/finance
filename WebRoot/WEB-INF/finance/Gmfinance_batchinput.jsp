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
	<title>财务管理-财务编辑</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
<body>
<div class="container-fluid gmp GMAdmin">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form style="width:100%;height:100%;" id="listForm" method="post" class="form-horizontal" action="Gmfinance!${isAddAction?'gmbAdd':'gmbUpdate'}.action" role="form">
		<div class="row gmbbp_content gmbbp_contentposition gmbbp_content_top120">
			<div class="col-md-12 gmbbp_content_padding">
<!-- 左侧菜单区域开始 -->
				<div class="col-md-2 gmbbp_contleft gmbbp_cont_left">
					<div class="gmbbp_cont_lefttitle">菜单</div>
						<div class="gmbbp_cont_nav">
							<ul class="lyrow ui-draggable column ui-sortable gmbbp_cont_treeborderNo gmbbp_cont_navl">
							<div></div>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmcreditcard}">
								<li class="lyrow ui-draggable gmcif gmbbp_leftnav_Attr" test="${!empty gmbasemenu.gmb_menus_gmcreditcard}" data-setting = "4">
									<a href="#" class="gmbbp_navl_normal gmbbp_nav_level1" data-menu="gm_credit_card0">信用卡管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li  class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmcreditcard!gmbList.action" class="active" data-menu="gm_credit_card1"><span></span> 信用卡列表</a>
											</li>
										</div>
									</ul>
								</li>
							</c:if>
							<c:if test="${!empty gmbasemenu.gmb_menus_gmfinance}">
								<li class="lyrow ui-draggable gmcif" test="${!empty gmbasemenu.gmb_menus_gmfinance}" data-setting = "4">
								<a href="#" class="active gmbbp_nav_level1" data-menu="gm_finance0">财务管理</a>
									<ul class="lyrow ui-draggable gmbbp_cont_navl1 gmbbp_leftmenu_sidebar" style="display:none;">
										<div class="column ui-sortable gmbbp_cont_treeborderNo">
											<li class="box box-element ui-draggable" data-setting = "4">
												<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action" class="active" data-menu="gm_finance1"><span></span> 财务列表</a>
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
								<div class="gmbbp_conright_logo">&nbsp;&nbsp;${isAddAction?'批量创建':'编辑'}财务</div>
								<!--内容右侧表格部分-->
								<div class="col-md-12 gmbbp_int_formcreat gmb_pageinfo">
									<div class="col-md-12 tab-content gmbbp_formlistcon">
										<div role="tabpanel" class="col-md-12 tab-pane active" id="tabgmfinance">
											<input type="hidden" name="id" value="${gmfinance.id}" />
											<input type="hidden" id="isAddAction" value="${isAddAction}" />
									 
							<div class="col-md-12 lyrow ui-draggable" data-setting = "2">
								<div class="col-md-12 column ui-sortable gmbbp_batchinputform_formgroup gmbbp_cont_treeborderNo gmdemolist">
									<button type="button" class="btn btn-default gmbbp_batchinput_close gmdeletbox" style="display:none;">X删除</button>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        金额:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="22"
													name="gmfinanceList[0].money" value="${gmfinance.money}"
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
													name="gmfinanceList[0].paytype" value="${gmfinance.paytype}"
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
													name="gmfinance.userid.id" value="${gmfinance.userid.id}"
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
													name="gmfinanceList[0].remark" value="${gmfinance.remark}"
													placeholder="备注"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        支付时间:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<div class="input-group date form_datetime" data-date=""
													data-date-format="dd MM yyyy" data-link-field="yyyy-mm-dd">
													<input class="form-control gmbbp_input " id="dtp_paytime" size="16" 
														name="gmfinanceList[0].paytime" placeholder="支付时间" value="<fmt:formatDate value="${gmfinance.paytime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
														readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        消费类型:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="16"
													name="gmfinanceList[0].consumetype" value="${gmfinance.consumetype}"
													placeholder="消费类型"/>
											</div>
										</div>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        类型:
											    </label>
											</div>
												<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
													<select class="form-control gmbbp_input " name="gmfinanceList[0].financetype" placeholder="类型">
														<option value="" selected="selected">请选择</option>
															<option value="pay" <c:if test="${gmfinance.financetype=='pay'}">selected="selected"</c:if>>支出</option>
															<option value="income" <c:if test="${gmfinance.financetype=='income'}">selected="selected"</c:if>>收入</option>
													</select>
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
														name="gmfinanceList[0].updatetime" placeholder="更新日期" value="<fmt:formatDate value="${gmfinance.updatetime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
														readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
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
														name="gmfinanceList[0].creattime" placeholder="创建日期" value="<fmt:formatDate value="${gmfinance.creattime}"  pattern="yyyy-MM-dd HH:mm:ss"/>" type="text"
														readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
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
		$("li[as='gmfinance']").addClass("active");
	});
</script>
</body>
</html>