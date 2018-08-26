package com.greatmap.gmbuilder.finance.filters;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greatmap.gmbuilder.finance.entity.Gmbbasefilter;
import com.greatmap.gmbuilder.finance.service.impl.GmbbasefilterService;
import com.greatmap.gmbuilder.util.DesUtil;
import com.greatmap.gmbuilder.util.StringUtil;

/**
 * 
 * 项目名称：GMTest001
 * 类名称：SecurityFilter
 * 类描述：  TODO(权限过滤器)
 * 开发单位: 北京天耀宏图科技有限公司
 * 创建人：FanWY
 * 创建时间：2017-2-22 上午9:57:51
 * 修改人：
 * 修改时间：
 * 修改备注：
 * @version v1.0
 *
 */
public class AuthorityFilter implements Filter {
	
	/**
	 * 存储编码格式信息
	 */
	private String encode = null;

	/**
	 * 401页面地址
	 */
	private String page401 = "/401.jsp";

	/**
	 * 过滤Filter
	 */
	private static Hashtable<String, String> filters = new Hashtable<String, String>();

	/**
	 * 不过滤Filter
	 */
	private static Hashtable<String, String> nofilters = new Hashtable<String, String>();

	/**
	 * 销毁方法
	 */
	@Override
	public void destroy() {

	}

	/**
	 * 过滤器
	 */
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		//转换对象
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        //设置统一的编码格式
        request.setCharacterEncoding(StringUtil.isEmpty(encode)?"UTF-8":encode);
        response.setCharacterEncoding(StringUtil.isEmpty(encode)?"UTF-8":encode);
        //获取当前的请求地址
        String cururl = request.getRequestURI();
		//防止出现项目名与组件名称一致的情况。导致替换链接错误。如请求地址为：/gmoa/gmoa/Gmbbase!list.action ,转换后为 /gmoa/Gmbbase!list.action
        //如果不适用下面的代码 ，请求地址为：/gmoa/gmoa/Gmbbase!list.action ,转换后为 /Gmbbase!list.action
        Pattern p = Pattern.compile(request.getContextPath());
        Matcher m = p.matcher(cururl);
        String url = m.replaceFirst("");
        //设置内置高级管理员
        Object administrator = request.getSession().getAttribute("MFwwDQYJsslaVCg4ddieuz55Lcc5d5uEKr6UfSpzdVFR0CAwEAAQ");
        //判断是否包含非过滤URL
        if(!nofilters.containsKey(url) && (StringUtil.isEmpty(administrator))){
        	//获取登录用户对象
        	Object basemenu_url = request.getSession().getAttribute("gmbasemenu_url");
        	//判断是否是用户对象
        	if(basemenu_url!=null && basemenu_url instanceof Hashtable){
        		//转换用户菜单URL
        		Hashtable<String,String> baseURL = (Hashtable<String,String>)basemenu_url;
        		if(baseURL.contains(url)){
        			chain.doFilter(request, response);  
        			return;
        		}
        	}
        	response.sendRedirect(request.getContextPath()+page401);
        	return;
        }
        /* 
         * 使用doFilter方法调用链中的下一个过滤器或目标资源（servlet或JSP页面）。 
         * chain.doFilter处理过滤器的其余部分（如果有的话），最终处理请求的servlet或JSP页面。 
         */  
        chain.doFilter(request, response);  
	}
	
	/**
	 * 初始化配置文件参数
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		//获取在web.xml文件中配置了的编码格式的信息  
		this.encode = config.getInitParameter("encode");
		//获取401页面地址
		if(StringUtil.isNotEmpty(config.getInitParameter("page401"))){
			this.page401 = config.getInitParameter("page401");
		}
		//过滤器DAO
		GmbbasefilterService filterDAO = new GmbbasefilterService();
		try {
			//获取过滤器内容
			List<Gmbbasefilter> gmbbasefilterList = filterDAO.getAll();
			//遍历过滤器
			for (Gmbbasefilter gmbbasefilter : gmbbasefilterList) {
				//判断是否空值
				if(gmbbasefilter!=null && StringUtil.isNotEmpty(gmbbasefilter.getUrl())){
					//判断是否过滤
					if(gmbbasefilter.getIsFilter()){
						filters.put(gmbbasefilter.getUrl(), gmbbasefilter.getUrl());
					}else{
						nofilters.put(gmbbasefilter.getUrl(), gmbbasefilter.getUrl());
					}
				}
			}
			//获取debug模式
			File debugFile = new File(config.getServletContext().getRealPath(DesUtil.decrypt("OhivplXc+dgYxKdwrLcBEjZXIQtmzBda")));
			//判断debug是否为空
			if(debugFile==null || !debugFile.isFile()){
				//进行全部压缩JS、CSS、JSP
		//		FileUtil.compressorJSCSS(config.getServletContext().getRealPath("/"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
