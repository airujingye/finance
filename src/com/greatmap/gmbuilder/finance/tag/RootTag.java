package com.greatmap.gmbuilder.finance.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class RootTag extends TagSupport {

	private static final long serialVersionUID = 1L;

	JspWriter out = null;
	HttpSession session = null;
	HttpServletRequest request = null;

	public void init() {
		request = (HttpServletRequest) pageContext.getRequest();
		out = pageContext.getOut();
		session = (HttpSession) pageContext.getSession();
	}

}
