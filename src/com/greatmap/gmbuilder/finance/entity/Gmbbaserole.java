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
 * 类名称:GMB_BASE_ROLE 
 * 类描述:TODO(基础角色Entity)
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
@Table(name = "GMB_BASE_ROLE")
public class Gmbbaserole implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmbbaserole() {
		
	}
	
	/**
	 * 编号
	 */
	@Comment("编号")
	@Id
	@Column(name = "id", nullable = false, length = 32)
	private String id;
	
	/**
	 * 角色名称
	 */
	@Comment("角色名称")
	@Column(name = "name", length = 64)
	private String name;
	
	/**
	 * Gmbbasemenu
	 */
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="GMB_BASE_REL_ROLE_MENU",uniqueConstraints = {@UniqueConstraint(columnNames={"roleid","menuid"})},joinColumns = { @JoinColumn(name ="roleid",nullable = false)}, inverseJoinColumns = { @JoinColumn(name = "menuid",nullable = false) })
	@ForeignKey(name="fk_gmbbaserole_gmbbasemenu",inverseName="gmb_base_rel_role_menu_ibfk_1")
	@Index(name="fk_gmbbaserole_gmbbasemenu",columnNames={"gmb_base_rel_role_menu_ibfk_1"})
	private java.util.List<Gmbbasemenu> gmbbasemenus = new java.util.ArrayList<Gmbbasemenu>();
	
	/**
	 * Gmbbaseuser
	 */
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="GMB_BASE_REL_USER_ROLE",uniqueConstraints = {@UniqueConstraint(columnNames={"roleid","userid"})},joinColumns = { @JoinColumn(name ="roleid",nullable = false)}, inverseJoinColumns = { @JoinColumn(name = "userid",nullable = false) })
	@ForeignKey(name="fk_gmbbaserole_gmbbaseuser",inverseName="gmb_base_rel_user_role_ibfk_1")
	@Index(name="fk_gmbbaserole_gmbbaseuser",columnNames={"gmb_base_rel_user_role_ibfk_1"})
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
		
	public void setGmbbasemenus(java.util.List<Gmbbasemenu> gmbbasemenus) {
		this.gmbbasemenus =gmbbasemenus;
	}
	
	public java.util.List<Gmbbasemenu> getGmbbasemenus() {
		return this.gmbbasemenus;
	}
		
	public void setGmbbaseusers(java.util.List<Gmbbaseuser> gmbbaseusers) {
		this.gmbbaseusers =gmbbaseusers;
	}
	
	public java.util.List<Gmbbaseuser> getGmbbaseusers() {
		return this.gmbbaseusers;
	}
}