package com.wootion.cmmb.view.action.workflow;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.service.workflow.WorkflowService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class QueryWorkflowAction extends BaseAction {

	private String nowpage = null;// 页码
	private String maxpage = null;// 每页显示条数
	private String startDate;// 创建开始时间
	private String endDate;// 创建结束时间，主要用于查询一个时间区间内创建的数据
	private String workflowName;

	private QueryResult<Workflow> result;

	private WorkflowService service;

	@Override
	public String execute(HttpServletRequest arg0, HttpServletResponse arg1) {

		Integer firstindex = 1;// 当前页数
		Integer maxresult = 10;// 每页显示数
		if (nowpage != null && !nowpage.trim().equals("")) {
			firstindex = Integer.parseInt(nowpage.trim());
			if (firstindex == 0) {
				firstindex = 1;
			}
		}
		if (maxpage != null && !maxpage.trim().equals("")) {
			maxresult = Integer.parseInt(maxpage.trim());
		}
		result = getService().queryWorkflowsResult(firstindex, maxresult,
				startDate, endDate, workflowName);
		return SUCESS;
	}

	public String getNowpage() {
		return nowpage;
	}

	public void setNowpage(String nowpage) {
		this.nowpage = nowpage;
	}

	public String getMaxpage() {
		return maxpage;
	}

	public void setMaxpage(String maxpage) {
		this.maxpage = maxpage;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getWorkflowName() {
		return workflowName;
	}

	public void setWorkflowName(String workflowName) {
		this.workflowName = workflowName;
	}

	public WorkflowService getService() {
		if (service == null)
			service = IMPServiceFactory.getWorkflowService();
		return service;
	}

	public void setService(WorkflowService service) {
		this.service = service;
	}

	public QueryResult<Workflow> getResult() {
		return result;
	}

	public void setResult(QueryResult<Workflow> result) {
		this.result = result;
	}

}
