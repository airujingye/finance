package com.greatmap.gmbuilder.finance.entity;
//引用基础包
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//引用注解包
import com.greatmap.gmbuilder.annotations.Comment;

/**
 * 
 * 类名称:GMB_BASE_DATADIC 
 * 类描述:TODO(数据字典Entity)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:敏捷开发平台
 * 创建时间:2018-06-30 16:47:44 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "GMB_BASE_DATADIC")
public class Gmbbasedatadic implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmbbasedatadic() {
		
	}
	
	/**
	 * 编号
	 */
	@Comment("编号")
	@Id
	@Column(name = "id", nullable = false, length = 32)
	private String id;
	
	/**
	 * 名称
	 */
	@Comment("名称")
	@Column(name = "name", nullable = false, length = 45)
	private String name;
	
	/**
	 * 代码
	 */
	@Comment("代码")
	@Column(name = "code", nullable = false, length = 45)
	private String code;
	
	/**
	 * 父节点
	 */
	@Comment("父节点")
	@Column(name = "parentid", length = 32)
	private String parentid;
	
	/**
	 * 是否是父节点
	 */
	@Comment("是否是父节点")
	@Column(name = "isparent", length = 1)
	private Boolean isParent;
	
	/**
	 * 描述
	 */
	@Comment("描述")
	@Column(name = "description", length = 45)
	private String description;
	
	/**
	 * 内置数据
	 */
	@Comment("内置数据")
	@Column(name = "isInternal", length = 1)
	private Boolean isInternal;
	
	/**
	 * 关键字
	 */
	@Comment("关键字")
	@Column(name = "gm_keycode", length = 320)
	private String gmkeycode;
	
	/**
	 * 排序号
	 */
	@Comment("排序号")
	@Column(name = "gm_order", length = 10)
	private Integer gmorder;
	
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getCode() {
		return this.code;
	}
	
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	public String getParentid() {
		return this.parentid;
	}
	
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	
	public Boolean getIsParent() {
		return this.isParent;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public void setIsInternal(Boolean isInternal) {
		this.isInternal = isInternal;
	}
	
	public Boolean getIsInternal() {
		return this.isInternal;
	}
	
	public void setGmkeycode(String gmkeycode) {
		this.gmkeycode = gmkeycode;
	}
	
	public String getGmkeycode() {
		return this.gmkeycode;
	}
	
	public void setGmorder(Integer gmorder) {
		this.gmorder = gmorder;
	}
	
	public Integer getGmorder() {
		return this.gmorder;
	}
}