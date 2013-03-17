package com.wootion.cmmb.service.workflow;

import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.service.BaseService;

public interface WorkflowManageService extends BaseService{

	QueryResult<Workflow> queryWorkflowsResult(Integer firstindex, Integer maxresult,
			String startDate, String endDate, String workflowName);

	boolean deleteWorkflow(long workflowid);

	boolean modifyWorkflow(String workflowid, String jsonNodes);

	Workflow getWorkflow(String workflowid);

	boolean addWorkflow(String formid, String workflowName,String jsonNodes, String workflowDescription);

	List<Form> searchUnAssignedForms();

	boolean modifyWorkflowStatus(long workflowId);
	
}
