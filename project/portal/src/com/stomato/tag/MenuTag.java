package com.stomato.tag;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.log4j.Logger;

import com.stomato.domain.Menu;
import com.stomato.domain.User;
import com.stomato.service.MenuService;
import com.stomato.utils.SpringContextUtil;

public class MenuTag extends BodyTagSupport{
	
	private Logger logger = Logger.getLogger(MenuTag.class);

	private static final long serialVersionUID = 1L;

	@Override
	public int doEndTag() throws JspException {
		logger.debug("menu tag start");
		HttpSession session = pageContext.getSession() ;
		String basePath = pageContext.getServletContext().getContextPath();
		User user = (User)session.getAttribute("user");
		if(user == null)return SKIP_BODY;

		JspWriter out=pageContext.getOut();
		try {
			MenuService menuService = (MenuService)SpringContextUtil.getBean("menuService");
			List<Menu> menuList = menuService.listMenuByUser(user);
			StringBuffer sb = new StringBuffer();
			sb.append("<ul class=\"sidebar-menu\">");
	   	 	for(int i = 0,j=menuList.size(); i < j; i++){
		   	 	Menu menu = menuList.get(i);
		   	 	
		   	 	sb.append("<li class=\"has-sub "+(i==0 || basePath.indexOf(menu.) ? "active open":"")+"\">");
			   	sb.append("<a href=\"javascript:void(0);\" class=\"\">");
			   	sb.append("<span class=\"icon-box\"><i class=\"icon-file-alt\"></i></span>"+menu.getName());
			   	sb.append("<span class=\"arrow\"></span>");
			   	sb.append("</a>");
			   	sb.append("<ul class=\"sub\">");
			   	for(Menu sunMenu : menu.getSunMenu()){
			   		sb.append("<li><a class=\"\" href=\""+sunMenu.getPath()+"\">"+sunMenu.getName()+"</a></li>");
	   	 		}
			   	sb.append("</ul>");
			   	sb.append("</li>");
	   	 	}
	   	 	sb.append("</ul>");
			logger.debug(sb.toString());
			out.println(sb.toString());
		} catch (Exception e) {
			logger.debug("初始化菜单出错！");
			e.printStackTrace();
		}
		logger.debug("menu tag end");
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}

	@Override
	public void release() {
		super.release();
	}
	
	

}
