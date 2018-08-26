/**
 * 文件上传对象
 * @开发单位 北京天耀宏图科技有限公司
 * @开发部门 北京应用研发部
 * @作者 wuyi
 * @开发时间 2017.06-09
 * @关键字 GMUpload
 * @说明：
 * 		1、通用文件上传，支持单个或批量
 * 		2、可定制上传格式
 * 		3、可限定上传个数
 * 		4、可限定文件大小
 * 		5、可使用扫一扫上传
 */

/**
 * 动态加载文件上传页面
 */
$.post(GM.rootPath+"/UploadModel.jsp", function(data){
	//将文件上传页面内容追加到当前的body对象中
	$(document.body).append(data);
	//初始化方法
//	GM.GMupload.init();
	GM.Upload.init();
});

/**
 * 文件上传
 * @单位 北京天耀宏图科技有限公司
 * @部门 北京应用研发部
 * @作者 fanwy
 * @时间 2017-6-12 整理
 */
/**
 * 文件上传
 * @关键字
 * @UploadModal 面板名称
 * @gmbtnupload 点击事情
 * @
 */
/**
 * 文件上传
 * @属性
 * @savePath 保存路径 页面对应属性 gmSavePath
 * @maxFileSize 文件长度  页面对应属性 gmMaxFileSize
 * @modalTitle 模态框名称  页面对应属性  gmModalTitle
 * @fileLength 文件个数  页面对应属性  gmFileLength
 * @fileType 文件上传类型  页面对应属性  gmFileType
 * @modalFileText 文件上传文字属性  页面对应属性  gmModalFileText
 * @uploadCallback 文件上传 成功后回调函数  gmCallback  默认为返回文件路径、名称
 * @businessCallback 文件上传 业务回调函数  gmBusinessCallback  
 * @successDataImport 文件上传 解析数据回调 gmSuccessDataImport
 * @status  图片管理 gmStatus  状态1:imgPosition,图片位置信息;状态2:imgData,保存原图片信息
 */
/**
 * 文件上传 fileType 文件上传类型
 * @png  -->  image/png
 * @jpeg --> image/jpeg
 * @xlsx  --> application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
 * @doc  -->  application/vnd.openxmlformats-officedocument.wordprocessingml.document
 * @pdf  -->  application/pdf
 * @""     --> DB文件
 */
GM.Upload = {
	/*面板名称*/
	panelName:"UploadModal"
	/*注册操作对象*/
	,regHanderObj:".gmbtnupload"
	/*保存路径*/
	,savePath:null
	/*所有文件*/
	,files:null
	/*当前选中对象*/
	,selectedObj:null
	//模态框title名称
	,modalTitle:null
	//文件上传模态框文字
	,modalFileText:null
	/*文件最大长度：-1为不限制，单位字节*/
	,maxFileSize:-1
	//文件上传类型
	,fileType:null
	//文件个数
	,fileLength:null
	//默认上传的文件类型、大小、个数
	//文件list
	,modalFilesList:null
	//文件个数
	,tFileLength:null
	//保存原图片信息状态
	,status:""
	//保存原图片信息
	,saveDatabase:""
	//获取所有文件传的名称集合
	,fileNames:""
	/**
	 * 初始化
	 */
	,init:function(){
		//判断文件上传对象是否为空
		if(GM.Util.isObjectExist(this.regHanderObj)){
			//注册事件
			this.regEvent(this.regHanderObj);
		}
	}
	/**
	 * 注册事件
	 */
	,regEvent:function(objId){
		//文件上传点击事件
		$(objId).click(function(){
			//设置当前选中对象
			GM.Upload.selectedObj = $(this);
			var tmpObj = GM.Upload.selectedObj;
			//是否添加业务判断回调
			if(GM.Util.isAttrExist(tmpObj,"gmBusinessCallback")){
				if(!eval(tmpObj.attr("gmBusinessCallback"))){
					return;
				}else{
					//显示弹出对话框
					GM.Upload.show();
				}
			}else{
				//显示弹出对话框
				GM.Upload.show();
			}
			//图片管理
			if(GM.Util.isAttrExist($(this),"gmStatus")){
				var objIdVal = $(this).attr("gmStatus");
				if(objIdVal.indexOf("imgPosition")>-1){
					$("#gmImgPosition").css("display","block");
				}
				if(objIdVal.indexOf("imgData")>-1){
					this.status = "data";
				}
			}
		});
		//解绑文件预览面板事件
		this.unRegEvent("#gmPreviewFilePanel");
		//解绑文件选择事件
		this.unRegEvent("#gmFileselect");
		//解绑清空事件
		this.unRegEvent("#gmBtnClearUpload");
		//解绑文件上传事件
		this.unRegEvent("#gmBtnSubmitUpload");
		//解除拖拽事件
		this.unRegEvent("#gmPreviewFilePanel");
		//注册文件上传按钮
		$("#gmPreviewFilePanel").click(function() {
			//打开文件选择框
			$("#gmFileselect").click();
		});
		//注册文件上传选择事件
		$("#gmFileselect").change(function(event){
			GM.Upload.fileSelectHandler(event);
		});
		//注册清空事件
		$("#gmBtnClearUpload").click(function() {
			GM.Upload.emptyFiles();
		});
		//注册文件上传事件
		$("#gmBtnSubmitUpload").click(function() {
			GM.Upload.saveFiles();
		});
		//得到当前拖拽的元素
		var filedrag = document.getElementById("gmPreviewFilePanel");
		//给拖拽对象添加鼠标动作事件：拖动到目标上，用来决定给用户的反馈
		filedrag.addEventListener("dragover", this.stopEvent, false);
		//给拖拽对象添加鼠标动作事件：拖动离开目标
		filedrag.addEventListener("dragleave", this.stopEvent, false);
		//给拖拽对象添加鼠标动作事件：放置发生
		filedrag.addEventListener("drop", this.fileSelectHandler, false);
	}
	/**
	 * 文件选择操作
	 */
	,fileSelectHandler:function(event){
		//阻止浏览器默认事件
		GM.Upload.stopEvent(event);
		//获取文件列表
		var upLoadFiles = event.target.files || event.dataTransfer.files;
		GM.Upload.tFileLength=upLoadFiles.length;
		GM.Upload.upLoadFilesList=upLoadFiles;
		//添加文件对象
		GM.Upload.putFiles(upLoadFiles);
		//调用文件预览
		GM.Upload.previewFile(upLoadFiles);
	}
	/**
	 * 解除注册事件
	 */
	,unRegEvent:function(objId){
		//异常所有绑定事件
		$(objId).unbind();
	}
	/**
	 * 显示文件上传窗口
	 */
	,show:function(){
		//设置属性传值
		GM.Upload.maxFileSize=GM.Upload.selectedObj.attr("gmMaxFileSize");
		GM.Upload.modalTitle=GM.Upload.selectedObj.attr("gmModalTitle");
		GM.Upload.savePath=GM.Upload.selectedObj.attr("gmSavePath");
		GM.Upload.fileLength=GM.Upload.selectedObj.attr("gmFileLength");
		GM.Upload.modalTitle=GM.Upload.selectedObj.attr("gmModalTitle");
		GM.Upload.modalFileText=GM.Upload.selectedObj.attr("gmModalFileText");
		$(".gmNoImagediv").css("display","block");
		$("#gmPriverFileTable").css("display","none");
		$("#"+this.panelName).find("h4").text(GM.Upload.modalTitle);
		$("#"+this.panelName).find(".fileupspantext").text(GM.Upload.modalFileText);
		$("#"+this.panelName).modal("show");
		//判断属性是否存在
		var tmpObj=GM.Upload.selectedObj;
		//文件上传类型
		if(GM.Util.isAttrExist(tmpObj,"gmFileType")){
			//常见类型
			if(tmpObj.attr("gmFileType")=="png"){
				$("#gmFileselect").attr("accept","image/png");
			}else if(tmpObj.attr("gmFileType")=="jpeg" || tmpObj.attr("gmFileType")=="jpe" || tmpObj.attr("gmFileType")=="jpg"){
				$("#gmFileselect").attr("accept","image/jpeg");
			}else if(tmpObj.attr("gmFileType")=="xlsx"){
				$("#gmFileselect").attr("accept","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			}else if(tmpObj.attr("gmFileType")=="doc"){
				$("#gmFileselect").attr("accept","application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			}else if(tmpObj.attr("gmFileType")=="txt"){
				$("#gmFileselect").attr("accept","text/plain");
			}else if(tmpObj.attr("gmFileType")=="pdf"){
				$("#gmFileselect").attr("accept","application/pdf");
			}else if(tmpObj.attr("gmFileType")=="xlt" || tmpObj.attr("gmFileType")=="xlw"){
				$("#gmFileselect").attr("accept","application/vnd.ms-excel");
			}else if(tmpObj.attr("gmFileType")=="xml"){
				$("#gmFileselect").attr("accept","text/xml, application/xml");
			}else if(tmpObj.attr("gmFileType")=="zip"){
				$("#gmFileselect").attr("accept","aplication/zip");
			}else if(tmpObj.attr("gmFileType")=="css"){
				$("#gmFileselect").attr("accept","text/css");
			}else if(tmpObj.attr("gmFileType")=="gif"){
				$("#gmFileselect").attr("accept","image/gif");
			}else if(tmpObj.attr("gmFileType")=="js"){
				$("#gmFileselect").attr("accept","text/javascript, application/javascript");
			}else if(tmpObj.attr("gmFileType")=="htm"){
				$("#gmFileselect").attr("accept","text/html");
			}else if(tmpObj.attr("gmFileType")=="html"){
				$("#gmFileselect").attr("accept","text/html");
			}
			//不常见类型
			else if(tmpObj.attr("gmFileType")=="3gpp"){
				$("#gmFileselect").attr("accept","audio/3gpp, video/3gpp");
			}else if(tmpObj.attr("gmFileType")=="ac3"){
				$("#gmFileselect").attr("accept","audio/ac3");
			}else if(tmpObj.attr("gmFileType")=="au"){
				$("#gmFileselect").attr("accept","audio/basic");
			}else if(tmpObj.attr("gmFileType")=="csv"){
				$("#gmFileselect").attr("accept","text/csv");
			}else if(tmpObj.attr("gmFileType")=="dot"){
				$("#gmFileselect").attr("accept","application/msword");
			}else if(tmpObj.attr("gmFileType")=="dtd"){
				$("#gmFileselect").attr("accept","application/xml-dtd");
			}else if(tmpObj.attr("gmFileType")=="dwg"){
				$("#gmFileselect").attr("accept","image/vnd.dwg");
			}else if(tmpObj.attr("gmFileType")=="dxf"){
				$("#gmFileselect").attr("accept","image/vnd.dxf");
			}else if(tmpObj.attr("gmFileType")=="jp2"){
				$("#gmFileselect").attr("accept","image/jp2");
			}else if(tmpObj.attr("gmFileType")=="json"){
				$("#gmFileselect").attr("accept","application/json");
			}else if(tmpObj.attr("gmFileType")=="mp2" || tmpObj.attr("gmFileType")=="mp3" || tmpObj.attr("gmFileType")=="mp4"){
				$("#gmFileselect").attr("accept","audio/mpeg");
			}else if(tmpObj.attr("gmFileType")=="mpeg"){
				$("#gmFileselect").attr("accept","video/mpeg");
			}else if(tmpObj.attr("gmFileType")=="mpg"){
				$("#gmFileselect").attr("accept","video/mpeg");
			}else if(tmpObj.attr("gmFileType")=="mpp"){
				$("#gmFileselect").attr("accept","application/vnd.ms-project");
			}else if(tmpObj.attr("gmFileType")=="ogg"){
				$("#gmFileselect").attr("accept","application/ogg, audio/ogg");
			}else if(tmpObj.attr("gmFileType")=="pot" || tmpObj.attr("gmFileType")=="pps" || tmpObj.attr("gmFileType")=="ppt"){
				$("#gmFileselect").attr("accept","application/vnd.ms-powerpoint");
			}else if(tmpObj.attr("gmFileType")=="rtf"){
				$("#gmFileselect").attr("accept","application/rtf, text/rtf");
			}else if(tmpObj.attr("gmFileType")=="svf"){
				$("#gmFileselect").attr("accept","image/vnd.svf");
			}else if(tmpObj.attr("gmFileType")=="tif" || tmpObj.attr("gmFileType")=="tiff"){
				$("#gmFileselect").attr("accept","image/tiff");
			}else if(tmpObj.attr("gmFileType")=="wdb" || tmpObj.attr("gmFileType")=="wps"){
				$("#gmFileselect").attr("accept","application/vnd.ms-works");
			}else if(tmpObj.attr("gmFileType")=="xhtml"){
				$("#gmFileselect").attr("accept","application/xhtml+xml");
			}else if(tmpObj.attr("gmFileType")=="xlc"){
				$("#gmFileselect").attr("accept","application/vnd.ms-excel");
			}else if(tmpObj.attr("gmFileType")=="xlm"){
				$("#gmFileselect").attr("accept","application/vnd.ms-excel");
			}else if(tmpObj.attr("gmFileType")=="xls"){
				$("#gmFileselect").attr("accept","application/vnd.ms-excel");
			}
		}
		//文件上传单个
		if(GM.Util.isAttrExist(tmpObj,"gmFileMultiple")){
			if(tmpObj.attr("gmFileMultiple")=="1"){
				$("#gmFileselect").removeAttr("multiple");
			}
		}
	}
	/**
	 * 文件预览
	 */
	,previewFile:function(upLoadFiles){
		//判断文件个数是否为空
		if(upLoadFiles!=null && upLoadFiles.length>0){
			//遍历文件
			for(var i=0;i<upLoadFiles.length;i++){
				//获取临时文件
				var tmpFile = upLoadFiles[i];
				//判断临时文件是否为空
				if(tmpFile!=null && tmpFile.name!=null){
					$(".gmNoImagediv").css("display","none");
					$("#gmPriverFileTable").css("display","block");
					//文件名称
					var fileName = tmpFile.name;
					//文件类型
					var fileType = tmpFile.type;
					//文件长度
					var fileSize = tmpFile.size;
					
					if(this.status == "data"){
						if(i==0){
							this.saveDatabase = fileName;
						}else{
							this.saveDatabase += ","+fileName;
						}
						console.log(this.saveDatabase)
					}
					//判断为图片类型
					if(fileType=="image/jpeg"){
						GM.Upload.showImg(tmpFile,"",fileName);
					}else if(fileType=="image/png"){
						GM.Upload.showImg(tmpFile,"",fileName);
					}
					//判断为Excel类型
					else if(fileType=="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"){
						GM.Upload.showImg(tmpFile,"../img/gmp_XLSX.png",fileName);
					}
					//判断为DOC类型
					else if(fileType=="application/vnd.openxmlformats-officedocument.wordprocessingml.document"){
						GM.Upload.showImg(tmpFile,"../img/gmp_doc.png",fileName);
					}
					//判断为PDF类型
					else if(fileType=="application/pdf"){
						GM.Upload.showImg(tmpFile,"../img/gmp_PDF.png",fileName);
					}
					//判断为DB类型
					else if(fileType==""){
						GM.Upload.showImg(tmpFile,"../img/gmp_db.png",fileName);
					}
					//其它类型
					else{
						GM.Upload.showImg(tmpFile,"../img/gmp_file.png",fileName);
					}
				}
			}
		}
	}
	/**
	 * 显示图片
	 */
	,showImg:function(tmpFile,imgSrc,fileName){
		//定义文件读取对象
		var reader = new FileReader();
		//读取对象信息
		reader.readAsDataURL(tmpFile);
		//加载图片文件
		reader.onload = function(event) {
			//获取文件预览克隆对象
			var tmpPrveiewObj = $("#gmPriverFileTable").find("div:first-child").clone();
			//调整地址
			if(imgSrc==""){
				tmpPrveiewObj.find("img:first-child") .attr("src",event.target.result);
			}else{
				tmpPrveiewObj.find("img:first-child") .attr("src",imgSrc);
			}
			tmpPrveiewObj.find("p") .text(fileName);
			
			//注册删除事件
			
			//追加对象
			$("#gmPriverFileTable").append(tmpPrveiewObj);
			//图片删除功能
			//GM.Upload.imgHover();
			//显示图片
			tmpPrveiewObj.show();
		}
	}
	/**
	 * 清空所有文件
	 */
	,emptyFiles:function(){
		var tmpObj=GM.Upload.selectedObj;
		$(".gmImgOnClick:visible p").each(function(){
			if(GM.Upload.fileNames.length>0){
				GM.Upload.fileNames+=",";
			}
			GM.Upload.fileNames+=$(this).text();
		})
		tmpObj.attr("fileNames",GM.Upload.fileNames);
		 GM.Upload.fileNames="";
		//清空预览信息
		$("#gmPriverFileTable div").not(":first").remove();
		//清空文件
		this.files = null;
	}
	/**
	 * 添加文件/单个或批量
	 */
	,putFiles:function(files){
		//判断文件是否为空
		if(this.files==null){
			this.files = new FormData();
		}
		//判断是否是批量文件
		if(files!=null && files.length>1){
			for(var i=0;i<files.length;i++){
				this.files.append("files",files[i]);
				if(files[i].name.indexOf(".")>-1)
					this.files.append("fileTypes",files[i].name.substring(files[i].name.lastIndexOf(".")+1));
				else
					this.files.append("fileTypes","");
			}
		}
		//判断是否是单个文件
		else{
			this.files.append("files",files[0]);
			if(files[0].name.indexOf(".")>-1){
				this.files.append("fileTypes",files[0].name.substring(files[0].name.lastIndexOf(".")+1));
			}else{
				this.files.append("fileTypes","");
			}
		}
	}
	/**
	 * 保存文件
	 */
	,saveFiles:function(){
		var tmpFileName=null;
		var tmpFileUrl=null;
		var tmpJsonObj=null;
		var tmpFileId=null;
		//判断文件是否为空
		if(this.files!=null){
			//单个文件 begin
			//获取文件的个数
			if(Number(GM.Upload.fileLength)==1){
				if(this.files.getAll("files").length==1){
					//设置为单个文件
					this.files.append("file",this.files.get("files"));
					if(this.files.get("files").name.indexOf(".")>-1){
						this.files.append("fileType",this.files.get("files").name.substring(this.files.get("files").name.lastIndexOf(".")+1));
					}else{
						this.files.append("fileType","");
					}
					//删除多文件名称
					this.files.delete("files");
					//删除多文件名称
					this.files.delete("fileTypes");
				}
			}
			//单个文件 end

			//判断设置类型
//			if (GM.Upload.fileType != null) {
//				for (var j = 0; j < GM.Upload.upLoadFilesList.length; j++) {
//					var curFile = GM.Upload.upLoadFilesList[j];
//					var curFileType = curFile.type;
//					//处理属性
//					var tmpFileType=null;
//					if(GM.Upload.fileType=="png"){
//						tmpFileType=GM.Upload.fileType;
//						GM.Upload.fileType="image/png";
//					}else if(GM.Upload.fileType=="jpeg"){
//						tmpFileType=GM.Upload.fileType;
//						GM.Upload.fileType="image/jpeg";
//					}else if(GM.Upload.fileType=="xlsx"){
//						tmpFileType=GM.Upload.fileType;
//						GM.Upload.fileType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
//					}else if(GM.Upload.fileType=="doc"){
//						tmpFileType=GM.Upload.fileType;
//						GM.Upload.fileType="application/vnd.openxmlformats-officedocument.wordprocessingml.document";
//					}else if(GM.Upload.fileType=="pdf"){
//						tmpFileType=GM.Upload.fileType;
//						GM.Upload.fileType="application/pdf";
//					}
//					if (GM.Upload.fileType != curFileType) {
//						alert("请上传"+tmpFileType+"文件")
//						return;
//					}
//				}
//			}
			//判断大小
			if (GM.Upload.maxFileSize != null) {
				for (var j = 0; j < GM.Upload.upLoadFilesList.length; j++) {
					var curFile = GM.Upload.upLoadFilesList[j];
					var curFileSize = Math.round((curFile.size) / 1024);
					if (Number(GM.Upload.maxFileSize) <= curFileSize) {
						alert("请上传小于"+GM.Upload.maxFileSize+"kb的文件");
						return;
					}
				}
			}
			
			//设置个数
			if(Number(GM.Upload.fileLength) < GM.Upload.tFileLength){
				alert("只能上传"+GM.Upload.fileLength+"个文件");
				return;
			}
					
			//判断保存路径是否为空，不为空则进行后台封装
			if(this.savePath!=null&&this.savePath.length>0){
				this.files.append("filepath",this.savePath);
			}
			//重新实例化XMLHttpRequest对象
			var xhr = new XMLHttpRequest();
			//xhr打开连接
			xhr.open("post", GM.rootPath+"/fileupload/Fileupload!FileUpLoad.action", true);
			//进度条管理
			//xhr.upload.addEventListener("progress",function(e) {});
			// ajax成功后
			xhr.onreadystatechange = function(e) {
				//判断返回状态
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						$("#UploadModal").modal("hide");
						$.messager.popup("上传成功");
						//清空文件
						GM.Upload.emptyFiles();
						tmpJsonObj=eval(xhr.responseText)
						$.each(tmpJsonObj,function(index,item){
							if(index !=0){//多个文件
								tmpFileName+=";"+item.filename;
								tmpFileUrl+=";"+item.filepath;
								tmpFileId+=";"+item.fileid;
							}else{//单个文件
								tmpFileName=item.filename;
								tmpFileUrl=item.filepath;
								tmpFileId=item.fileid;
							}
						})
						var tmpObj=GM.Upload.selectedObj;
						//文件上传成功后回调函数
						GM.Util.isAttrExist(tmpObj,"gmCallback")?eval(tmpObj.attr("gmCallback")):GM.Upload.SuccessFile(tmpFileName,tmpFileUrl, tmpFileId);
						//数据导入回调
						if(GM.Util.isAttrExist(tmpObj,"gmSuccessDataImport")){
							eval(tmpObj.attr("gmSuccessDataImport"));
						}
						$("#UploadModal").modal("hide");
					}
				}
			}
			if(this.status=="data"){
				this.files.append("saveDatabase",this.saveDatabase);
			}
			//发送数据
			xhr.send(this.files);
		}
	}
	/**
	 * 阻止浏览器默认事件(选择文件/拖拽使用)
	 */
	,stopEvent:function(event){
		//阻止浏览器的默认行为
		event.stopPropagation();
		event.preventDefault();
		event.target.className = (event.type == "dragover" ? "hover": "");
	}
	/**
	 * imgHover图片功能
	 */
	,imgHover:function(){
		//删除功能显示隐藏
		$(".gmimghover").hover(function(){
			$(this).find(".gmimghover_box").css("display","block");
		},function(){
			$(this).find(".gmimghover_box").css("display","none");
		})
	}
	/**
	 * 给input赋值
	 */
	,SuccessFile: function(fileName, filePath, tmpFileId){
		//通过customupload赋值给对应input框赋值
		GM.custompath=GM.Upload.selectedObj.attr("customupload");
		if (GM.Util.isVarExist(GM.custompath)) {
			//文件名称
			if (GM.Util.isObjectExist("#" + GM.custompath + "name")) {
				$("#" + GM.custompath + "name").val(fileName);
			}
			//文件路径
			if (GM.Util.isObjectExist("#" + GM.custompath + "path")) {
				$("#" + GM.custompath + "path").val(filePath);
			}
			//模态框id
			if (GM.Util.isObjectExist("#" + GM.custompath)) {
				$("#" + GM.custompath).modal("show");
			}
			//图片地址
			if (GM.Util.isObjectExist("." + GM.custompath + "img")) {
				$("." + GM.custompath + "img").attr("src", GM.rootPath + "/" + filePath);
			}
			//图片id
			if(GM.Util.isObjectExist("#" + GM.custompath + "id")){
				$("#" + GM.custompath + "id").val(tmpFileId);
			}
			//获取当前点击上传按钮的父节点
			var picparent = $("a[customupload='" + GM.custompath + "']").parent();
			if (picparent.hasClass("pattrPic")) {
				$(".pattrPanel").hide();
				$(".pattrPic").show();
				// $("#pattr").css({'left':mouseX+30,'top':mouseY});
				$("#pattr").show();
			}
		}
		$("#UploadModal").modal("hide");
	}
} || GM.Upload;
/**
 * 文件上传成功
 */
//GM.Upload.SuccessFile=function(fileName,filePath){
//		if(GM.Util.isVarExist(GM.custompath)){
//			//文件名称
//			if(GM.Util.isObjectExist("#gm"+GM.custompath)){
//				$("#"+GM.custompath).val(fileName);
//			}
//			//文件路径
//			if(GM.Util.isObjectExist("#"+GM.custompath+"path")){
//				$("#"+GM.custompath+"path").val(filePath);
//			}
//			//模态框id
//			if(GM.Util.isObjectExist("#"+GM.custompath)){
//				$("#"+GM.custompath).modal("show");
//			}
//			//图片地址
//			if(GM.Util.isObjectExist("."+GM.custompath+"img")){
//				$("."+GM.custompath+"img").attr("src",GM.rootPath+"/"+filePath);
//			}
//			//获取当前点击上传按钮的父节点
//			var picparent = $("a[customupload='"+GM.custompath+"']").parent();
//			if(picparent.hasClass("pattrPic")){
//				 $(".pattrPanel").hide();
//			     $(".pattrPic").show();
//				// $("#pattr").css({'left':mouseX+30,'top':mouseY});
//			     $("#pattr").show();
//			}
//		}else{
//			gmb_batch_importpath(filePath);
//		}
//		$("#UploadModal").modal("hide");
//}

//GM.GMupload = {
//		webstocketId:"",
//		showtitle:"",
//		fileaccept:""
//} || GM.GMupload;

///**
// *支持html5拖拽上传
// *
// **/

////标注二维码是否过期
//var qrcodeIsOverdue=false;
////获取文件对象
//var sucFileObj;
////定义文件上传属性
//var custompath;
//var gmmsg;
/**
 * 初始化文件上传参数
 */
//GM.GMupload.init=function(){
	//判断消息对象是否为空，并且非移动端文件上传
//	if(GM.Msg!=null && ($(".phoneupload")==undefined || $(".phoneupload").length==0)){
//		//初始化消息
//		GM.Msg.init();
//		//接收消息
//		gmmsg.onmessage = function(event) {
//			if(event.data!=null && event.data.indexOf("receiveID")>-1){
//				GM.GMupload.webstocketId=eval("("+event.data+")").receiveID;
//			}else{
//				var str=event.data;
//				if(str!=null && str.indexOf(",")>-1){
//					GM.GMupload.SuccessFile(event.data.split(",")[0],event.data.split(",")[1]);
//				}
//			}
//		};
//	}
//	//首先获取地址栏参数
//	var showtitle=GM.GMupload.GetQueryString("showtitle");
//	if(GM.GMupload.GetQueryString("webstocketId")!=null && GM.GMupload.GetQueryString("webstocketId")!="" && GM.GMupload.GetQueryString("webstocketId")!=undefined){
//		GM.GMupload.webstocketId=GM.GMupload.GetQueryString("webstocketId");
//	}
//	//绑定标题
//	$(".filetitle").html(((showtitle=="" || showtitle==undefined)?"文件":showtitle)+"上传");
//	$(".fileupspantext").html("拖拽"+((showtitle=="" || showtitle==undefined)?"文件":showtitle)+"到这里");
//	//判断对象是否存在
//	if($(".pagetitle")!=null && $(".pagetitle")!=undefined){
//		$(".pagetitle").html(((showtitle=="" || showtitle==undefined)?"文件":showtitle)+"上传");
//	}
//	//获取接受文件类型
//	var fileaccept=GM.GMupload.GetQueryString("fileaccept");
//	$("#gmFileselect").attr("accept",fileaccept);
//	//切换图片上传默认隐藏
//	$(".sweepupload").hide();
//	$(".noimagediv").show();

	
//	$(".uploadsweep").click(function() {
//		$(".modal-title").html("扫一扫上传"+GM.GMupload.showtitle);
//		$(".filedragupload").hide();
//		//二维码过期隐藏
//		$(".qrcodeOverdue").hide();
//		$(".sweepupload").show();
//		//初始化二维码
//		GM.GMupload.GenerateSweep();
//		//启动定时器，二维码每1分钟重新生成一次
//		var GenerateTime=setInterval("GM.GMupload.checkqrcode()",1000*60);
//	});

	//切换图片上传点击事件
//	$(".uploaddrag").click(function() {
//		$(".modal-title").html(GM.GMupload.showtitle+"上传");
//		$(".filedragupload").show();
//		$(".sweepupload").hide();
//	});

//	//清空按钮点击事件
//	$("#btnclearUpload").click(function(){
//		//清空数据
//		$("#gmPriverFileTable").empty();
//		//提示显示
//		$(".noimagediv").show();
//		GM.Map.clear();
//	});

//	/**
//	 * 点击关闭模式窗口按钮的事件
//	 */
//	$(".modalclose").click(function(){
//		if(GM.custompath!=null && GM.custompath!=undefined){
//			$("#"+GM.custompath).modal("show");
//		}
//	});

//};

///**
// * 获取地址栏参数
// */
//GM.GMupload.GetQueryString=function(name){
//     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
//     var r = window.location.search.substr(1).match(reg);
//     if(r!=null)return  unescape(r[2]); return null;
//};

///**
// * 设置显示名称和允许的文件类型
// */
//GM.GMupload.addTitle=function(title,fileaccept){
//	GM.GMupload.showtitle=title;
//	GM.GMupload.fileaccept=fileaccept;
//	if($(".filetitle")!=null && $(".filetitle")!=undefined){
//		$(".filetitle").html(((title=="" || title==undefined)?"文件":title)+"上传");
//	}
//	if($(".fileupspantext")!=null && $(".fileupspantext")!=undefined){
//		$(".fileupspantext").html("拖拽"+((title=="" || title==undefined)?"文件":title)+"到这里");
//	}
//	if($("#gmFileselect")!=null && $("#gmFileselect")!=undefined){
//		$("#gmFileselect").attr("accept",fileaccept);
//	}
//};

