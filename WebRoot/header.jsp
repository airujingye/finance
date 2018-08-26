<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String gmBase = request.getContextPath(); %>
<html>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 column ui-sortable gmbbp_header">
			<div class="col-xs-2 col-sm-4 col-md-2 col-lg-2 box ui-draggable gmbbp_header_menu gmbbp_logo_Attr" data-setting = "1">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="column ui-sortable gmbbp_logo gmbbp_cont_treeborderNo" href="#">
											<img alt="Brand" src="<%=gmBase%>/img/gmss_logo.png"/>
				</a>
			</div>
			<div class="col-xs-10 col-sm-8 col-md-10 col-lg-10 lyrow ui-draggable gmbbp_header_nav" data-setting = "1">
				<div class="clear gmb_collapse" id="bs-navbar-collapse">
					<ul class="column ui-sortable left gmbbp_cont_treeborderNo gmbbp_header_panel gmbbp_header_navleft">
						<li as="index" class="box box-element ui-draggable gmbbp_header_menu" data-setting = "4">
							<a href="<%=gmBase%>/main.jsp"><i></i>首页</a>
						</li>
						<li as="nomemory" class="box box-element ui-draggable gmbbp_header_menu" data-setting = "4">
							<a href="<%=gmBase%>/finance/Gmfinance!gmbList.action"><i></i>财务管理</a>
						</li>
						<c:if test="${!empty gmbasemenu.gmb_menus_security}">
							<li as="gmbbasemenu" class="gmcif box box-element ui-draggable gmbbp_header_menu" test="${!empty gmbasemenu.gmb_menus_security}" data-setting = "4">
								<a href="<%=gmBase%>${gmbparent_url[gmbasemenu.gmb_menus_security.id]}"><i></i>安全管理</a>
							</li>
						</c:if>
						<c:if test="${!empty gmbasemenu.gmb_menus_setting}">
							<li as="gmbbasefilter" class="gmcif box box-element ui-draggable gmbbp_header_menu" test="${!empty gmbasemenu.gmb_menus_setting}" data-setting = "4">
								<a href="<%=gmBase%>${gmbparent_url[gmbasemenu.gmb_menus_setting.id]}"><i></i>系统设置</a>
							</li>
						</c:if>
					</ul>
					<ul class="right clear gmbbp_header_navright">
						<li class="left gmbbp_header_news">
							<a href="#" class="on"><i></i></a>
						</li>
						<li class="left gmbbp_header_userbox" id="gmbbp_header_navthor">
							<a class="gmbbp_header_navuser" href="#"></a>
							<div class="gmbbp_header_navset" style="display:none;">
								<a href="<%=gmBase%>/userinput.jsp">设置</a>
								<a href="#" data-toggle="modal" data-target="#quit" >退出</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- 手机适配 -->
			<div class="clear gmbbp_app_navbtn">
				<span class="right"></span>
			</div>
		</div>
	</div>

<!--退出 提示框 begin -->
<div class="modal fade" tabindex="-1" id="quit" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><span class="gmbbp_modal_lines"></span>退出登录</h4>
			</div>
			<div class="modal-body">
				<p>你确定要退出？</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="window.location.href='<%=gmBase%>/finance/Gmsecurity!logout.action?handle=admin'" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>
<!--退出 提示框 end -->
<!--生成缓存 提示框 begin -->
<div class="modal fade" tabindex="-1" id="gmbbpCache" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><span class="gmbbp_modal_lines"></span>生成缓存</h4>
			</div>
			<div class="modal-body">
				<p>生成缓存成功！</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary gmbbp_cache_btn" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>
<!--生成缓存 提示框 end -->
</html>