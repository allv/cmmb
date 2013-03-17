package com.wootion.cmmb.view.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.service.workflow.WorkflowManageService;

public class AjaxEnableWorkflowServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		WorkflowManageService mgmService = IMPServiceFactory.getWorkflowMgmService();

		String mid = req.getParameter("workflowId");
		resp.setCharacterEncoding("utf-8");
		PrintWriter writer = resp.getWriter();
		if (StringUtils.isNotBlank(mid)) {
			boolean flag =  mgmService.modifyWorkflowStatus(Long.parseLong(mid));
			if(flag) {
				writer.write("工作流状态设置成功！");
			}else {
				writer.write("工作流状态设置失败，当前工作流与未结束的单据有关联，请先删除未结束的单据！");
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
