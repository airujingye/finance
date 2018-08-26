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
 * 类名称:GMB_BASE_FILTER 
 * 类描述:TODO(权限过滤Entity)
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
@Table(name = "GMB_BASE_FILTER")
public class Gmbbasefilter implements java.io.Serializable{
	
	/**
	 * 构造函数
	 */
	public Gmbbasefilter() {
		
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
	 * 地址
	 */
	@Comment("地址")
	@Column(name = "url", length = 512)
	private String url;
	
	/**
	 * 是否过滤
	 */
	@Comment("是否过滤")
	@Column(name = "isfilter", length = 1)
	private Boolean isFilter;
	
	
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
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getUrl() {
		return this.url;
	}
	
	public void setIsFilter(Boolean isFilter) {
		this.isFilter = isFilter;
	}
	
	public Boolean getIsFilter() {
		return this.isFilter;
	}
}