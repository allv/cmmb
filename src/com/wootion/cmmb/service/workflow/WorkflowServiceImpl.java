package com.wootion.cmmb.service.workflow;

import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.service.BaseServiceImpl;

public class WorkflowServiceImpl extends BaseServiceImpl implements WorkflowService {
	
	@Override
	public QueryResult<Workflow> queryWorkflowsResult(Integer firstindex,
			Integer maxresult, String startDate, String endDate,
			String workflowName) {
		String whererjpql = " o.description like '%' ";
		if (startDate != null && !startDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.wtroleCreatetime >= '"
					+ startDate + "'";
		}
		if (endDate != null && !endDate.trim().equals("")) {
			whererjpql = whererjpql + " and o.createtime <= '" + endDate
					+ "'";
		}
		if (workflowName != null && !workflowName.trim().equals("")) {
			whererjpql = whererjpql + " and o.name like '%" + workflowName
					+ "%'";
		}
		return this.commonDao.getScrollData(Workflow.class, "id", firstindex,
				maxresult, whererjpql, null, null);
	}
	
}
