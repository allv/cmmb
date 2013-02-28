package com.wootion.cmmb.common.workflow;

import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;

public interface WorkflowDAO {

	public abstract WorkflowRecords getMaxWorkflowRecords(String workflowid, String billid);

}