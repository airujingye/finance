/**
 * 
 * 类名称:hh_header.js 
 * 类描述:TODO(外网用户重置脚本文件)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:YY
 * 创建时间:2017-1-11 17:01:30 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
function headeractive(as){
	$(".hh_nav a").removeClass("on");
	$(".hh_nav a[as='"+as+"']").addClass("on");
}

//判断是否登录
var user = GM.Util.getCookie("adminnick");
if(user != null || user != undefined){
	$(".gmhohhot_login").text(user);
	$(".gmhohhot_login").attr("href","javascript:;");
}
//退出框显示、隐藏
$(".gmhohhot_user").hover(function(){
	if(user!=null || user!=undefined){
		$(".gmhohhot_userset").show();
	}
},function(){
	$(".gmhohhot_userset").hide();
})
//退出系统 
$(".gmhohhot_quite_btn").click(function(){
	window.location.href=GM.Util.getRootPath()+'/gmhohhot/Gmadmin!logout.action'
})
//头部状态
function setNavActive() {
	var cookie = null;
	$(".hh_nav a").click(function() {
		//设置cookie
		$(".hh_nav a").removeClass("active");
		GM.Util.setCookie("navAs", $(this).attr("as"))
	})
	cookie = GM.Util.getCookie("navAs");
	if(cookie) {
		$(".hh_nav a").removeClass("on");
		$(".hh_nav a[as=" + cookie + "]").addClass("on");
	} else {
		$(".hh_nav a").removeClass("on");
		$(".hh_nav a[as='sy']").addClass("on");
	}
}
setNavActive();
//添加收藏
$(".gmhohhot_sc").click(function(){
	var url = window.location;
	var title = $("title").text();
	GM.Util.addFavorite(url,title);
})

//分享
$("body").click(function(e){
	if($(e.target).parent().get(0).className == "gm_share"){
		$(".gm_sharebox").show("1500");
	}else{
		$(".gm_sharebox").hide("1500");
	}
})
