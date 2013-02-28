package com.wootion.cmmb.common.workflow;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.view.action.BaseAction;

public abstract class WorkflowBaseAction extends BaseAction {

	@Override
	public String execute(HttpServletRequest arg0, HttpServletResponse arg1) {
		beforeExecute(arg0,arg1);
		String forward = doExecute(arg0,arg1);
		afterExecute(arg0,arg1);
		return forward;
	}
	
	protected void afterExecute(HttpServletRequest arg0, HttpServletResponse arg1) {
		
	}

	protected void beforeExecute(HttpServletRequest arg0, HttpServletResponse arg1) {
		
	}

	public abstract String doExecute(HttpServletRequest arg0, HttpServletResponse arg1);

}
