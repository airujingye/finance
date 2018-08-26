-- 数据模板(Oracle初始化数据模板)
-- 数据制作者:敏捷开发平台
-- 数据制作版本：V1.0.0

-- 初始化数据库表结构 --
INSERT INTO GMB_BASE_FILTER (id,name,url,isfilter) VALUES('GMB100000000000000','登录','/finance/Gmsecurity!login.action',0);
INSERT INTO GMB_BASE_FILTER (id,name,url,isfilter) VALUES('GMB100000000000001','退出','/finance/Gmsecurity!logout.action',0);
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000000','文件上传','gmb_menus_upload','GMB100000000000000',1,'0','/finance/Fileupload!gmbFileUpLoad.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid) VALUES('GMB100000000000001','安全管理','gmb_menus_security','GMB100000000000001',1,'0');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000022','菜单表管理','gmb_menus_gmbbasemenu','GMB100000000000001GMB100000000000022',1,'GMB100000000000001','/finance/Gmbbasemenu!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000023','添加','gmb_menus_gmbbasemenu_add','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000024','删除','gmb_menus_gmbbasemenu_delete','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000025','编辑','gmb_menus_gmbbasemenu_update','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000026','查询','gmb_menus_gmbbasemenu_list','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000113750016','详情','gmb_menus_gmbbasemenu_info','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000113750017','导入','gmb_menus_gmbbasemenu_import','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000113750018','导出','gmb_menus_gmbbasemenu_export','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000113750019','打印','gmb_menus_gmbbasemenu_print','GMB100000000000001GMB100000000000022GMB100000000000023',1,'GMB100000000000022','/finance/Gmbbasemenu!gmbPrint.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000032','基础角色管理','gmb_menus_gmbbaserole','GMB100000000000001GMB100000000000032',1,'GMB100000000000001','/finance/Gmbbaserole!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000033','添加','gmb_menus_gmbbaserole_add','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000034','删除','gmb_menus_gmbbaserole_delete','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000035','编辑','gmb_menus_gmbbaserole_update','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000036','查询','gmb_menus_gmbbaserole_list','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000122138624','详情','gmb_menus_gmbbaserole_info','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000122138625','导入','gmb_menus_gmbbaserole_import','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000122138626','导出','gmb_menus_gmbbaserole_export','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000122138627','打印','gmb_menus_gmbbaserole_print','GMB100000000000001GMB100000000000032GMB100000000000033',1,'GMB100000000000032','/finance/Gmbbaserole!gmbPrint.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000042','基础用户管理','gmb_menus_gmbbaseuser','GMB100000000000001GMB100000000000042',1,'GMB100000000000001','/finance/Gmbbaseuser!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000043','添加','gmb_menus_gmbbaseuser_add','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000044','删除','gmb_menus_gmbbaseuser_delete','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000045','编辑','gmb_menus_gmbbaseuser_update','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000046','查询','gmb_menus_gmbbaseuser_list','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000130527232','详情','gmb_menus_gmbbaseuser_info','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000130527233','导入','gmb_menus_gmbbaseuser_import','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000130527234','导出','gmb_menus_gmbbaseuser_export','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000130527235','打印','gmb_menus_gmbbaseuser_print','GMB100000000000001GMB100000000000042GMB100000000000043',1,'GMB100000000000042','/finance/Gmbbaseuser!gmbPrint.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid) VALUES('GMB100000000000071','系统设置','gmb_menus_setting','GMB100000000000071',1,'0');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000072','数据字典管理','gmb_menus_gmbbasedatadic','GMB100000000000071GMB100000000000072',1,'GMB100000000000071','/finance/Gmbbasedatadic!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000073','添加','gmb_menus_gmbbasedatadic_add','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000074','删除','gmb_menus_gmbbasedatadic_delete','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000075','编辑','gmb_menus_gmbbasedatadic_update','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000076','查询','gmb_menus_gmbbasedatadic_list','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000143110144','详情','gmb_menus_gmbbasedatadic_info','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000143110145','导入','gmb_menus_gmbbasedatadic_import','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000143110146','导出','gmb_menus_gmbbasedatadic_export','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000143110147','打印','gmb_menus_gmbbasedatadic_print','GMB100000000000071GMB100000000000072GMB100000000000073',1,'GMB100000000000072','/finance/Gmbbasedatadic!gmbPrint.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000082','权限过滤管理','gmb_menus_gmbbasefilter','GMB100000000000071GMB100000000000082',1,'GMB100000000000071','/finance/Gmbbasefilter!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000083','添加','gmb_menus_gmbbasefilter_add','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000084','删除','gmb_menus_gmbbasefilter_delete','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000085','编辑','gmb_menus_gmbbasefilter_update','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMB100000000000086','查询','gmb_menus_gmbbasefilter_list','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000151498752','详情','gmb_menus_gmbbasefilter_info','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000151498753','导入','gmb_menus_gmbbasefilter_import','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000151498754','导出','gmb_menus_gmbbasefilter_export','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000151498755','打印','gmb_menus_gmbbasefilter_print','GMB100000000000071GMB100000000000082GMB100000000000083',1,'GMB100000000000082','/finance/Gmbbasefilter!gmbPrint.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid) VALUES('GMBN100000000000141','无记忆','gmb_menus_nomemory','GMBN100000000000141',0,'0');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000192','信用卡管理','gmb_menus_gmcreditcard','GMBN100000000000141GMBN100000000000192',1,'GMBN100000000000141','/finance/Gmcreditcard!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000193','添加','gmb_menus_gmcreditcard_add','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000193441792','删除','gmb_menus_gmcreditcard_delete','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000195','编辑','gmb_menus_gmcreditcard_update','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000196','查询','gmb_menus_gmcreditcard_list','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000197','详情','gmb_menus_gmcreditcard_info','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000193441793','导入','gmb_menus_gmcreditcard_import','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000193441794','导出','gmb_menus_gmcreditcard_export','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000193441795','打印','gmb_menus_gmcreditcard_print','GMBN100000000000141GMBN100000000000192GMBN100000000000193',1,'GMBN100000000000192','/finance/Gmcreditcard!gmbPrint.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000202','财务管理','gmb_menus_gmfinance','GMBN100000000000141GMBN100000000000202',1,'GMBN100000000000141','/finance/Gmfinance!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000203','添加','gmb_menus_gmfinance_add','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbAdd.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000197636096','删除','gmb_menus_gmfinance_delete','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbDelete.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000205','编辑','gmb_menus_gmfinance_update','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbUpdate.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000206','查询','gmb_menus_gmfinance_list','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbList.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('GMBN100000000000207','详情','gmb_menus_gmfinance_info','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbInfo.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000201830400','导入','gmb_menus_gmfinance_import','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbImport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000201830401','导出','gmb_menus_gmfinance_export','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbExport.action');
INSERT INTO GMB_BASE_MENU (id,name,keyword,quickquery,isparent,parentid,url) VALUES('1012981000201830402','打印','gmb_menus_gmfinance_print','GMBN100000000000141GMBN100000000000202GMBN100000000000203',1,'GMBN100000000000202','/finance/Gmfinance!gmbPrint.action');