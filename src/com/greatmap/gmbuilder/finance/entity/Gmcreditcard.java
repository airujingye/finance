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
 * 类名称:GM_CREDIT_CARD 
 * 类描述:TODO(信用卡Entity)
 * 开发单位:北京天耀宏图科技有限公司
 * 创建人:敏捷开发平台
 * 创建时间:2018-06-06 19:37:37 
 * 修改人:
 * 修改时间:
 * 修改备注:
 * @version v1.0
 *
 */
@Entity
@Table(name = "GM_CREDIT_CARD")
public class Gmcreditcard implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmcreditcard() {
		
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
	 * 银行
	 */
	@Comment("银行")
	@Column(name = "bank", length = 32)
	private String bank;
	
	/**
	 * 对账日
	 */
	@Comment("对账日")
	@Column(name = "accountday", length = 19)
	private java.util.Date accountday;
	
	/**
	 * 还款日
	 */
	@Comment("还款日")
	@Column(name = "repaymentday", length = 19)
	private java.util.Date repaymentday;
	
	/**
	 * 滞纳金
	 */
	@Comment("滞纳金")
	@Column(name = "latefee", length = 22)
	private Double latefee;
	
	/**
	 * 用户编号
	 */
	/**
	 * Gmbbaseuser
	 */	
	@ManyToOne(fetch=FetchType.EAGER)
	@ForeignKey(name="gm_credit_card_ibfk_1")
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
	 * 更新日期
	 */
	@Comment("更新日期")
	@Column(name = "updatetime", length = 19)
	private java.util.Date updatetime;
	
	/**
	 * 卡号
	 */
	@Comment("卡号")
	@Column(name = "cardno", length = 32)
	private String cardno;
	
	/**
	 * 有效期
	 */
	@Comment("有效期")
	@Column(name = "validitydate", length = 19)
	private java.util.Date validitydate;
	
	/**
	 * 余额
	 */
	@Comment("余额")
	@Column(name = "balance", length = 22)
	private Double balance;
	
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
	@Column(name = "card_type", length = 255)
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
	
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	public String getBank() {
		return this.bank;
	}
	
	public void setAccountday(java.util.Date accountday) {
		this.accountday = accountday;
	}
	
	public java.util.Date getAccountday() {
		return this.accountday;
	}
	
	public void setRepaymentday(java.util.Date repaymentday) {
		this.repaymentday = repaymentday;
	}
	
	public java.util.Date getRepaymentday() {
		return this.repaymentday;
	}
	
	public void setLatefee(Double latefee) {
		this.latefee = latefee;
	}
	
	public Double getLatefee() {
		return this.latefee;
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

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public java.util.Date getValiditydate() {
		return validitydate;
	}

	public void setValiditydate(java.util.Date validitydate) {
		this.validitydate = validitydate;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
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