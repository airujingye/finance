var editor = null;
KindEditor.ready(function(K) {
	editor = K.editor({
	 	uploadJson : GM.rootPath+'/library/kindeditor/jsp/upload_json_now.jsp',
		allowFileManager : true
	});
});
$(document).ready(function(){
	/**
	 * 先查询当天预约/申请数量是否超标
	 */
	var onlinetype = $(".hh_reservation").val();
	var onlineurl;
	if(onlinetype=="reservation"){
		onlineurl = "/gmhohhot/Gmtrailer!findReservationCount.action";
	}else{
		onlineurl = "/gmhohhot/Gmmakereservation!findReservationCount.action";
	};
	$.ajax({
			url: GM.rootPath+onlineurl,
			type: "POST",
			dataType: "json",
			async: false,
			cache: false,
			success: function(data) {
				if(data!=null){
					if(data.curcount>=data.totalcount){
						$(".areanextbtn").attr("disabled",true);
						$(".remark").text("今天申请数量已满，请改天申请！")
					}else{
						$(".areanextbtn").attr("disabled",false);
						//查询当前用户最近一个申请是否在期限内
						/*$.ajax({
								url: "gmhohhot/Gmmakereservation!checkreservation.action",
								type: "POST",
								dataType: "json",
								async: false,
								cache: false,
								success: function(flag) {
									if(flag!=null){
										if(flag.isSucess){
											$(".areanextbtn").attr("disabled",false);
											$(".remark").text("");
										}else{
											$(".areanextbtn").attr("disabled",true);
											$(".remark").text("一天之内只能申请一次，请耐心等待！");
										}
									}
									
								}
						});*/
					}
					$(".totalcount").text(data.totalcount);
					$(".remaindcount").text(data.totalcount-data.curcount);
				}
			}
	});
		GM.custompath = "selectfile";
		/**
		 * 添加权利人信息
		 */
		var i = 1;
		$(".addpowerbtn").click(function(){
			var infostr = $(".gm_powerusers").html();
			infostr = infostr.replace(/\[0\]/gm,"["+i+"]").replace("添加权利人","删除权利人").replace("addpowerbtn","delpowerbtn");
			infostr = "<div class='col-md-10 col-xs-12 gm_powerusers'>" +infostr+"</div>";
			$(".gm_powerusers").after(infostr);
			checkownedtype("power");
			$(".delpowerbtn").click(function(){
				$(this).parent().parent().remove();
			});
			ownedtypechange("power");
			i++;
		});
		/**
		 * 添加义务人信息
		 */
		var k = 1;
		$(".adddutybtn").click(function(){
			var infostr = $(".gm_dutyusers").html().replace(/\[0\]/gm,"["+k+"]").replace("添加义务人","删除义务人").replace("adddutybtn","deldutybtn");
			infostr = "<div class='col-md-10 col-xs-12 gm_dutyusers'>" +infostr+"</div>";
			$(".gm_dutyusers").after(infostr);
			checkownedtype("duty");
			$(".deldutybtn").click(function(){
				$(this).parent().parent().remove();
			});
			ownedtypechange("duty");
			k++;
		});
		/**
		 * 添加房产证号
		 */
		var n=1;
		$(".addhoursebtn").click(function(){
			var infostr = $(".dyqscdjhourseno").html().replace(/\[0\]/gm,"["+n+"]").replace("添加房产证号","删除房产证号").replace("addhoursebtn","delhoursebtn");
			infostr = "<div class='col-md-12 dyqscdjhourseno"+n+"'>" +infostr+"</div>";
			$(".dyqscdjhourseno").after(infostr);
			//注册删除事件
			$(".delhoursebtn").click(function(){
				$(this).parent().parent().remove();
			});
			n++;
		});
		/**
		 * 添加债务人信息
		 */
		var m=1;
		$(".adddebtorbtn").click(function(){
			var infostr = $(".dyqscdjdebtors").html().replace(/\[0\]/gm,"["+m+"]").replace("添加债务人","删除债务人").replace("adddebtorbtn","deldebtorbtn");
			infostr = "<div class='col-md-12 dyqscdjdebtors"+m+"'>" +infostr+"</div>";
			$(".dyqscdjdebtors").after(infostr);
			//注册删除事件
			$(".deldebtorbtn").click(function(){
				$(this).parent().parent().remove();
			});
			m++;
		});
		
		//判断在添加权利人或者义务人时，共有类型是否已经选择
		function checkownedtype(type){
			//判断共有方式是否被选中
			if($("."+type+"ownedtype").eq(0).val()!="" && $("."+type+"ownedtype").eq(0).val()!=null && $("."+type+"ownedtype").eq(0).val()!=undefined){
				//共同所有
				if($("."+type+"ownedtype").eq(0).val()=="1"){
					//权利人,义务人共有方式
					$("."+type+"ownedtype").each(function(index, domEle){
						if(index!=0){
							$(this).html("<option value='1' selected='selected'>共同所有</option>").attr("readonly","readonly");
						}
					});
					//共有情况
					$("."+type+"ownedinfo").each(function(index, domEle){
						if(index!=0){
							$(this).val("共同所有");
						}
					});
				}
				//按份共有
				if($("."+type+"ownedtype").eq(0).val()=="2"){
					//权利人,义务人共有方式
					$("."+type+"ownedtype").each(function(index, domEle){
						if(index!=0){
							$(this).html("<option value='2' selected='selected'>按份共有</option>").attr("readonly","readonly");
						}
					});
					//共有情况
					$("."+type+"ownedinfo").each(function(index, domEle){
						if(index!=0){
							$(this).val("按份共有");
						}
					});
				}
				//其他
				if($("."+type+"ownedtype").eq(0).val()=="3"){
					//权利人,义务人共有方式
					$("."+type+"ownedtype").each(function(index, domEle){
						if(index!=0){
							$(this).html("<option value='3' selected='selected'>其他</option>").attr("readonly","readonly");
						}
					});
					//共有情况
					$("."+type+"ownedinfo").each(function(index, domEle){
						if(index!=0){
							$(this).val("其他");
						}
					});
				}
			}
		}
		
		/**
		 * 添加抵押信息
		var j = 1;//addybpledgebtn
		$(".addybpledgebtn").click(function(){
			var infostr = $(".ybdyqscdjinfo").html().replace(/\[0\]/gm,"["+j+"]").replace("添加抵押信息","删除抵押信息").replace("addybpledgebtn","delybpledgebtn");
			infostr = "<div class='col-md-12 ybdyqscdjinfo'>" +infostr+"</div>"
			$(".ybdyqscdjinfo").after(infostr);
			//注册删除事件
			$(".delybpledgebtn").click(function(){
				$(this).parent().parent().remove();
			});
			//注册时间控件事件
			$('.form_datetime').datetimepicker({
				language:  'zh-CN',
				weekStart: 1,
			    todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0,
				format:'yyyy-mm-dd'
			});
			j++;
		});*/
	 	/*
	 	 * 登记大类选择事件
	 	 */
		$(".djtype").change(function(){
			//清空小类名称隐藏域
			$(".djsmname").val("");
			//先将小类对应的特殊表单隐藏并且diabled
			if($(".djsmtype").parent(".dyqscdj").css("display")!="none"){
				var smkeyword = $(".djsmtype>option:selected").attr("svalue");
				$("."+smkeyword+"info").css("display","none");
				//disabled相应div中表单
				$("."+smkeyword+"info").find("*").each(function(){
					$(this).attr("disabled", "disabled");
				});
				//首先将所有option对应的小类下拉框隐藏
				$(".djsmtype").attr("greatmapcache",false);
				var opts = $(".djtype option");
				if(opts!=null&&opts.length>0){
					for(var i=1;i<opts.length;i++){
						var $option = $(opts[i]);
						if($option.attr("svalue")!=null && $option.attr("svalue")!="" && $option.attr("svalue")!=undefined){
							$("."+$option.attr("svalue")).css("display","none");
							//先将所有的房屋编码输入框禁用
							$("."+$option.attr("svalue")+"hourseno").css("display","none");
							$("."+$option.attr("svalue")+"hourseno input").attr("disabled","disabled");
							//将相应债务人信息div隐藏
							if($("."+$option.attr("svalue")+"debtors")!=null && $("."+$option.attr("svalue")+"debtors")!=undefined){
								$("."+$option.attr("svalue")+"debtors").css("display","none");
								$("."+$option.attr("svalue")+"debtors").find("*").each(function(){
									$(this).attr("disabled","disabled");
								});
							}
						}
					}
				}
			}
			$(".djsmtype option:first").prop("selected", "selected");
			
			//获取option选中的值
			var djtype = $('.djtype>option:selected').attr("svalue");
			//判断是否存在相应的债务人debtors
			if($("."+djtype+"debtors")!=null && $("."+djtype+"debtors")!=undefined){
				$("."+djtype+"debtors").css("display","block");
				$("."+djtype+"debtors").find("*").each(function(){
					$(this).removeAttr("disabled");
				});
			}
			$(".powercue").html("");
			$(".dutycue").html("");
			$(".djsmtypemsg").html("");//登记小类提示信息清空
			//$(".djsmtypemsg").css("display","none");
			$(".dutyusers").show();
			$(".dutyusers").find("*").each(function(){
				$(this).removeAttr("disabled");
			});
			$(".djhousenopane").find(".hh_rightname").html("房产证号");
			$("#djhouseno").attr("placeholder","房产证号(甘房权证新城区字第***号)");
			//判断djtype填写相应的提示信息（权利人，义务人）
			if(djtype=="gyjsydsyqjfwsyqzydj"){//转移
				$(".powercue").html("（买方）");
				$(".dutycue").html("（卖方）");
				$(".djsmtypemsg").css("display","inline-block");
				$(".djsmtypemsg").html("注：存量房买卖为二手房买卖");
			}else if(djtype=="dyqscdj" || djtype=="GMYBDYQZGDYQZXDJ"){
				$(".powercue").html("（如：银行）");
				$(".dutycue").html("（抵押人）");
				if(djtype=="GMYBDYQZGDYQZXDJ"){
					$(".djhousenopane").find(".hh_rightname").html("抵押证明号");
					$("#djhouseno").attr("placeholder","抵押证明号");
				}
			}else if(djtype=="GMZXDJ" ){
				$(".dutyusers").hide();
				var deldutybtns = $(".deldutybtn");
				if(deldutybtns!=null && deldutybtns!=undefined && deldutybtns.length>0){
					$(".deldutybtn").each(function(){
						$(this).click();
					});
				}
				$(".dutyusers").find("*").each(function(){
					$(this).attr("disabled","disabled");
				});
			}
			if(djtype=="ygspfmmygdj"){
				$(".djhousenopane").css("display","none");
				$(".gm_location_tip").css({"position": "absolute","display":"inline-block","width": "100%"});
				$(".powerusers .gmgs_role_obligee span").eq(0).html("预告权利人");
				$(".dutyusers .dutyuserinfo .gmgs_role_obligor span").eq(0).html("预告义务人");
				$(".powercue").html("（买方）");
				$(".dutycue").html("（卖方）");
			}else{
				$(".djhousenopane").css("display","block");
				$(".gm_location_tip").css("display","none");
				$(".powerusers .gmgs_role_obligee span").eq(0).html("权利人");
				$(".dutyusers .dutyuserinfo .gmgs_role_obligor span").eq(0).html("义务人");
			}
			//获取option选中的值
			var tmpisParent = $('.djtype>option:selected').attr("isParent");
			if(djtype!=null&&djtype!=undefined&&djtype!=""){
				if($("."+djtype)!=null && $("."+djtype)!=undefined){
					if(tmpisParent=="true")djtype="gmtypedj";
					$("."+djtype).css("display","block");
					$("."+djtype+" .djsmtype").attr("keyName","id");
					$("."+djtype+" .djsmtype").attr("keyValue",$(this).val());
					//将对应的房屋号div显示
					$("."+djtype+"hourseno").css("display","block");
					$("."+djtype+"hourseno input").removeAttr("disabled");
					//触发事件
					$("."+djtype+" .djsmtype").each(function (index,domEle){
						 $(domEle).click();
					});
				}
			}
			
			//获取相应的删除房屋号按钮
			var delhoursebtns = $(".delhoursebtn");
			if(delhoursebtns!=null && delhoursebtns!=undefined && delhoursebtns.length>0){
				$(".delhoursebtn").each(function(){
					$(this).click();
				});
			}
			//获取相应的删除债务人按钮
			var deldebtorbtns = $(".deldebtorbtn");
			if(deldebtorbtns!=null && deldebtorbtns!=undefined && deldebtorbtns.length>0){
				$(".deldebtorbtn").each(function(){
					$(this).click();
				});
			}
			
			if(tmpisParent!="true"){
				//增加登记大类对应的材料
				materialLoad($(this).val());
			}
		});
		
		/**
		 * 权利、义务人共有方式选择事件
		 */
		function ownedtypechange(type){
			$("."+type+"ownedtype").change(function(){
				//先将权利比例表单readonly
				$(this).parent().parent().parent().find("."+type+"powerscale").attr("readonly","readonly");
				$(this).parent().parent().parent().find("."+type+"powerscale").val("");
				$(this).parent().parent().parent().find("."+type+"hiddenpowerscale").val("");
				$(this).parent().parent().parent().find("."+type+"ownedinfo").val("");
				$(".add"+type+"btn").removeAttr("disabled");
				if($(this).val()!=null && $(this).val()!=""){
					//判断当前选中的是否是单独所有
					if($(this).val()=="0"){
						//判断是否存在添加的权利人或者义务人，存在删除
						$(".del"+type+"btn").each(function(){
							$(this).click();
						});
						$("."+type+"ownedtype").eq(0).val("0");
						//将添加权利人,义务人按钮禁用
						$(".add"+type+"btn").attr("disabled","disabled");
					}
					//判断当前选中的是否是共同所有
					if($(this).val()=="1"){
						//权利人,义务人共有方式
						$("."+type+"ownedtype").each(function(index, domEle){
							if(index!=0){
								$(this).html("<option value='1' selected='selected'>共同所有</option>").attr("readonly","readonly");
							}
						});
						$("."+type+"powerscale").each(function(index, domEle){
							$(this).attr("readonly","readonly");
						});
						//共有情况
						$("."+type+"ownedinfo").each(function(index, domEle){
							if(index!=0){
								$(this).val("共同所有");
							}
						});
					}
					//判断当前选中的是否是按份共有
					if($(this).val()=="2"){
						//权利人,义务人共有方式
						$("."+type+"ownedtype").each(function(index, domEle){
							if(index!=0){
								$(this).html("<option value='2' selected='selected'>按份共有</option>").attr("readonly","readonly");
							}
						});
						//将共有比例文本框readonly去除powerpowerscale
						$("."+type+"powerscale").each(function(index, domEle){
							$(this).removeAttr("readonly");
						});
						//共有情况
						$("."+type+"ownedinfo").each(function(index, domEle){
							if(index!=0){
								$(this).val("按份共有");
							}
						});
						$(this).parent().parent().parent().find("."+type+"powerscale").removeAttr("readonly");
					}
					//其他
					if($(this).val()=="3"){
						//权利人,义务人共有方式
						$("."+type+"ownedtype").each(function(index, domEle){
							if(index!=0){
								$(this).html("<option value='3' selected='selected'>其他</option>").attr("readonly","readonly");
							}
						});
						//共有情况
						$("."+type+"ownedinfo").each(function(index, domEle){
							if(index!=0){
								$(this).val("其他");
							}
						});
					}
					$(this).parent().parent().parent().find("."+type+"ownedinfo").val($(this).find('option:selected').text());
				}
			});
			$("."+type+"powerscale").keyup(function(){
				if($(this).val()!=null && $(this).val()!=""){
					$(this).parent().parent().parent().find("."+type+"hiddenpowerscale").val($(this).val()+"%");
				}else{
					$(this).parent().parent().parent().find("."+type+"hiddenpowerscale").val($(this).val());
				}
			});
		}
		ownedtypechange("duty");
		ownedtypechange("power");
		/**
		 * 义务人共有方式选择事件
		
		$(".dutyownedtype").change(function(){
			//先将权利比例表单readonly
			$(this).parent().parent().parent().find(".dutypowerscale").attr("readonly","readonly");
			$(this).parent().parent().parent().find(".dutypowerscale").val("");
			$(this).parent().parent().parent().find(".dutyhiddenpowerscale").val("");
			$(this).parent().parent().parent().find(".dutyownedinfo").val("");
			//判断当前选中的是否是按份共有
			if($(this).val()!=null && $(this).val()!=""){
				if($(this).val()=="2"){
					$(this).parent().parent().parent().find(".dutypowerscale").removeAttr("readonly");
				}
				$(this).parent().parent().parent().find(".dutyownedinfo").val($(this).find('option:selected').text());
			}
		});
		$(".dutypowerscale").keyup(function(){
			if($(this).val()!=null && $(this).val()!=""){
				$(this).parent().parent().parent().find(".dutyhiddenpowerscale").val($(this).val()+"%");
			}else{
				$(this).parent().parent().parent().find(".dutyhiddenpowerscale").val($(this).val());
			}
		}); */
		
		/**
		 * 加载材料信息
		 * typekeyword 材料关键字
		 */
		function materialLoad(typeid){
			var url = GM.rootPath+"/gmhohhot/Gmmaterial!ajaxNeedList.action";
			//判断小类大类id是否为空
			 if(typeid!=null&&typeid!=""&&typeid!=undefined){
			  	url = url + "?typeid=" +  typeid;
			 }
			//动态加载对应登记类型的附件材料
			  $(".gmfiles").load(url,function(){
				//判断材料div中是否有内容
				 if($(this).html()!=null && $.trim($(this).html())!=""){
					 //显示附件材料下一步按钮
					 $("#bmaterialFile").show();
					 //隐藏附件材料提交按钮
					 $("#bmaterialSub").hide();
					//重新注册文件上传点击事件
					$(".gmp_imgload").click(function() {
						var txtName = $(this).attr("inputName");
							editor.loadPlugin('image', function() {
								editor.plugin.imageDialog({
									showRemote : false,
									imageUrl : $("#"+txtName).val(),
									clickFn : function(url, title, width, height, border, align) {
										if(url!=null && url!=""){
											var name = url.substring(url.lastIndexOf("\/")+1,url.length);
											var imagenames = $("#"+txtName+"Name").val();
											if(imagenames!=null && imagenames!=""){
												$("#"+txtName+"Name").val(imagenames+","+name);
											}else{
												$("#"+txtName+"Name").val(name);
											}
											var imgurl = $("#"+txtName).val();
											url = url.split("\/");
											url.splice(0,1);
											url = url.join("\/");
											if(imgurl!=null && imgurl!=""){
												$("#"+txtName).val(imgurl+","+"/rest/"+url);
											}else{
												$("#"+txtName).val("/rest/"+url);
											}
										}
										editor.hideDialog();
									}
								});
							});
					});
			 	 }else{
			 		 //删除无用信息
			 		$(".gmfiles").html("");
			 		 //不存在附件材料
			 		 //隐藏附件材料下一步按钮
					 $("#bmaterialFile").hide();
					 //显示附件材料提交按钮
					 $("#bmaterialSub").show();
			 	 }
			  });
		}
		
		/*
		 * 登记小类选择事件
		 */
		$(".djsmtype").change(function(){
			
			//隐藏域赋值
			if($(this).val()!=null&&$(this).val()!=""){
				$(".djsmname").val($('.djsmtype>option:selected').text());
			}
			//首先将等级小类对应的表单div隐藏
			var smopts = $(".djsmtype option");
			if(smopts!=null && smopts.length>0){
				for(var i=0;i<smopts.length;i++){
					var $smopt = $(smopts[i]);
						if($smopt.attr("svalue")!=null && $smopt.attr("svalue")!="" && $smopt.attr("svalue")!=undefined){
							if($("."+$smopt.attr("svalue")+"info")!=null && $("."+$smopt.attr("svalue")+"info")!=undefined){
								$("."+$smopt.attr("svalue")+"info").css("display","none");
								//disabled相应div中表单
								$("."+$smopt.attr("svalue")+"info").find("*").each(function(){
									$(this).attr("disabled", "disabled");
								});
							}
						}
				}
			}
			//动态显示每个小类对应的表单信息
			//获取当前选中的option
			var typekeyword = $(this).find("option:selected").attr("svalue");
			if(typekeyword!=null&&typekeyword!=""&&typekeyword!=undefined){
				if(typekeyword=="GMFXGM"){
					$(".powercue").html("(变更前)");
					$(".dutycue").html("(变更后)");
				}
				if($("."+typekeyword+"info")!=null && $("."+typekeyword+"info")!="" && $("."+typekeyword+"info")!=undefined){
					$("."+typekeyword+"info").find("*").each(function(){
						$(this).removeAttr("disabled");
					});
					$("."+typekeyword+"info").css("display","block");
				}
			}
			//增加登记小类对应的材料
			materialLoad($(this).val());
			
		});
		
		
		
		
	  /*
	   * 地区选择完成后下一步
	   */
	  $(".areanextbtn").click(function(){
	  	$(".djsmtype").parent(".dyqscdj").css("display","none");
		  var val=$('input:radio[class="gmregion"]:checked').val();
		  if(val==null){
                $.messager.popup("请选择登记区域!");
                return false;
            } 
		  $(".djtype").attr("keyvalue",$('input:radio[class="gmregion"]:checked').attr("keyword"));
		  $("#gmOaaddress").val($('input:radio[class="gmregion"]:checked').val());
		  if(val.indexOf("国土所")>-1 || val.indexOf("市民")>-1){
			  $(".djhousenopane").hide();
			  $(".dutyusers").hide();
		  }else{
				 $(".djhousenopane").show();
				  $(".dutyusers").show();
			 }
		  $(".djtype").each(function (index,domEle){
			  $(domEle).click();
		  });
		  $(".first a").click();
	  });
	  
	//地区选择跳转事件
	  
	$(".choosearea").click(function(){
		if($(window).width()<768){
			$(".djtype").attr("keyvalue",$(this).find("input").attr("keyword"));
			 $(".djtype").each(function (index,domEle){
				 $(domEle).click();
			 });
			if($(this).text().indexOf("区")>-1){
				  $(".djhousenopane").hide();
				  $(".dutyusers").hide();
			 }else{
				 $(".djhousenopane").show();
				  $(".dutyusers").show();
			 }
			$(".choose").attr("name","");
			$(this).find("input").attr("name","gmmakereservation.oaaddress");
			$(".first a").click();
		}
		
	 });
		
	  /*
	   * 申请信息填写完成后下一步
	   */
	 $(".nextbtn").click(function(){
		//增加基本验证
		 if(GM.Validator.areaValidate())
		  $(".second a").click();
	  });
	  
	  /*
	   * 信息填写页面上一步事件
	   */
	$(".areaprebtn").click(function(){
		//首先将等级小类对应的表单div隐藏
			var smopts = $(".djsmtype option");
			if(smopts!=null && smopts.length>0){
				for(var i=0;i<smopts.length;i++){
					var $smopt = $(smopts[i]);
						if($smopt.attr("svalue")!=null && $smopt.attr("svalue")!="" && $smopt.attr("svalue")!=undefined){
							if($("."+$smopt.attr("svalue")+"info")!=null && $("."+$smopt.attr("svalue")+"info")!=undefined){
								$("."+$smopt.attr("svalue")+"info").css("display","none");
								//disabled相应div中表单
								$("."+$smopt.attr("svalue")+"info").find("*").each(function(){
									$(this).attr("disabled", "disabled");
								});
							}
						}
				}
			}
		$(".djtype option:first").prop("selected", "selected");
		$(".djtype").attr("greatmapcache",false);
	  	$(".area a").click();
	});
	/*
	 * 最后一页上一步事件
	 */
	$(".prebtn").click(function(){
	      $(".first a").click();
	})
	
	$(".subbtn").click(function(){
		//增加基本验证
		var contactus_code = $(".convenience_code").val();
	 	if(!GM.Validator.areaValidate())return false;
		/*if(contactus_code!=codeno){
			  $.messager.popup("验证码错误！");
			  return false;
		}*/
		$.messager.model = { 
			ok:{ text: "确定"},
		    cancel: { text: "取消"}
		};
		$.messager.confirm("提示信息","信息确认后不可更改，您是否确认提交？",function(){
			var path= GM.Util.getCookie("identifiedcode");
		    
			$(this).attr("disabled",true);
			$("#fulladdress").val($("#xxdizhi").val());
			if($(".subbtn").attr("id")=="gmOrderSubmit"){
				var url=GM.rootPath+"/gmhohhot/Gmtrailer!gmtrailerSave.action";
				var obj="order";
			}else{
				var url= GM.rootPath+"/gmhohhot/Gmmakereservation!ajaxSaveSpecial.action";
				var obj="apply";
			}
			$.ajax({
				url: url,
				type: "POST",
				dataType: "json",
				async: false,
				data: $("#yuyueform").serialize(),
				cache: false,
				success: function(data) {
                   if(data=="1"){//提交成功

				   	location.href=GM.rootPath+"/greatmap/"+path+"/gmgs_successful.html?type="+obj;
				   	
                   }else if(data=="0"){//提交失败
				   	 $.messager.alert("提示信息","申请失败请重新申请！");
					 $(this).attr("disabled",false);
                   }else if(data=="2"){//重复提交
				   	 $.messager.alert("提示信息","该申请您已经提交过了，不能重复申请，请耐心等待审核结果！");
					 $(this).attr("disabled",false);
				   }else if(data=="3"){//重复提交
				   	 $.messager.alert("提示信息","已达到当日预约办理上限，请修改预约日期！");
					 $(this).attr("disabled",false);
				   }
				}
			});
		});

	  });
	/*
	 * 初始化GreatMap控件
	 */
	
	//GM.DataDicTrees.init();
	$('input').iCheck({
	    checkboxClass: 'icheckbox_square-blue',
	    radioClass: 'iradio_square-blue'
	});
	/*
	 * 初始化时间控件
	 */	
	if(GM.isClassNameExist('form_datetime')){
		$('.form_datetime').datetimepicker({
			language:  'zh-CN',
			weekStart: 1,
		    todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format:'yyyy-mm-dd'
		});
	}
	
});




/*----------------------------------网上申请新增页面----------------------------------------*/
var onlinehall = {
	//证书查验
	proveQuery:function(){
		if(!GM.Validator.areaValidate())return false;
		 $.ajax({
			url: GM.rootPath+"/gmhohhot/Gmcertificate!getInspection.action",
			type: "POST",
			dataType: "json",
			data: $("#yuyueform").serialize(),
			success: function(data) {
				if(data.isSucess==true){
					$.messager.popup("证明有效!");
				}else{
					$.messager.popup("证明无效!");
				}
			}
		});
	},
	init:function(){
		//证书查验
		$(".prove_check").click(function(){
			onlinehall.proveQuery();
		 })
		
	}
} || onlinehall;
onlinehall.init();
























