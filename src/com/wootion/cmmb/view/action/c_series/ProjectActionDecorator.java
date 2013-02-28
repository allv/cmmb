package com.wootion.cmmb.view.action.c_series;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.util.PageBasicInfo;
import com.wootion.cmmb.common.workflow.WorkflowParameter;
import com.wootion.cmmb.common.workflow.WorkflowService;
import com.wootion.cmmb.common.workflow.WorkflowServiceImpl;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;

public class ProjectActionDecorator implements ProjectAction{

	private ProjectAction action = new ProjectActionImpl();
	private WorkflowService service = new WorkflowServiceImpl();
	
	@Override
	public String addpro() throws Exception {
		// TODO Auto-generated method stub
		return action.addpro();
	}

	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}
	
	private Long getCurrentUserId(String sessionID) {
		UserCacheBean uc1 = PermissionCollection.getInstance().getUserCache(sessionID);
		return uc1.getUserID();
	}
	
	private void handleWorkflow() {
		 HttpServletRequest request = this.getRequest();
		String submitFlag =request.getParameter(WorkflowParameter.SUBMIT_FLAG);
		String pid = request.getParameter("proid").trim();
		String remark = request.getParameter("remark");
		Long handleUserid = getCurrentUserId(request.getSession().getId());
		if(submitFlag != null && submitFlag.equals(WorkflowParameter.HANDLE_TYPE_SUBMIT)) {
			service.submit(WorkflowParameter.FORM_PROJECT, handleUserid, pid,remark);
		}
		if(submitFlag != null && submitFlag.equals(WorkflowParameter.HANDLE_TYPE_AUDIT)) {
			service.audit(WorkflowParameter.FORM_PROJECT, handleUserid, pid,remark);
		}
		if(submitFlag != null && submitFlag.equals(WorkflowParameter.HANDLE_TYPE_REJECT)) {
			service.reject(WorkflowParameter.FORM_PROJECT, handleUserid, pid,remark);
		}
		if(submitFlag != null && submitFlag.equals(WorkflowParameter.HANDLE_TYPE_BACK)) {
			service.back(WorkflowParameter.FORM_PROJECT, handleUserid, pid,remark);
		}
		
	}

	@Override
	public String addprotrack() throws Exception {
		// TODO Auto-generated method stub
		return action.addprotrack();
	}

	@Override
	public String track() throws Exception {
		// TODO Auto-generated method stub
		return action.track();
	}

	@Override
	public String premodify() throws Exception {
		// TODO Auto-generated method stub
		return action.premodify();
	}

	@Override
	public String modifypro() throws Exception {
		String forward = action.modifypro();
		handleWorkflow();
		return forward;
	}

	@Override
	public String deletepro() throws Exception {
		// TODO Auto-generated method stub
		return action.deletepro();
	}

	@Override
	public String viewpro() throws Exception {
		// TODO Auto-generated method stub
		return action.viewpro();
	}

	@Override
	public void page(HttpServletRequest request, PageBasicInfo pageObj) {
		action.page(request, pageObj);
	}

	
}
