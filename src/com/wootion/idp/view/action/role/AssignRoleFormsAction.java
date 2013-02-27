package com.wootion.idp.view.action.role;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.vo.FormVO;

public class AssignRoleFormsAction extends ActionSupport {

	private static final long serialVersionUID = 7986959271620052802L;
	private static final String SUCESS = "sucess";

	private String mid;
	private String roleName;
	private List<FormVO> allForms;
	private List<String> selecteForms;

	private RoleManagerService roleService;

	public String getMid() {
		return mid;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public List<FormVO> getAllForms() {
		return allForms;
	}

	public void setAllForms(List<FormVO> allForms) {
		this.allForms = allForms;
	}

	public List<String> getSelecteForms() {
		return selecteForms;
	}

	public void setSelecteForms(List<String> selecteForms) {
		this.selecteForms = selecteForms;
	}

	public RoleManagerService getRoleService() {
		if (roleService == null)
			roleService = ServiceFactroy.getRoleService();
		return roleService;
	}

	public void setRoleService(RoleManagerService roleService) {
		this.roleService = roleService;
	}

	@SuppressWarnings("unchecked")
	public String getRoleForms() {
		Wtrole role = (Wtrole) getRoleService().getObjectByID(Wtrole.class,
				Long.valueOf(Long.parseLong(mid)));
		if (role != null)
			roleName = role.getWtroleName();
		List<Form> allForms = (List<Form>) getRoleService().getAllObject(
				Form.class);
		Set<Form> currentForms = role.getForms();
		List<FormVO> result = new ArrayList<FormVO>();
		for (Form form : allForms) {
			boolean checked = false;
			for (Form tempForm : currentForms) {
				if (form.getId().equals(tempForm.getId())) {
					checked = true;
					break;
				}
			}
			FormVO vo = new FormVO();
			vo.setForm(form);
			vo.setChecked(checked);
			result.add(vo);
		}
		setAllForms(result);
		return SUCESS;
	}

	public String assignRoleForms() {
		boolean result = getRoleService().saveRoleForms(Long.parseLong(mid),selecteForms);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		if (result) {
			request.setAttribute("type", "ok");
			request.setAttribute("msg", "表单分配成功！！");
		} else {
			request.setAttribute("type", "err");
			request.setAttribute("msg", "表单分配失败，未找到对应的角色记录！");
		}
		return SUCESS;
	}

}
