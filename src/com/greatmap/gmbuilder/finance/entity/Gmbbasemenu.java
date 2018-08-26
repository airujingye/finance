package com.greatmap.gmbuilder.finance.entity;
//引用基础包
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

//引用注解包
import com.greatmap.gmbuilder.annotations.Comment;
import com.greatmap.gmbuilder.annotations.ForeignKey;
import com.greatmap.gmbuilder.annotations.Index;

/**
 * 
 * 类名称:GMB_BASE_MENU 
 * 类描述:TODO(菜单表Entity)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:敏捷开发平台
 * 创建时间:2018-06-06 19:37:39 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
@Entity
@Table(name = "GMB_BASE_MENU")
public class Gmbbasemenu implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmbbasemenu() {
		
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
	@Column(name = "name", length = 64)
	private String name;
	
	/**
	 * 关键字
	 */
	@Comment("关键字")
	@Column(name = "keyword", length = 128)
	private String keyword;
	
	/**
	 * 查询码
	 */
	@Comment("查询码")
	@Column(name = "quickquery", length = 512)
	private String quickquery;
	
	/**
	 * 是否父节点
	 */
	@Comment("是否父节点")
	@Column(name = "isparent", length = 1)
	private Boolean isParent;
	
	/**
	 * 父节点
	 */
	@Comment("父节点")
	@Column(name = "parentid", length = 32)
	private String parentid;
	
	/**
	 * 菜单地址
	 */
	@Comment("菜单地址")
	@Column(name = "url", length = 512)
	private String url;
	
	/**
	 * Gmbbaserole
	 */
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="GMB_BASE_REL_ROLE_MENU",uniqueConstraints = {@UniqueConstraint(columnNames={"menuid","roleid"})},joinColumns = { @JoinColumn(name ="menuid",nullable = false)}, inverseJoinColumns = { @JoinColumn(name = "roleid",nullable = false) })
	@ForeignKey(name="fk_gmbbasemenu_gmbbaserole",inverseName="gmb_base_rel_role_menu_ibfk_2")
	@Index(name="fk_gmbbasemenu_gmbbaserole",columnNames={"gmb_base_rel_role_menu_ibfk_2"})
	private java.util.List<Gmbbaserole> gmbbaseroles = new java.util.ArrayList<Gmbbaserole>();
	
	/**
	 * Gmbbaseuser
	 */
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="GMB_BASE_REL_USER_MENU",uniqueConstraints = {@UniqueConstraint(columnNames={"menuid","userid"})},joinColumns = { @JoinColumn(name ="menuid",nullable = false)}, inverseJoinColumns = { @JoinColumn(name = "userid",nullable = false) })
	@ForeignKey(name="fk_gmbbasemenu_gmbbaseuser",inverseName="gmb_base_rel_user_menu_ibfk_1")
	@Index(name="fk_gmbbasemenu_gmbbaseuser",columnNames={"gmb_base_rel_user_menu_ibfk_1"})
	private java.util.List<Gmbbaseuser> gmbbaseusers = new java.util.ArrayList<Gmbbaseuser>();
	
	
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
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getKeyword() {
		return this.keyword;
	}
	
	public void setQuickquery(String quickquery) {
		this.quickquery = quickquery;
	}
	
	public String getQuickquery() {
		return this.quickquery;
	}
	
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	
	public Boolean getIsParent() {
		return this.isParent;
	}
	
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	public String getParentid() {
		return this.parentid;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getUrl() {
		return this.url;
	}
		
	public void setGmbbaseroles(java.util.List<Gmbbaserole> gmbbaseroles) {
		this.gmbbaseroles =gmbbaseroles;
	}
	
	public java.util.List<Gmbbaserole> getGmbbaseroles() {
		return this.gmbbaseroles;
	}
		
	public void setGmbbaseusers(java.util.List<Gmbbaseuser> gmbbaseusers) {
		this.gmbbaseusers =gmbbaseusers;
	}
	
	public java.util.List<Gmbbaseuser> getGmbbaseusers() {
		return this.gmbbaseusers;
	}
}