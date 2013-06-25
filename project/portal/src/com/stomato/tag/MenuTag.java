package com.stomato.tag;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.log4j.Logger;

import com.stomato.domain.Menu;
import com.stomato.domain.User;
import com.stomato.service.RoleMenuService;
import com.stomato.utils.SpringContextUtil;
import com.stomato.vo.SysConfig;

public class MenuTag extends BodyTagSupport{
	
	private Logger logger = Logger.getLogger(MenuTag.class);

	private static final long serialVersionUID = 1L;

	@Override
	public int doEndTag() throws JspException {
		logger.debug("menu tag start");
		HttpSession session = pageContext.getSession() ;
		String basePath = pageContext.getServletContext().getContextPath();
		User user = (User)session.getAttribute("account");
		if(user == null)return SKIP_BODY;
		
		RoleMenuService roleMenuService = (RoleMenuService)SpringContextUtil.getBean("roleMenuService");
		List<Integer> menuIdList = roleMenuService.listRoleMenu(user.getRoleId());
		
		JspWriter out=pageContext.getOut();
		try {
			logger.debug(SysConfig.getMenuSys().size());
			StringBuffer sb = new StringBuffer();
			for(Menu menu:SysConfig.getMenuSys()){
				if(menuIdList.contains(menu.getId()) && menu.getVisible() != 0){
					sb.append("<dl class='bitem'>");
					sb.append("<dt onClick='showHide(\"items_"+menu.getId()+"\")'><b>"+menu.getName()+"</b></dt>");
					sb.append("<dd style='display:block' class='sitem' id='items_"+menu.getId()+"'>");
					sb.append("<ul class='sitemu'>");
					for(Menu sunMenu:menu.getSunMenu()){
						if(menuIdList.contains(sunMenu.getId()) && sunMenu.getVisible() != 0){
							sb.append("<li>");
							sb.append("<a href='"+basePath+sunMenu.getPath()+"' target='main'>"+sunMenu.getName()+"</a>");
							sb.append("</li>");
						}
					}
					sb.append("</ul>");
					sb.append("</dd>");
					sb.append("</dl>");
				}
			}
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
