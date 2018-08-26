package com.greatmap.gmbuilder.finance.action;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Hashtable;
//引用基础包
import java.util.List;

//引用Spring包
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.greatmap.gmbuilder.database.GSSHException;
import com.greatmap.gmbuilder.database.entity.DynamicEntity;
import com.greatmap.gmbuilder.database.entity.Fields;
import com.greatmap.gmbuilder.database.entity.SearchFilter;
import com.greatmap.gmbuilder.finance.entity.Gmbbasedatadic;
import com.greatmap.gmbuilder.finance.service.IGmbbasedatadicService;
//引用GMBuilder包
import com.greatmap.gmbuilder.framework.action.BaseAction;
import com.greatmap.gmbuilder.framework.annotations.GMInject;
import com.greatmap.gmbuilder.util.Page;
import com.greatmap.gmbuilder.util.StringUtil;
import com.greatmap.gmbuilder.util.office.ExcelUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * 类名称:GMB_BASE_DATADIC 
 * 类描述:TODO(数据字典Action)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:敏捷开发平台
 * 创建时间:2018-06-30 16:47:44 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
public class GmbbasedatadicAction extends BaseAction {
	
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 数据字典类
	 */
	protected Gmbbasedatadic gmbbasedatadic;
	
	/**
	 * 导出状态
	 */
	private Boolean exportState = false;
	
	/**
	 * 导入状态
	 */
	private Boolean importState = false;
	
	/**
	 * 字段（与实体Bean等同）
	 */
	private String fields = null;
	
	/**
	 * 文件名称
	 */
	private String fileName = null;
	
	/**
	 * 数据字典父类
	 */
	private Gmbbasedatadic parentObj;
	
	/**
	 * 数据字典添加回显指定父类节点
	 */
	private Gmbbasedatadic addGmbbasedatadic;
	
	/**
	 * 数据字典查询关键字
	 */
	private String keyName;
	
	/**
	 * 数据字典查询内容
	 */
	private String keyValue;
	
	/**
	 * 数据字典List
	 */
	private List<Gmbbasedatadic> gmbbasedatadicList;
	
	/**
	 * 条件过滤对象
	 */
	private SearchFilter searchFilter;
	
	/**
	 * 数据字典服务
	 */
	@GMInject
	public IGmbbasedatadicService gmbbasedatadicService;
	
	
	/**
	 * 
	 * @Title: body
	 * @Description: TODO(字典管理内容)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public String body(){
		return "body";
	}
	
	/**
	 * 
	 * @Title: tree
	 * @Description: TODO(字典Tree)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public String tree(){
		return "tree";
	}
	
	/**
	 *  TODO(根据id获取对象)
	 *  @return    返回类型   
	 * @throws
	 */
	public String getGmbbasedatadicObj(){
		try {
			Fields fields = new Fields("ID");
			fields.addField("name");
			//通过id获取对象
			gmbbasedatadic=gmbbasedatadicService.get(id,fields,1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//该对象以json对象的形式传到前台
		WriteJSONObject(JSONObject.fromObject(gmbbasedatadic));
		return "none";
	}
	
	/**
	 * 
	 * @Title: getParentTree
	 * @Description: TODO(获取所有父节点Tree)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	private String getParentTree() {
		//判断id是否为空，为空则赋值0，设置顶级结点
		if(id==null || "".equals(id)){
			id="0";
		}
		//创建过滤器
		SearchFilter searchFilter = new SearchFilter();
		//设置父节点条件
		searchFilter.addSearchAndFilter("parentid", id);
		//设置是否是父节点
		searchFilter.addSearchFilter("isParent", true);
		//设置查询字段
		Fields fields = new Fields("ID");
		fields.addField("name");
		fields.addField("PARENTID");
		fields.addField("ISPARENT");
		//获取查询结果
		try {
			gmbbasedatadicList = gmbbasedatadicService.getList(fields,searchFilter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回JSON
		return (gmbbasedatadicList!=null)?WriteJsonArray(JSONArray.fromObject(gmbbasedatadicList)):NONE;
	}
	
	/**
	 * 
	 * @Title: getDataDicOption
	 * @Description: TODO(获取Tree下级内容)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public String getDataDicOption(){
		try {
			gmbbasedatadic = gmbbasedatadicService.get(keyName, keyValue);
			if(gmbbasedatadic!=null)
			gmbbasedatadicList = gmbbasedatadicService.getList("parentid", gmbbasedatadic.getId());
			return WriteJsonArray(gmbbasedatadicList);
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 获取所有数据字典
	 * @return
	 */
	private String getAllList() {
	    //如果id不为空，表示非首次访问，则不进行查询，直接返回
		if(StringUtil.isNotEmpty(id)){
			return NONE;
		}
	    //设置查询字段
		Fields fields = new Fields("ID");
		fields.addField("name");
		fields.addField("PARENTID");
		fields.addField("ISPARENT");
		//定义数据字典对象List
		List<Gmbbasedatadic> gmbbasedatadic = null;
		try {
			//获取所有数据字典
			gmbbasedatadic = gmbbasedatadicService.getAll(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回数据字典列表
		return gmbbasedatadic!=null?WriteJsonArray(JSONArray.fromObject(gmbbasedatadic)):NONE;
	}
	
	/**
	 *数据字典列表
	 * @return page
	 */
	 private Page getList(){
		 if (page == null) {
			page = new Page();
		 }
		 
		 //检查page对象默认属性值
		 checkPage (page);
		 
		 //如果全文检索不为空则使用全文检索查询
		 if (fullSearch != null && fullSearch.trim().length() > 0) {
			try {
				page = gmbbasedatadicService.findFullByPage(page,super.searchColumns,fullSearch);
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }else{
			//如果关键字查询为空，则使用父节点进行查询
			if(StringUtil.isNotEmpty(id)){
				searchFilter =(searchFilter==null)?searchFilter=new SearchFilter():searchFilter;
				searchFilter.addSearchFilter("parentid", StringUtil.isEmpty(id)?"0":id);
			}
			if(searchFilter!=null){
				List<SearchFilter> searchFilters = searchFilter.getSearchFilters();
				if(searchFilters!=null&&searchFilters.size()>0){
					List<SearchFilter> objValueNullFilters = new ArrayList<SearchFilter>();
					for (SearchFilter sf : searchFilters) {
						if(sf==null || StringUtil.isEmpty(sf.getObjectValue())){
							objValueNullFilters.add(sf);
						}
					}
					for (SearchFilter sf : objValueNullFilters) {
						searchFilters.remove(sf);
					}
					searchFilter.setSearchFilters(searchFilters);
				}
			}
			try {
				page = gmbbasedatadicService.findByPager(page,searchFilter);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		 }
		 return page;
	 }
	 
	/**
	 * 数据字典列表
	 * @return
	 */
	public String gmbList() {
		if(StringUtil.isNotEmpty(handle)){
			if(handle.equalsIgnoreCase("forwardListPage")){
				return listPage();
			}else if(handle.equalsIgnoreCase("forwardListParentTree")){
				return getParentTree();
			}else if(handle.equalsIgnoreCase("forwardAllList")){
				return getAllList();
			}else if(handle.equalsIgnoreCase("forwardAjaxDicInfo")){
				return ajaxInfo();
			}else if(handle.equalsIgnoreCase("forwardAjaxList")){
				return ajaxList();
			}
			else{
				return NONE;
			}
		}else{
		   	//调用getList方法
			getList();
			return "list";
		}
	}
	
	/**
	 * 添加数据字典
	 * @return
	 */
	public String gmbAdd() {
		try{
			//判断当前操作内容为转发至添加页/转发至批量添加页
			if(StringUtil.isNotEmpty(handle) && (handle.equalsIgnoreCase("forwardAddPage") || handle.equalsIgnoreCase("forwardbatchAddPage"))){
				//设置为添加标记
				this.isAddAction = true;
				try {
					//获取所有根节点
					gmbbasedatadicList=gmbbasedatadicService.getList("isParent",true);
					//判断id是否非空
					if(StringUtil.isNotEmpty(id)){
						addGmbbasedatadic = gmbbasedatadicService.get(id);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} 
				//跳转到添加页面
				if(handle.equalsIgnoreCase("forwardAddPage")){
					if(StringUtil.isNotEmpty(redirectPage)){
						return "redirectPage";
					}
					return INPUT;
				//跳转到批量添加页面
				}else{
					return "batchinput";
				}
			}
			//判断是否是转发至添加目录页
			else if(StringUtil.isNotEmpty(handle) && handle.equalsIgnoreCase("forwardAddCatalog")){
				//设置为目录标记
				this.isCatalog = true;
				return INPUT;
			}
			//判断是否是异步添加功能
			else if(StringUtil.isNotEmpty(handle) && handle.equalsIgnoreCase("forwardAjaxAdd")){
				return ajaxSave();
			}
			//跳转到添加页面
			else if (StringUtil.isNotEmpty(handle) && handle.equalsIgnoreCase("forwardAdd")){
				//判断跳转页面是否
				if(StringUtil.isNotEmpty(redirectPage)){
					return "redirectPage";
				}
				return "table";
			}
			//进行保存（单个/批量）
			else{
				getSave();
				if(StringUtil.isNotEmpty(redirectPage)){
					return "redirectPage";
				}
				if(StringUtil.isEmpty(redirectUrl))
				//跳转到指定页面
				this.redirectUrl = "Gmbbasedatadic!gmbList.action?id="+gmbbasedatadic.getParentid();
				return SUCCESS;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 删除数据字典
	 * @return
	 */
	public String gmbDelete() {
		//设置一个标志位
		boolean flag = false;
		try {
			gmbbasedatadicService.delete(ids);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return WriteJSONObject(flag);
	}
	
	/**
	 *数据字典列表
	 */
	private String listPage(){
		getList();
		//判断跳转页面是否
		if(StringUtil.isNotEmpty(redirectPage)){
			return "redirectPage";
		}
		return "table";
	}
	
	/**
	 * 使用ajax查询数据字典列表
	 * @return
	 */
	private String ajaxList(){
		if(!exportState){
		  //调用getList方法
		  getList();
		  WriteJsonArray(page.getResult());
		}else if(fields!=null){
			//判断分页对象是否为空
			if(page==null){
				page = new Page();
			}
			//设置每页显示
			page.setPageSize(8000);
			//获取查询数据
			gmbbasedatadicList = getList().getResult();
			//导出Excel
			fileName = ExcelUtil.exportExcel(fields, gmbbasedatadicList, getRequest().getRealPath("/excelTemp"));
			return "exportExcel";
		}
	    return "none";
	}
	
	/**
	 *  
	 * @Title: getDownloadFile
	 * @Description: TODO(获取下载文件)
	 * @param @return
	 * @param @throws Exception    设定文件
	 * @return InputStream    返回类型
	 * @throws
	 */
    public InputStream getDownloadFile() throws Exception {  
        return ServletActionContext.getServletContext().getResourceAsStream("/excelTemp/"+this.fileName) ;
    }
	
	
	/**
	 * 保存数据字典
	 * @return
	 */
	 private int getSave(){
	 	try {
			if(gmbbasedatadic!=null){
		    	gmbbasedatadic.setId(StringUtil.getUUID());
				gmbbasedatadicService.save(gmbbasedatadic);
			}else{
				for(Gmbbasedatadic gmbbasedatadic:gmbbasedatadicList){
					gmbbasedatadic.setId(StringUtil.getUUID());
				}
				gmbbasedatadicService.save(gmbbasedatadicList);
			}
			//执行成功返回1
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			//执行不成功返回0
			return 0;
		}
	}
	
	/**
	 * 使用ajax保存数据字典
	 * @return
	 */
	 public String ajaxSave(){
		if(!importState){
			//定义变量获取执行状态
		   	int saveStatus=getSave();
		   	//将执行状态以字符串形式输出，1：保存成功；0：保存失败
		   	writeString(String.valueOf(saveStatus));
	   	}else{
			Hashtable<String, Object> msg = new Hashtable<String, Object>();
			 //获取导入数据内容
			 List<ArrayList<ArrayList<Object>>> excelList = ExcelUtil.ImportExcel(getRealPath(fileName));
			 if(StringUtil.isEmpty(fields) || fields.split(",").length<1){
				msg.put("state", false);
				msg.put("msg", "字段为空，请检查！");
			 }
			 //判断内容是否为空
			 else if(excelList!=null && excelList.size()>0){
				 //动态excel对象列表
				 List excelDynamicList = new ArrayList();
				 //获取存储字段
				 String tmpFields[] = fields.split(",");
				 //遍历Excel单页
				 for (ArrayList<ArrayList<Object>> arrayList : excelList) {
					for (int i=1;i<arrayList.size();i++) {
						//动态excel对象
						DynamicEntity excelDynamic = new DynamicEntity();
						//获取行
						ArrayList<Object> row = arrayList.get(i);
						//遍历封装动态Bean
						for (int j=0;j<tmpFields.length;j++) {
							//判断内容是否为空
							if(StringUtil.isEmpty(row.get(j))){
								excelDynamic.addProperty(tmpFields[j], null);
							}else{
								excelDynamic.addProperty(tmpFields[j], row.get(j).toString());
							}
						}
						excelDynamicList.add(excelDynamic);
					}
				 }
				 try {
					gmbbasedatadicService.save(excelDynamicList);
					msg.put("state", true);
					msg.put("msg", "保存成功！");
				} catch (GSSHException e) {
					msg.put("state", false);
					msg.put("msg", "保存失败:"+e.getErrorMsg());
				}
			 }else{
			 	msg.put("state", false);
				msg.put("msg", "数据不存在/数据格式不正确！");
			 }
			 WriteJSONObject(msg);
		}
	   return "none";
	 }
	 
	/**
	 * 编辑数据字典
	 * @return
	 */
	public String gmbUpdate() {
		try {
			//判断当前操作内容为转发至编辑页
			if(StringUtil.isNotEmpty(handle) && (handle.equalsIgnoreCase("forwardUpdatePage") || handle.equalsIgnoreCase("forwardCatalogUpdatePage"))){
				if(handle.equalsIgnoreCase("forwardCatalogUpdatePage")){
					this.isCatalog = true;
				}
				try {
					gmbbasedatadic = gmbbasedatadicService.get(id);
					if(gmbbasedatadic!=null)
						parentObj = gmbbasedatadicService.get("id", gmbbasedatadic.getParentid());
					gmbbasedatadicList=gmbbasedatadicService.getList("isParent",true);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(StringUtil.isNotEmpty(redirectPage)){
					return "redirectPage";
				}
				return INPUT;
			}else{
				//定义变量获取更新状态
				int updateStatus=getUpdate();
				//更新成功
				if(updateStatus==1){
				  	//跳转连接
				  	this.redirectUrl = "Gmbbasedatadic!gmbList.action?id="+gmbbasedatadic.getParentid();
				}
				return SUCCESS;
			}
		} catch (Exception e){
			e.printStackTrace();
		} 
		return null;
	}
	
	/**
	 * 查看数据字典
	 * @return
	 */
	public String gmbInfo() {
		try {
			gmbbasedatadic = gmbbasedatadicService.get(id);
			gmbbasedatadicList=gmbbasedatadicService.getList("isParent",true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "info";
	}
	
	/**
	  * @Title: ajaxInfo  ajax获取数据字典信息
	  * @param @return    设定文件
	  * @return String    返回类型
	  * @throws
	  */
	private String ajaxInfo(){
		try {
			//通过id获取对象
			gmbbasedatadic = gmbbasedatadicService.get(id);
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		//返回相应页码
		return WriteJSONObject(gmbbasedatadic);
	}
	
	/**
	 * 更新数据字典
	 * @return
	 */
	private int getUpdate(){
		try {
			Gmbbasedatadic gmbbasedatadic = gmbbasedatadicService.get(id);
			BeanUtils.copyProperties(this.gmbbasedatadic, gmbbasedatadic, new String[] {"id"});
			gmbbasedatadicService.update(gmbbasedatadic);	
			return 1;	
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 使用ajax更新数据字典
	 * @return
	 */
	 public String ajaxUpdate(){
	    //定义变量获取更新结果
	    int updateStatus=getUpdate();
	    //将执行状态以字符串形式输出，1：更新成功；0：更新失败
		writeString(String.valueOf(updateStatus));
	    return "none";
	 }
	
	/**
	 * 唯一性校验方法
	 * @Title: UniqueValid 
	 * @return List 列表
	 * @throws
	 */
	public String uniqueValid() {
		//校验结果以json形式展现
		String writeJSON = null;
		try {
			searchFilter.addSearchFilter(searchFilter.getColumnName(), searchFilter.getStringValue().trim());
			writeJSON = writeJSON(gmbbasedatadicService.isExist(searchFilter));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return writeJSON;
	}
	
	public Gmbbasedatadic getGmbbasedatadic() {
		return gmbbasedatadic;
	}
	
	public void setGmbbasedatadic(Gmbbasedatadic gmbbasedatadic) {
		this.gmbbasedatadic = gmbbasedatadic;
	}
	
	public Gmbbasedatadic getParentObj() {
		return parentObj;
	}
	
	public void setParentObj(Gmbbasedatadic parentObj) {
		this.parentObj = parentObj;
	}
	
	public Gmbbasedatadic getAddGmbbasedatadic() {
		return addGmbbasedatadic;
	}
	
	public void setAddGmbbasedatadic(Gmbbasedatadic addGmbbasedatadic) {
		this.addGmbbasedatadic = addGmbbasedatadic;
	}
	
	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
	
	public List<Gmbbasedatadic> getGmbbasedatadicList(){
		return gmbbasedatadicList;
	}
	
	public void setGmbbasedatadicList(List<Gmbbasedatadic> gmbbasedatadicList){
		this.gmbbasedatadicList=gmbbasedatadicList;
	}
	
	public SearchFilter getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(SearchFilter searchFilter) {
		this.searchFilter = searchFilter;
	}
	
	public Boolean getExportState() {
		return exportState;
	}

	public void setExportState(Boolean exportState) {
		this.exportState = exportState;
	}
	
	public String getFields() {
		return fields;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public Boolean getImportState() {
		return importState;
	}

	public void setImportState(Boolean importState) {
		this.importState = importState;
	}
	
}
