<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>菜单表管理-菜单表详情</title>
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
						<li role="presentation" class=" lyrow ui-draggable showAttr active" data-setting = "1"><a href="#tabgmbbasemenu" aria-controls="home" role="tab" data-toggle="tab">菜单表基本信息</a></li>
											<li role="presentation" class=" lyrow ui-draggable" data-setting = "1"><a href="#tab_gmbbasemenu_GMB_BASE_ROLE" data-toggle="tab">基础角色</a></li>
											<li role="presentation" class=" lyrow ui-draggable" data-setting = "1"><a href="#tab_gmbbasemenu_GMB_BASE_USER" data-toggle="tab">基础用户</a></li>
					</ul>
				</div>
				<div class="tab-content gmbbp_formlistcon gmbbp_modal_infoallcheck">
					<div role="tabpanel" class="tab-pane active" id="tabgmbbasemenu">
						<input type="hidden" name="id" value="${gmbbasemenu.id}" />
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
													${gmbbasemenu.name}
												</label>
											</div>
										</div>
									<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
									    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 control-label gmbbp_inputtext">
									        <label> 
									            关键字:
									        </label>
									    </div>
										<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
											<label class="gmbbp_infoform_label">
												${gmbbasemenu.keyword}
											</label>
										</div>
									</div>
									<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
									    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 control-label gmbbp_inputtext">
									        <label> 
									            是否父节点:
									        </label>
									    </div>
										<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
											<label class="gmbbp_infoform_label">
												<c:if test="${gmbbasemenu.isParent}">
													是
												</c:if>
												<c:if test="${!gmbbasemenu.isParent}">
													否
												</c:if>
											</label>
										</div>
									</div>
									<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
									    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 control-label gmbbp_inputtext">
									        <label> 
									            父节点:
									        </label>
									    </div>
										<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
											<label class="gmbbp_infoform_label">
												${isAddAction? addGmbbasemenu.name==null?"顶级节点":addGmbbasemenu.name : parentObj==null?"顶级节点":parentObj.name }
											</label>
										</div>
									</div>
										<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4 lyrow ui-draggable" data-setting = "1">
										    <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 control-label gmbbp_inputtext">
										        <label> 
										            菜单地址:
										        </label>
										    </div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<label class="gmbbp_infoform_label">
													${gmbbasemenu.url}
												</label>
											</div>
										</div>
						</div>
					</div>					</div>
					<!-- 遍历关联表开始  -->
									<div class="tab-pane gmbbp_infoPage_table" id="tab_gmbbasemenu_GMB_BASE_ROLE">
													<!-- 列表开始 -->
													<table id="gmbbaseroletable" class="table table-bordered gmbbp_conrtable-hover gmb_pageinfo">
														<tr class="active">
																	<td>
																		<input type="checkbox" disabled="disabled" class="gmbbaseroleallcheck" />
																	</td>								
																	<td >角色名称</td>
														</tr>							
													</table>
													<!-- 列表结束-->
											</div>
									<div class="tab-pane gmbbp_infoPage_table" id="tab_gmbbasemenu_GMB_BASE_USER">
													<!-- 列表开始 -->
													<table id="gmbbaseusertable" class="table table-bordered gmbbp_conrtable-hover gmb_pageinfo">
														<tr class="active">
																	<td>
																		<input type="checkbox" disabled="disabled" class="gmbbaseuserallcheck" />
																	</td>								
																	<td >用户名</td>
																	<td >密码</td>
																	<td >用户类型</td>
														</tr>							
													</table>
													<!-- 列表结束-->
											</div>
					<!-- 遍历关联表结束 -->
				</div>
			</div>
		</div>
	</div>
</div>		
<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GM.js"></script>
</head>
<script type="text/javascript">
	$(".gmbbp_header_navleft li").removeClass('active');
	$(".gmbbp_header_navleft li[as='gmbbasemenu']").addClass("active");
	$("li[as='gmbbasemenu']").addClass("active");
	
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
										datas+="<td><input type=\"checkbox\" class=\"gmbbaseroleids\" name=\"gmbbasemenu.gmbbaseroles["+i+"].id\" value=\""+data[i].id+"\" /></td>";
										datas+="<td >"+data[i].name+"</td>";
								datas+="</tr>";
							}
						}
						 /*获取表格对象*/
						 var gmbbaseroletable = $("#gmbbaseroletable");
						 gmbbaseroletable.append(datas);
						 /*详情弹框复选框全选和不全选*/
						 GM.Util.idAllCheckMethod("gmbbaseroletable","gmbbaseroleallcheck","gmbbaseroleids");					 
				    }
				 });
				 /*回显*/
				 if(gmbbaseroles!=null&&gmbbaseroles.length>0){
					 var needId = $("input[name='id']").val();
					 if(needId!=null && needId!=""){
					 	 $.ajax({
							url : "<%=gmBase%>/finance/Gmbbasemenu!gmbList.action?handle=forwardAjaxDicInfo&id="+needId,
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
				/*获取非树结构的多对多数据*/
				var gmbbaseusers ;
				$.ajax({
					url : "<%=gmBase%>/finance/Gmbbaseuser!gmbList.action?handle=forwardAllList",
					type: "POST",
					dataType: "json",
					cache: false,
					async: false,
					success:function(data){
						/*拼接数据*/
						var datas = "";
						if(data!=null&&data.length>0){
							gmbbaseusers = data;
							for(var i=0;i<data.length;i++){
								datas+="<tr>";
										datas+="<td><input type=\"checkbox\" class=\"gmbbaseuserids\" name=\"gmbbasemenu.gmbbaseusers["+i+"].id\" value=\""+data[i].id+"\" /></td>";
										datas+="<td >"+data[i].username+"</td>";
										datas+="<td >"+data[i].password+"</td>";
										datas+="<td >"+data[i].gmusertype+"</td>";
								datas+="</tr>";
							}
						}
						 /*获取表格对象*/
						 var gmbbaseusertable = $("#gmbbaseusertable");
						 gmbbaseusertable.append(datas);
						 /*详情弹框复选框全选和不全选*/
						 GM.Util.idAllCheckMethod("gmbbaseusertable","gmbbaseuserallcheck","gmbbaseuserids");					 
				    }
				 });
				 /*回显*/
				 if(gmbbaseusers!=null&&gmbbaseusers.length>0){
					 var needId = $("input[name='id']").val();
					 if(needId!=null && needId!=""){
					 	 $.ajax({
							url : "<%=gmBase%>/finance/Gmbbasemenu!gmbList.action?handle=forwardAjaxDicInfo&id="+needId,
							type: "POST",
							dataType: "json",
							cache: false,
							async: false,
							success:function(data){
								GM.QueryList.feedback(data.gmbbaseusers,"gmbbaseuserallCheck","gmbbaseuserids");
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
		  	if($('.form_datetime').val()!=null){
				/*显示日期*/
				 $('.form_datetime').datetimepicker({
					language:  'zh-CN',
					weekStart: 1,
				    todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					minView: 2,
					forceParse: 0,
					format:'yyyy-mm-dd hh:ii:ss'
				});
			}
		});
		$(".bdelfromadd").click(function(){
			$(this).parent().remove();
		});
	});
	$().ready(function(){
		$("li[as='gmbbasemenu']").addClass("active");
	});
</script>
</body>
</html>