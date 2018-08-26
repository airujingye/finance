/**
 * @Title: LandAction.java
 * @Package com.greatmap.gmbuilder.snaker.action
 * @Description: TODO(用一句话描述该文件做什么)
 * @author FanWY
 * @date 2017-6-27 下午2:10:10
 * @version V1.0  
 */
package com.greatmap.gmbuilder.finance.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.greatmap.gmbuilder.database.GSSHException;
import com.greatmap.gmbuilder.finance.tag.DictTag;
import com.greatmap.gmbuilder.framework.action.BaseAction;
import com.greatmap.gmbuilder.framework.dao.impl.BaseDynamicEntityDao;

/**
 * 项目名称：
 * 类名称：ChartAction
 * 类描述：  TODO(用一句话描述该文件做什么)
 * 开发单位: 北京天耀宏图科技有限公司
 * 创建人：Zhaosj
 * 创建时间：2017-7-22 下午21:10:10
 * 修改人：
 * 修改时间：
 * 修改备注：
 * @version v1.0
 * 
 */
public class ChartAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 动态Dao
	 */
	private BaseDynamicEntityDao baseDynamicEntityDao = new BaseDynamicEntityDao();
	
	/**
	 * 获取柱状图统计数据
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String gmbColumnsCharts(){
		//统计消费金额，消费类型
		String sql = "select sum(money) as money ,consumetype from gm_finance group by consumetype";
		//返回结果
		Map result = new HashMap();
		//环形图数据
		Map ringItem;
		List ringData = new ArrayList();
		//消费类型
		List categories = new ArrayList<>();
		//消费金额
		List data = new ArrayList<>();
		try {
			List list = baseDynamicEntityDao.executeSQL("mysql", sql);
			for (Object gmf : list) {
				Map map = (HashMap)gmf;
				//消费类型代码
				String consumetype = map.get("consumetype").toString();
				//从数据字典中获取消费类型代码对应的中文名称
				String name = DictTag.getName(consumetype);
				categories.add(name);
				data.add(map.get("money"));
				//初始化
				ringItem = new HashMap();
				//名称
				ringItem.put("name", name);
				//值
				ringItem.put("value", map.get("money"));
				ringData.add(ringItem);
			}
			result.put("categories", categories);
			result.put("data", data);
			result.put("ringData", ringData);
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		//以json形式返回数据
		return WriteJSONObject(result);
	}
   
}
