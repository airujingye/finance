package com.greatmap.gmbuilder.finance.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.springframework.beans.BeanUtils;

import com.greatmap.gmbuilder.database.GSSHException;
import com.greatmap.gmbuilder.database.entity.SearchFilter;
import com.greatmap.gmbuilder.finance.entity.Gmbbasemenu;
import com.greatmap.gmbuilder.finance.entity.Gmbbaserole;
import com.greatmap.gmbuilder.finance.entity.Gmbbaseuser;
import com.greatmap.gmbuilder.finance.service.IGmbbasemenuService;
import com.greatmap.gmbuilder.finance.service.IGmbbaseroleService;
import com.greatmap.gmbuilder.finance.service.IGmbbaseuserService;
import com.greatmap.gmbuilder.framework.annotations.GMInject;
import com.greatmap.gmbuilder.util.FileUtil;
import com.greatmap.gmbuilder.util.StringUtil;

/**
 * 
 * 项目名称：Finance
 * 类名称：GmsecurityAction
 * 类描述：  TODO(权限管理对象)
 * 开发单位: 北京天耀宏图科技有限公司
 * 创建人：FanWY
 * 创建时间：2017-2-22 下午1:43:09
 * 修改人：
 * 修改时间：
 * 修改备注：
 * @version v1.0
 *
 */
public class GmsecurityAction extends GmbbaseuserAction {
	
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 菜单服务
	 */
	@GMInject
	public IGmbbasemenuService gmbbasemenuService;
	
	/**
	 * 用户服务
	 */
	@GMInject
	public IGmbbaseuserService gmbbaseuserService;
	
	/**
	 * 角色服务
	 */
	@GMInject
	public IGmbbaseroleService gmbbaseroleService;
	
	
	/**
	 * 查询用户信息集合
	 * @return
	 */
	public String getUserList(){
		//数据返回对象
		List<Map<String, String>> resultMap = new ArrayList<Map<String,String>>();
		List<Gmbbaseuser> result = new ArrayList<Gmbbaseuser>();
		try {
			//查询所有用户信息
			result = gmbbaseuserService.getAll();
			//遍历用户
			for (Gmbbaseuser gmbbaseuser : result) {
				Map<String, String> map = new HashMap<String, String>();
				//获取用户id
				map.put("id", gmbbaseuser.getId());
				//获取用户USERNAME
				map.put("username", gmbbaseuser.getUsername());
				//封装用户
				resultMap.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return WriteJsonArray(resultMap);
	}
	
	
	/**
	 * 使用ajax获取角色树
	 * @return
	 */
	public String getRoleList(){
		//返回数据对象
		List<Map<String, String>> resultMap = new ArrayList<Map<String,String>>();
		List<Gmbbaserole> result = new ArrayList<Gmbbaserole>();
		try {
			result = gmbbaseroleService.getAll();
			//遍历角色
			for (Gmbbaserole gmbbaserole : result) {
				Map<String, String> map = new HashMap<String, String>();
				//获取角色id
				map.put("id", gmbbaserole.getId());//角色id
				//获取角色名
				map.put("name", gmbbaserole.getName());//角色名称
				//封装角色
				resultMap.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  WriteJsonArray(resultMap);
	}
	
	
	
	/**
	 * 
	 * @Title: login
	 * @Description: TODO(登录)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public String login(){
		//返回消息对象
		HashMap<String, String> msg = new HashMap<String, String>();
		try{
			//判断账号密码不能为空
			if(StringUtil.isNotEmpty(gmbbaseuser.getUsername())
					&& StringUtil.isNotEmpty(gmbbaseuser.getPassword())){
				//删除授权文件内容
				this.getSession().removeAttribute("MFwwDQYJsslaVCg4ddieuz55Lcc5d5uEKr6UfSpzdVFR0CAwEAAQ");
				//判断高级管理员
				if(gmbbaseuser.getUsername().equalsIgnoreCase("greatmap_admin_sqm")  && FileUtil.readFile(getRealPath("/WEB-INF/gm_default_authorization.txt")).equals("t4yc1nafkap2b75h6eo7pn8zvvu4cwtmwgx4jm8abp9f9fcl9e961it3hef1dl4701mn2u4kd5z90d8xz9vn4kwi04wp6luo6m1idj38dz5kzl6bmt8lgxlj3yrjays4x7mlgl3bgb1nsv5a8ddhypsufoystiirzyljz9jr6zsz3v9b5favroajv5607rempwp9mhkneeygqyfde7br6vr3gan3h0vgmbsztytzxys2nqvwbycwnoq5ea5khwap")){
					getSession().setAttribute("gmloginuser", gmbbaseuser);
					Cookie[] cookies = this.getRequest().getCookies();
					for (Cookie cookie : cookies) {
						//cookie = new Cookie("greatmapbuilderkey", "t4yc1nafkap2b75h6eo7pn8zvvu4cwtmwgx4jm8abp9f9fcl9e961it3hef1dl4701mn2u4kd5z90d8xz9vn4kwi04wp6luo6m1idj38dz5kzl6bmt8lgxlj3yrjays4x7mlgl3bgb1nsv5a8ddhypsufoystiirzyljz9jr6zsz3v9b5favroajv5607rempwp9mhkneeygqyfde7br6vr3gan3h0vgmbsztytzxys2nqvwbycwnoq5ea5khwap");
						if(StringUtil.isNotEmpty(cookie.getName()) && cookie.getName().equalsIgnoreCase("greatmapbuilderkey")){
							//判断是否是客户端
							if(cookie.getValue().equalsIgnoreCase("t4yc1nafkap2b75h6eo7pn8zvvu4cwtmwgx4jm8abp9f9fcl9e961it3hef1dl4701mn2u4kd5z90d8xz9vn4kwi04wp6luo6m1idj38dz5kzl6bmt8lgxlj3yrjays4x7mlgl3bgb1nsv5a8ddhypsufoystiirzyljz9jr6zsz3v9b5favroajv5607rempwp9mhkneeygqyfde7br6vr3gan3h0vgmbsztytzxys2nqvwbycwnoq5ea5khwap")){
								this.getSession().setAttribute("MFwwDQYJsslaVCg4ddieuz55Lcc5d5uEKr6UfSpzdVFR0CAwEAAQ", "欢迎高级管理员");
								//设置菜单集合
								getSession().setAttribute("gmbasemenu", getAllMenu());
								break;
							}
						}
					 }
					//判断是否正确存在内容
					if(StringUtil.isEmpty(this.getSession().getAttribute("MFwwDQYJsslaVCg4ddieuz55Lcc5d5uEKr6UfSpzdVFR0CAwEAAQ"))){
						msg.put("error", "账号/密码错误!");
					}
				}else{
					//创建过滤器
					SearchFilter sf = new SearchFilter();
					sf.addSearchAndFilter("username", gmbbaseuser.getUsername());
					sf.addSearchFilter("password", StringUtil.md5(gmbbaseuser.getPassword()));
					//用户类型
					sf.addSearchAndFilter("gmusertype", gmbbaseuser.getGmusertype());
					try {
						//获取登录用户
						gmbbaseuser = gmbbaseuserService.get(sf, 3);
						if(gmbbaseuser!=null){
							//设置Session
							getSession().setAttribute("gmloginuser", gmbbaseuser);
							//设置菜单集合
							getSession().setAttribute("gmbasemenu", getBaeMenu(gmbbaseuser));
							//设置角色id
							getSession().setAttribute("gmident", getGmident(gmbbaseuser));
						}else{
							msg.put("error", "账号/密码错误!");
						}
					} catch (GSSHException e) {
						msg.put("error", e.getErrorMsg());
					}
				}
			}else{
				msg.put("error", "账号/密码不能为空!");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return WriteJSONObject(msg);
	}
	
	/**
	 * 
	 * @Title: getBaeMenu
	 * @Description: TODO(获取基础菜单)
	 * @param @param gmbbaseuser
	 * @param @return    设定文件
	 * @return Hashtable<String,Gmbbasemenu>    返回类型
	 * @throws
	 */
	private Hashtable<String,Gmbbasemenu> getBaeMenu(Gmbbaseuser gmbbaseuser){
		ArrayList<String> ids = new ArrayList<String>();
		//父节点
		HashMap<String,String> gmbparent_url = new HashMap<String,String>();
		//创建基础菜单
		Hashtable<String,Gmbbasemenu> baseMenu = new Hashtable<String, Gmbbasemenu>();
		//创建基础URL对象
		Hashtable<String,String> baseURL = new Hashtable<String, String>();
		//获取基础菜单
		List<Gmbbasemenu> baseMenuList = gmbbaseuser.getGmbbasemenus();
		//遍历菜单
		for (Gmbbasemenu gmbbasemenu : baseMenuList) {
			ids.add(gmbbasemenu.getId());
		}
		//获取基础角色
		List<Gmbbaserole> gmroleList = gmbbaseuser.getGmbbaseroles();
		//遍历角色
		for (Gmbbaserole gmbbaserole: gmroleList) {
			//获取角色里面的菜单
			baseMenuList = gmbbaserole.getGmbbasemenus();
			//遍历角色中的菜单
			for (Gmbbasemenu gmbbasemenu : baseMenuList) {
				ids.add(gmbbasemenu.getId());
				baseMenu.put(gmbbasemenu.getKeyword(), gmbbasemenu);
			}
		}
		//获取所有菜单
		try {
			baseMenuList = gmbbasemenuService.getTreeALLNodes(ids);
			for (Gmbbasemenu gmbbasemenu : baseMenuList) {
				baseMenu.put(gmbbasemenu.getKeyword(), gmbbasemenu);
				if(StringUtil.isNotEmpty(gmbbasemenu.getUrl())){
					baseURL.put(gmbbasemenu.getUrl(), gmbbasemenu.getUrl());
					if(!gmbparent_url.containsKey(gmbbasemenu.getParentid()))
						gmbparent_url.put(gmbbasemenu.getParentid(), gmbbasemenu.getUrl());
				}
			}
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		//设置菜单URL集合
		getSession().setAttribute("gmbasemenu_url", baseURL);
		getSession().setAttribute("gmbparent_url", gmbparent_url);
		return baseMenu;
	}
	
	/**
	 * 
	 * @Title: getBaeMenu
	 * @Description: TODO(获取基础菜单)
	 * @param @param gmbbaseuser
	 * @param @return    设定文件
	 * @return Hashtable<String,Gmbbasemenu>    返回类型
	 * @throws
	 */
	private Hashtable<String,Gmbbasemenu> getAllMenu(){
		//父节点
		HashMap<String,String> gmbparent_url = new HashMap<String,String>();
		//创建基础菜单
		Hashtable<String,Gmbbasemenu> baseMenu = new Hashtable<String, Gmbbasemenu>();
		//获取所有菜单
		ArrayList<Gmbbasemenu> baseMenuList;
		try {
			baseMenuList = (ArrayList<Gmbbasemenu>) gmbbasemenuService.getAll();
			for (Gmbbasemenu gmbbasemenu : baseMenuList) {
				if(gmbbasemenu.getKeyword()!=null)
				baseMenu.put(gmbbasemenu.getKeyword().toLowerCase(), gmbbasemenu);
				if(!gmbparent_url.containsKey(gmbbasemenu.getParentid()))
					gmbparent_url.put(gmbbasemenu.getParentid(), gmbbasemenu.getUrl());
			}
		} catch (GSSHException e) {
			e.printStackTrace();
		}
		getSession().setAttribute("gmbparent_url", gmbparent_url);
		return baseMenu;
	}
	
	/**
	 * 
	 * @Title: logout
	 * @Description: TODO(用户安全退出)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public String logout(){
		//session失效
		this.getSession().invalidate();
		try {
			//判断指定路径
			String indexURL = this.getContextPath();
			if(indexURL==null || indexURL.length()<1){
				indexURL = "/";
			}
			//判断是否存在指定操作路径
			if(StringUtil.isNotEmpty(handle)){
				indexURL+="/"+handle;
			}
			//跳转指定位置
			this.getResponse().sendRedirect(indexURL);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 更新用户
	 * @return
	 */
	public String update() {
       //定义变量获取更新状态
		try {
			Gmbbaseuser gmbbaseuser = gmbbaseuserService.get(id);
			if(!this.gmbbaseuser.getUsername().equalsIgnoreCase(gmbbaseuser.getUsername())){
				this.gmbbaseuser.setUsername(StringUtil.md5(this.gmbbaseuser.getUsername()));
			}
			BeanUtils.copyProperties(this.gmbbaseuser, gmbbaseuser, new String[] { "id" ,"gmbbasemenus","gmbbaseroles"});
			gmbbaseuserService.update(gmbbaseuser);	
			//设置Session
			getSession().setAttribute("gmloginuser", gmbbaseuser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//跳转连接
		this.redirectUrl = this.getContextPath()+"/userinput.jsp";
		return SUCCESS;
	}
	
	/**
	 *  
	 * @Title: getGmident
	 * @Description: TODO(获取当前登录用户角色id)
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	private String getGmident(Gmbbaseuser gmbbaseuser) {
		//获取当前登录用户角色集合
		List<Gmbbaserole> gmbbaseroles = gmbbaseuser.getGmbbaseroles();
		//声明角色id接受对象
		StringBuilder roleids = new StringBuilder();
		//遍历拼接角色id
		for (Gmbbaserole gmbbaserole : gmbbaseroles) {
			roleids.append(gmbbaserole.getId()).append(",");
		}
		//所有角色id
		String gmident = roleids.toString();
		//去掉末尾的逗号
		if (StringUtil.isNotEmpty(gmident)) {
			gmident = gmident.substring(0, gmident.length());
		}
		//返回gmident
		return gmident;
	}
}
