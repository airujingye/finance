/**
 * 
 * 文件名称:Login.js
 * 类描述:TODO(用户登录)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:FWY
 * 创建时间:2017-09-21 10:18:41 
 * 修改人:
 * 修改时间:
 * 
 * @version v1.0
 */
GM.Login = {
	//临时验证码地址
	tmpVerCodeUrl:null,
	//保存登录地址
	formLoginUrl:"",
	//保存注册地址
	formRegisterUrl:"",
	//保存form链接gmforword参数
	formForword:"",
	//保存页面链接gmforword参数
	urlForword:"",
	//初始化
	init:function(){
		//记住用户名
		var userName = GM.Util.getCookie("username");
		if(userName == "" || userName==undefined){
			$("input[name='gmbbaseuser.username']:visible").val("");
			$(".gmlogin_remember").attr("checked",false);
		}else{
			$("input[name='gmbbaseuser.username']:visible").val(userName);
			$(".gmlogin_remember").attr("checked","checked");
		}
		
		//判断验证码是否存在
		if(GM.Util.isObjectExist(".GMB_VerCode")){
			//注册单击事件
			$(".GMB_VerCode").click(function(){
				//判断临时验证码地址是否为空
				if(GM.Login.tmpVerCodeUrl==null)
					GM.Login.tmpVerCodeUrl = $(this).attr("src");
				//验证码生成
				$(this).attr("src",GM.Login.tmpVerCodeUrl+"?random="+Math.random());
			});
			//设置前后台不同登陆背景
			if(GM.Util.getUrlParam("gmforword")){
				$("body").addClass("gmbbl_login_admin_bg");
				$(".gmbbl_login_foot").addClass("gmbbl_login_admin_foot");
			}
		}
		//点击登录
		$(".GMB_Btn_Login").click(function(){
			//判断验证返回结果是否为真
			if(GM.Validator.baseValidate()){
				//记住用户名
				if($(".gmlogin_remember").is(':checked')){
					GM.Util.setCookie("username",$("input[name='gmbbaseuser.username']:visible").val());
				}else{
					GM.Util.setCookie("username","");
				}
				//获取登录地址
				GM.Login.formLoginUrl = $("#GMBFormLogin").attr("action");
				//调用登录接口
				$.ajax({
					url : GM.Login.formLoginUrl,
					type : "POST",
					dataType : "json",
					async : false,
					data: $("#GMBFormLogin").serialize(),
					cache : false,
					success: function(data) {
						//提示登录失败信息
						if(data!=null&&data.error!=null){
							$.messager.popup(data.error);
							//失败重新刷新验证码
							$(".GMB_VerCode").click();
						}else{
							//登录成功
							GM.Login.formForword = $("#GMBFormLogin").attr("gmforword");
							//获取链接上gmforword变量值；
							GM.Login.urlForword = GM.Util.getUrlParam("gmforword");
							//当前链接有gmforword参数
							if(window.location.href.indexOf("gmforword")>-1){
								//获取登录form表单上的变量gmforword
								if(GM.Login.urlForword != null&&GM.Login.urlForword.length>0){
									//跳转后台登录首页
									location.href = GM.rootPath+"/"+GM.Login.urlForword;
								} 
							//跳转form表单上的变量gmforword
							}else if(GM.Login.formForword != null&&GM.Login.formForword.length>0){
								//跳转后台登录首页
								location.href = GM.rootPath+"/"+GM.Login.formForword;
							}else{
								location.href = GM.rootPath+"/";
							}
						}
					}
				})
			}
			
		})
		//用户注册
		$(".gmlogin_register").click(function(){
			//获取登录地址
			GM.Login.formRegisterUrl = $("#GMBFormRegister").attr("action");
			//验证判断
			if(GM.Validator.baseValidate()){
				var userpawOld = $(".gmlogin_surepasw").val();
				var userpawNew = $("input[name='gmbbaseuser.password']:visible").val();
				if(userpawOld != userpawNew){
					$.messager.popup("两次密码输入不一致！");
					return;
				}
				//注册ajax
				$.ajax({
					url:GM.Login.formRegisterUrl,
					type:"POST",
					dataType : "json",
					async : false,
					data: $("#GMBFormRegister").serialize(),
					cache : false,
					success:function(data){
						if(data=="1"){
							$.messager.popup("注册成功！");
							//刷新页面
							setTimeout(function(){
								window.location.reload();
							},2000)
						}else if(data=="0"){
							$.messager.popup("注册失败！");
						}
					}
				})
			}
		})
		//支持回车键执行登录
		$("body").keydown(function() {
		    if (event.keyCode == "13") {
		        $(".GMB_Btn_Login").click();
		    }
		});
		//初始化登录背景效果
		if(GM.Util.isObjectExist("#gmLoginBg")){
			$('#gmLoginBg').particleground({
			    dotColor: '#ddd',
			    lineColor: '#ddd'
			 });
		}
		//tab切换
//		GM.Util.changeTab("#myTab");
	}
} || GM.Login;

//初始化登录
GM.Login.init();
