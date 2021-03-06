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
import com.greatmap.gmbuilder.finance.entity.Gmbbasefilter;
import com.greatmap.gmbuilder.finance.service.IGmbbasefilterService;
//引用GMBuilder包
import com.greatmap.gmbuilder.framework.action.BaseAction;
import com.greatmap.gmbuilder.framework.annotations.GMInject;
import com.greatmap.gmbuilder.util.Page;
import com.greatmap.gmbuilder.util.StringUtil;
import com.greatmap.gmbuilder.util.office.ExcelUtil;

import net.sf.json.JSONArray;

/**
 * 
 * 类名称:GMB_BASE_FILTER 
 * 类描述:TODO(权限过滤Action)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:敏捷开发平台
 * 创建时间:2018-06-06 19:37:39 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
public class GmbbasefilterAction extends BaseAction {
	
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 权限过滤类
	 */
	protected Gmbbasefilter gmbbasefilter;
	
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
	 * 权限过滤List
	 */
	private List<Gmbbasefilter> gmbbasefilterList;
	
	/**
	 * 条件过滤对象
	 */
	private SearchFilter searchFilter;
	
	/**
	 * 权限过滤服务
	 */
	@GMInject
	public IGmbbasefilterService gmbbasefilterService;
	
	
	
	/**
	 * 获取所有权限过滤
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
		//定义权限过滤对象List
		List<Gmbbasefilter> gmbbasefilter = null;
		try {
			//获取所有权限过滤
			gmbbasefilter = gmbbasefilterService.getAll(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回权限过滤列表
		return gmbbasefilter!=null?WriteJsonArray(JSONArray.fromObject(gmbbasefilter)):NONE;
	}
	
	/**
	 *权限过滤列表
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
				page = gmbbasefilterService.findFullByPage(page,super.searchColumns,fullSearch);
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }else{
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
				page = gmbbasefilterService.findByPager(page,searchFilter);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		 }
		 return page;
	 }
	 
	/**
	 * 权限过滤列表
	 * @return
	 */
	public String gmbList() {
		if(StringUtil.isNotEmpty(handle)){
			if(handle.equalsIgnoreCase("forwardListPage")){
				return listPage();
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
	 * 添加权限过滤
	 * @return
	 */
	public String gmbAdd() {
		try{
			//判断当前操作内容为转发至添加页/转发至批量添加页
			if(StringUtil.isNotEmpty(handle) && (handle.equalsIgnoreCase("forwardAddPage") || handle.equalsIgnoreCase("forwardbatchAddPage"))){
				//设置为添加标记
				this.isAddAction = true;
				//跳转到添加页面
				if(handle.equalsIgnoreCase("forwardAddPage")){
					return INPUT;
				//跳转到批量添加页面
				}else{
					return "batchinput";
				}
			}
			//判断是否是异步添加功能
			else if(StringUtil.isNotEmpty(handle) && handle.equalsIgnoreCase("forwardAjaxAdd")){
				return ajaxSave();
			}
			//进行保存（单个/批量）
			else{
				getSave();
				if(StringUtil.isEmpty(redirectUrl))
				//跳转到指定页面
				this.redirectUrl = "Gmbbasefilter!gmbList.action";
				return SUCCESS;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 删除权限过滤
	 * @return
	 */
	public String gmbDelete() {
		//设置一个标志位
		boolean flag = false;
		try {
			gmbbasefilterService.delete(ids);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return WriteJSONObject(flag);
	}
	
	/**
	 *权限过滤列表
	 */
	private String listPage(){
		getList();
		return "table";
	}
	
	/**
	 * 使用ajax查询权限过滤列表
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
			gmbbasefilterList = getList().getResult();
			//导出Excel
			fileName = ExcelUtil.exportExcel(fields, gmbbasefilterList, getRequest().getRealPath("/excelTemp"));
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
	 * 保存权限过滤
	 * @return
	 */
	 private int getSave(){
	 	try {
			if(gmbbasefilter!=null){
		    	gmbbasefilter.setId(StringUtil.getUUID());
				gmbbasefilterService.save(gmbbasefilter);
			}else{
				for(Gmbbasefilter gmbbasefilter:gmbbasefilterList){
					gmbbasefilter.setId(StringUtil.getUUID());
				}
				gmbbasefilterService.save(gmbbasefilterList);
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
	 * 使用ajax保存权限过滤
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
					gmbbasefilterService.save(excelDynamicList);
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
	 * 编辑权限过滤
	 * @return
	 */
	public String gmbUpdate() {
		try {
			//判断当前操作内容为转发至编辑页
			if(StringUtil.isNotEmpty(handle) && (handle.equalsIgnoreCase("forwardUpdatePage"))){
				try {
					gmbbasefilter = gmbbasefilterService.get(id);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return INPUT;
			}else{
				//定义变量获取更新状态
				int updateStatus=getUpdate();
				//更新成功
				if(updateStatus==1){
				  	//跳转连接
				  	this.redirectUrl = "Gmbbasefilter!gmbList.action";
				}
				return SUCCESS;
			}
		} catch (Exception e){
			e.printStackTrace();
		} 
		return null;
	}
	
	/**
	 * 查看权限过滤
	 * @return
	 */
	public String gmbInfo() {
		try {
			gmbbasefilter = gmbbasefilterService.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "info";
	}
	
	/**
	  * @Title: ajaxInfo  ajax获取权限过滤信息
	  * @param @return    设定文件
	  * @return String    返回类型
	  * @throws
	  */
	private String ajaxInfo(){
		try {
			//通过id获取对象
			gmbbasefilter = gmbbasefilterService.get(id);
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		//返回相应页码
		return WriteJSONObject(gmbbasefilter);
	}
	
	/**
	 * 更新权限过滤
	 * @return
	 */
	private int getUpdate(){
		try {
			Gmbbasefilter gmbbasefilter = gmbbasefilterService.get(id);
			BeanUtils.copyProperties(this.gmbbasefilter, gmbbasefilter, new String[] {"id"});
			gmbbasefilterService.update(gmbbasefilter);	
			return 1;	
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 使用ajax更新权限过滤
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
			writeJSON = writeJSON(gmbbasefilterService.isExist(searchFilter));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return writeJSON;
	}
	
	public Gmbbasefilter getGmbbasefilter() {
		return gmbbasefilter;
	}
	
	public void setGmbbasefilter(Gmbbasefilter gmbbasefilter) {
		this.gmbbasefilter = gmbbasefilter;
	}
	
	public List<Gmbbasefilter> getGmbbasefilterList(){
		return gmbbasefilterList;
	}
	
	public void setGmbbasefilterList(List<Gmbbasefilter> gmbbasefilterList){
		this.gmbbasefilterList=gmbbasefilterList;
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
