package com.wootion.cmmb.common.formPermission;

import com.wootion.cmmb.common.workflow.WorkflowHandle;

public interface FormPermissionService {

	public abstract void saveOrUpdateFormPermission(String billid,
			WorkflowHandle action, Long handleUserid);

	public abstract void deleteFormPermission(String billid);

	public abstract boolean checkPermission(String currentUserId, String billid);

}