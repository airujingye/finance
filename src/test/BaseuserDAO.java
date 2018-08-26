package test;

import java.util.List;

import com.greatmap.gmbuilder.database.DBUtil;
import com.greatmap.gmbuilder.database.GSSHException;
import com.greatmap.gmbuilder.database.dao.impl.BaseCore;
import com.greatmap.gmbuilder.database.entity.DatabaseInfo;
import com.greatmap.gmbuilder.finance.entity.Gmfinance;
import com.greatmap.gmbuilder.framework.dao.impl.BaseDynamicEntityDao;

/**
 * 
 * 项目名称：GMBuilderSecurityPlugin
 * 类名称：BaseuserDAO
 * 类描述：  TODO(用户信息实现类)
 * 开发单位: 北京天耀宏图科技有限公司
 * 创建人：HanMY
 * 创建时间：2014-9-30 下午2:06:39
 * 修改人： FanWY
 * 修改时间：2014-11
 * 修改备注：整理代码结构、增加注释
 * @version v1.0
 *
 */
public class BaseuserDAO extends BaseCore<Gmfinance, String>{
    private static DatabaseInfo dbConn;
    
    
    static{
    	dbConn = new DatabaseInfo();
    	dbConn.setAlias("mysql");
    	dbConn.setDburl("jdbc:mysql://localhost:3306");
    	dbConn.setUser("root");
    	dbConn.setPassword("root");
    	dbConn.setDefaultSchema("finance");
    	dbConn.setDriverName("com.mysql.jdbc.Driver");
    	
    	try {
			DBUtil.addDataSource(dbConn);
		} catch (GSSHException e) {
			e.printStackTrace();
		}
    }
    private static BaseDynamicEntityDao baseDynamicEntityDao = new BaseDynamicEntityDao();
    
    public static void main(String[] args) {
    	BaseuserDAO baseuserDAO = new BaseuserDAO();
    	try{
    		Gmfinance gmfinance = baseuserDAO.get("1006194747737374720");
    		
    		String sql = "select sum(money) as money ,consumetype from gm_finance group by consumetype";
    		List<Gmfinance> list = baseuserDAO.executeSQL("mysql", sql);
    		
    		List list2 = baseDynamicEntityDao.executeSQL("mysql", sql);
    		for (Object gmf : list2) {
    			System.out.println(gmf);
    		}
    		for (Gmfinance gmf : list) {
    			System.out.println(gmf.getConsumetype() + " : " + gmf.getMoney());
    		}
    	} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
