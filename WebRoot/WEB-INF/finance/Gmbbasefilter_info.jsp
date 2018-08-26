<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>权限过滤管理-权限过滤详情</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
</head>
<body>
<div class="container-fluid gmbbp_remove_style gmp gmbbp_info ">
	<div class="row gmbbp_remove_style">
		<div class="col-md-12 gmbbp_remove_style">
			<!-- 表单区域开始 -->
			<!--内容右侧表格部分-->
			<div class="col-md-12 gmbbp_remove_style gmbbp_int_formcreat gmb_pageinfo gmb_Validator">
				<div class="gmbbp_int_formlisttitle">
					<ul class="nav nav-tabs gmbbp_tab_panel column ui-sortable" role="tablist">
						<li role="presentation" class=" lyrow ui-draggable showAttr active" data-setting = "1"><a href="#tabgmbbasefilter" aria-controls="home" role="tab" data-toggle="tab">权限过滤基本信息</a></li>
					</ul>
				</div>
				<div class="tab-content gmbbp_formlistcon gmbbp_modal_infoallcheck">
					<div role="tabpanel" class="tab-pane active" id="tabgmbbasefilter">
						<input type="hidden" name="id" value="${gmbbasefilter.id}" />
						<input type="hidden" id="isAddAction" value="${isAddAction}" />
							<div class="lyrow ui-draggable">
								<div class="col-md-12 column ui-sortable gmbbp_batchinputform_formgroup gmbbp_cont_treeborderNo gmdemolist">
																	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
										    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 control-label gmbbp_inputtext">
										        <label> 
										            名称:
										        </label>
										    </div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<label class="gmbbp_infoform_label">
													${gmbbasefilter.name}
												</label>
											</div>
										</div>
										<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
										    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 control-label gmbbp_inputtext">
										        <label> 
										            地址:
										        </label>
										    </div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<label class="gmbbp_infoform_label">
													${gmbbasefilter.url}
												</label>
											</div>
										</div>
									<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
									    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 control-label gmbbp_inputtext">
									        <label> 
									            是否过滤:
									        </label>
									    </div>
										<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
											<label class="gmbbp_infoform_label">
												<c:if test="${gmbbasefilter.isFilter}">
													是
												</c:if>
												<c:if test="${!gmbbasefilter.isFilter}">
													否
												</c:if>
											</label>
										</div>
									</div>
						</div>
					</div>					</div>
					<!-- 遍历关联表开始  -->
					<!-- 遍历关联表结束 -->
				</div>
			</div>
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