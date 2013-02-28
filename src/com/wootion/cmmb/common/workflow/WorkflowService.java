package com.wootion.cmmb.common.workflow;

public interface WorkflowService {

	public abstract void submit(Long formProject, Long handleUserid, String pid,String remark);

	public abstract void audit(Long formProject, Long handleUserid, String pid,String remark);
	public abstract void reject(Long formProject, Long handleUserid, String pid,String rejectReason);

	public abstract void back(Long formProject, Long handleUserid, String pid,
			String remark);

}