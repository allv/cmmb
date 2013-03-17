package com.wootion.cmmb.common.workflow;

import java.util.List;
import java.util.Set;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;

public interface WorkflowDAO {

	public abstract WorkflowRecords getMaxWorkflowRecords(String workflowid, String billid);

	public abstract List<WorkflowBills> findWorkflowBill(String billid, Long formid);

	public Set<WorkflowNodes> findWorkflowNode(Long formid);

	public abstract List<Form> getAllForms();

}