package com.greatmap.gmbuilder.finance.entity;
//引用基础包
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//引用注解包
import com.greatmap.gmbuilder.annotations.Comment;
import com.greatmap.gmbuilder.annotations.ForeignKey;

/**
 * 
 * 类名称:GM_FINANCE 
 * 类描述:TODO(财务Entity)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:敏捷开发平台
 * 创建时间:2018-06-06 19:37:38 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
@Entity
@Table(name = "GM_FINANCE")
public class Gmfinance implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmfinance() {
		
	}
	
	/**
	 * 编号
	 */
	@Comment("编号")
	@Id
	@Column(name = "id", nullable = false, length = 32)
	private String id;
	
	/**
	 * 金额
	 */
	@Comment("金额")
	@Column(name = "money", length = 22)
	private Double money;
	
	/**
	 * 支付类型
	 */
	@Comment("支付类型")
	@Column(name = "paytype", length = 32)
	private String paytype;
	
	/**
	 * 支付类型
	 */
	@Comment("消费类型")
	@Column(name = "consumetype", length = 16)
	private String consumetype;
	
	/**
	 * 类型:支出、收入
	 */
	@Comment("类型")
	@Column(name = "financetype", length = 32)
	private String financetype;
	
	/**
	 * 用户编号
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@ForeignKey(name="gm_finance_ibfk_1")
	@Column(name = "userid", length = 32)
	private Gmbbaseuser userid;
	
	/**
	 * 备注
	 */
	@Comment("备注")
	@Column(name = "remark", length = 512)
	private String remark;
	
	/**
	 * 创建日期
	 */
	@Comment("创建日期")
	@Column(name = "creattime", length = 19)
	private java.util.Date creattime;
	
	/**
	 * 支付日期
	 */
	@Comment("支付日期")
	@Column(name = "paytime", length = 19)
	private java.util.Date paytime;
	
	/**
	 * 更新日期
	 */
	@Comment("更新日期")
	@Column(name = "updatetime", length = 19)
	private java.util.Date updatetime;
	
	/**
	 * 持卡人
	 */
	@Comment("持卡人")
	@Column(name = "cardholder", length = 32)
	private String cardholder;
	
	
	/**
	 * 卡片类型
	 */
	@Comment("卡片类型")
	@Column(name = "card_type", length = 32)
	private String cardtype;
	
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
	public void setMoney(Double money) {
		this.money = money;
	}
	
	public Double getMoney() {
		return this.money;
	}
	
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	
	public String getPaytype() {
		return this.paytype;
	}
		
	public void setUserid(Gmbbaseuser userid) {
		this.userid = userid;
	}
	
	public Gmbbaseuser getUserid() {
		return this.userid;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getRemark() {
		return this.remark;
	}
	
	public void setCreattime(java.util.Date creattime) {
		this.creattime = creattime;
	}
	
	public java.util.Date getCreattime() {
		return this.creattime;
	}
	
	public void setUpdatetime(java.util.Date updatetime) {
		this.updatetime = updatetime;
	}
	
	public java.util.Date getUpdatetime() {
		return this.updatetime;
	}

	public java.util.Date getPaytime() {
		return paytime;
	}

	public void setPaytime(java.util.Date paytime) {
		this.paytime = paytime;
	}

	public String getConsumetype() {
		return consumetype;
	}

	public void setConsumetype(String consumetype) {
		this.consumetype = consumetype;
	}

	public String getFinancetype() {
		return financetype;
	}

	public void setFinancetype(String financetype) {
		this.financetype = financetype;
	}

	public String getCardholder() {
		return cardholder;
	}

	public void setCardholder(String cardholder) {
		this.cardholder = cardholder;
	}

	public String getCardtype() {
		return cardtype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	
	
	
}