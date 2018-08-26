package com.greatmap.gmbuilder.finance.tag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.greatmap.gmbuilder.database.GSSHException;
import com.greatmap.gmbuilder.finance.entity.Gmbbasedatadic;
import com.greatmap.gmbuilder.finance.service.IGmbbasedatadicService;
import com.greatmap.gmbuilder.finance.service.impl.GmbbasedatadicService;
import com.greatmap.gmbuilder.util.StringUtil;

/**
 * 数据字典标签支持类
 * @author zhaoshenjiao
 *
 */
public class DictTag extends RootTag {

	private static final long serialVersionUID = 1L;

	/**
	 * 存储数据
	 */
	private static Map<String, String> data = new HashMap<String, String>();
	
	/**
	 * 数据字典服务
	 */
	private static IGmbbasedatadicService gmbbasedatadicService = new GmbbasedatadicService();

	/**
	 * 
	 */
	private String key;

	/**
	 * 值
	 */
	private String value;

	static {
		initData();
	}
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int doStartTag() {
		super.init();
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 获取value
	 * @param key
	 * @return
	 */
	public static String getName(String key){
		return data.get(key);
	}
	public int doEndTag() {
		if (data == null) {
			initData();
		}
		try {
			String name = data.get(value);
			//如果为空，则从数据库重新获取
			if (StringUtil.isEmpty(name)) {
				initUserData(value);
				name = data.get(value);
			} 
			out.append(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	/**
	 * 重新从数据库中获取数据
	 * 
	 * @param id 编号
	 */
	public static void initUserData(String id) {
		Gmbbasedatadic gmbbasedatadic;
		try {
			gmbbasedatadic = gmbbasedatadicService.get(id);
			if (gmbbasedatadic != null) {
				data.put(id, gmbbasedatadic.getName());
			}
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 初始化数据
	 */
	public static void initData() {
		try {
			List<Gmbbasedatadic> all = gmbbasedatadicService.getAll();
			for (Gmbbasedatadic gmbbasedatadic : all) {
				data.put(gmbbasedatadic.getId(), gmbbasedatadic.getName());
			}
		} catch (GSSHException e) {
			e.printStackTrace();
		}
	}
}
