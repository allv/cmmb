package com.wootion.cmmb.view.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;

public class AjaxDeleteRoleServlet extends HttpServlet {

	private static final long serialVersionUID = -4708494697102123042L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RoleManagerService roleService = ServiceFactroy.getRoleService();

		String mid = req.getParameter("roleid");
		resp.setCharacterEncoding("utf-8");
		PrintWriter writer = resp.getWriter();
		if (StringUtils.isNotBlank(mid)) {
			try {

				Wtrole role = (Wtrole) roleService.getObjectByID(Wtrole.class,
						Long.parseLong(mid));
				role.setIsDelete(1);
				roleService.modifyObject(role);
				writer.write("删除角色成功！");
			} catch (Exception e) {
				writer.write("删除角色失败，未找到对应的角色记录或者该角色与其他记录有关联，请先删除关联项！！");
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
