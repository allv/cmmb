package com.wootion.cmmb.common.workflow;

public class WorkflowParameter {

	public static final String SUBMIT_FLAG = "submitflag";
	
	public static final Long FORM_PROJECT = 100001l;

	public static final String AUDIT_FLAG = "auditflag";
	
	public static final Integer BILL_STATUS_SAVE = 0;//保存，未提交
	public static final Integer BILL_STATUS_SUBMIT = 1;//提交中
	public static final Integer BILL_STATUS_AUDIT = 2;//已审核
	
	public static final Integer NODE_TYPE_SUBMIT = 1;
	public static final Integer NODE_TYPE_AUDIT = 2;
	
	public static final Integer HANDLE_TYPE_SUBMIT = 1;
	public static final Integer HANDLE_TYPE_AUDIT = 2;
	public static final Integer HANDLE_TYPE_BACK = 3;
	public static final Integer HANDLE_TYPE_REJECT = 4;
	
}
