var GMGSIndex = {
	//临时验证码地址
	tmpVerCodeUrl:null,
	//搜索
	searchFul:function(){
		if($(".headsearch")!=null && $(".headsearch")!=undefined){
			$(".headsearch").click(function(){
				//获取连接地址
				var url = $(".headform").attr("action");
				url += "?fullSearch="+$(".hh_header_searchbox_input").val();
				window.open(url);
			});
		}
	},
	//头部状态
	setNavActive:function(){
		var cookie = null;
		$(".gmgs_nav a").click(function() {
			//设置cookie
			$(".gmgs_nav a").removeClass("active");
			GM.Util.setCookie("navAs", $(this).attr("as"))
		})
		cookie = GM.Util.getCookie("navAs");
		if(cookie) {
			$(".gmgs_nav a").removeClass("on");
			$(".gmgs_nav a[as=" + cookie + "]").addClass("on");
		} else {
			$(".gmgs_nav a").removeClass("on");
			$(".gmgs_nav a[as='sy']").addClass("on");
		}
	},
	//头部定位
	addressPosition:function(_this){
		$(".gmgs_addinfo").show();
		var identifiedcode= GM.Util.getCookie("identifiedcode");
		$.ajax({
			url:GM.rootPath + "/gmhohhot/Gmaddrinfo!getAddress.action",
			type:"GET",
			dataType:"json",
			success:function(data){
				/*市*/
				var cityHtmlText = '';
				var countyHtmlText = "";
				var city = "";
				$.each(data,function(index,item){
					cityHtmlText+='<a href="javascript:;">'+item.addressName+'</a>';
					/*县*/
					if(item.addressList.length == 0){
						var html = "<div class='gmgs_addinfo_county_context'></div>";
						$(".gmgs_addinfo_county").append(htmlTest);
					}else{
						html = "<div class='gmgs_addinfo_county_context'>";
						$.each(item.addressList,function(i,ele){
							if(ele.statue==true){
								html += "<a data-addressPath='"+ele.addressinfo.indexpath+"' data-address='"+ele.addressinfo.identifiedcode+"' class='gmgs_address_name'>"+ele.addressinfo.addrname+"</a>";
							}else{
								html += "<a href='"+ GM.rootPath + ele.addressinfo.indexpath+"' data-address='"+ele.addressinfo.identifiedcode+"' class='cursor'>"+ele.addressinfo.addrname+"</a>";
							}
						});
						html +="</div>";
						countyHtmlText+=html;
					}
				});
				$(".gmgs_addinfo_city").html(cityHtmlText);
				$(".gmgs_addinfo_county").html(countyHtmlText);
				/*点击切换区域*/
				$(".gmgs_address_name").click(function(){
					var _this = $(this);
					if(identifiedcode==_this.attr("data-address")){
						$.messager.popup("您已所在该区域!");
						return false;
					}else{
						var addressPath = _this.attr("data-addressPath");
						GMGSIndex.change(addressPath);
					}
				});
				//点击市县
				$(".gmgs_addinfo_county_context a").click(function(){
					var _this = $(this);
					if(_this.hasClass("cursor")){
						$.messager.popup("服务暂未开放");
						return false;
					}else{
						$(".gmgs_getadd span").text(_this.text());
					}
				})
			}
		});
	},
	change:function(addressPath){
		$.ajax({
			url:GM.rootPath+"/gmhohhot/Gmaddrinfo!gotoChange.action",
			type:"GET",
			dataType:"json",
			success:function(data){
				if(data.isSucess==true){
					location.href=GM.rootPath+addressPath;
				}else{
					alert("请退出当前地区用户");
				}
			}
		});
	},
	//我要建议
	ConvenienceAdvice: function(){
		var contactus_code = $(".convenience_code").val();
		if(!GM.Validator.baseValidate())return false;
		$.ajax({
			url: GM.rootPath+"/gmhohhot/Gmadvice!ajaxSaveSpecial.action",
			type: "POST",
			dataType: "json",
			async: false,
			data: $("#jianyiform").serialize(),
			cache: false,
			success: function(data) {
		      if(data=="1"){
		            $.messager.popup("建议成功！");
					setTimeout("location.href='"+GM.rootPath+"/greatmap/"+path+"/gmgs_contactus.html'",1100);
		      }else{
		 		   	 $.messager.popup("建议失败，请重新填写！");
		      }
			}
	    });
	},
	//我要咨询
	ConvenienceConsult:function(){
		var path= GM.Util.getCookie("identifiedcode");
		var contactus_code = $(".convenience_code").val();
	 	if(!GM.Validator.baseValidate())return false;
		$.ajax({
			url: GM.rootPath+"/gmhohhot/Gmadvice!ajaxSaveSpecial.action",
	   		type: "POST",
	   		dataType: "json",
	   		async: false,
	   		data: $("#jianyiform").serialize(),
	   		cache: false,
	   		success: function(data) {
	          if(data=="1"){
	                $.messager.popup("咨询成功！");
					setTimeout("location.href='"+GM.rootPath+"/greatmap/"+path+"/gmgs_convenience.html'",1100);
	          }else{
	     		   	 $.messager.popup("咨询失败，请重新填写！");
	          }
	   		}
		});
	},
	modifypwd:function(){
		var identifiedcode =  GM.Util.getCookie("identifiedcode");
		if(!GM.Validator.areaValidate())return false;
		var hh_newloginpwd = $(".hh_newloginpwd").val();
		var hh_newloginpwds = $(".hh_newloginpwds").val();
		if(hh_newloginpwd!=hh_newloginpwds){
			$.messager.popup("两次密码输入不一致！");
			return false;
		}
		$.ajax({
				url: GM.rootPath+"/gmhohhot/Gmadmin!mosifypwd.action",
				type: "POST",
				dataType: "json",
				async: false,
				data: $("#modifyform").serialize(),
				cache: false,
				success: function(data) {
					if(data!=null){
						if(data.isSucess){
						     $.messager.popup("密码修改成功！");
							 setTimeout("location.href='"+GM.rootPath+"/greatmap/"+identifiedcode+"/gmgs_login.html'",500);
						}else{
							$.messager.popup("原始密码不正确，请重新输入");
						}
					}
				}
			}); 
	},
	//初始化
	init:function(){
		//搜索
		GMGSIndex.searchFul();
		//头部状态
		GMGSIndex.setNavActive();
		//添加收藏
		$(".gmgs_sc").click(function(){
			var url = window.location;
			var title = $("title").text();
			GM.Util.addFavorite(url,title);
		});
		//分享
		$("body").click(function(e){
			if(e.target.className == "gmgs_share"){
				$(".gmgs_sharebox").show("1500");
			}else{
				$(".gmgs_sharebox").hide("1500");
			}
		});
		//首页I定位
		$(".gmgs_header_left").hover(function(){
			var _this = $(this);
			GMGSIndex.addressPosition(_this);
		},function(){
			$(".gmgs_addinfo").hide();
		});
		//左侧菜单点击一级菜单
		$(".gm_newsInfo_leftSideBar").click(function() {
			$(this).toggleClass("on");
			$(this).find(".hh_second_menu").slideToggle();
		})

		//判断验证码是否存在
		if(GM.Util.isObjectExist(".GMB_VerCode")){
			//注册单击事件
			$(".GMB_VerCode").click(function(){
				//判断临时验证码地址是否为空
				if(GMGSIndex.tmpVerCodeUrl==null)
					GMGSIndex.tmpVerCodeUrl = $(this).attr("src");
				//验证码生成
				$(this).attr("src",GMGSIndex.tmpVerCodeUrl+"?random="+Math.random());
			});
		};
		//首页
		if(GM.Util.isObjectExist(".gmgs_firstindex")){
			//设置cookie
			GM.Util.setCookie("addrname",$(".gmgs_firstindex").attr("data-addrname"));
			GM.Util.setCookie("identifiedcode",$(".gmgs_firstindex").attr("data-identifiedcode"));
		}
		//index页面
		if(GM.Util.isObjectExist(".gmgs_index")){
			var ua = navigator.userAgent;
			var ipad = ua.match(/(iPad).*OS\s([\d_]+)/),
		    isIphone = !ipad && ua.match(/(iPhone\sOS)\s([\d_]+)/),
		    isAndroid = ua.match(/(Android)\s+([\d.]+)/),
		    isMobile = isIphone || isAndroid;
		    if(isMobile) {
		        //location.href = 'http://wx.hohhot-estate.gov.cn';
		        location.href = 'wxindex.jsp';
		    }
		    var downHovers = $("h5[name='downHover']");
			$(function(){
				//设置日期
				GMGSIndex.initDate();
				//初始化下载专栏表 -默认格下下载
				$("#bgxz").addClass('hh_down_h5');
			});
		}
		$(".gmgs_index_content .gmgs_index_navs li a").click(function(){
			GM.Util.setCookie("navAs", $(this).attr("as"));
			window.location.href = $(this).attr("data-url");
		});
		//我要建议
		var path= GM.Util.getCookie("identifiedcode");
		$(".jybutton").click(function(){
			GMGSIndex.ConvenienceAdvice();
		});
		//我要咨询
		$(".zxbutton").click(function(){
			GMGSIndex.ConvenienceConsult();
		});
		$(".hh_title a").click(function(){
			if($(this).attr("as")=="sy"){
				$(".gmgs_nav #nav a[as='sy']").attr("class","on").siblings().removeClass("on");
				GM.Util.setCookie("navAs", $(this).attr("as"));
			}
		});
		//修改密码
		$(".hh_loginbtn").click(function(){
			GMGSIndex.modifypwd();
		});
	},
	//设置日期
	initDate:function(){
		var show_day = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
		var myDate = new Date();
		var year = myDate.getFullYear(),//年份
		month = myDate.getMonth() + 1,//月份
		day = myDate.getDate();//当前日
		var dateString = year + '年' + month + '月' + day + '日' + show_day[myDate.getDay()];
		$("#date").html(dateString);
	}
} || GMGSIndex;
//初始化
GMGSIndex.init();
