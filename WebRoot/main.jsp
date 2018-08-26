<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String gmBase = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="<%=gmBase%>/gmstatic/theme/base_blue/gmp_main.css" />
	<link rel="shortcut icon" href="<%=gmBase%>/favicon.ico">
	<title>财务管理系统首页</title>
</head>
<body>
	<div class="container-fluid gmp GMAdmin">
		<jsp:include page="./header.jsp"></jsp:include>
	  	<!--后台内容区域 开始--> 
            <form id="listForm" class="form-horizontal" method="post" action="Gmbbasemenu!gmbList.action?id="> 
                <div class="row gmbbp_contentposition"> 
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gmbbp_content_padding"> 
                        <!--右侧内容区开始--> 
                        <div class="col-md-12 gmbbp_content_right"> 
                                <div class="gmbbp_cont_righttitle"> 
                                    <p>欢迎首页</p> 
                                </div> 
                                <!--切换面板内容区 开始--> 
                                <div class="col-md-12 gmbbp_pannel_content"> 
                                    <div class="col-md-12 gmbbp_pannel_statistics"> 
                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 gmbbp_remove_style gmbbp_pannel_padding"> 
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gmbbp_remove_style gmbbp_pannel_color"> 
                                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 gmbbp_remove_style"> 
                                                    <p class="gmbbp_remove_p">212件</p> 
                                                    <p class="gmbbp_remove_p">单月办理量</p> 
                                                </div> 
                                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 gmbbp_remove_style gmbbp_pannel_percentage">
                                                     30% 
                                                </div> 
                                            </div> 
                                        </div> 
                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 gmbbp_remove_style gmbbp_pannel_padding"> 
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gmbbp_remove_style gmbbp_pannel_color"> 
                                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 gmbbp_remove_style"> 
                                                    <p class="gmbbp_remove_p">212件</p> 
                                                    <p class="gmbbp_remove_p">单月办理量</p> 
                                                </div> 
                                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 gmbbp_remove_style gmbbp_pannel_percentage">
                                                     30% 
                                                </div> 
                                            </div> 
                                        </div> 
                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 gmbbp_remove_style gmbbp_pannel_padding"> 
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gmbbp_remove_style gmbbp_pannel_color"> 
                                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 gmbbp_remove_style"> 
                                                    <p class="gmbbp_remove_p">212件</p> 
                                                    <p class="gmbbp_remove_p">单月办理量</p> 
                                                </div> 
                                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 gmbbp_remove_style gmbbp_pannel_percentage">
                                                     30% 
                                                </div> 
                                            </div> 
                                        </div> 
                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 gmbbp_remove_style gmbbp_pannel_padding"> 
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gmbbp_remove_style gmbbp_pannel_color"> 
                                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 gmbbp_remove_style"> 
                                                    <p class="gmbbp_remove_p">212件</p> 
                                                    <p class="gmbbp_remove_p">单月办理量</p> 
                                                </div> 
                                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 gmbbp_remove_style gmbbp_pannel_percentage">
                                                     30% 
                                                </div> 
                                            </div> 
                                        </div> 
                                    </div> 
                                    <div class="col-md-12 gmbbp_pannel_chart gmbbp_chart_padding"> 
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 gmbbp_remove_style gmbbp_charts_width lyrow ui-draggable" data-setting = "1"> 
                                             <div class="gmbbp_charts_marginRight column ui-sortable gmbbp_cont_treeborderNo" style="min-height: 30px;"> 
                                                <div class="box box-element ui-draggable gmbbp_cont_navl1Postion col-lg-12 col-md-12 col-sm-12" type="cake" style="height:400px;" data-setting = "1">
                                                    <div class="gmb_ring_charts gmbbp_left_charts" id="ring_charts" >
                                                	</div> 
                                                </div> 
                                            </div> 
                                        </div> 
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 gmbbp_remove_style gmbbp_charts_width"> 
                          
                                            <div class="gmbbp_charts_marginLeft column ui-sortable gmbbp_cont_treeborderNo" style="min-height: 30px;"> 
                                                <div class="box box-element ui-draggable gmbbp_cont_navl1Postion col-lg-12 col-md-12 col-sm-12" type="cake" style="height:400px;" data-setting = "1">
                                                    <div class="gmb_columns_charts gmbbp_style_charts" id="columns_charts" >
                                                	</div>
                                                </div> 
                                            </div> 
                                        </div> 
                                    </div> 
                                    <div class="col-md-12 gmbbp_remove_style gmbbp_pannel_chart"> 
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 gmbbp_remove_style gmbbp_charts_width "> 
                                        
                                            <div class="gmbbp_charts_marginRight column ui-sortable gmbbp_cont_treeborderNo" style="min-height: 30px;"> 
                                                <div class="box box-element ui-draggable gmbbp_cont_navl1Postion col-lg-12 col-md-12 col-sm-12" type="cake" style="height:400px;" data-setting = "1">
                                                    <div class="gmb_area_charts gmbbp_left_charts" id="area_charts" >
                                                	</div> 
                                                </div> 
                                            </div> 
                                        </div> 
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 gmbbp_remove_style gmbbp_charts_width"> 
                                            
                                            <div class="gmbbp_charts_marginLeft column ui-sortable gmbbp_cont_treeborderNo" style="min-height: 30px;"> 
                                                <div class="box box-element ui-draggable gmbbp_cont_navl1Postion col-lg-12 col-md-12 col-sm-12" type="cake" style="height:400px;" data-setting = "1">
                                                    <div class="gmb_line_charts gmbbp_style_charts" id="line_charts" >
                                                	</div> 
                                                </div> 
                                            </div>
                                        </div> 
                                    </div> 
                                </div>
                                <!--切换面板内容区 开始--> 
                        </div> 
                        <!--右侧内容区结束--> 
                    </div> 
                </div> 
                <!--内容右侧内容结束--> 
            </form> 
            <!--后台内容区域 结束--> 
	</div>
<script src="./gmstatic/js/GM.js"></script>
<script type="text/javascript" src="<%=gmBase%>/gmstatic/js/GreatMap/GMBase/echarts.min.js"></script>
<script type="text/javascript" src="<%=gmBase%>/js/loadCharts.js"></script>
</body>
</html>