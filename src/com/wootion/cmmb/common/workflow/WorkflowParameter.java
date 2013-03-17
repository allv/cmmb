package com.wootion.cmmb.common.workflow;

import org.apache.commons.lang.StringUtils;

public class WorkflowParameter {

	public static final String SUBMIT_FLAG = "workflowflag";
	public static final String SHOWWORKFLOW_FLAG = "showWorkflow";
	public static final String SHOWWORKFLOWBACK_FLAG = "showWorkflowBack";
	public static final String SHOWWORKFLOWSUBMIT_FLAG = "showWorkflowSubmit";
	public static final String SHOWWORKFLOWAUDIT_FLAG = "showWorkflowAudit";
	public static final String SHOWWORKFLOWREJECT_FLAG = "showWorkflowReject";
	public static final String SHOWWORKFLOWQUERY_FLAG = "showWorkflowQuery";

	public static final Long FORM_PROJECT = 100001l;

	public static final String AUDIT_FLAG = "auditflag";

	public static final Integer BILL_STATUS_SAVE = 0;// 保存，未提交
	public static final Integer BILL_STATUS_SUBMIT = 1;// 提交中
	public static final Integer BILL_STATUS_AUDITED = 2;// 已审核
	public static final Integer BILL_STATUS_REJECT = 3;// 已驳回
	public static final Integer BILL_STATUS_AUDIT = 4;// 待审核
	public static final Integer BILL_STATUS_DELETED = 5;// 已经删除

	public static final Integer NODE_TYPE_SAVE = 0;
	public static final Integer NODE_TYPE_SUBMIT = 1;
	public static final Integer NODE_TYPE_AUDIT = 2;

	public static final Integer HANDLE_TYPE_SAVE = 0;
	public static final Integer HANDLE_TYPE_SUBMIT = 1;
	public static final Integer HANDLE_TYPE_AUDIT = 2;
	public static final Integer HANDLE_TYPE_BACK = 3;
	public static final Integer HANDLE_TYPE_REJECT = 4;

	public static String getHandleTypeDisplayValue(Integer handleType) {
		if (handleType.equals(HANDLE_TYPE_SAVE))
			return "保存";
		if (handleType.equals(HANDLE_TYPE_SUBMIT))
			return "提交";
		if (handleType.equals(HANDLE_TYPE_AUDIT))
			return "审核";
		if (handleType.equals(HANDLE_TYPE_BACK))
			return "返回";
		if (handleType.equals(HANDLE_TYPE_REJECT))
			return "驳回";
		return StringUtils.EMPTY;
	}
	
	public static String getNodeTypeDisplayValue(Integer nodeType) {
		if (nodeType.equals(NODE_TYPE_SAVE))
			return "保存";
		if (nodeType.equals(NODE_TYPE_SUBMIT))
			return "提交";
		if (nodeType.equals(NODE_TYPE_AUDIT))
			return "审核";
		return StringUtils.EMPTY;
	}

}
