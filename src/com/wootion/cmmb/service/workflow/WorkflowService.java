package com.wootion.cmmb.service.workflow;

import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.service.BaseService;

public interface WorkflowService extends BaseService{

	QueryResult<Workflow> queryWorkflowsResult(Integer firstindex, Integer maxresult,
			String startDate, String endDate, String workflowName);

	
}
