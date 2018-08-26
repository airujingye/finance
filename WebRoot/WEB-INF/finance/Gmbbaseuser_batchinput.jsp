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
	<title>基础用户管理-基础用户编辑</title>
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_input.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
<body>
<div class="container-fluid gmp GMAdmin">
	<jsp:include page="../../header.jsp"></jsp:include>
	<form style="width:100%;height:100%;" id="listForm" method="post" class="form-horizontal" action="Gmbbaseuser!${isAddAction?'gmbAdd':'gmbUpdate'}.action" role="form">
		<div class="row gmbbp_content gmbbp_contentposition gmbbp_content_top120">
			<div class="col-md-12 gmbbp_content_padding">
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
			
				<!-- 表单区域开始 -->
					<div class="col-md-10 gmbbp_height gmbbp_size_right">
						<div class="col-md-12 gmbbp_content_right">
							<div class="col-md-12 gmbbp_con_righttitle">
								<!--内容右侧title部分开始-->
								<div class="gmbbp_conright_logo">&nbsp;&nbsp;${isAddAction?'批量创建':'编辑'}基础用户</div>
								<!--内容右侧表格部分-->
								<div class="col-md-12 gmbbp_int_formcreat gmb_pageinfo">
									<div class="col-md-12 tab-content gmbbp_formlistcon">
										<div role="tabpanel" class="col-md-12 tab-pane active" id="tabgmbbaseuser">
											<input type="hidden" name="id" value="${gmbbaseuser.id}" />
											<input type="hidden" id="isAddAction" value="${isAddAction}" />
									 
							<div class="col-md-12 lyrow ui-draggable" data-setting = "2">
								<div class="col-md-12 column ui-sortable gmbbp_batchinputform_formgroup gmbbp_cont_treeborderNo gmdemolist">
									<button type="button" class="btn btn-default gmbbp_batchinput_close gmdeletbox" style="display:none;">X删除</button>
										<div class="form-group col-lg-4 col-md-4 col-sm-6 col-xs-12 lyrow ui-draggable" data-setting = "1">
											<div class="col-lg-4 col-md-4 col-sm-4  control-label gmbbp_inputtext">
											    <label> 
											        用户名:
											    </label>
											</div>
											<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
												<input type="text" class="form-control gmbbp_input " maxlength="64"
													name="gmbbaseuserList[0].username" value="${gmbbaseuser.username}"
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
													name="gmbbaseuserList[0].password" value="${gmbbaseuser.password}"
													placeholder="密码"/>
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
													name="gmbbaseuserList[0].gmusertype" value="${gmbbaseuser.gmusertype}"
													placeholder="用户类型"/>
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
			var gmbbasemenus = getNeedNodes("treegmbbasemenu");
			
			/*自动封装菜单表表单*/
			createInputByProperty("gmbbaseuser.gmbbasemenus","id","hidden",gmbbasemenus,form[0]);
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