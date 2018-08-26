package com.greatmap.gmbuilder.finance.entity;
//引用基础包
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

//引用注解包
import com.greatmap.gmbuilder.annotations.Comment;
import com.greatmap.gmbuilder.annotations.ForeignKey;
import com.greatmap.gmbuilder.annotations.Index;

/**
 * 
 * 类名称:GMB_BASE_USER 
 * 类描述:TODO(基础用户Entity)
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
@Table(name = "GMB_BASE_USER")
public class Gmbbaseuser implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmbbaseuser() {
		
	}
	
	/**
	 * 编号
	 */
	@Comment("编号")
	@Id
	@Column(name = "id", nullable = false, length = 32)
	private String id;
	
	/**
	 * 用户名
	 */
	@Comment("用户名")
	@Column(name = "username", length = 64)
	private String username;
	
	/**
	 * 密码
	 */
	@Comment("密码")
	@Column(name = "password", length = 128)
	private String password;
	
	/**
	 * 用户类型
	 */
	@Comment("用户类型")
	@Column(name = "gmusertype", length = 32)
	private String gmusertype;
	
	/**
	 * 姓名
	 */
	@Comment("姓名")
	@Column(name = "zhname", length = 32)
	private String zhname;
	
	/**
	 * Gmcreditcard
	 */
	@OneToMany(mappedBy="gmbbaseuser",fetch=FetchType.LAZY)
	@ForeignKey(name="gm_credit_card_ibfk_1")
	@Column(name = "userid")
	private java.util.List<Gmcreditcard> gmcreditcardibfk1 = new java.util.ArrayList<Gmcreditcard>();
	
	/**
	 * Gmfinance
	 */
	@OneToMany(mappedBy="gmbbaseuser",fetch=FetchType.LAZY)
	@ForeignKey(name="gm_finance_ibfk_1")
	@Column(name = "userid")
	private java.util.List<Gmfinance> gmfinanceibfk1 = new java.util.ArrayList<Gmfinance>();
	
	/**
	 * Gmbbasemenu
	 */
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="GMB_BASE_REL_USER_MENU",uniqueConstraints = {@UniqueConstraint(columnNames={"userid","menuid"})},joinColumns = { @JoinColumn(name ="userid",nullable = false)}, inverseJoinColumns = { @JoinColumn(name = "menuid",nullable = false) })
	@ForeignKey(name="fk_gmbbaseuser_gmbbasemenu",inverseName="gmb_base_rel_user_menu_ibfk_2")
	@Index(name="fk_gmbbaseuser_gmbbasemenu",columnNames={"gmb_base_rel_user_menu_ibfk_2"})
	private java.util.List<Gmbbasemenu> gmbbasemenus = new java.util.ArrayList<Gmbbasemenu>();
	
	/**
	 * Gmbbaserole
	 */
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="GMB_BASE_REL_USER_ROLE",uniqueConstraints = {@UniqueConstraint(columnNames={"userid","roleid"})},joinColumns = { @JoinColumn(name ="userid",nullable = false)}, inverseJoinColumns = { @JoinColumn(name = "roleid",nullable = false) })
	@ForeignKey(name="fk_gmbbaseuser_gmbbaserole",inverseName="gmb_base_rel_user_role_ibfk_2")
	@Index(name="fk_gmbbaseuser_gmbbaserole",columnNames={"gmb_base_rel_user_role_ibfk_2"})
	private java.util.List<Gmbbaserole> gmbbaseroles = new java.util.ArrayList<Gmbbaserole>();
	
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setGmusertype(String gmusertype) {
		this.gmusertype = gmusertype;
	}
	
	public String getGmusertype() {
		return this.gmusertype;
	}
	
	public void setGmcreditcardibfk1(java.util.List<Gmcreditcard> gmcreditcardibfk1) {
		this.gmcreditcardibfk1 = gmcreditcardibfk1;
	}
	
	public java.util.List<Gmcreditcard> getGmcreditcardibfk1() {
		return this.gmcreditcardibfk1;
	}
	
	public void setGmfinanceibfk1(java.util.List<Gmfinance> gmfinanceibfk1) {
		this.gmfinanceibfk1 = gmfinanceibfk1;
	}
	
	public java.util.List<Gmfinance> getGmfinanceibfk1() {
		return this.gmfinanceibfk1;
	}
		
	public void setGmbbasemenus(java.util.List<Gmbbasemenu> gmbbasemenus) {
		this.gmbbasemenus =gmbbasemenus;
	}
	
	public java.util.List<Gmbbasemenu> getGmbbasemenus() {
		return this.gmbbasemenus;
	}
		
	public void setGmbbaseroles(java.util.List<Gmbbaserole> gmbbaseroles) {
		this.gmbbaseroles =gmbbaseroles;
	}
	
	public java.util.List<Gmbbaserole> getGmbbaseroles() {
		return this.gmbbaseroles;
	}

	public String getZhname() {
		return zhname;
	}

	public void setZhname(String zhname) {
		this.zhname = zhname;
	}
	
	
}