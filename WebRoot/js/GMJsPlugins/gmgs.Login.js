/**
 * 
 * 类名称:hh_userlogin.js 
 * 类描述:TODO(外网用户登录脚本文件)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:FWY
 * 创建时间:2016-11-27 10:38:41 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
var GMGS_Login={
	wait:60,
	flag:false,
	init:function(){
		/**
		 * 用户登录点击事件
		 */
		$(".gmhohhot_login_loginsub").click(function(){
			GMGS_Login.userLogin();
		});
		//为keyListener方法为的登录按键事件
		document.onkeydown=GMGS_Login.keyListener;
		/**
		 * 判断登录页面不能再其它框架中
		 */
		if (top.location != self.location){
			top.location=self.location;
		}
		/**
		* 短信验证码获取
		*/
		$(".identifying_code").click(function(){
			GMGS_Login.smsAuthenticationCode($(this));
		});
		/**
		 * 注册-用户注册点击事件
		 */
		$(".gmhohhot_register_regsub").click(function(){
			GMGS_Login.register($(this));
		});
		/**
		 * 重置确认事件
		 */
		$(".reg_btn").click(function(){
			GMGS_Login.resetEvent();
		});
	},
	/**
	 * 用户登录点击事件
	 */
	userLogin:function(){
		var path= GM.Util.getCookie("identifiedcode");
		//增加基本验证
	 	if(!GM.Validator.areaValidate())return false;
	 	//获取登录地址
	 	var formLoginUrl = $("#gmgs_login_form").attr("action")
		$.ajax({
			url: formLoginUrl,
			type: "POST",
			dataType: "json",
			async: false,
			data: $("#gmgs_login_form").serialize(),
			cache: false,
			success: function(data) {
				if(data!=null&&data!=""){
					if(data.isSucess==false){
						$.messager.alert("提示信息","用户名或密码错误请重新登陆！");
					}else{
						if(data.isAdmin){
							$.messager.alert("提示信息","用户名或密码错误请重新登陆！");
						}else{
							location.href=GM.rootPath+"/greatmap/"+path+"/gmgs_onlinehall.jsp";
						}
					}
				}
			}
		});
	},
	/**
	 * 确认按钮回车事件
	 */
	keyListener:function(e){
		// 当按下回车键，执行我们的代码
		if(e.keyCode == 13){
			if(!($(".modal-dialog").is(":visible")))
				$(".gmgs_loginsub").click();
		}
	},
	time:function(btn){
	 if(GMGS_Login.wait == 0) {  
	    	$(btn).css("background","#0096ff").css("color","#fff");
	        btn.get(0).removeAttribute("disabled");  
	        btn.get(0).value = "获取验证码";  
	        GMGS_Login.wait = 60;  
	    } else {  
	        btn.get(0).setAttribute("disabled", true);  
	        $(btn).css("background","#f1f1f1").css("color","#333");
	        btn.get(0).value = "重新发送(" + GMGS_Login.wait + ")";  
	        GMGS_Login.wait--;  
	        setTimeout(function() {  
	        	GMGS_Login.time(btn);
	            },1000);
	    }  
	},
	/**
	* 短信验证码获取
	*/
	smsAuthenticationCode:function($this){	
	 	var identifying = $(".gmgs_regphone").val();
		   if(identifying!=""){
		       var codereg = /^1\d{10}$/
			   codeisok= codereg.test(identifying);
		       if(codeisok){
		    		//注册
			   		if(GM.Util.isObjectExist(".gmhohhot_register")){
			   			GMGS_Login.time($this);
			   		}
			   		//获取注册地址
			   		var formRegUrl = $("#registerform").attr("action");
					 $.ajax({
							url: formRegUrl,
							type: "POST",
							dataType: "json",
							async: true,
							data: {
						        code:identifying
							},
							cache: false,
							success: function(data) {
								//忘记密码
								if(GM.Util.isObjectExist(".gmgs_forgetpwd")){
								   if(data==1){
									 GMGS_Login.flag = true;
					               }else if(data==2){
								   	 $.messager.popup("验证码获取失败，请重新获取！");
					               }else if(data==3){
					            	 $.messager.popup("手机号未注册，请重新填写！");
					               }
								}
								//注册
						   		if(GM.Util.isObjectExist(".gmhohhot_register")){
						   			if(data==1){
						   			   $(".gmgs_regphone").attr("readonly","readonly");
									   $.messager.popup("验证码获取成功！");
						   			}else if(data==2){
								   	   $.messager.popup("验证码获取失败，请重新获取！");
						   			}
						   		}
							}
						 });
						//忘记密码
						if(GM.Util.isObjectExist(".gmgs_forgetpwd")){
							 if(GMGS_Login.flag){
								 GMGS_Login.time($this);
							 } 
						}
		       }else{
		    	$this.css("color","#fff");
		        $.messager.popup("请输入正确手机号码！");
			   }
		   }else{
			    $this.css("color","#fff");
		        $.messager.popup("请输入正确手机号码！");
		   }
	},
	//注册点击事件
	register:function($this){
		$this.css("color","#fff").css("background","#2a9de8").css("border","none");
		var that = $this;
		if(!GM.Validator.areaValidate())return false;
		var pwd = $(".hh_regpwd").val();
		var spwd = $(".hh_regspwd").val();
		if(pwd != spwd){
			 $.messager.popup("两次密码输入不一致，请重新输入");
			 return false;
		}
        that.addClass('disabled');
        var path= GM.Util.getCookie("identifiedcode");
		$.ajax({
			url: GM.rootPath+"/gmhohhot/Gmadmin!register.action",
			type: "POST",
			dataType: "json",
			async: true,
			data: $("#registerform").serialize(),
			cache: false,
			success: function(data) {
			   if(data==1){
				  $.messager.popup("恭喜您注册成功！");
				  setTimeout("location.href='"+GM.rootPath+"/greatmap/"+path+"/gmgs_login.html'",500);
			   }else if(data==2){
			   	   $.messager.popup("用户注册失败！");
			   	   that.removeClass('disabled');
			   }else if(data==3){
			   	   $.messager.popup("用户名已存在请重新注册！");
			   	   $(".gmgs_regphone").attr("readonly",false);
			   	   that.removeClass('disabled');
			   }else if(data==4){
			   	   $.messager.popup("验证码错误请重新输入！");
			   	   that.removeClass('disabled');
			   } 
			}
		});
	},
	/**
	 * 重置确认事件
	 */
	resetEvent:function(){
		if(!GM.Validator.areaValidate())return false;
		var pwd = $(".reg_pwd").val();
		var spwd = $(".reg_spwd").val();
		var path= GM.Util.getCookie("identifiedcode");
		if(pwd != spwd){
			 $.messager.popup("两次密码输入不一致，请重新输入");
			 return false;
		}
		//验证完成后重置密码
		$.ajax({
				url: GM.rootPath+"/gmhohhot/Gmadmin!resetPwd.action",
				type: "POST",
				dataType: "json",
				async: false,
				data: $(".gmgs_forgetpwd_form").serialize(),
				cache: false,
				success: function(data) {
					  if(data==1){
					 	$.messager.alert("提示信息","重置密码成功！");
						setTimeout("location.href ='"+GM.rootPath+"/greatmap/"+path+"/gmgs_login.html'",500);
				      }else if(data==2){
				   	 	$.messager.alert("提示信息","验证码错误请重新输入！");
				      }
				}
		});
	}
};
$(function(){
	GMGS_Login.init();
});
