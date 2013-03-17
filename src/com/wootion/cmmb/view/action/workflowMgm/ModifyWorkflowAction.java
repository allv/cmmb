package com.wootion.cmmb.view.action.workflowMgm;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.common.workflow.WorkflowParameter;
import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.cmmb.service.workflow.WorkflowManageService;
import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;

public class ModifyWorkflowAction extends ActionSupport {
	private static final long serialVersionUID = 9206239200131016018L;

	private static final String SUCESS = "sucess";
	private String mid;
	private Workflow workflow;
	private String workflowName;
	private String formName;
	private String workflowDescription;
	private String formid;
	private Set<WorkflowNodes> nodes;
	private String currentHandleRoles;
	private List<Wtuser> currentHandleUsers;
	private String nodeType;

	private String jsonNodes;

	private WorkflowManageService service;
	private RoleManagerService roleService;

	private List<Form> unAssignedForms;

	public String goToAdd() {
		return SUCESS;
	}

	public String getWorkflowUnAssignedForms() {
		unAssignedForms = this.getService().searchUnAssignedForms();
		return SUCESS;
	}

	public String addWorkflow() {
		boolean flag = this.getService().addWorkflow(formid, workflowName,
				jsonNodes, workflowDescription);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		if (flag) {
			request.setAttribute("type", "ok");
			request.setAttribute("msg", "工作流修改成功！！");
		} else {
			request.setAttribute("type", "err");
			request.setAttribute("msg", "工作流修改失败，当前工作流与未结束的单据有关联，请先删除未结束的单据！");
		}
		return SUCESS;
	}

	public String getWorkflowHandleUsers() {
		Form form = (Form) this.getService().getObjectByID(Form.class,
				Long.parseLong(formid));
		Set<Wtrole> roles = form.getRoles();
		StringBuilder sb = new StringBuilder();
		currentHandleUsers = new ArrayList<Wtuser>();
		if (roles != null) {
			for (Wtrole role : roles) {
				if (nodeType.equals(WorkflowParameter.NODE_TYPE_AUDIT
						.toString())) {
					if (DomainUtil.isManagerRole(role)) {
						sb.append(role.getWtroleName()).append(",");
						currentHandleUsers.addAll(this.getRoleService()
								.getRoleUsers(role.getWtroleId()));
					}
				} else {
					sb.append(role.getWtroleName()).append(",");
					currentHandleUsers.addAll(this.getRoleService()
							.getRoleUsers(role.getWtroleId()));
				}
			}
		}
		filterRedundantUser();
		currentHandleRoles = sb.toString();
		return SUCESS;
	}

	private void filterRedundantUser() {
		if(currentHandleUsers != null && currentHandleUsers.size()>2) {
			List<Wtuser> result  = new ArrayList<Wtuser>();
			for(Wtuser user:currentHandleUsers) {
				if(!result.contains(user)) {
					result.add(user);
				}
			}
			currentHandleUsers = result;
		}
	}

	public String getWorkflow() {
		workflow = this.getService().getWorkflow(mid);
		nodes = workflow.getSortNodesASC();
		return SUCESS;
	}

	public String modifyWorkflow() {
		boolean flag = this.getService().modifyWorkflow(mid, jsonNodes);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		if (flag) {
			request.setAttribute("type", "ok");
			request.setAttribute("msg", "工作流修改成功！！");
		} else {
			request.setAttribute("type", "err");
			request.setAttribute("msg", "工作流修改失败，当前工作流与未结束的单据有关联，请先删除未结束的单据！");
		}
		return SUCESS;
	}

	public WorkflowManageService getService() {
		if (service == null)
			service = IMPServiceFactory.getWorkflowMgmService();
		return service;
	}

	public void setService(WorkflowManageService service) {
		this.service = service;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getFormName() {
		if (this.workflow != null) {
			formName = this.workflow.getForm().getName();
		}
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public Set<WorkflowNodes> getNodes() {
		return nodes;
	}

	public void setNodes(Set<WorkflowNodes> nodes) {
		this.nodes = nodes;
	}

	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}

	public String getFormid() {
		if (this.workflow != null) {
			formid = this.workflow.getForm().getId().toString();
		}
		return formid;
	}

	public void setFormid(String formid) {
		this.formid = formid;
	}

	public String getCurrentHandleRoles() {
		return currentHandleRoles;
	}

	public void setCurrentHandleRoles(String currentHandleRoles) {
		this.currentHandleRoles = currentHandleRoles;
	}

	public List<Wtuser> getCurrentHandleUsers() {
		return currentHandleUsers;
	}

	public void setCurrentHandleUsers(List<Wtuser> currentHandleUsers) {
		this.currentHandleUsers = currentHandleUsers;
	}

	public RoleManagerService getRoleService() {
		if (roleService == null)
			roleService = ServiceFactroy.getRoleService();
		return roleService;
	}

	public void setRoleService(RoleManagerService roleService) {
		this.roleService = roleService;
	}

	public String getNodeType() {
		return nodeType;
	}

	public void setNodeType(String nodeType) {
		this.nodeType = nodeType;
	}

	public String getJsonNodes() {
		return jsonNodes;
	}

	public void setJsonNodes(String jsonNodes) {
		this.jsonNodes = jsonNodes;
	}

	public String getWorkflowDescription() {
		return workflowDescription;
	}

	public void setWorkflowDescription(String workflowDescription) {
		this.workflowDescription = workflowDescription;
	}

	public String getWorkflowName() {
		return workflowName;
	}

	public void setWorkflowName(String workflowName) {
		this.workflowName = workflowName;
	}

	public List<Form> getUnAssignedForms() {
		return unAssignedForms;
	}

	public void setUnAssignedForms(List<Form> unAssignedForms) {
		this.unAssignedForms = unAssignedForms;
	}

}
